$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13

$base   = 'https://genevaers.github.io/User-Documentation/'
$root   = Split-Path -Parent $MyInvocation.MyCommand.Path
$cache  = Join-Path $root 'pages'
New-Item -ItemType Directory -Force -Path $cache | Out-Null

# 1. Collect page URLs from the sitemap
$sm   = Invoke-WebRequest -Uri ($base + 'sitemap.xml') -UseBasicParsing -TimeoutSec 30
$urls = [regex]::Matches($sm.Content, '<loc>(.*?)</loc>') | ForEach-Object { $_.Groups[1].Value } |
        Where-Object { $_ -match '\.html$' }

# Order: Get Started, Setup and Use, Advanced Features, Reference
$groupNames = @('Get Started', 'Setup and Use', 'Advanced Features', 'Reference')
function Rank($u) {
    $p = $u.Replace($base, '')
    if ($p -like 'Get%20Started*')     { return 1 }
    if ($p -like 'Setup%20and%20Use*') { return 2 }
    if ($p -like 'AdvancedFeatures*')  { return 3 }
    return 4
}
$urls = $urls | Sort-Object @{Expression = { Rank $_ }}, @{Expression = { $_ }}

# 2. Download + extract main content
$sections = New-Object System.Collections.Generic.List[object]
$i = 0
foreach ($u in $urls) {
    $i++
    $file = Join-Path $cache (($u.Replace($base, '') -replace '[\\/:%]', '_') + '.htm')
    if (-not (Test-Path $file)) {
        try {
            $r = Invoke-WebRequest -Uri $u -UseBasicParsing -TimeoutSec 30
            [IO.File]::WriteAllText($file, $r.Content, [Text.Encoding]::UTF8)
        } catch {
            Write-Output "FAILED $u"
            continue
        }
    }
    $html = [IO.File]::ReadAllText($file, [Text.Encoding]::UTF8)
    $m = [regex]::Match($html, '(?s)<main[^>]*id="content"[^>]*>(.*?)<footer')
    if (-not $m.Success) { $m = [regex]::Match($html, '(?s)<main[^>]*>(.*?)</main>') }
    if (-not $m.Success) { Write-Output "NOCONTENT $u"; continue }
    $body = $m.Groups[1].Value
    $body = [regex]::Replace($body, '(?is)<script.*?</script>', '')

    $rel = [Uri]::UnescapeDataString($u.Replace($base, '')) -replace '\.html$', ''
    $sections.Add([pscustomobject]@{
        Url = $u; Rel = $rel.ToLower(); Path = $rel; Group = (Rank $u); Body = $body
        Ids = New-Object 'System.Collections.Generic.HashSet[string]'
    })
    if ($i % 25 -eq 0) { Write-Output "$i / $($urls.Count)" }
}

# 3. Index pages / anchors so links can be rewritten to internal PDF jumps
$script:pageMap = @{}
for ($k = 0; $k -lt $sections.Count; $k++) {
    $s = $sections[$k]
    $s | Add-Member -NotePropertyName N -NotePropertyValue ($k + 1)
    $script:pageMap[$s.Rel] = $s
    foreach ($mm in [regex]::Matches($s.Body, '(?i)\sid="([^"]*)"')) { [void]$s.Ids.Add($mm.Groups[1].Value) }
}
$script:groupMap = @{ 'get started' = 1; 'setup and use' = 2; 'advancedfeatures' = 3; 'reference' = 4 }
$script:basePath = ([Uri]$base).AbsolutePath
$script:cur      = $null
$script:curUri   = $null
$script:nInternal = 0
$script:nExternal = 0

$linkEval = {
    param($mm)
    $href = [Net.WebUtility]::HtmlDecode($mm.Groups[1].Value).Trim()
    if ($href -eq '' -or $href -match '^(?i)(mailto:|javascript:|tel:)') { return '<a>' }
    $cur = $script:cur
    if ($href.StartsWith('#')) {
        $f = $href.Substring(1)
        $script:nInternal++
        if ($f -ne '' -and $cur.Ids.Contains($f)) { return '<a href="#p' + $cur.N + '-' + [Net.WebUtility]::HtmlEncode($f) + '">' }
        return '<a href="#p' + $cur.N + '">'
    }
    try { $abs = New-Object Uri($script:curUri, $href) } catch { return '<a>' }
    if ($abs.Host -eq ([Uri]$base).Host -and $abs.AbsolutePath.StartsWith($script:basePath)) {
        $r = ([Uri]::UnescapeDataString($abs.AbsolutePath.Substring($script:basePath.Length)).TrimEnd('/') -replace '\.html$', '').ToLower()
        $frag = $abs.Fragment.TrimStart('#')
        if ($script:pageMap.ContainsKey($r)) {
            $t = $script:pageMap[$r]
            $script:nInternal++
            if ($frag -ne '' -and $t.Ids.Contains($frag)) { return '<a href="#p' + $t.N + '-' + [Net.WebUtility]::HtmlEncode($frag) + '">' }
            return '<a href="#p' + $t.N + '">'
        }
        if ($script:groupMap.ContainsKey($r)) { $script:nInternal++; return '<a href="#g' + $script:groupMap[$r] + '">' }
    }
    $script:nExternal++
    return '<a href="' + [Net.WebUtility]::HtmlEncode($abs.AbsoluteUri) + '">'
}
$srcEval = {
    param($mm)
    $v = $mm.Groups[1].Value
    if ($v -match '^(?i)(https?:|data:)') { return $mm.Value }
    try { return 'src="' + (New-Object Uri($script:curUri, [Net.WebUtility]::HtmlDecode($v))).AbsoluteUri + '"' } catch { return $mm.Value }
}
$hOpenEval  = { param($mm) '<h' + [Math]::Min([int]$mm.Groups[1].Value + 1, 6) }
$hCloseEval = { param($mm) '</h' + [Math]::Min([int]$mm.Groups[1].Value + 1, 6) + '>' }

