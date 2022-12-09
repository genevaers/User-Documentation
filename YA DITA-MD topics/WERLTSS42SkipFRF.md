# Syntax: SKIP and SKIPIF statements in Format Record Filter {#WERLTSS42SkipFRF .reference}

## The purpose of SKIP and SKIPIF in Format Record Filter { .section}

In this logic text, SKIP or SKIPIF define the view records to be excluded from the final output of the view.

If there are **no SELECT, SELECTIF, SKIP or SKIPIF statements** in Format Record Filter, then **all view records** are selected.

The idea is that you either SELECT or SKIP but you cannot do both in the same logic text. Once you have selected records then all others are skipped. Alternatively, once you skip records then all others are selected.

SKIPIF defines the view records to skip based on a condition.

SKIP must always be inside an IF statement, in a THEN or ELSE case. The path through the IF statement decides which records reach the SKIP statement.

Format Record Filter can have **one SKIPIF** or **one IF that contains one or more SKIP statements**. Once either of these is present, no SELECT or SELECTIF statements are allowed.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSSS_SkipIF_04_FRF.gif)

![](images/LTSSS_IF_Skip_04_FRF.gif)

## Rules for the syntax { .section}

-   Format Record Filter can have one SKIPIF statement or one IF statement that contains one or more SKIP statements. When one SKIPIF or SKIP is present, then no SELECT or SELECTIF statements are allowed.
-   One IF statement can have a SKIP for the THEN or ELSE case. One IF statement can have other IF statements nested inside, which may also have SKIP statements inside. All this counts as one IF statement.

The best way to learn is the examples below. See also the topic "**Syntax: IF Statements in Format Record Filter**".

A link is under **Related reference** below.

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

**Parent topic:**[Syntax: SELECT, SELECTIF, SKIP and SKIPIF statements](../html/WERLTSS0SelectSkip.md)

