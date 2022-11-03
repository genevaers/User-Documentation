
|Example logic text|Meaning|
|------------------|-------|
|**IF ISFOUND({Lookup2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where lookup path Lookup2 successfully<br>finds a target record, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISFOUND({Lookup2})**|

