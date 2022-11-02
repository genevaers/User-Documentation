
|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = FISCALYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous fiscal year<br>and skip all other records.<br>The example at left assumes that field4 is a fiscal year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} >= FISCALYEAR(-1))**|

