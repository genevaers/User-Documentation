
# Examples: LEFT function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (LEFT({field2},5) CONTAINS "AA") THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;SELECT<br>ENDIF**|Select only records where field2 has the <br>characters "AA" somewhere in the first five bytes.<br>This example can also be written:<br>&nbsp;&nbsp;**SELECTIF(LEFT({field2},5) contains "AA")**|
