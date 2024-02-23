
# Examples: YEARSBETWEEN function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = RUNYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous year,<br>and skip all other records.<br>The example at left assumes that field4 is a year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} = RUNYEAR(-1))**|
|**IF (YEARSBETWEEN({field1},{field2}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where there is at least one year<br>between field1 and field2, and skip all other records.<br>This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(YEARSBETWEEN({field1},{field2}) >= 1)**|

