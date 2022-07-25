---
layout: default
title: "GVBVDPNL DD Statements"
parent: Run Control Utilities
nav_order: 6
---

# GVBVDPNL DD Statements 

|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|
|:-|:-|:-|:-|:-|:-|-:|
|Input|VDPNPARM|GVBVDPNL Parameter File|No|PS|FB|80|
||VDP1|View Definition Parameter File 1|Yes|PS|VB|32756|
||VDP2|View Definition Parameter File 2|If COMPARE=Y|PS|VB|32756|
|Output|VDPSUM1|VDP Record Summary Report for VDP1|Yes|PS|VB|164|
||VDPSUM2|VDP Record Summary Report for VDP2|If COMPARE=Y|PS|VB|164|
||VDPSUMC|VDP Record Summary Comparison Report|If COMPARE=Y|PS|VB|164|
||VDPDTL1|VDP Record Detail Report for VDP1|Yes|PS|VB|164|
||VDPDTL2|VDP Record Detail Report for VDP2|If COMPARE=Y|PS|VB|164|
||VIEWRPT1|View Report for VDP1|Yes|PS|VB|164|
||VIEWRPT2|View Report for VDP2|If COMPARE=Y|PS|VB|164|
||VIEWRPTC|View Comparison Report|If COMPARE=Y|PS|VB|164|
||LOGCRPT1|View Logic Report for VDP1|Yes|PS|VB|324|
||LOGCRPT2|View Logic Report for VDP2|If COMPARE=Y|PS|VB|324|
||LOGCRPTC|View Logic Comparison Report|If COMPARE=Y|PS|VB|324|
||LRRPT1|Logical Record Report for VDP1|Yes|PS|VB|164|
||LRRPT2|Logical Record Report for VDP2|If COMPARE=Y|PS|VB|164|
||LRRPTC|Logical Record Comparison Report|If COMPARE=Y|PS|VB|164|
||LPRPT1|Lookup Path Report for VDP1|Yes|PS|VB|164|
||LPRPT2|Lookup Path Report for VDP2|If COMPARE=Y|PS|VB|164|
||LPRPTC|Lookup Path Comparison Report|If COMPARE=Y|PS|VB|164|
||LFRPT1|Logical File Report for VDP1|Yes|PS|VB|164|
||LFRPT2|Logical File Report for VDP2|If COMPARE=Y|PS|VB|164|
||LFRPTC|Logical File Comparison Report|If COMPARE=Y|PS|VB|164|
||PFRPT1|Physical File Report for VDP1|Yes|PS|VB|164|
||PFRPT2|Physical File Report for VDP2|If COMPARE=Y|PS|VB|164|
||PFRPTC|Physical File Comparison Report|If COMPARE=Y|PS|VB|164|
||EXITRPT1|User Exit Report for VDP1|Yes|PS|VB|164|
||EXITRPT2|User Exit Report for VDP2|If COMPARE=Y|PS|VB|164|
||EXITRPTC|User Exit Comparison Report|If COMPARE=Y|PS|VB|164|
||CRECRPT1|Control Record Report for VDP1|Yes|PS|VB|164|
||CRECRPT2|Control Record Report for VDP2|If COMPARE=Y|PS|VB|164|
||CRECRPTC|Control Record Comparison Report|If COMPARE=Y|PS|VB|164|
||DDRPT1|DD Statement Report for VDP1|Yes|PS|VB|164|
||DDRPT2|DD Statement Report for VDP2|If COMPARE=Y|PS|VB|164|
||DDRPTC|DD Statement Comparison Report|If COMPARE=Y|PS|VB|164|
||FMTMPLTS|File Manager Template Library|IF FM_TEMPLATES=Y|PO|VB|164|
||VDPNLRPT|GVBVDPNL Control Report|Yes|PS|VB|164|
||VDPNLLOG|GVBVDPNL Log File|Yes|PS|VB|164|

