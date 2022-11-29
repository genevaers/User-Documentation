
# Examples: ISNUMERIC function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNUMERIC({field5})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field5 is numeric, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNUMERIC({field5}))**|

