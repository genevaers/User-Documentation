# Run Control Generator (RCG) DD Statements  
  
|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|RCGPARM|RCG Parameter File|Yes|PS|FB|80|
||DBFLDRS|Database Folder List|If INPUT_TYPE=DB2 and a DBVIEWS DD statement does not exist|PS|FB|80|
||DBVIEWS|Database View List|If INPUT_TYPE=DB2 and a DBFLDRS DD statement does not exist|PS|FB|80|
||RUNVIEWS|Run View List|No|PS|FB|80|
||WBXMLI|Workbench XML Input Library|If INPUT_TYPE=WBXML|PO|VB|8192|
||VDPXMLI|VDP XML Input Library|If INPUT_TYPE=VDPXML|PO|VB|8192|
||VDPOLD|VDP File|If VDP_REPORT=Y and COMPARE=Y|PS|VB|8192|
||JLTOLD|Reference-Phase Logic Table|If JLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
||XLTOLD|Extract-Phase Logic Table|If XLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
|Output|VDPNEW|VDP Output File|Yes|PS|VB|8192|
||JLTNEW|Reference-Phase Logic Table|Yes|PS|VB|8192|
||XLTNEW|Extract-Phase Logic Table|Yes|PS|VB|8192|
||VDPRPT|VDP Report File|If VDP_REPORT=Y|PS|VB|8192|
||JLTRPT|Reference-Phase Logic Table Report|If JLT_REPORT=Y|PS|VB|8192|
||XLTRPT|Extract-Phase Logic Table Report|If XLT_REPORT=Y|PS|VB|8192|
||RCGRPT|RCG Control Report|Yes|PS|VB|164|
||RCGLOG|RCG Log File|Yes|PS|VB|164|
