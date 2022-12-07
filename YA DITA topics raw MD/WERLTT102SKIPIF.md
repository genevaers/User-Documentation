# Examples: SKIPIF statements {#WERLTT102SKIPIF .reference}

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

**Parent topic:**[Logic text 1: Extract Record Filter](../html/WERLTT100ERecFilter.md)

