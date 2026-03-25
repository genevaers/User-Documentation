
# Examples: SUBSTR function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (SUBSTR({field2},6,5) CONTAINS "AA") THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;SELECT<br>ENDIF**|Select only records where field2 has the <br>characters "AA" somewhere in the five bytes starting at position 6.<br>This example can also be written:<br>&nbsp;&nbsp;**SELECTIF(SUBSTR({field2},6,5) contains "AA")**|
