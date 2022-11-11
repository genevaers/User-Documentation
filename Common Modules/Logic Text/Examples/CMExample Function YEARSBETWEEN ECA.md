
# Examples: YEARSBETWEEN function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = YEARSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column to the years<br>between the transaction date<br>and the shipping date.|
|**IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there is at least one year between<br>the transaction date and the shipping date,<br>then set current column to the shipping date,<br>otherwise set current column to the<br>transaction date.|
|**IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>there is at least one year between<br>the transaction date and the shipping date.|

