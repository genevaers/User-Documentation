param([switch]$SkipImages)
# Builds a static, navigable web site from the cached GenevaERS documentation pages in .\pages
# (the same pages the PDF was compiled from). Output: .\site\index.html
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13

$base    = 'https://genevaers.github.io/User-Documentation/'
$baseUri = [Uri]$base
$root    = Split-Path -Parent $MyInvocation.MyCommand.Path
$cache   = Join-Path $root 'pages'
$site    = Join-Path $root 'site'
$utf8    = New-Object Text.UTF8Encoding($false)

$siteName = 'GenevaERS User Documentation'
$groupOrder = @('get started', 'setup and use', 'advancedfeatures', 'reference')
$groupDesc = @{
    'get started'      = 'Introductions to GenevaERS, the Workbench and the Performance Engine.'
    'setup and use'    = 'Step-by-step examples: create a view, add a filter, a lookup and column logic, build a summary view, and run it.'
    'advancedfeatures' = 'Workbench metadata, views, lookup paths, record filters, security, environments and more.'
    'reference'        = 'Logic text syntax, functions and examples, parameter files, DD statements and keyboard shortcuts.'
}

# ---------------------------------------------------------------- helpers
function HtmlEnc([string]$s) { [Net.WebUtility]::HtmlEncode($s) }
function Slug([string]$s) { ($s.ToLower() -replace '[^a-z0-9._-]+', '-').Trim('-') }
function StripTags([string]$s) { ([Net.WebUtility]::HtmlDecode(([regex]::Replace($s, '<[^>]+>', ' ')))) -replace '\s+', ' ' | ForEach-Object { $_.Trim() } }
function NatKey([string]$s) { [regex]::Replace($s.ToLower(), '\d+', { param($m) $m.Value.PadLeft(6, '0') }) }
function Camel([string]$s) { [regex]::Replace($s, '([a-z0-9])([A-Z])', '$1 $2') }
function Pretty([string]$s) {
    if ($s -ceq 'MetaData') { return 'Metadata' }
    $t = Camel ($s -replace '[-_]+', ' ')
    return ($t.Substring(0, 1).ToUpper() + $t.Substring(1))
}
function JStr([string]$s) {
    $sb = New-Object Text.StringBuilder
    [void]$sb.Append('"')
    foreach ($ch in $s.ToCharArray()) {
        switch ($ch) {
            '"'  { [void]$sb.Append('\"') }
            '\'  { [void]$sb.Append('\\') }
            '<'  { [void]$sb.Append('\u003c') }
            '>'  { [void]$sb.Append('\u003e') }
            '&'  { [void]$sb.Append('\u0026') }
            default {
                if ([int]$ch -lt 32) { [void]$sb.Append(('\u{0:x4}' -f [int]$ch)) } else { [void]$sb.Append($ch) }
            }
        }
    }
    [void]$sb.Append('"')
    $sb.ToString()
}
function RelPath([string[]]$fromDir, [string[]]$toFile) {
    $c = 0
    while ($c -lt $fromDir.Count -and $c -lt ($toFile.Count - 1) -and $fromDir[$c] -eq $toFile[$c]) { $c++ }
    $up = @()
    for ($i = $c; $i -lt $fromDir.Count; $i++) { $up += '..' }
    $down = @()
    for ($i = $c; $i -lt $toFile.Count; $i++) { $down += $toFile[$i] }
    (@($up) + @($down)) -join '/'
}
function WriteOut([string[]]$segs, [string]$text) {
    $p = Join-Path $site ($segs -join '\')
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $p) | Out-Null
    [IO.File]::WriteAllText($p, $text, $utf8)
}

