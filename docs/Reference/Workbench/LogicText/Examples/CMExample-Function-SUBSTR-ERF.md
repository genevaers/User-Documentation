
# Examples: SUBSTR function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (SUBSTR({field1},1,3) = "ABC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field1 has the characters ABC starting in position 1, and skip all other records.<br>The code can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(SUBSTR({field1},1,3) = "ABC")**|
|**IF (SUBSTR({field2},1,3) contains "AA")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where fields2 has the characters "AA" somewhere in the first 3 bytes<br>This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(SUBSTR({field2},1,3) contains "AA")**|
