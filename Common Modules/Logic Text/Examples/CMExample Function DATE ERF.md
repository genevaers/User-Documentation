
# Examples: DATE function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF {field1} = DATE("20111201",CCYYMMDD)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select those input records where<br>field1 is December 1, 2011.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field1}= DATE("20111201",CCYYMMDD))**|

