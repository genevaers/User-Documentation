
|Example logic text|Meaning|
|------------------|-------|
|**IF (MONTHSBETWEEN({field1},{field2}) >= 3)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where there are at least 3 months between field1 and field2,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(MONTHSBETWEEN({field1},{field2}) >= 3)**|

