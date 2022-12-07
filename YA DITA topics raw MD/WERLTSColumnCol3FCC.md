# Syntax: COLUMN and COL.nnn in Format Column Calculations {#WERLTSColumnCol3FCC .reference}

## Introduction { .section}

**COLUMN** is always a statement where you set the value of the current column.

**COL.nnn** refers to a column value where nnn is the number of that column in that view \(starting at one on the leftmost column\).

COL.nnn can only appear in an **inquiry** \(for example "IF \(COL.nnn = ? " \) in the format phase. In **Format Column Calculations**, the nnn must be a column number between 1 and the current column \(inclusive\).

![](images/LTZZ_Syntax_legend.gif)

## Syntax for COLUMN in Format Column Calculations { .section}

![](images/LTS_COLUMN_3FCC_01.gif)

## Syntax for inquiry on COL.nnn in Format Column Calculations { .section}

See topic "**Syntax: IF statements in Format Column Calculations**". A link is under **Related reference** below.

## Rules for the syntax { .section}

-   You can only set the value of the current column using the COLUMN statement.
-   COL.nnn can only appear in an **inquiry** \(for example "IF \(COL.nnn = ? " \). The nnn must be a column number between 1 and the current column \(inclusive\).

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

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

## Examples: IF with COL.nnn in Format Column Calculation { .section}

In this logic text, you cannot set the value of COL.nnn - you can only enquire on the value of a column between 1 and the current column \(inclusive\).

|Example logic text|Meaning|
|------------------|-------|
|```
IF (Col.7 = "X")
   THEN COLUMN = "TOTAL"
ENDIF
```

|If column 7 is "X" then set the current column to "TOTAL". The current column must be to the right of Column 7.|
|```
IF (Col.4 = "14733")
   THEN COLUMN = Col.2
ENDIF
```

|If column 4 is "14733" then set the current column to column 2. The current column must be to the right of Column 4.|
|```
IF ((Col.4 + Col.5)* COl.6
     > 1000)
   THEN COLUMN = "\xFF"
ENDIF
```

|If column 4 and column 5 are added and then multiplied by column 6 and the result is greater than 1000 then set the current column to hexadecimal FF. The current column must be to the right of Column 6.|

**Parent topic:**[Syntax: COLUMN and COL.nnn statements](../html/WERLTSColumnCol0.md)

