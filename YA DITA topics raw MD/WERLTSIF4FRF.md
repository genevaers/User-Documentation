# Syntax: IF statements in Format Record Filter {#WERLTSIF4FRF .reference}

## Introduction { .section}

IF statements can be part of any logic text. An IF statement allows a condition to control if one or more statements are executed.

IF statements are allowed in all logic text, although the statements that can be called from an IF statement depend on the particular logic text.

An IF statement can call another IF statement - this is called "nesting" of IF statements, and is allowed in all logic text.

The details of what conditions and what statements are allowed in an IF statement in Format Record Filter are shown below.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTS_IF_4FRF_01.gif)

![](images/LTS_IF_4FRF_02.gif)

![](images/LTS_IF_4FRF_03.gif)

![](images/LTS_IF_4FRF_04.gif)

## Rules for the syntax { .section}

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: IF with SELECT in Format Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (COL.3 > 1000)
   THEN SELECT
ENDIF
```

|Select for output only those records with column 3 greater than 1000. Skip all other records. The code at left can also be written as:```
SELECTIF(COL.3 > 1000)
```

|
|```
IF (COL.2 = "ABC")
   THEN SELECT
ENDIF
```

|Select for output only those records with column 2 equal to "ABC". Skip all other records.|
|```
IF NOT (COL.2 = "ABC")
   THEN SELECT
ENDIF
```

|Select those output records with field column 2 not equal to "ABC". Skip all other records. The code at left gives the same result as:```
SKIPIF(COL.2 = "ABC")
```

|
|```
IF (COL.2 = "A") OR
   (COL.2 = "D")
   THEN SELECT
ENDIF
```

|Select for output only those records with column 2 equal to "A" or "D". Skip all other records.|
|```
IF (COL.2 = "A") AND
   (COL.3 > 10)
   THEN SELECT
ENDIF
```

|Select for output only those records with column 2 equal to "A" and column 3 greater than 10. Skip all other records.|
|```
IF (COL.3 + Col.4 > Col.5 * 100)
   THEN SELECT
ENDIF
```

|Select for output only those records with column 3 plus column 4 is greater than column 5 times 100. Skip all other records.|
|```
IF NOT (COL.6 = ALL("-"))
   THEN SELECT
ENDIF
```

|Select for output those records with column 6 is not equal to all dashes. Skip all other records. This example gives the same result as:```
SKIPIF(COL.6 = ALL("-"))
```

|
|```
IF (COL.6 = REPEAT("-", 13))
   THEN SELECT
ENDIF
```

|Select for output those records with column 6 is equal to 13 dashes. Skip all other records.|
|```
IF (COL.6 = "\xFF")
   THEN SELECT
ENDIF
```

|Select for output those records with column 6 is equal to hexadecimal FF. Skip all other records.|
|```
IF (COL.2 = "A") AND
   (COL.3 > 10)
THEN SELECT
ELSE IF (COL.2 "D")
     THEN SELECT
     ELSE IF (COL.2 "G")
          THEN SELECT
          ENDIF
     ENDIF
ENDIF
```

|Select for output those records with column 2 equal to "A" and column 3 greater than 10.

Also select for output those records with column 2 equal to "D".

Also select for output those records with column 2 equal to "G".

Skip all other records.

Notice that the logic text at left counts as only one IF statement, because the extra IF statements are nested inside the first.

The code at left can also be written as follows \(note the use of brackets to control the evaluation of the conditions\):

```
IF (COL.2 = "A" AND COL.3 > 10) OR
   (COL.2 = "D") OR
   (COL.2 = "G")
   THEN SELECT
ENDIF
```

|
|```
IF (COL.2 = "A") AND
   (COL.3 > 10)
THEN IF (COL.4 + COL.5
         > COL.6)
     THEN SELECT
     ELSE IF (COL.7 = 0)
          THEN SELECT
          ENDIF
     ENDIF
ENDIF
```

|Consider those records with column 2 equal to "A" and column 3 greater than 10.

Of the considered records, select for output those records with column 4 plus column 5 is greater then column 6.

Of the considered records not yet selected, select also for output those records with column 7 equal to zero.

Skip all other records.

Notice that the logic text at left counts as only one IF statement, because the extra IF statements are nested inside the first.

The code at left can also be written as follows \(note the use of brackets to control the evaluation of the conditions\):

```
IF (COL.2 = "A" AND COL.3 > 10) AND
   ((COL.4 + COL.5 > COL.6) OR
   (COL.7 = 0))
   THEN SELECT
