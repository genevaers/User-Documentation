
|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNULL({field4})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field4}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = "NOT AVAILABLE"<br>ENDIF**|If field4 for the current record does not contain null values,<br>then set the current column to field4,<br>otherwise set the current column to "NOT AVAILABLE".|

