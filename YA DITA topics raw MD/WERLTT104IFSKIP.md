# Examples: IF with SKIP {#WERLTT104IFSKIP .reference}

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

**Parent topic:**[Logic text 1: Extract Record Filter](../html/WERLTT100ERecFilter.md)

