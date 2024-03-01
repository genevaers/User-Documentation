# Examples: CONTAINS in Extract Record Filter

|Example logic text|Meaning|
|------------------|-------|
|**SELECTIF({field2}<br>&nbsp;&nbsp;&nbsp;&nbsp;CONTAINS&nbsp;"CCC")**|Select input records where field2 contains the characters "CCC",<br> and skip all other records.|
|**IF ({field2}<br>&nbsp;&nbsp;&nbsp;&nbsp;CONTAINS&nbsp;"CCC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select input records where field2 contains characters "CCC", and skip all other records. This example can be written:<br>&nbsp; **SELECTIF({field2} CONTAINS "CCC")**|

# Examples: CONTAINS in Extract Column Assignment

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2}<br>&nbsp;&nbsp;&nbsp;&nbsp;CONTAINS&nbsp;"CCC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN={field2}<br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;COLUMN = " " <br>ENDIF**|If field2 contains the characters "CCC" then set the current <br>column to field2, otherwise set the current column to blank.|
