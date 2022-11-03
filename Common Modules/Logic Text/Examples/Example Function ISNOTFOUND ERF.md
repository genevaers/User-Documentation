
|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTFOUND({Lookup3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where lookup path Lookup3 does not successfully<br>find a target record, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNOTFOUND({Lookup3})**|