# ---------------------------------------------------------------- 1. parse cached pages
$pages = New-Object Collections.ArrayList
foreach ($f in (Get-ChildItem $cache -File)) {
    $h = [IO.File]::ReadAllText($f.FullName, [Text.Encoding]::UTF8)
    $c = [regex]::Match($h, 'rel="canonical" href="([^"]*)"').Groups[1].Value
    if (-not $c.StartsWith($base)) { Write-Output "SKIP (no canonical) $($f.Name)"; continue }
    $m = [regex]::Match($h, '(?s)<main[^>]*id="content"[^>]*>(.*?)<footer')
    if (-not $m.Success) { $m = [regex]::Match($h, '(?s)<main[^>]*>(.*?)</main>') }
    if (-not $m.Success) { Write-Output "SKIP (no content) $($f.Name)"; continue }
    $rel = [Uri]::UnescapeDataString($c.Substring($base.Length)) -replace '\.html$', ''
    [void]$pages.Add([pscustomobject]@{
        Url = $c; Rel = $rel; Key = $rel.ToLower(); Segs = @($rel.Split('/'))
        Body = $m.Groups[1].Value
        Project = (StripTags ([regex]::Match($h, '(?s)<h1 class="project-name">(.*?)</h1>').Groups[1].Value))
        Title = ''; Out = @(); Toc = @(); Text = ''; Heads = ''; Parent = $null; Crumbs = ''
    })
}
Write-Output "Parsed $($pages.Count) pages"

# ---------------------------------------------------------------- 2. tree + output paths
function New-Dir($name, $label, $parent, $key) {
    $ds = @()
    if ($parent) { $ds = @($parent.DirSegs) }
    $ds += (Slug $name)
    [pscustomobject]@{
        IsDir = $true; Name = $name; Label = $label; Key = $key; Parent = $parent
        Pages = (New-Object Collections.ArrayList); Dirs = (New-Object Collections.ArrayList)
        DirSegs = $ds; Out = (@($ds) + 'index.html')
    }
}
$homeNode = [pscustomobject]@{
    IsDir = $true; Name = ''; Label = 'Home'; Key = ''; Parent = $null
    Pages = (New-Object Collections.ArrayList); Dirs = (New-Object Collections.ArrayList)
    DirSegs = @(); Out = @('index.html')
}
$dirMap = @{ '' = $homeNode }
$pageMap = @{}
foreach ($p in $pages) {
    $cur = $homeNode
    for ($i = 0; $i -lt $p.Segs.Count - 1; $i++) {
        $k = (($p.Segs[0..$i]) -join '/').ToLower()
        if (-not $dirMap.ContainsKey($k)) {
            $d = New-Dir $p.Segs[$i] (Pretty $p.Segs[$i]) $cur $k
            [void]$cur.Dirs.Add($d)
            $dirMap[$k] = $d
        }
        $cur = $dirMap[$k]
    }
    $p.Parent = $cur
    $name = $p.Segs[$p.Segs.Count - 1]
    $p.Out = @($cur.DirSegs) + ((Slug $name) + '.html')
    [void]$cur.Pages.Add($p)
    $pageMap[$p.Key] = $p
}
# Output path collisions would silently overwrite pages
$dups = $pages | Group-Object { $_.Out -join '/' } | Where-Object { $_.Count -gt 1 }
if ($dups) { $dups | ForEach-Object { Write-Output "COLLISION $($_.Name)" }; throw 'Output path collision' }

# ---------------------------------------------------------------- 3. convert bodies
$script:cur     = $null
$script:curUri  = $null
$script:images  = New-Object System.Collections.Hashtable   # case-sensitive: absolute url -> local relative path (under site\)
$script:nInt    = 0
$script:nExt    = 0
$script:unres   = New-Object Collections.ArrayList
$script:ids     = $null
$script:toc     = $null

function LocalImage([Uri]$abs) {
    $rest = [Uri]::UnescapeDataString($abs.AbsolutePath.Substring($baseUri.AbsolutePath.Length))
    if ($rest.ToLower().StartsWith('images/')) {
        $script:images[$abs.AbsoluteUri] = $rest
        $segs = @($rest.Split('/') | ForEach-Object { $_ })
        return $segs
    }
    return $null
}
function Up([string[]]$fromDir) { (@($fromDir | ForEach-Object { '..' }) -join '/') }

