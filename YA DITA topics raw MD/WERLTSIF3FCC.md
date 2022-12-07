# Syntax: IF statements in Format Column Calculations {#WERLTSIF3FCC .reference}

## Introduction { .section}

IF statements can be part of any logic text. An IF statement allows a condition to control if one or more statements are executed.

IF statements are allowed in all logic text, although the statements that can be called from an IF statement depend on the particular logic text.

An IF statement can call another IF statement - this is called "nesting" of IF statements, and is allowed in all logic text.

The details of what conditions and what statements are allowed in an IF statement in Format Column Calculations are shown below.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTS_IF_3FCC_01.gif)

![](images/LTS_COLUMN_3FCC_01Z.gif)

![](images/LTS_IF_3FCC_02.gif)

![](images/LTS_IF_3FCC_03.gif)

## Rules for the syntax { .section}

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

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

**Parent topic:**[Syntax: IF statements](../html/WERLTSIF0.md)

