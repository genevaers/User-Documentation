
|Example logic text|Meaning|
|------------------|-------|
|```
|IF (field3} = "Total")
   THEN COLUMN = ALL("-")
ENDIF
```
|If field3 is "Total" then set the current column to all dashes.|
  
|```
IF (field4} = ALL("-"))
   THEN COLUMN = (field5} + (field6}
ENDIF
```
|If field4 is all dashes, then set the current column to a total of fields 5 and 6.|
   
