
# Examples: RUNDAY function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} < RUNDAY(-7))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip any input records where field1 is more than 7 days before the<br>date of running this view, and select all other records.<br>This example assumes that field1 is a date.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} < RUNDAY(-7))**|

