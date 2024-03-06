# Examples: SKIPIF in Extract Record Filter

|Example logic text|Meaning|
|------------------|-------|
|**SKIPIF(CURRENT({field4})<br>&nbsp;&nbsp;&nbsp;&nbsp;PRIOR({field4}))**|Skip records where the new field4 value is the same as the previous field4. This assumes the input file is sorted into field4 order. This selects only the input records where field4 is a new value \(compared to the previous record\).| 
|**SKIPIF({field1} > 1000)**|Skip for output those records with field1 greater than 1000. Select all other records. The code at left is a shorthand for:<br>&nbsp;&nbsp;IF {field1} > 1000<br>&nbsp;&nbsp;&nbsp;&nbsp; THEN SKIP<br> &nbsp;&nbsp;ENDIF|
|**SKIPIF({field2} = "ABC")**|Skip for output those records with field2 equal to "ABC". Select all other records.|
|**SKIPIF(NOT({field2} = "ABC")**|Skip those output records with field2 not equal to "ABC". Select all other records. This example gives the same result as: <br>&nbsp;&nbsp;SELECTIF({field3} = "ABC")|
|**SKIPIF({field3} = "A" OR<br>&nbsp;&nbsp;&nbsp;&nbsp;{field3} = "D")**|Skip for output those records with field4 equal to "A" and field5 greater than 10. Select all other records.|
|**SKIPIF({field4} = "A" AND<br>&nbsp;&nbsp;&nbsp;&nbsp;{field5} > 10)**|Select for output only those records with field3 equal to "A" and field4 greater than 10. Skip all other records.|
|**SKIPIF({field6} * 2 > {field8}+ 5)**|Skip for output those records with field6 times 2 is greater than field8 plus 5. Select all other records.|
|**SKIPIF({field6} = ALL("-"))**|Skip for output those records with field6 is equal to all dashes. Select all other records.|
|**SKIPIF({field6} =  <br>&nbsp;&nbsp;&nbsp;&nbsp; REPEAT("-", 13))**|Skip for output those records with field6 is equal to 13 dashes. Select all other records.|
|**SKIPIF(NOT {field6} = "\xFF")**|Skip for output those records with field6 is equal to hexadecimal FF. Select all other records.|
|**SKIPIF(ISNOTFOUND({Lookup2}))**|Skip all input records where the lookup path Lookup2 does not successfully find a target record, and select all other records.|
|**SKIPIF(ISNOTFOUND({Lookup2,field7}))**|Skip all input records where the lookup path Lookup2 does not successfully finds a target record using effective date of field7, and select all other records.|
|**SKIPIF(ISNOTFOUND({Lookup2;$SYM="A"}))**|Skip all input records where the lookup path Lookup2 using symbol SYM set to "A" does not successfully finds a target record, and select all other records.|
|**SKIPIF(ISNOTFOUND({Lookup2,<br>&nbsp;&nbsp;&nbsp;&nbsp;field8;\$SYM1=3,\$SYM2=0}))**|Skip all input records where the lookup path Lookup2 using effective date of field8 and symbol SYM1 set to 3 and symbol SYM2 set to zero does not successfully finds a target record. Select all other records.|
|**SKIPIF(ISNULL({field1}))**|Skip all input records where field1 contains null values, and select all other records.|
|**SKIPIF(ISNOTNUMERIC({field2}))**|Skip all input records where field2 is not numeric, and select all other records.|
|**SKIPIF(ISSPACES({field3}))**|Skip all input records where field3 is spaces, and select all other records.|
|**SKIPIF(DAYSBETWEEN({field4},{field5})<br>&nbsp;&nbsp;&nbsp;&nbsp; > 7)**|Skip only records where there are more than 7 days between field4 and field5, and select all other records.|
|**SKIPIF({field1} BEGINS_WITH "BBB")**|Skip input records where field1 begins with characters "BBB", and select all other records.|
|**SKIPIF({field2} CONTAINS "CCC")**|Skip input records where field2 contains characters "CCC", and select all other records.|
|**SKIPIF({field3} ENDS_WITH "EEE")**|Skip input records where field3 ends with characters "EEE", and select all other records.|
