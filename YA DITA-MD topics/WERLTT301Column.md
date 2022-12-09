# Examples: COLUMN statements {#WERLTT301Column .reference}

## Examples: COLUMN statement in Format Column Calculation { .section}

You must set a value of COLUMN.

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = Col.3 * Col.4
```

|Set the current column to column 3 times column 4. The current column must be to the right of Column 4.|
|```
COLUMN = "TOTAL"
```

|Set the current column to "TOTAL".|
|```
COLUMN = ALL("-")
```

|Set the current column to all dashes.|
|```
COLUMN = REPEAT("-", 13)
```

|Set the current column to 13 dashes.|
|```
COLUMN = "\xFF"
```

|Set the current column to hexadecimal FF.|

**Parent topic:**[Logic text 3: Format Column Calculations](../html/WERLTT300FColCalcs.md)

