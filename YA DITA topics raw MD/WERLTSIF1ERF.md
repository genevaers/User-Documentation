# Syntax: IF statements in Extract Record Filter {#WERLTSIF1ERF .reference}

## Introduction { .section}

IF statements can be part of any logic text. An IF statement allows a condition to control if one or more statements are executed.

IF statements are allowed in all logic text, although the statements that can be called from an IF statement depend on the particular logic text.

An IF statement can call another IF statement - this is called "nesting" of IF statements, and is allowed in all logic text.

The details of what conditions and what statements are allowed in an IF statement in Extract Record Filter are shown below.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTS_IF_1ERF_01.gif)

![](images/LTS_IF_1ERF_02.gif)

![](images/LTS_IF_1ERF_03.gif)

![](images/LTS_IF_1ERF_04.gif)

![](images/LTS_IF_1ERF_05.gif)

![](images/LTS_IF_1ERF_06.gif)

![](images/LTS_IF_1ERF_07.gif)

![](images/LTS_IF_1ERF_08.gif)

![](images/LTS_IF_1ERF_09.gif)

![](images/LTS_IF_1ERF_10.gif)

## Rules for the syntax { .section}

See topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: IF with SELECT in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (CURRENT({field1}) <>
    PRIOR({field1}))
   THEN SELECT
ENDIF
```

|Select only records with unique values for field1. This assumes the input file is sorted into field1 order. This example can also be written:```
SELECTIF(CURRENT({field1}) <>
         PRIOR({field1}))
```

|
|```
IF ({field3} > 1000)
   THEN SELECT
ENDIF
```

|Select for output only those records with field3 greater than 1000. Skip all other records. The code at left can also be written as:```
SELECTIF({field3} > 1000)
```

|
|```
IF ({field2} = "ABC")
   THEN SELECT
ENDIF
```

|Select for output only those records with field2 equal to "ABC". Skip all other records.|
|```
IF NOT ({field2} = "ABC")
   THEN SELECT
ENDIF

```

|Select those output records with field2 not equal to "ABC". Skip all other records. The code at left gives the same result as:```
SKIPIF({field2} = "ABC")
```

|
|```
IF ({field2} = "ABC") OR
   ({field2} = "DEF")
   THEN SELECT
ENDIF
```

|Select for output only those records with field2 equal to "ABC" or "DEF". Skip all other records.|
|```
IF ({field2} = "ABC") AND
   ({field3} > 1000)
   THEN SELECT
ENDIF
```

|Select for output only those records with field2 equal to "ABC" and field3 greater than 1000. Skip all other records.|
|```
IF ({field3} + {field4} >
    {field5} * 100)
   THEN SELECT
ENDIF
```

|Select for output only those records with field3 plus field4 is greater than field5 times 100. Skip all other records.|
|```
IF NOT ({field6} = ALL("-"))
   THEN SELECT
ENDIF
```

|Select for output those records with field6 is not equal to all dashes. Skip all other records. This example gives the same result as:```
SKIPIF({field6} = ALL("-"))
```

|
|```
IF ({field6} = REPEAT("-", 13))
   THEN SELECT
ENDIF
```

|Select for output those records with field6 is equal to 13 dashes. Skip all other records.|
|```
IF ({field6} = "\xFF")
   THEN SELECT
ENDIF
```

|Select for output those records with field6 is equal to hexadecimal FF. Skip all other records.|
|```
IF ({field2} = "ABC") AND
   ({field3} > 10)
THEN SELECT
ELSE IF ({field2} = "DEF")
     THEN SELECT
     ELSE IF ({field2} = "GHI")
          THEN SELECT
          ENDIF
     ENDIF
ENDIF
```

|Select for output those records with field2 equal to "ABC" and field3 greater than 10.

In addition, select for output those records with field2 equal to "DEF".

In addition, select for output those records with field2 equal to "GHI".

Skip all other records.

Notice that the logic text at left counts as only one IF statement, because the extra IF statements are nested inside the first.

The code at left can also be written as follows \(note the use of brackets to control the evaluation of the conditions\):

```
IF ({field2} = "ABC" AND
   {field3} > 10)          OR
   ({field2} = "DEF")      OR
   ({field2} = "GHI")
   THEN SELECT