$linkEval = {
    param($mm)
    $pre = $mm.Groups[1].Value; $raw = $mm.Groups[2].Value; $post = $mm.Groups[3].Value
    $href = [Net.WebUtility]::HtmlDecode($raw).Trim()
    if ($href -eq '' -or $href.StartsWith('#')) { return $mm.Value }
    if ($href -match '^(?i)(mailto:|tel:)') { return $mm.Value }
    if ($href -match '^(?i)javascript:') { return $pre + '#' + $post }
    try { $abs = New-Object Uri($script:curUri, $href) } catch { return $mm.Value }
    # relative links that climb above the site root (e.g. ../../../Reference/x.html) are re-rooted under the site
    if ($href -notmatch '^(?i)[a-z][a-z0-9+.-]*:' -and $abs.Host -eq $baseUri.Host -and -not $abs.AbsolutePath.StartsWith($baseUri.AbsolutePath)) {
        $abs = New-Object Uri($baseUri, $abs.PathAndQuery.TrimStart('/') + $abs.Fragment)
    }
    if ($abs.Host -ne $baseUri.Host -or -not $abs.AbsolutePath.StartsWith($baseUri.AbsolutePath)) {
        $script:nExt++
        return $mm.Value
    }
    $fromDir = @($script:cur.Out[0..($script:cur.Out.Count - 2)] | Where-Object { $_ })
    if ($script:cur.Out.Count -eq 1) { $fromDir = @() }
    $frag = $abs.Fragment
    $local = LocalImage $abs
    if ($local) { return $pre + (HtmlEnc (RelPath $fromDir (@('images') + $local[1..($local.Count - 1)]))) + $post }
    $p = [Uri]::UnescapeDataString($abs.AbsolutePath.Substring($baseUri.AbsolutePath.Length))
    $p = $p -replace '(?i)(^|/)index\.(html|md)$', ''
    $p = ($p -replace '(?i)\.(html|md)$', '').Trim('/').ToLower()
    if ($pageMap.ContainsKey($p)) {
        $script:nInt++
        return $pre + (HtmlEnc ((RelPath $fromDir $pageMap[$p].Out) + $frag)) + $post
    }
    if ($dirMap.ContainsKey($p)) {
        $script:nInt++
        return $pre + (HtmlEnc ((RelPath $fromDir $dirMap[$p].Out) + $frag)) + $post
    }
    $leaf = ($p -split '/')[-1]
    $cand = @($pageMap.Values | Where-Object { $_.Segs[$_.Segs.Count - 1].ToLower() -eq $leaf })
    if ($leaf -and $cand.Count -eq 1) { $script:nInt++; return $pre + (HtmlEnc ((RelPath $fromDir $cand[0].Out) + $frag)) + $post }
    [void]$script:unres.Add("$($script:cur.Rel) -> $href")
    return $pre + (HtmlEnc $abs.AbsoluteUri) + $post
}
$srcEval = {
    param($mm)
    $v = [Net.WebUtility]::HtmlDecode($mm.Groups[1].Value).Trim()
    if ($v -match '^(?i)(data:|https?://(?!genevaers\.github\.io))') { return $mm.Value }
    try { $abs = New-Object Uri($script:curUri, $v) } catch { return $mm.Value }
    if ($abs.Host -eq $baseUri.Host -and $abs.AbsolutePath.StartsWith('/images/')) { $abs = New-Object Uri($baseUri, $abs.AbsolutePath.Substring(1)) }
    $local = LocalImage $abs
    if (-not $local) { return ' src="' + (HtmlEnc $abs.AbsoluteUri) + '"' }
    $fromDir = @()
    if ($script:cur.Out.Count -gt 1) { $fromDir = @($script:cur.Out[0..($script:cur.Out.Count - 2)]) }
    $r = RelPath $fromDir (@('images') + $local[1..($local.Count - 1)])
    $r = (($r.Split('/') | ForEach-Object { if ($_ -eq '..') { $_ } else { [Uri]::EscapeDataString($_) } }) -join '/')
    return ' src="' + $r + '"'
}
$headEval = {
    param($mm)
    $lvl = $mm.Groups[1].Value; $attrs = $mm.Groups[2].Value; $inner = $mm.Groups[3].Value
    $idm = [regex]::Match($attrs, '(?i)\sid="([^"]*)"')
    $text = StripTags $inner
    if ($idm.Success) { $id = $idm.Groups[1].Value }
    else {
        $id = (Slug $text); if (-not $id) { $id = 'section' }
        $n = 2; $b = $id
        while ($script:ids.Contains($id)) { $id = "$b-$n"; $n++ }
        [void]$script:ids.Add($id)
        $attrs = $attrs + ' id="' + $id + '"'
    }
    $script:toc += , @($lvl, $id, $text)
    return "<h$lvl$attrs>$inner</h$lvl>"
}

