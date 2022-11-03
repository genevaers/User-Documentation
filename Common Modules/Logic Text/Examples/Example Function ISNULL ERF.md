
|Example logic text|Meaning|
|------------------|-------|
|**IF ISNULL({field1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field1 contains null values,<br>and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNULL({field1})**|

