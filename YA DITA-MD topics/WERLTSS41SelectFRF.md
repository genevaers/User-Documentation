# Syntax: SELECT and SELECTIF statements in Format Record Filter {#WERLTSS41SelectFRF .reference}

## The purpose of SELECT and SELECTIF in Format Record Filter { .section}

In this logic text, SELECT or SELECTIF define the view records to be included in the final output of the view.

If there are **no SELECT, SELECTIF, SKIP or SKIPIF statements** in Format Record Filter, then **all view records** are selected.

The idea is that you either SELECT or SKIP but you cannot do both in the same logic text. Once you have selected records then all others are skipped. Alternatively, once you skip records then all others are selected.

SELECTIF defines the view records to select based on a condition.

SELECT must always be inside an IF statement, in a THEN or ELSE case. The path through the IF statement decides which records reach the SELECT statement.

Format Record Filter can have **one SELECTIF** or **one IF that contains one or more SELECT statements**. Once either of these is present, no SKIP or SKIPIF statements are allowed.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSSS_SelectIF_04_FRF.gif)

![](images/LTSSS_IF_Select_04_FRF.gif)

## Rules for the syntax { .section}

-   Format Record Filter can have one SELECTIF statement or one IF statement that contains one or more SELECT statements. When one SELECTIF or SELECT is present, then no SKIP or SKIPIF statements are allowed.
-   One IF statement can have a SELECT for the THEN or ELSE case. One IF statement can have other IF statements nested inside, which may also have SELECT statements inside. All this counts as one IF statement.

The best way to learn is the examples below. See also the topic "**Syntax: IF Statements in Format Record Filter**".

A link is under **Related reference** below.

## Examples: SELECTIF in Format Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
SELECTIF(COL.3 > 1000)
```

|Select for output only those records with column 3 greater than 1000. Skip all other records. The code at left is a shorthand for:```
IF (COL.3 > 1000)
   THEN SELECT
ENDIF
```

|
|```
SELECTIF(COL.2 = "ABC")
```

|Select for output only those records with column 2 equal to "ABC". Skip all other records.|
|```
SELECTIF(NOT COL.2 = "ABC")
```

|Select those output records with field column 2 not equal to "ABC". Skip all other records. This example gives the same result as:```
SKIPIF(COL.2 = "ABC")
```

|
|```
SELECTIF(COL.2 = "A" OR
         COL.2 = "D")
```

|Select for output only those records with column 2 equal to "A" or "D". Skip all other records.|
|```
SELECTIF(COL.2 = "A" AND
         COL.3 > 10)
```

|Select for output only those records with column 2 equal to "A" and column 3 greater than 10. Skip all other records.|
|```
SELECTIF(COL.3 + Col.4 > Col.5)
```

|Select for output only those records with column 3 plus column 4 is greater than column 5. Skip all other records.|
|```
SELECTIF(NOT COL.6 = ALL("-"))
```

|Select for output those records with column 6 is not equal to all dashes. Skip all other records. This example gives the same result as:```
SKIPIF(COL.6 = ALL("-"))
```

|
|```
SELECTIF(NOT COL.6 =
         REPEAT("-", 13))
```

|Select for output those records with column 6 is not equal to 13 dashes. Skip all other records. This example gives the same result as:```
SKIPIF(COL.6 = REPEAT("-", 13))
```

|
|```
SELECTIF(NOT COL.6 = "\xFF")
```

|Select for output those records with column 6 is not equal to hexadecimal FF. Skip all other records. This example gives the same result as:```
SKIPIF(COL.6 = "\xFF")
```

|

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

**Parent topic:**[Syntax: SELECT, SELECTIF, SKIP and SKIPIF statements](../html/WERLTSS0SelectSkip.md)

