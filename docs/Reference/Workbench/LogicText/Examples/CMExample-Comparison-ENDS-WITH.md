# Examples: ENDS_WITH in Extract Record Filter

|Example logic text|Meaning|
|------------------|-------|
|**SELECTIF({field3}<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDS_WITH&nbsp;"EEE")**|Select input records where field3 ends with characters "EEE",<br> and skip all other records.|
|**IF ({field3}<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDS_WITH&nbsp;"EEE")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select input records where field3 ends with characters "EEE", and skip all other records. This example can be written:<br>&nbsp; **SELECTIF({field3} ENDS_WITH "EEE")**|

# Examples: ENDS_WITH in Extract Column Logic

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field3}<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDS_WITH&nbsp;"EEE")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN={field3}<br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;COLUMN = " " <br>ENDIF**|If field3 ends with characters "EEE" then set the current <br>column to field3, otherwise set the current column to blank.|
