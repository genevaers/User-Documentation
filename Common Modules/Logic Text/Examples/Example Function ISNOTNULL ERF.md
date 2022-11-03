
|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNULL({field3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field3 does not contain null values,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTNULL({field3})**|
|**IF ISNOTNULL({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where the lookup field for lookup path Lookup1<br>does not contain null values, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTNULL({Lookup1})**|

