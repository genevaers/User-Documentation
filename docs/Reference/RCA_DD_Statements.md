# Run Control Analyser (RCA) DD Statements  
  
|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|RCAPARM|RCA Parameter File|Yes|PS|FB|80|
||VDPNEW|VDP File||PS|VB|8192|
||JLTNEW|Reference-Phase Logic Table||PS|VB|8192|
||XLTNEW|Extract-Phase Logic Table||PS|VB|8192|
|If COMPARE=Y|VDPOLD|VDP File||PS|VB|8192|
||JLTOLD|Reference-Phase Logic Table||PS|VB|8192|
||XLTOLD|Extract-Phase Logic Table||PS|VB|8192|
|Output|VDPRPT|VDP Report File||PS|VB|8192|
||JLTRPT|Reference-Phase Logic Table Report||PS|VB|8192|
||XLTRPT|Extract-Phase Logic Table Report||PS|VB|8192|
||RCARPT|RCA Control Report|Yes|PS|VB|164|
||RCALOG|RCA Log File|Yes|PS|VB|164|
