
# Examples: ISNOTNUMERIC function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNUMERIC({field8})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = 0<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field8}<br>ENDIF**|If field8 for the current record is not numeric,<br>then set the current column to zero,<br>otherwise set the current column to field8.|

