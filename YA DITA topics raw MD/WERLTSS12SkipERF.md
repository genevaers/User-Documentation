# Syntax: SKIP and SKIPIF statements in Extract Record Filter {#WERLTSS12SkipERF .reference}

## The purpose of SKIP and SKIPIF in Extract Record Filter { .section}

In this logic text, SKIP or SKIPIF define the input records to be excluded in the extract phase.

If there are **no SELECT, SELECTIF, SKIP or SKIPIF statements** in Extract Record Filter, then **all input records** are selected.

The idea is that you either SELECT or SKIP but you cannot do both in the same logic text. Once you have selected records then all others are skipped. Alternatively, once you skip records then all others are selected.

SKIPIF defines the input records to skip based on a condition.

SKIP must always be inside an IF statement, in a THEN or ELSE case. The path through the IF statement decides which records reach the SKIP statement.

Extract Record Filter can have **one SKIPIF** or **one IF that contains one or more SKIP statements**. Once either of these is present, no SELECT or SELECTIF statements are allowed.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSSS_SkipIF_01_ERF.gif)

![](images/LTSSS_IF_Skip_01_ERF.gif)

## Rules for the syntax { .section}

-   Extract Record Filter can have one SKIPIF statement or one IF statement that contains one or more SKIP statements. When one SKIPIF or SKIP is present, then no SELECT or SELECTIF statements are allowed.
-   One IF statement can have a SKIP for the THEN or ELSE case. One IF statement can have other IF statements nested inside, which may also have SKIP statements inside. All this counts as one IF statement.

The best way to learn is the examples below. See also the topic "**Syntax: IF Statements in Extract Record Filter**".

A link is under **Related reference** below.

## Examples: SKIPIF in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
SKIPIF(CURRENT({field4}) =
       PRIOR({field4}))
```

|Skip records where the new field4 value is the same as the previous field4. This assumes the input file is sorted into field4 order. This selects only the input records where field4 is a new value \(compared to the previous record\).|
|```
SKIPIF({field1} > 1000)
```

|Skip for output those records with field1 greater than 1000. Select all other records. The code at left is a shorthand for:```
IF ({field1} > 1000)
   THEN SKIP
ENDIF
```

|
|```
SKIPIF({field2} = "ABC")
```

|Skip for output those records with field2 equal to "ABC". Select all other records.|
|```
SKIPIF(NOT {field2} = "ABC")  
```

|Skip those output records with field2 not equal to "ABC". Select all other records. This example gives the same result as:```
SELECTIF({field2} = "ABC")
```

|
|```
SKIPIF({field3} = "A" OR {field3} = "D")
```

|Skip for output those records with field3 equal to "A" or "D". Select all other records.|
|```
SKIPIF({field4} = "A" AND {field5} > 10)
```

|Skip for output those records with field4 equal to "A" and field5 greater than 10. Select all other records.|
|```
SKIPIF({field6} * 2 > {field8}+ 5)
```

|Skip for output those records with field6 times 2 is greater than field8 plus 5. Select all other records.|
|```
SKIPIF({field6} = ALL("-"))

```

|Skip for output those records with field6 is equal to all dashes. Select all other records.|
|```
SKIPIF({field6} = REPEAT("-", 13))
```

|Skip for output those records with field6 is equal to 13 dashes. Select all other records.|
|```
SKIPIF({field6} = "\xFF")   
```

|Skip for output those records with field6 is equal to hexadecimal FF. Select all other records.|
|```
SKIPIF(ISNOTFOUND({Lookup2})
```

|Skip all input records where the lookup path Lookup2 does not successfully find a target record, and select all other records.|
|```
SKIPIF(ISNOTFOUND({Lookup2,field7})
```

|Skip all input records where the lookup path Lookup2 does not successfully finds a target record using effective date of field7, and select all other records.|
|```
SKIPIF(ISNOTFOUND({Lookup2;$SYM="A"})   
```

|Skip all input records where the lookup path Lookup2 using symbol SYM set to "A" does not successfully finds a target record, and select all other records.|
|```
SKIPIF(ISNOTFOUND({Lookup2,
                  field8;$SYM1=3,$SYM2=0})
```

|Skip all input records where the lookup path Lookup2 using effective date of field8 and symbol SYM1 set to 3 and symbol SYM2 set to zero does not successfully finds a target record. Select all other records.|
|```
SKIPIF(ISNULL({field1})
```

|Skip all input records where field1 contains null values, and select all other records.|
|```
SKIPIF(ISNOTNUMERIC({field2})
```

|Skip all input records where field2 is not numeric, and select all other records.|
|```
SKIPIF(ISSPACES({field3})
```

|Skip all input records where field3 is spaces, and select all other records.|
|```
SKIPIF(DAYSBETWEEN({field4},{field5})
        > 7)   
```

|Skip only records where there are more than 7 days between field4 and field5, and select all other records.|
|```
SKIPIF({field1} BEGINS_WITH "BBB")
```

|Skip input records where field1 begins with characters "BBB", and select all other records.|
|```
SKIPIF({field2} CONTAINS "CCC")
```

|Skip input records where field2 contains characters "CCC", and select all other records.|
|```
SKIPIF({field3} ENDS_WITH "EEE")
```

|Skip input records where field3 ends with characters "EEE", and select all other records.|
|```
SKIPIF({field4} MATCHES "...")   
```

|Skip input records where field4 matches characters "...", and select all other records.|
|```
SKIPIF({field5} LIKE "MA...")
```

|Skip input records where field5 is exactly 5 characters starting with "MA", and select all other records.|
|```
SKIPIF({field6} LIKE "..VA..")
```

|Skip input records where field6 is exactly 6 characters with characters 3 and 4 as "VA", and select all other records.|
|```
SKIPIF({field7} LIKE ".....NA")
```

|Skip input records where field7 is exactly 6 characters ending in "NA", and select all other records.|
|```
SKIPIF({field8} LIKE "^BBB*")  
```

|Skip input records where field8 begins with characters "BBB", and select all other records. This example has the same effect as:```
SKIPIF({field8} BEGINS_WITH "BBB")
```

It is better to use BEGINS\_WITH because the logic text executes faster.

|
|```
SKIPIF({field9} LIKE "*CCC*")
```

|Skip input records where field9 contains characters "CCC", and select all other records. This example has the same effect as:```
SKIPIF({field9} CONTAINS "CCC")
```

It is better to use CONTAINS because the logic text executes faster.

|
|```
SKIPIF({field1} LIKE "*EEE$")
```

|Skip input records where field1 ends with characters "EEE", and select all other records. This example has the same effect as:```
SKIPIF({field1} ENDS_WITH "EEE")
```

It is better to use ENDS\_WITH because the logic text executes faster.

|
|```
SKIPIF({field2} LIKE "^B*C*E$")
```

|Skip input records where field2 begins with "B", contains "C" and ends with "E", and select all other records.|

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

**Parent topic:**[Syntax: SELECT, SELECTIF, SKIP and SKIPIF statements](../html/WERLTSS0SelectSkip.md)

