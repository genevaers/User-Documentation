
|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTFOUND({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "PROBLEM'<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If the lookup path Lookup1 uses the current record and<br>does not successfully find a target record,<br>then set the current column to "PROBLEM",<br>otherwise set the current column to blank.|

