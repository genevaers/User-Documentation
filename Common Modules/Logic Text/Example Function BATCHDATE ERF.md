
|Example logic text|Meaning|
|------------------|-------|
|IF ({field1} < BATCHDATE(-7))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF|Skip any input records where field1 is more than<br> 7 days before the date of running this view.<br> Select all other records.<br> This example can also be written:<br>SKIPIF({field1} < BATCHDATE(-7))|

