
## Examples: IF with COLUMN & COL.nnn (FCL)

You must set a value of COLUMN.
In this logic text, you cannot set the value of COL.nnn - you can only enquire on the value of a column between 1 and the current column (inclusive).

|Example logic text|Meaning|
|------------------|-------|
|**IF (Col.7 = 999)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "TOTAL" <br>ENDIF**|If column 7 is 999 then set the current column to<br> "TOTAL". The current column must be to the right<br> of Column 7.|
|**IF (Col.7 = 999)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = Col.3 * Col.4<br>ENDIF**|If column 7 is 999 then set the current column to <br>column 3 times column 4. The current column must <br>be to the right of Column 7.|
|**IF (Col.2 = Col.3)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = ALL("-")<br>ENDIF**|If column 2 equals column 3 then set the current<br>column to all dashes. The current column must be to <br>the right of Column 3.|
|**IF (Col.2 = Col.3)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = REPEAT("-",13)<br>ENDIF**|If column 2 equals column 3 then set the current<br> column to 13 dashes. The current column must be to <br>the right of Column 3.|
|**IF (Col.4 = "14733")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "\xFF"<br>ENDIF**|If column 4 is "14733" then set the current column to <br>hexadecimal FF. The current column must be to the <br>right of Column 4.|
