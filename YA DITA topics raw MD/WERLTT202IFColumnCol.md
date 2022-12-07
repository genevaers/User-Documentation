# Examples: IF with COLUMN and COL.nnn statements {#WERLTT202IFColumnCol .reference}

## Examples: IF with COLUMN and COL.nnn in Extract Column Assignment { .section}

In all the following examples, **COLUMN can be replaced by COL.nnn**, for example COL.3. You can set the value of any COL.nnn from any other column. You can create multiple IF statements in Extract Column Assignment logic text. However, you cannot inquire on COL.nnn \(for example, IF COL.4 = 0 is not allowed\).

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field1} > 0) THEN
   COLUMN = ({field2}/{field1}) * 100
   COL.27 = {field1} * {field26}
   COL.28 = {field14} + {field1}
ELSE
   COLUMN = 0
   COL.27 = 0
   COL.28 = 0
ENDIF
```

|If field1 is greater than zero then set the current column to field2 divided by field1 all multiplied by 100, set column 27 to field1 times field26 and set column 28 to field 14 plus field1. If field1 is not greater than zero then set the current column and columns 27 and 28 to zero.|
|```
IF (CURRENT({field5}) <> PRIOR({field5}))
   THEN COLUMN = "PRODUCT: "
   ELSE COLUMN = " "
ENDIF
```

|If the current record has a different value of field5 from the previous record, set the current column to "PRODUCT: " otherwise set the current column to blank. This assumes the input file is sorted into field5 order.|
|```
IF ({field5} = "Total")
   THEN COLUMN = ALL("-")
ENDIF
```

|If field5 is "Total" then set the current column to all dashes.|
|```
IF {field6} = ALL("-")
   THEN COLUMN = {field2} + {field3}
ENDIF
```

|If field6 is all dashes, then set the current column to a total of fields 2 and 3.|
|```
IF ({field5} = "Total")
   THEN COLUMN = REPEAT("-", 13)
ENDIF
```

|If field5 is "Total" then set the current column to 13 dashes.|
|```
IF ({field6} = REPEAT("-", 13))
   THEN COLUMN = {field2} + {field3}
ENDIF
```

|If field6 is 13 dashes, then set the current column to a total of fields 2 and 3.|
|```
IF ({field5} = "Total")
   THEN COLUMN = "\xFF"
ENDIF
```

|If field5 is "Total" then set the current column to hexadecimal FF.|
|```
IF ({field6} = "\xFF")
   THEN COLUMN = {field2} + {field3}
ENDIF
```

|If field6 is hexadecimal FF, then set the current column to a total of fields 2 and 3.|
|```
IF ISNOTSPACES({field1})
   THEN COLUMN = {field1}
   ELSE COLUMN = "DEFAULT"
ENDIF
```

|If field1 is not spaces then set the current column to field1, otherwise set the current column to "DEFAULT".|
|```
IF ISFOUND({Lookup1})
   THEN COLUMN = {Lookup1}
   ELSE COLUMN = " "
ENDIF
```

|If the lookup path Lookup1 uses the current record to successfully find a target record, then set the current column to the lookup path field found, otherwise set the current column to blank.|
|```
 IF ISFOUND({Lookup2;$SYM="A"})
    THEN COLUMN = {Lookup2;$SYM="A"}
    ELSE COLUMN = 0
 ENDIF
```

|If the lookup path Lookup2 using symbol SYM set to "A", then set the current column to that lookup field, otherwise set the current column to zero.|
|```
IF ISNULL({field4}
   THEN COLUMN = "EMPTY"
   ELSE COLUMN = {field4}
ENDIF
```

|If field4 for the current record contains null values, then set the current column to "EMPTY", otherwise set the current column to field4.|
|```
IF ISNUMERIC({field4}
   THEN COLUMN = {field4} * 100
   ELSE COLUMN = 0
ENDIF
```

|If field4 for the current record is numeric, then set the current column to field4 times 100, otherwise set the current column to zero.|
|```
IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE})
     > 10)
   THEN COLUMN = {SHIP_DATE}
   ELSE COLUMN = {BUY_DATE}
ENDIF
```

|If there are more than 10 days between the transaction date and the shipping date, then set the current column to the shipping date, otherwise set the current column to the transaction date.|
|```
IF ({field1} BEGINS_WITH "BBB")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 begins with characters "BBB" then set the current column to field1, otherwise set the current column to blank.|
|```
IF ({field2} CONTAINS "CCC")
   THEN COLUMN = {field2}
   ELSE COLUMN = " "
ENDIF
```

|If field2 contains characters "CCC" then set the current column to field2, otherwise set the current column to blank.|
|```
IF ({field3} ENDS_WITH "EEE")
   THEN COLUMN = {field3}
   ELSE COLUMN = " "
ENDIF
```

|If field3 ends with characters "EEE" then set the current column to field3, otherwise set the current column to blank.|
|```
IF ({field4} MATCHES "...")
   THEN COLUMN = {field4}
   ELSE COLUMN = " "
ENDIF
```

|If field4 matches characters "..." then set the current column to field4, otherwise set the current column to blank.|
|```
IF ({field1} LIKE "MA...")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|Select input records where field1 is exactly 5 characters starting with "MA", and skip all other records.|
|```
IF ({field1} LIKE "..VA..")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|Select input records where field1 is exactly 6 characters with characters 3 and 4 as "VA", and skip all other records.|
|```
IF ({field1} LIKE ".....NA")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|Select input records where field1 is exactly 6 characters ending in "NA", and skip all other records.|
|```
IF ({field1} LIKE "^BBB*")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 begins with characters "BBB" then set the current column to field1, otherwise set the current column to blank.|
|```
IF ({field1} LIKE "*CCC*")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 contains characters "CCC" then set the current column to field1, otherwise set the current column to blank.|
|```
IF ({field1} LIKE "*EEE$")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 ends with characters "EEE" then set the current column to field1, otherwise set the current column to blank.|
|```
IF ({field1} LIKE "^B*C*E$")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 begins with "B", contains "C" and ends with "E" then set the current column to field1, otherwise set the current column to blank.|

**Parent topic:**[Logic text 2: Extract Column Assignment](../html/WERLTT200EColAssign.md)

