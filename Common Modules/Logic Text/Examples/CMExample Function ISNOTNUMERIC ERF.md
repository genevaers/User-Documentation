
# Examples: ISNOTNUMERIC function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNUMERIC({field7})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field7 is not numeric, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNOTNUMERIC({field7})**|

