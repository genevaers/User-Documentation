
# Examples: ISNOTSPACES function in ECL 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTSPACES({field3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field3}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = "NOT SET"<br>ENDIF**|If field3 for the current record is not spaces,<br>then set the current column to field3,<br>otherwise set the current column to "NOT SET".|