foreach ($s in $sections) {
    $script:cur    = $s
    $script:curUri = [Uri]$s.Url
    $b = $s.Body
    $b = [regex]::Replace($b, '(?is)<a\s[^>]*?href\s*=\s*"([^"]*)"[^>]*>', $linkEval)
    $b = [regex]::Replace($b, '(?is)<a\s(?![^>]*href\s*=)[^>]*>', '<a>')      # anchors without href
    $b = [regex]::Replace($b, '(?i)\ssrc="([^"]+)"', { param($mm) ' ' + (& $srcEval $mm) })
    $b = [regex]::Replace($b, '(?i)<h([1-6])(?=[\s>])', $hOpenEval)           # demote so group heading is top bookmark level
    $b = [regex]::Replace($b, '(?i)</h([1-6])>', $hCloseEval)
    $b = [regex]::Replace($b, '(?i)(\sid=")([^"]*)"', ('$1p' + $s.N + '-$2"'))
    $s.Body = $b
}
Write-Output "Links rewritten: $($script:nInternal) internal, $($script:nExternal) external"

# 4. Build combined HTML with clickable TOC
$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>GenevaERS User Documentation</title>')
[void]$sb.AppendLine('<style>body{font-family:"Segoe UI",Arial,sans-serif;font-size:11pt;line-height:1.45;color:#1f2328}a{color:#0b5cad;text-decoration:underline}h1{font-size:20pt;border-bottom:2px solid #157878;padding-bottom:4px}h2{font-size:17pt}h3{font-size:13.5pt}h4{font-size:12pt}table{border-collapse:collapse;margin:8px 0}td,th{border:1px solid #bbb;padding:3px 6px;vertical-align:top;font-size:10pt}pre,code{font-family:Consolas,monospace;font-size:9.5pt}pre{background:#f4f5f7;padding:6px;white-space:pre-wrap;word-wrap:break-word}img{max-width:100%}section.page{page-break-before:always}.src{color:#57606a;font-size:9pt}.toc ul{margin:0 0 8px 0;padding-left:18px}.toc li{list-style:none;font-size:10pt}.toc h3{margin:12px 0 4px 0}.toc.cols ul{column-count:2;column-gap:24px}.toc.cols li{break-inside:avoid;word-wrap:break-word;font-size:9pt}.grp{font-size:14pt;margin:8px 0}.cnt{color:#57606a;font-size:10pt}.cover{font-size:28pt;font-weight:bold;margin:0 0 10px 0}</style></head><body>')
# Front Contents: only the four top-level sections. Each section's page list sits at the start of that section.
[void]$sb.AppendLine('<p class="cover" id="top">GenevaERS User Documentation</p><p>Compiled from <b>https://genevaers.github.io/User-Documentation/</b> on ' + (Get-Date -Format 'yyyy-MM-dd') + '. ' + $sections.Count + ' pages.</p><h1>Contents</h1><div class="toc">')
for ($g = 1; $g -le 4; $g++) {
    $cnt = @($sections | Where-Object { $_.Group -eq $g }).Count
    [void]$sb.AppendLine('<p class="grp"><a href="#g' + $g + '">' + $groupNames[$g - 1] + '</a> <span class="cnt">(' + $cnt + ' pages)</span></p>')
}
[void]$sb.AppendLine('<p class="cnt">Select a section to open its list of pages. Use the bookmarks panel to expand and collapse sections and headings.</p></div>')
$seen = @{}
foreach ($s in $sections) {
    if (-not $seen.ContainsKey($s.Group)) {
        $seen[$s.Group] = $true
        $g = $s.Group
        [void]$sb.AppendLine('<section class="page" id="g' + $g + '"><h1>' + $groupNames[$g - 1] + '</h1><p class="cnt"><a href="#top">Back to Contents</a></p><div class="toc cols"><ul>')
        foreach ($x in ($sections | Where-Object { $_.Group -eq $g })) {
            [void]$sb.AppendLine('<li><a href="#p' + $x.N + '">' + [Net.WebUtility]::HtmlEncode($x.Path) + '</a></li>')
        }
        [void]$sb.AppendLine('</ul></div></section>')
    }
    [void]$sb.AppendLine('<section class="page" id="p' + $s.N + '"><p class="src">' + [Net.WebUtility]::HtmlEncode($s.Path) + ' &mdash; <a href="#g' + $s.Group + '">' + $groupNames[$s.Group - 1] + ' list</a></p>' + $s.Body + '</section>')
}
[void]$sb.AppendLine('</body></html>')
$out = Join-Path $root 'GenevaERS_User_Documentation.html'
[IO.File]::WriteAllText($out, $sb.ToString(), (New-Object Text.UTF8Encoding($false)))
Write-Output "HTML written: $out ($($sections.Count) pages)"

