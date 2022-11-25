
# Examples: RUNQUARTER function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field3} >= RUNQUARTER(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field3 is the previous quarter or later,<br>and skip all other records.<br>The example at left assumes that field3 is a month value.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field3} >= RUNQUARTER(-1))**|

