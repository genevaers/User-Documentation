
|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= FISCALMONTH(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous fiscal month or later,<br>and skip all other records. Fiscal months means that if the date of<br>running this view is fiscal month one, then only records from<br>fiscal month one are selected.<br>The example at left assumes that field2 is a fiscal month number.<br>The code at left can also be written as:<br>**SELECTIF({field2} >= FISCALMONTH(-1))**|
