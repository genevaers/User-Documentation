---
layout: default
title: "GVBMR91 DD Statements"
parent: Run Control Utilities
nav_order: 4
---

# GVBMR91 DD Statements  
  
|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|MR91PARM|GVBMR91 Parameter File|Yes|PS|FB|80|
||WBXMLS|Workbench XML Member List|No|PS|FB|80|
||VDPXMLS|VDP XML Member List|No|PS|FB|80|
||DBFLDRS|Database Folder List|If INPUT_TYPE=DB2 and a DBVIEWS DD statement does not exist|PS|FB|80|
||DBVIEWS|Database View List|If INPUT_TYPE=DB2 and a DBFLDRS DD statement does not exist|PS|FB|80|
||RUNVIEWS|Run View List|No|PS|FB|80|
||WBXMLI|Workbench XML Input Library|If INPUT_TYPE=WBXML|PO|VB|8192|
||VDPXMLI|VDP XML Input Library|If INPUT_TYPE=VDPXML|PO|VB|8192|
||VDPXSD|VDP XML Schema Definition|If INPUT_TYPE=VDPXML|PS|VB|259|
||DSNAOINI|DB2 ODBC Initialization File|If INPUT_TYPE=DB2|PS|FB|80|
|Output|WBXML|Workbench XML Output Library|If OUTPUT_WB_XML=Y|PO|VB|8192|
||VDPXML|VDP XML Output File|If OUTPUT_VDP_XML=Y|PS|VB|8192|
||VDP|VDP Output File|If OUTPUT_RUN_CONTROL=Y|PS|VB|8192|
||JLT|Reference-Phase Logic Table|If OUTPUT_RUN_CONTROL=Y|PS|VB|8192|
||XLT|Extract-Phase Logic Table|If OUTPUT_RUN_CONTROL=Y|PS|VB|8192|
||MR91RPT|GVBMR91 Control Report|Yes|PS|VB|164|
||MR91LOG|GVBMR91 Log File|Yes|PS|VB|164|
||MR91TRAC|GVBMR91 Trace File|If TRACE=Y|PS|VB|164|

