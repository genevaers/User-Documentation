
|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= RUNMONTH(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous month or later,<br>and skip all other records.<br>The example at left assumes that field2 is a month number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field2} >= RUNMONTH(-1))**|