# 5. Print to PDF with Edge headless (selectable text, internal links, document outline = bookmarks)
$edge = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
$pdf  = Join-Path $root 'GenevaERS_User_Documentation.pdf'
if (Test-Path $pdf) { Remove-Item $pdf -Force }
$fileUrl = ([Uri]$out).AbsoluteUri
& $edge --headless=new --disable-gpu --no-pdf-header-footer --generate-pdf-document-outline --virtual-time-budget=120000 "--print-to-pdf=$pdf" $fileUrl | Out-Null
Start-Sleep -Seconds 5
if (Test-Path $pdf) { Write-Output "PDF written: $pdf ($([math]::Round((Get-Item $pdf).Length/1MB,1)) MB)" } else { Write-Output 'PDF NOT CREATED' }

# 6. Ask PDF viewers to open the bookmarks panel on the left (/PageMode /UseOutlines) via an incremental update
if (Test-Path $pdf) {
    $lat   = [Text.Encoding]::GetEncoding(28591)
    $bytes = [IO.File]::ReadAllBytes($pdf)
    $text  = $lat.GetString($bytes)
    $tailAt = [Math]::Max(0, $text.Length - 2048)
    $tail  = $text.Substring($tailAt)
    $sx    = [regex]::Match($tail, 'startxref\s+(\d+)\s+%%EOF\s*$')
    $trl   = [regex]::Match($tail, 'trailer\s*<<(.*?)>>\s*startxref', 'Singleline')
    $rootN = [regex]::Match($trl.Groups[1].Value, '/Root\s+(\d+)\s+0\s+R').Groups[1].Value
    $size  = [regex]::Match($trl.Groups[1].Value, '/Size\s+(\d+)').Groups[1].Value
    $info  = [regex]::Match($trl.Groups[1].Value, '/Info\s+(\d+\s+0\s+R)').Groups[1].Value
    if ($sx.Success -and $rootN -and $size) {
        $prev = $sx.Groups[1].Value
        $cm   = [regex]::Match($text, "(?s)(?<=[\r\n])$rootN 0 obj\s*(<<.*?>>)\s*endobj")
        if ($cm.Success -and $cm.Groups[1].Value -notmatch '/PageMode') {
            $dict    = $cm.Groups[1].Value
            # Initial View: Navigation = "Bookmarks Panel and Page", continuous layout, open at fit-width on the cover page
            $dict    = [regex]::Replace($dict, '/ViewerPreferences\s*<<.*?>>', '/ViewerPreferences <</Type /ViewerPreferences /DisplayDocTitle true /HideToolbar true /HideMenubar true /NonFullScreenPageMode /UseOutlines>>', 'Singleline')
            $pg      = [regex]::Match($text, '/top\s*\[(\d+) 0 R').Groups[1].Value
            $extra   = "`n/PageMode /UseOutlines`n/PageLayout /OneColumn"
            if ($pg) { $extra += "`n/OpenAction [$pg 0 R /FitH null]" }
            $newDict = $dict.Substring(0, $dict.LastIndexOf('>>')) + $extra + ">>"
            $objText = "`n$rootN 0 obj`n$newDict`nendobj`n"
            $objOff  = $bytes.Length + 1                       # offset of "<rootN> 0 obj" (after the leading newline)
            $xrefOff = $bytes.Length + $objText.Length
            $entry   = ('{0:D10} 00000 n ' -f $objOff) + "`n"  # exactly 20 bytes
            $trailer = "xref`n$rootN 1`n$entry" + "trailer`n<</Size $size`n/Root $rootN 0 R`n" + $(if ($info) { "/Info $info`n" } else { '' }) + "/Prev $prev>>`nstartxref`n$xrefOff`n%%EOF`n"
            $add = $lat.GetBytes($objText + $trailer)
            $fs  = [IO.File]::Open($pdf, 'Append')
            $fs.Write($add, 0, $add.Length); $fs.Close()
            Write-Output "Bookmarks panel set to open on load (PageMode UseOutlines)."
        } else { Write-Output 'PageMode already set or catalog not found; skipped.' }
    } else { Write-Output 'Could not parse PDF trailer; PageMode not set.' }
}
