# Run Control Analyzer (RCA) DD Statements  
  
|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|RCAPARM|RCA Parameter File|Yes|PS|FB|80|
||VDPNEW|VDP File|If VDP_REPORT=Y|PS|VB|8192|
||JLTNEW|Reference-Phase Logic Table|If JLT_REPORT=Y|PS|VB|8192|
||XLTNEW|Extract-Phase Logic Table|If XLT_REPORT=Y|PS|VB|8192|
||VDPOLD|VDP File|If VDP_REPORT=Y and COMPARE=Y|PS|VB|8192|
||JLTOLD|Reference-Phase Logic Table|If JLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
||XLTOLD|Extract-Phase Logic Table|If XLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
|Output|VDPRPT|VDP Report File|If VDP_REPORT=Y|PS|VB|8192|
||JLTRPT|Reference-Phase Logic Table Report|If JLT_REPORT=Y|PS|VB|8192|
||XLTRPT|Extract-Phase Logic Table Report|If XLT_REPORT=Y|PS|VB|8192|
||RCARPT|RCA Control Report|Yes|PS|VB|164|
||RCALOG|RCA Log File|Yes|PS|VB|164|
