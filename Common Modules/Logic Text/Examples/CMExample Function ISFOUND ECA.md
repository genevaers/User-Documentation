
# Examples: ISFOUND function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISFOUND({Lookup2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {Lookup2}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If the lookup path Lookup2 uses the current record to<br>successfully find a target record, then set the current column<br>to the lookup field, otherwise set the<br>current column to blank.|

