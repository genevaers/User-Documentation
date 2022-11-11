
# Examples: ISSPACES function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISSPACES({field9})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field9 is spaces, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISSPACES({field9})**|