ENDIF
```

|

## Examples: IF with SKIP in Format Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (COL.3 > 1000)
   THEN SKIP
ENDIF
```

|Skip for output those records with column 3 greater than 1000. Select all other records. The code at left can also be written as:```
SKIPIF(COL.3 > 1000)
```

|
|```
IF (COL.2 = "ABC")
   THEN SKIP
ENDIF
```

|Skip for output those records with column 2 equal to "ABC". Select all other records.|
|```
IF NOT (COL.2 = "ABC")
   THEN SKIP
ENDIF
```

|Skip those output records with field column 2 not equal to "ABC". Select all other records. The code at left gives the same result as:```
SELECTIF(COL.2 = "ABC")
```

|
|```
IF (COL.2 = "A") OR
   (COL.2 = "D")
   THEN SKIP
ENDIF
```

|Skip for output those records with column 2 equal to "A" or "D". Select all other records.|
|```
IF (COL.2 = "A") AND
   (COL.3 > 10)
   THEN SKIP
ENDIF
```

|Skip for output those records with column 2 equal to "A" and column 3 greater than 10. Select all other records.|
|```
IF (COL.3 + Col.4
    > Col.5 * 100)
   THEN SKIP
ENDIF
```

|Skip for output those records with column 3 plus column 4 is greater than column 5 times 100. Select all other records.|
|```
IF (COL.6 = ALL("-"))
   THEN SKIP
ENDIF
```

|Skip for output those records with column 6 is equal to all dashes. Select all other records. This example gives the same result as:```
SKIPIF(COL.6 = ALL("-"))
```

|
|```
IF (COL.6 = REPEAT("-", 13))
   THEN SKIP
ENDIF
```

|Skip for output those records with column 6 is equal to 13 dashes. Select all other records. This example gives the same result as:```
SKIPIF(COL.6 = REPEAT("-", 13))
```

|
|```
IF (COL.6 = "\xFF")
   THEN SKIP
ENDIF
```

|Skip for output those records with column 6 is equal to hexadecimal FF. Select all other records. This example gives the same result as:```
SKIPIF(COL.6 = "\xFF")
```

|
|```
IF (COL.2 = "A") AND
   (COL.3 > 10)
THEN SKIP
ELSE IF (COL.2 = "D")
     THEN SKIP
     ELSE IF (COL.2 = "G")
          THEN SKIP
          ENDIF
     ENDIF
ENDIF
```

|Skip for output those records with column 2 equal to "A" and column 3 greater than 10.

In addition, skip for output those records with column 2 equal to "D".

In addition, skip for output those records with column 2 equal to "G".

Select all other records.

Notice that the logic text at left counts as only one IF statement, because the extra IF statements are nested inside the first.

The code at left can also be written as follows \(note the use of brackets to control the evaluation of the conditions\):

```
IF (COL.2 = "A" AND COL.3 > 10) OR
   (COL.2 = "D") OR
   (COL.2 = "G")
   THEN SKIP
ENDIF
```

|
|```
IF (COL.2 = "A") AND
   (COL.3 > 10)
THEN IF (COL.4 + COL.5
         > COL.6)
     THEN SKIP
     ELSE IF (COL.7 = 0)
          THEN SKIP
          ENDIF
     ENDIF
ENDIF
```

|Consider those records with column 2 equal to "A" and column 3 greater than 10.

Of the considered records, skip for output those records with column 4 plus column 5 is greater then column 6.

Of the considered records not yet skipped, skip also for output those records with column 7 equal to zero.

Select all other records.

Notice that the logic text at left counts as only one IF statement, because the extra IF statements are nested inside the first.

The code at left can also be written as follows \(note the use of brackets to control the evaluation of the conditions\):

```
IF (COL.2 = "A" AND COL.3 > 10) AND
   ((COL.4 + COL.5 > COL.6) OR
    (COL.7 = 0))
   THEN SKIP
ENDIF
```

|

**Parent topic:**[Syntax: IF statements](../html/WERLTSIF0.md)