foreach ($p in $pages) {
    $script:cur = $p
    $script:curUri = [Uri]($p.Url -replace '/includes/', '/')   # include fragments are rendered inside their parent folder
    $b = [regex]::Replace($p.Body, '(?is)<script.*?</script>', '')
    $b = [regex]::Replace($b, '(?is)<!--.*?-->', '')

    # Title: first heading when the page opens with one; otherwise the page's own header; otherwise the file name
    $title = ''
    $m = [regex]::Match($b, '(?is)^\s*<h([12])[^>]*>(.*?)</h\1>')
    if ($m.Success) { $title = StripTags $m.Groups[2].Value; $b = $b.Substring($m.Length) }
    if (-not $title) {
        if ($p.Project -and $p.Project -ne $siteName) { $title = $p.Project }
        else { $title = Pretty $p.Segs[$p.Segs.Count - 1] }
    }
    $p.Title = $title
    $b = [regex]::Replace($b, '(?i)<(/?)h1(?=[\s>])', '<${1}h2')

    $b = [regex]::Replace($b, '(?is)(<a\b[^>]*?\shref\s*=\s*")([^"]*)(")', $linkEval)
    $b = [regex]::Replace($b, '(?i)\ssrc="([^"]+)"', $srcEval)

    $script:ids = New-Object 'Collections.Generic.HashSet[string]'
    foreach ($im in [regex]::Matches($b, '(?i)\sid="([^"]*)"')) { [void]$script:ids.Add($im.Groups[1].Value) }
    $script:toc = @()
    $b = [regex]::Replace($b, '(?is)<h([23])([^>]*)>(.*?)</h\1>', $headEval)
    $b = [regex]::Replace($b, '(?is)<table\b', '<div class="tablewrap"><table')
    $b = [regex]::Replace($b, '(?is)</table>', '</table></div>')

    $p.Body = $b
    $p.Toc = $script:toc
    $plain = StripTags $b
    $p.Text = $plain.Substring(0, [Math]::Min(4000, $plain.Length))
    $p.Heads = (($script:toc | ForEach-Object { $_[2] }) -join ' | ')
}
Write-Output "Links rewritten: $($script:nInt) internal, $($script:nExt) external, $($script:unres.Count) unresolved on-site"
$script:unres | Select-Object -First 15 | ForEach-Object { Write-Output "  unresolved: $_" }
$fallback = @($pages | Where-Object { $_.Title -ceq (Pretty $_.Segs[$_.Segs.Count - 1]) })
Write-Output "Pages titled from file name: $($fallback.Count)"

