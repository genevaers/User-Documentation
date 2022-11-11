
# Examples: FISCALQUARTER function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= FISCALQUARTER(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous fiscal quarter<br>or later,and skip all other records. Fiscal quarter means that if<br>the date of running this view is fiscal quarter one, then<br>only records from fiscal quarter one are selected.<br>The example at left assumes that field2 is a fiscal quarter number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field2} >= FISCALQUARTER(-1))**|
