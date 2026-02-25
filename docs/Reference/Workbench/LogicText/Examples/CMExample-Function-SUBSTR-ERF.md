
# Examples: SUBSTR function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (SUBSTR({field1},1,3) = "ABC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field1 has the <br>characters ABC starting in position 1, <br>and skip all other records.<br>The code can also be written as:<br>&nbsp;&nbsp;**SELECTIF(SUBSTR({field1},1,3) = "ABC")**|
|**IF (SUBSTR({field2},6,5) CONTAINS "AA") THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;SELECT<br>ENDIF**|Select only records where field2 has the <br>characters "AA" somewhere in the five bytes starting at position 6.<br>This example can also be written:<br>&nbsp;&nbsp;**SELECTIF(SUBSTR({field2},6,5) contains "AA")**|
