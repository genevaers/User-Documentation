# Examples: BEGINS_WITH in Extract Record Filter

|Example logic text|Meaning|
|------------------|-------|
|**SELECTIF({field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;BEGINS_WITH&nbsp;"BBB")**|Select input records where field1 begins with characters "BBB",<br> and skip all other records.|
|**IF ({field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;BEGINS_WITH&nbsp;"BBB")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select input records where field1 begins with characters "BBB", and skip all other records. This example can be written:<br>&nbsp; **SELECTIF({field1} BEGINS_WITH "BBB")**|

# Examples: BEGINS_WITH in Extract Column Logic

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;BEGINS_WITH&nbsp;"BBB")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN={field1}<br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;COLUMN = " " <br>ENDIF**|If field1 begins with characters "BBB" then set the current <br>column to field1, otherwise set the current column to blank.|
