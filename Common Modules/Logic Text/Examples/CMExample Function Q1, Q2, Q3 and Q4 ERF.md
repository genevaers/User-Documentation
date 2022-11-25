
# Examples: Q1, Q2, Q3 and Q4 function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} = Q1())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where field1 is a date in Q1 of the current year,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field1} = Q1())**|