# ---------------------------------------------------------------- 4. images
$imgRoot = Join-Path $site 'images'
$failed = New-Object Collections.ArrayList
if (-not $SkipImages) {
    $n = 0
    foreach ($kv in $script:images.GetEnumerator()) {
        $n++
        $dest = Join-Path $site ($kv.Value -replace '/', '\')
        if (Test-Path $dest) { continue }  # (case-insensitive file system: a .GIF variant is satisfied by an earlier .gif)
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $dest) | Out-Null
        try { Invoke-WebRequest -Uri $kv.Key -UseBasicParsing -TimeoutSec 30 -OutFile $dest }
        catch {
            if (Test-Path $dest) { Remove-Item $dest -Force }
            $alt = [regex]::Replace($kv.Key, '\.([A-Za-z0-9]+)$', { param($m) '.' + $m.Groups[1].Value.ToLower() })
            try { if ($alt -ceq $kv.Key) { throw 'same' }; Invoke-WebRequest -Uri $alt -UseBasicParsing -TimeoutSec 30 -OutFile $dest }
            catch { [void]$failed.Add($kv.Key); if (Test-Path $dest) { Remove-Item $dest -Force } }
        }
        if ($n % 40 -eq 0) { Write-Output "images $n / $($script:images.Count)" }
    }
    Write-Output "Images: $($script:images.Count) referenced, $($failed.Count) failed"
    $failed | ForEach-Object { Write-Output "  image failed: $_" }
}

# ---------------------------------------------------------------- 5. ordering, nav, pager
function SortedPages($d) { @($d.Pages | Sort-Object { NatKey $_.Title }) }
function SortedDirs($d) {
    if ($d.Key -eq '') { return @($d.Dirs | Sort-Object { $i = [Array]::IndexOf($groupOrder, $_.Key); if ($i -lt 0) { 99 } else { $i } }) }
    return @($d.Dirs | Sort-Object { NatKey $_.Label })
}
function CountPages($d) { $n = $d.Pages.Count; foreach ($c in $d.Dirs) { $n += (CountPages $c) }; $n }
$flat = New-Object Collections.ArrayList
function Walk($d) {
    foreach ($p in (SortedPages $d)) { [void]$flat.Add($p) }
    foreach ($c in (SortedDirs $d)) { Walk $c }
}
Walk $homeNode

function NavJson($d) {
    $parts = New-Object Collections.ArrayList
    foreach ($p in (SortedPages $d)) { [void]$parts.Add('{"t":' + (JStr $p.Title) + ',"u":' + (JStr ($p.Out -join '/')) + '}') }
    foreach ($c in (SortedDirs $d)) {
        [void]$parts.Add('{"t":' + (JStr $c.Label) + ',"u":' + (JStr ($c.Out -join '/')) + ',"c":' + (NavJson $c) + '}')
    }
    '[' + ($parts -join ',') + ']'
}
WriteOut @('assets', 'nav.js') ('window.NAV=' + (NavJson $homeNode) + ';')

# breadcrumbs (as search "path" text and HTML)
function CrumbsFor($d, [string[]]$fromDir, [string]$last) {
    $chain = New-Object Collections.ArrayList
    $x = $d
    while ($x -and $x.Key -ne '') { $chain.Insert(0, $x); $x = $x.Parent }
    $html = '<a href="' + (RelPath $fromDir @('index.html')) + '">Home</a>'
    $plain = New-Object Collections.ArrayList
    foreach ($c in $chain) {
        if (($c.Out -join '/') -eq $last) { continue }
        $html += '<span class="sep">/</span><a href="' + (RelPath $fromDir $c.Out) + '">' + (HtmlEnc $c.Label) + '</a>'
        [void]$plain.Add($c.Label)
    }
    return @($html, ($plain -join ' / '))
}

# search index
$sj = New-Object Collections.ArrayList
foreach ($p in $flat) {
    $cr = CrumbsFor $p.Parent @() ''
    [void]$sj.Add('{"t":' + (JStr $p.Title) + ',"u":' + (JStr ($p.Out -join '/')) + ',"s":' + (JStr $cr[1]) + ',"h":' + (JStr $p.Heads) + ',"x":' + (JStr $p.Text) + '}')
}
WriteOut @('assets', 'search-index.js') ('window.SEARCH=[' + ($sj -join ',') + '];')

