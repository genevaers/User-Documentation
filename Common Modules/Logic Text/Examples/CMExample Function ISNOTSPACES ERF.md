
# Examples: ISNOTSPACES function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTSPACES({field2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field2 is not spaces, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTSPACES({field2})**|

