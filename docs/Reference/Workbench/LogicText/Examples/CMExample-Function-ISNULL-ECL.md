
# Examples: ISNULL function in ECL 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNULL({field2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "EMPTY"<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field2}<br>ENDIF**|If field2 for the current record contains null values,<br>then set the current column to "EMPTY",<br>otherwise set the current column to field2.|

