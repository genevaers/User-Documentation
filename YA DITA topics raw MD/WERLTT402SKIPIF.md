# Examples: SKIPIF statements {#WERLTT402SKIPIF .reference}

## Examples: SKIPIF in Format Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
SKIPIF(COL.3 > 1000)
```

|Skip for output those records with column 3 greater than 1000. Select all other records. The code at left is a shorthand for:```
IF (COL.3 > 1000)
   THEN SKIP
ENDIF
```

|
|```
SKIPIF(COL.2 = "ABC")
```

|Skip for output those records with column 2 equal to "ABC". Select all other records.|
|```
SKIPIF(NOT COL.2 = "ABC")
```

|Skip those output records with field column 2 not equal to "ABC". Select all other records. This example gives the same result as:```
SELECTIF(COL.2 = "ABC")
```

|
|```
SKIPIF(COL.2 = "A" OR
       COL.2 = "D")
```

|Skip for output those records with column 2 equal to "A" or "D". Select all other records.|
|```
SKIPIF(COL.2 = "A" AND
       COL.3 > 10)
```

|Skip for output those records with column 2 equal to "A" and column 3 greater than 10. Select all other records.|
|```
SKIPIF(COL.3 + Col.4 > Col.5)
```

|Skip for output those records with column 3 plus column 4 is greater than column 5. Select all other records.|
|```
SKIPIF(COL.6 = ALL("-"))
```

|Skip for output those records with column 6 is equal to all dashes. Select all other records.|
|```
SKIPIF(COL.6 = REPEAT("-", 13))
```

|Skip for output those records with column 6 is equal to 13 dashes. Select all other records.|
|```
SKIPIF(COL.6 = "\xFF")
```

|Skip for output those records with column 6 is equal to hexadecimal FF. Select all other records.|

**Parent topic:**[Logic text 4: Format Record Filter](../html/WERLTT400FRecFilter.md)

