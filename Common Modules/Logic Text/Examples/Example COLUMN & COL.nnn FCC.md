
|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = Col.3 \* Col.4**|Set current column to column 3 times column 4.<br>The current column must be to the right of Column 4.|
|**COLUMN = "TOTAL"**|Set current column to "TOTAL".|
|**COLUMN = ALL("-")**|Set current column to all dashes.|
|**COLUMN = REPEAT("-", 13)**|Set current column to 13 dashes.|
|**COLUMN = "\xFF"**|Set current column to hexadecimal FF.|

# Examples: IF with COLUMN (FCC)

|Example logic text|Meaning|
|------------------|-------|
|**IF (Col.7 = 999)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "TOTAL"<br>ENDIF**|If column 7 is 999 then set current column to "TOTAL".<br>The current column must be to the right of Column 7.|
|**IF (Col.7 = 999)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = Col.3 \* Col.4<br>ENDIF**|If column 7 is 999 then set current column to column 3 times<br>column 4. The current column must be to the right of Column 7.|
|**IF (Col.2 = Col.3)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = ALL("-")<br>ENDIF**|If column 2 equals column 3 then set current column to all dashes.<br>The current column must be to the right of Column 3.|
|**IF (Col.2 = Col.3)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = REPEAT("-", 13)<br>ENDIF**|If column 2 equals column 3 then set current column to 13 dashes.<br>The current column must be to the right of Column 3.|
|**IF (Col.4 = "14733")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "\xFF"<br>ENDIF**|If column 4 is "14733" then set current column<br>to hexadecimal FF.<br>The current column must be to the right of Column 4.|

# Examples: IF with COL.nnn (FCC)

|Example logic text|Meaning|
|------------------|-------|
|**IF (Col.7 = "X")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "TOTAL"<br>ENDIF**|If column 7 is "X" then set current column to "TOTAL".<br>The current column must be to the right of Column 7.|
|**IF (Col.4 = "14733")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = COL.2<br>ENDIF**|If column 4 is "14733" then set the current column to column 2.<br>The current column must be to the right of Column 4.|
|**IF ((Col.4 + Col.5) \* COl.6 > 1000)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "\xFF"<br>ENDIF**|If column 4 and column 5 are added and then<br>multiplied by column 6 and the result is greater<br>than 1000 then set current column to hexadecimal FF.<br>The current column must be to the right of Column 6.|