ENDIF 
```

|
|```
IF ({field2} = "ABC") AND
   ({field3} > 10)
THEN IF ({field4} + {field5}
       > {field6})
     THEN SELECT
     ELSE IF ({field7} = 0)
          THEN SELECT
          ENDIF
     ENDIF
ENDIF
```

|Consider those records with field2 equal to "ABC" and field3 greater than 10.

Of the considered records, select for output those records with field4 plus field5 is greater then field6.

Of the considered records not yet selected, select also for output those records with field7 equal to zero.

Skip all other records.

Notice that the logic text at left counts as only one IF statement, because the extra IF statements are nested inside the first.

The code at left can also be written as follows \(note the use of brackets to control the evaluation of the conditions\):

```
IF ({field2} = "ABC" AND
    {field3} > 10)
                          AND
   (({field4} + {field5}
       > {field6})   OR
   ({field7} = 0))
   THEN SELECT
ENDIF 
```

|
|```
IF ISFOUND({Lookup3})
   THEN SELECT
ENDIF
```

|Select all input records where the lookup path Lookup3 successfully finds a target record, and skip all other records. This example is the same as:```
SELECTIF(ISFOUND({Lookup3})
```

|
|```
IF ISFOUND({Lookup3,field7})
   THEN SELECT
ENDIF
```

|Select all input records where the lookup path Lookup3 successfully finds a target record using effective date of field7, and skip all other records. This example is the same as:```
SELECTIF(ISFOUND({Lookup3,field7}) 
```

|
|```
IF ISFOUND({Lookup3;$SYM="A"})
   THEN SELECT
ENDIF
```

|Select all input records where the lookup path Lookup3 successfully finds a target record using symbol SYM set to "A", and skip all other records. This example is the same as:```
SELECTIF(ISFOUND({Lookup3;$SYM="A"})
```

|
|```
IF ISFOUND({Lookup3,
            field7;$SYM1=3,$SYM2=0})
   THEN SELECT
ENDIF
```

|Select all input records where the lookup path Lookup3 successfully finds a target record using effective date of field7 and symbol SYM1 set to 3 and symbol SYM2 set to zero. Skip all other records. This example is the same as:```
SELECTIF(ISFOUND({Lookup3,
         field7;$SYM1=3,$SYM2=0})
```

|
|```
IF DAYSBETWEEN({field1},{field2})
     > 7
   THEN SELECT
ENDIF
```

|Select only records where there are more than 7 days between field1 and field2, and skip all other records This example can also be written:```
SELECTIF(DAYSBETWEEN({field1},{field2})
          > 7)
```

|
|```
IF ({field1} BEGINS_WITH "BBB")
   THEN SELECT
ENDIF
```

|Select input records where field1 begins with characters "BBB", and skip all other records. This example can be written:```
SELECTIF({field1} BEGINS_WITH "BBB")
```

It is better to use BEGINS\_WITH because the logic text executes faster.

|
|```
IF ({field2} CONTAINS "CCC")
   THEN SELECT
ENDIF
```

|Select input records where field2 contains characters "CCC", and skip all other records. This example can be written:```
SELECTIF({field2} CONTAINS "CCC")
```

It is better to use CONTAINS because the logic text executes faster.

|
|```
IF ({field3} ENDS_WITH "EEE")
   THEN SELECT
ENDIF
```

|Select input records where field3 ends with characters "EEE", and skip all other records. This example can be written:```
SELECTIF({field3} ENDS_WITH "EEE")
```

It is better to use ENDS\_WITH because the logic text executes faster.

|
|```
IF ({field4} MATCHES "...")
   THEN SELECT
ENDIF
```

|Select input records where field4 matches characters "...", and skip all other records. This example can be written:```
SELECTIF({field4} MATCHES "...")
```

|
|```
IF ({field1} LIKE "^BBB*")
   THEN SELECT
ENDIF
```

|Select input records where field1 begins with characters "BBB", and skip all other records. This example has the same effect as:```
SELECTIF({field1} BEGINS_WITH "BBB")
```

It is better to use BEGINS\_WITH because the logic text executes faster.

|
|```
IF ({field1} LIKE "*CCC*")
   THEN SELECT
ENDIF
```

|Select input records where field1 contains characters "CCC", and skip all other records. This example has the same effect as:```
SELECTIF({field1} CONTAINS "CCC")
```

It is better to use CONTAINS because the logic text executes faster.

|
|```
IF ({field1} LIKE "*EEE$")
   THEN SELECT
ENDIF  
```

|Select input records where field1 ends with characters "EEE", and skip all other records. This example has the same effect as:```
SELECTIF({field1} ENDS_WITH "EEE")
```

It is better to use ENDS\_WITH because the logic text executes faster.

|
|```
IF ({field1} LIKE "^B*C*E$")
   THEN SELECT
ENDIF
```

|Select input records where field1 begins with "B", contains "C" and ends with "E", and skip all other records.|

## Examples: IF with SKIP in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (CURRENT({field1}) =
    PRIOR({field1}))
   THEN SKIP
ENDIF
```

|Skip records where field1 is the same as the previous record. This assumes the input file is sorted into field1 order. This example can also be written:```
SKIPIF(CURRENT({field1}) =
       PRIOR({field1})) 
```

|
|```
IF ({field3} > 1000)
   THEN SKIP
ENDIF
```

|Skip for output those records with field3 greater than 1000. Select all other records. The code at left can also be written as:```
SKIPIF({field3} > 1000)
```

|
|```
IF ({field2} = "ABC")
   THEN SKIP
ENDIF
```

|Skip for output those records with field2 equal to "ABC". Select all other records.|
|```
IF NOT ({field2} = "ABC")
   THEN SKIP
ENDIF
```

|Skip those output records with field2 not equal to "ABC". Select all other records. The code at left gives the same result as:```
SELECTIF({field2} = "ABC")
```

|
|```
IF ({field2} = "A") OR
   ({field2} = "D")
   THEN SKIP
ENDIF
```

|Skip for output those records with field2 equal to "A" or "D". Select all other records.|
|```
IF ({field2} = "A") AND
   ({field3} > 10
   THEN SKIP
ENDIF
```

|Skip for output those records with field2 equal to "A" and field3 greater than 10. Select all other records.|
|```
IF ({field3} + {field4}
    > {field5})
   THEN SKIP
ENDIF
```

|Skip for output those records with field3 plus field4 is greater than field5. Select all other records.|
|```
IF ({field6} = ALL("-"))
   THEN SKIP
ENDIF
```

|Skip for output those records with field6 is equal to all dashes. Select all other records. This example gives the same result as:```
SKIPIF({field6} = ALL("-"))
```

|
|```
IF ({field6} = REPEAT("-", 13))
   THEN SKIP
ENDIF
```

|Skip for output those records with field6 is equal to 13 dashes. Select all other records. This example gives the same result as:```
SKIPIF({field6} = REPEAT("-", 13))
```

|
|```
IF ({field6} = "\xFF")
   THEN SKIP
ENDIF
```

|Skip for output those records with field6 is equal to hexadecimal FF. Select all other records. This example gives the same result as:```
SKIPIF({field6} = "\xFF")
```

|
|```
IF ({field2} = "A") AND
   ({field3} > 10)
THEN SKIP
ELSE IF ({field2} = "D")
     THEN SKIP
     ELSE IF ({field2} = "G")
          THEN SKIP
          ENDIF
     ENDIF
ENDIF
```

|Skip for output those records with field2 equal to "A" and field3 greater than 10.

In addition, skip for output those records with field2 equal to "D".

In addition, skip for output those records with field2 equal to "G".

Select all other records.

Notice that the logic text at left counts as only one IF statement, because the extra IF statements are nested inside the first.

The code at left can also be written as follows \(note the use of brackets to control the evaluation of the conditions\):

```
IF ({field2} = "A" AND
    {field3} > 10)         OR
   ({field2} = "D") OR
   ({field2} = "G")
   THEN SKIP
ENDIF
```

|
|```
IF ISNOTFOUND({Lookup4})
   THEN SKIP
ENDIF
```

|Skip all input records where the lookup path Lookup4 does not successfully find a target record, and select all other records. This example is the same as:```
SKIPIF(ISNOTFOUND({Lookup4})
```

|
|```
IF ISNOTFOUND({Lookup4,field7})
   THEN SKIP
ENDIF
```

|Skip all input records where the lookup path Lookup4 does not successfully find a target record using effective date of field7, and select all other records. This example is the same as:```
SKIPIF(ISNOTFOUND({Lookup4,field7})
```

|
|```
IF ISNOTFOUND({Lookup4;$SYM="A"})
   THEN SKIP
ENDIF
```

|Skip all input records where the lookup path Lookup4 does not successfully find a target record using symbol SYM set to "A", and select all other records. This example is the same as:```
SKIPIF(ISNOTFOUND({Lookup4;$SYM="A"})
```

|
|```
IF ISNOTFOUND
   ({Lookup4,field7;$SYM1=3,$SYM2=0})
   THEN SKIP
ENDIF
```

|Skip all input records where the lookup path Lookup4 does not successfully find a target record using effective date of field7 and symbol SYM1 set to 3 and symbol SYM2 set to zero. Select all other records. This example is the same as:```
SKIPIF(ISNOTFOUND({Lookup4,
                 field7;$SYM1=3,$SYM2=0})
```

|
|```
IF DAYSBETWEEN({field1},{field2})
     > 7
   THEN SKIP
ENDIF
```

|Skip records where there are more than 7 days between field1 and field2, and select all other records. This example can also be written:```
SKIPIF(DAYSBETWEEN({field1},{field2})
       > 7)
```

|
|```
IF ({field1} BEGINS_WITH "BBB")
   THEN SKIP
ENDIF
```

|Skip input records where field1 begins with characters "BBB", and select all other records. This example can be written:```
SKIPIF({field1} BEGINS_WITH "BBB")
```

It is better to use BEGINS\_WITH because the logic text executes faster.

|
|```
IF ({field2} CONTAINS "CCC")
   THEN SKIP
ENDIF
```

|Skip input records where field2 contains characters "CCC", and select all other records. This example can be written:```
SKIPIF({field2} CONTAINS "CCC")
```

It is better to use CONTAINS because the logic text executes faster.

|
|```
IF ({field3} ENDS_WITH "EEE")
   THEN SKIP
ENDIF
```

|Skip input records where field3 ends with characters "EEE", and select all other records. This example can be written:```
SKIPIF({field3} ENDS_WITH "EEE")
```

It is better to use ENDS\_WITH because the logic text executes faster.

|
|```
IF ({field4} MATCHES "...")
   THEN SKIP
ENDIF
```

|Skip input records where field4 matches characters "...", and select all other records. This example can be written:```
SKIPIF({field4} MATCHES "...")
```

|
|```
IF ({field1} LIKE "^BBB*")
   THEN SKIP
ENDIF
```

|Skip input records where field1 begins with characters "BBB", and select all other records. This example has the same effect as:```
SKIPIF({field1} BEGINS_WITH "BBB")
```

It is better to use BEGINS\_WITH because the logic text executes faster.

|
|```
IF ({field1} LIKE "*CCC*")
   THEN SKIP
ENDIF
```

|Skip input records where field1 contains characters "CCC", and select all other records. This example has the same effect as:```
SKIPIF({field1} CONTAINS "CCC")
```

It is better to use CONTAINS because the logic text executes faster.

|
|```
IF ({field1} LIKE "*EEE$")
   THEN SKIP
ENDIF
```

|Skip input records where field1 ends with characters "EEE", and select all other records. This example has the same effect as:```
SKIPIF({field1} ENDS_WITH "EEE")
```

It is better to use ENDS\_WITH because the logic text executes faster.

|
|```
IF ({field1} LIKE "^B*C*E$")
   THEN SKIP
ENDIF
```

|Skip input records where field1 begins with "B", contains "C" and ends with "E", and select all other records.|

**Parent topic:**[Syntax: IF statements](../html/WERLTSIF0.md)

