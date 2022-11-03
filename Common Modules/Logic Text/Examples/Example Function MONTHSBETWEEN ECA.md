
|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column to the months between<br>the transaction date and the shipping date.|
|**IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE}) > 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there is more than one month between the transaction date and the shipping date,<br>then set the current column to the shipping date,<br>otherwise set the current column to the transaction date.|
|**IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})> 6)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>there are more than 6 months between the<br>transaction date and the shipping date.|

