# Examples: IF with COLUMN statements {#WERLTT302IFColumn .reference}

## Examples: IF with COLUMN in Format Column Calculation { .section}

You must set a value of COLUMN.

|Example logic text|Meaning|
|------------------|-------|
|```
IF (Col.7 = 999)
   THEN COLUMN = "TOTAL"
ENDIF
```

|If column 7 is 999 then set the current column to "TOTAL". The current column must be to the right of Column 7.|
|```
IF (Col.7 = 999)
   THEN COLUMN = Col.3 * Col.4
ENDIF
```

|If column 7 is 999 then set the current column to column 3 times column 4. The current column must be to the right of Column 7.|
|```
IF (Col.2 = Col.3)
   THEN COLUMN = ALL("-")
ENDIF
```

|If column 2 equals column 3 then set the current column to all dashes. The current column must be to the right of Column 3.|
|```
IF (Col.2 = Col.3)
   THEN COLUMN = 
        REPEAT("-", 13)
ENDIF
```

|If column 2 equals column 3 then set the current column to 13 dashes. The current column must be to the right of Column 3.|
|```
IF (Col.4 = "14733")
   THEN COLUMN = "\xFF"
ENDIF
```

|If column 4 is "14733" then set the current column to hexadecimal FF. The current column must be to the right of Column 4.|

**Parent topic:**[Logic text 3: Format Column Calculations](../html/WERLTT300FColCalcs.md)