# ---------------------------------------------------------------- 6. page template
function Shell([string]$title, [string[]]$outSegs, [string]$crumbs, [string]$main, [string]$tocHtml, [string]$srcUrl) {
    $depth = $outSegs.Count - 1
    $r = ''
    for ($i = 0; $i -lt $depth; $i++) { $r += '../' }
    $self = $outSegs -join '/'
    $cls = 'layout'
    if (-not $tocHtml) { $cls += ' no-toc' }
    $src = ''
    if ($srcUrl) { $src = ' &middot; <a href="' + (HtmlEnc $srcUrl) + '">View original page</a>' }
    $docTitle = (HtmlEnc $title)
    if ($outSegs.Count -ne 1) { $docTitle += ' | ' + (HtmlEnc $siteName) }
    @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$docTitle</title>
<link rel="stylesheet" href="${r}assets/style.css">
</head>
<body data-root="$r" data-page="$(HtmlEnc $self)">
<a class="skip" href="#content">Skip to content</a>
<header class="topbar">
<button id="menu-toggle" class="menu-btn" type="button" aria-label="Toggle navigation" aria-expanded="false">Menu</button>
<a class="brand" href="${r}index.html">$siteName</a>
<div class="search"><input id="q" type="search" placeholder="Search the documentation" aria-label="Search the documentation" autocomplete="off"><ul id="results" hidden></ul></div>
</header>
<div class="$cls">
<nav id="sidebar" aria-label="Documentation navigation"><noscript><p><a href="${r}index.html">Home</a></p></noscript></nav>
<main id="content">
$crumbs
$main
</main>
$tocHtml
<footer class="sitefoot">Compiled from the GenevaERS User Documentation$src</footer>
</div>
<script src="${r}assets/nav.js"></script>
<script src="${r}assets/site.js"></script>
</body>
</html>
"@
}

# ---------------------------------------------------------------- 7. write content pages
for ($i = 0; $i -lt $flat.Count; $i++) {
    $p = $flat[$i]
    $fromDir = @($p.Parent.DirSegs)
    $cr = CrumbsFor $p.Parent $fromDir ''
    $crumbs = '<nav class="crumbs" aria-label="Breadcrumb">' + $cr[0] + '</nav>'
    $tocHtml = ''
    if ($p.Toc.Count -ge 2) {
        $li = ($p.Toc | ForEach-Object { '<li class="l' + $_[0] + '"><a href="#' + (HtmlEnc $_[1]) + '">' + (HtmlEnc $_[2]) + '</a></li>' }) -join ''
        $tocHtml = '<aside class="toc" aria-label="On this page"><h2>On this page</h2><ul>' + $li + '</ul></aside>'
    }
    $pager = '<nav class="pager" aria-label="Previous and next page">'
    if ($i -gt 0) { $pv = $flat[$i - 1]; $pager += '<a class="prev" href="' + (HtmlEnc (RelPath $fromDir $pv.Out)) + '"><span>Previous</span>' + (HtmlEnc $pv.Title) + '</a>' }
    if ($i -lt $flat.Count - 1) { $nx = $flat[$i + 1]; $pager += '<a class="next" href="' + (HtmlEnc (RelPath $fromDir $nx.Out)) + '"><span>Next</span>' + (HtmlEnc $nx.Title) + '</a>' }
    $pager += '</nav>'
    $main = '<h1>' + (HtmlEnc $p.Title) + '</h1>' + "`n" + $p.Body + "`n" + $pager
    WriteOut $p.Out (Shell $p.Title $p.Out $crumbs $main $tocHtml $p.Url)
}

