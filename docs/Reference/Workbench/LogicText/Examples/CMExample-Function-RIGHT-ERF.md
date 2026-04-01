
# Examples: RIGHT function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (RIGHT({field2},8) CONTAINS "AA") THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;SELECT<br>ENDIF**|Select only records where field2 has the <br>characters "AA" somewhere in the last eight bytes.<br>This example can also be written:<br>&nbsp;&nbsp;**SELECTIF(RIGHT({field2},8) contains "AA")**|
