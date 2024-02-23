
# Examples: BATCHDATE function in ERF

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} < BATCHDATE(-7))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip any input records where field1 is more than 7 days before the<br>date of running this view. Select all other records.<br> This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} < BATCHDATE(-7))**|