# ---------------------------------------------------------------- 8. section index pages + home
foreach ($d in ($dirMap.Values | Where-Object { $_.Key -ne '' })) {
    $fromDir = @($d.DirSegs)
    $cr = CrumbsFor $d $fromDir ($d.Out -join '/')
    $crumbs = '<nav class="crumbs" aria-label="Breadcrumb">' + $cr[0] + '</nav>'
    $total = CountPages $d
    $main = '<h1>' + (HtmlEnc $d.Label) + '</h1>'
    $desc = $groupDesc[$d.Key]
    if ($desc) { $main += '<p class="lead">' + (HtmlEnc $desc) + '</p>' } else { $main += '<p class="lead">' + $total + ' pages in this section.</p>' }
    $subs = @(SortedDirs $d)
    if ($subs.Count) {
        $main += '<h2>Subsections</h2><ul class="sectionlist">'
        foreach ($c in $subs) { $main += '<li><a href="' + (HtmlEnc (RelPath $fromDir $c.Out)) + '">' + (HtmlEnc $c.Label) + '</a> <span class="n">(' + (CountPages $c) + ' pages)</span></li>' }
        $main += '</ul>'
    }
    $pp = @(SortedPages $d)
    if ($pp.Count) {
        $main += '<h2>Topics</h2><ul class="sectionlist">'
        foreach ($p in $pp) { $main += '<li><a href="' + (HtmlEnc (RelPath $fromDir $p.Out)) + '">' + (HtmlEnc $p.Title) + '</a></li>' }
        $main += '</ul>'
    }
    WriteOut $d.Out (Shell $d.Label $d.Out $crumbs $main '' '')
}

$main = '<h1>' + $siteName + '</h1><p class="lead">GenevaERS is a single-pass optimization engine. This site presents the full user documentation (' + $pages.Count + ' pages) with a navigation tree, search, and links between topics.</p>'
$first = $null
$main += '<div class="start">'
foreach ($lnk in @(@('get started/concepts/intro0_introduction_to_using_genevaers', 'Start with the introduction'))) {
    if ($pageMap.ContainsKey($lnk[0])) { $main += '<a href="' + (HtmlEnc ($pageMap[$lnk[0]].Out -join '/')) + '">' + $lnk[1] + '</a>' }
}
$main += '</div><ul class="cards">'
foreach ($g in (SortedDirs $homeNode)) {
    $main += '<li class="card"><h2><a href="' + (HtmlEnc ($g.Out -join '/')) + '">' + (HtmlEnc $g.Label) + '</a></h2><div class="count">' + (CountPages $g) + ' pages</div>'
    if ($groupDesc[$g.Key]) { $main += '<p>' + (HtmlEnc $groupDesc[$g.Key]) + '</p>' }
    $items = @((SortedPages $g) | Select-Object -First 5 | ForEach-Object { @{ T = $_.Title; U = ($_.Out -join '/') } })
    if ($items.Count -lt 5) { $items += @((SortedDirs $g) | Select-Object -First (5 - $items.Count) | ForEach-Object { @{ T = $_.Label; U = ($_.Out -join '/') } }) }
    if ($items.Count) {
        $main += '<ul>'
        foreach ($it in $items) { $main += '<li><a href="' + (HtmlEnc $it.U) + '">' + (HtmlEnc $it.T) + '</a></li>' }
        $main += '</ul>'
    }
    $main += '<a class="more" href="' + (HtmlEnc ($g.Out -join '/')) + '">Browse ' + (HtmlEnc $g.Label) + '</a></li>'
}
$main += '</ul>'
WriteOut @('index.html') (Shell $siteName @('index.html') '' $main '' '')

Copy-Item (Join-Path $root 'site_src\style.css') (Join-Path $site 'assets\style.css') -Force
Copy-Item (Join-Path $root 'site_src\site.js') (Join-Path $site 'assets\site.js') -Force

Write-Output "Site written: $site ($($pages.Count) content pages, $($dirMap.Count) section pages)"
