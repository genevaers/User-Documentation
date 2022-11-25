
# Examples: DAYSBETWEEN function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = DAYSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column<BR>to the days between the transaction<BR>date and the shipping date.|
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 10)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<BR>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<BR>ENDIF**|If there are more than<BR>10 days between the transaction date<BR> and the shipping date, then<BR>set the current column to the<BR>shipping date, otherwise set the<BR>current column to the transaction date.|
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 30)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<BR>ENDIF**|Write to Extract 3 those<BR> records where there are<BR> more than 30 days between the<BR>transaction date and the shipping date.|
  