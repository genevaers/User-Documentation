
# Examples: REPEAT function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field9} = "Total")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = REPEAT("-", 13)<br>ENDIF**|If field9 is "Total" then set the current column to 13 dashes.|
|**IF ({field10} = REPEAT("-", 13))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1} + {field2}<br>ENDIF**|If field10 is 13 dashes, then set the current column<br>to a total of fields 1 and 2.|

