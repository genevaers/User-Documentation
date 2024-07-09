# GVBRCA DD Statements  
  
|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|GRCAPARM|GVBRCA Parameter File|Yes|PS|FB|80|
||VDP|VDP File||PS|VB|8192|
||JLT|Reference-Phase Logic Table||PS|VB|8192|
||XLT|Extract-Phase Logic Table||PS|VB|8192|
|Output|VDPRPT|VDP Report File||PS|VB|8192|
||JLTRPT|Reference-Phase Logic Table Report||PS|VB|8192|
||XLTRPT|Extract-Phase Logic Table Report||PS|VB|8192|
||GRCARPT|GVBRCA Control Report|Yes|PS|VB|164|
||GRCALOG|GVBRCA Log File|Yes|PS|VB|164|
