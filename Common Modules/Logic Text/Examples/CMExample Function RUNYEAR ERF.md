
# Examples: RUNYEAR function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = RUNYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous year,<br>and skip all other records.<br>The example at left assumes that field4 is a year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} = RUNYEAR(-1))**|

