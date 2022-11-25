
# Examples: REPEAT function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF NOT ({field7} = REPEAT("-", 13))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output those records with field7 is not equal<br>to 13 dashes. This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field7} = REPEAT("-", 13))**|
|**IF ({field8} = REPEAT("-", 13))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with field8 is equal<br>to 13 dashes. Select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field8} = REPEAT("-", 13))**|

