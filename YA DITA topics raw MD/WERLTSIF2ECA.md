# Syntax: IF statements in Extract Column Assignment {#WERLTSIF2ECA .reference}

## Introduction { .section}

IF statements can be part of any logic text. An IF statement allows a condition to control if one or more statements are executed.

IF statements are allowed in all logic text, although the statements that can be called from an IF statement depend on the particular logic text.

An IF statement can call another IF statement - this is called "nesting" of IF statements, and is allowed in all logic text.

The details of what conditions and what statements are allowed in an IF statement in Extract Column Assignment are shown below.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTS_IF_2ECA_01.gif)

![](images/LTS_COLUMN_2ECA_01Z.gif)

![](images/LTS_COLnnn_2ECA_01Z.gif)

![](images/LTS_IF_2ECA_02.gif)

![](images/LTS_IF_2ECA_03.gif)

![](images/LTS_IF_2ECA_04.gif)

![](images/LTS_IF_2ECA_05.gif)

![](images/LTS_IF_2ECA_06.gif)

![](images/LTS_IF_2ECA_07.gif)

![](images/LTS_IF_2ECA_08.gif)

![](images/LTS_IF_2ECA_09.gif)

![](images/LTS_IF_2ECA_10.gif)

## Rules for the syntax { .section}

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

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

## Examples: IF with WRITE in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (ISNUMERIC({field4}) AND
   ({field5} > {field6} * 10) AND
   (ISNOTSPACES{field7} 
   THEN WRITE (SOURCE=DATA,
               USEREXIT={DB2_Update})
ENDIF 
```

|If field4 is numeric and field5 is greater than field6 times 10 and field7 is not spaces, then call the user-exit routine DB2\_Update for the columns up to the current point. This effectively does a writes to a DB2 table the columns in that record up to the current point.|
| | |
|```
IF (ISNOTNULL({field3}) AND
   ({field2} = {field1} + {field5}
   THEN WRITE (SOURCE=INPUT,
               DEST=FILE=
                  {LogicalFile3})
ENDIF 
```

|If field3 is not nulls and field2 equals field1 plus field 5 then write the entire input record to LogicalFile3. All columns in the input record are included, no matter what column contains this logic text.|
| | |
|```
IF (DAYSBETWEEN({field12},{field15})
     > 10) AND
   (ISFOUND({Lookup3;$SYM="A"}))
   THEN WRITE (SOURCE=VIEW,
               DEST=EXT=03)
ENDIF 
```

|If field12 and field15 are more than 10 days apart and the lookup path Lookup3 works with symbol SYM set to "A", then write the columns up to the current point to extract work file \(EXT\) 3. This assumes that the control record for this environment has a Maximum Extract File Number that is at least 3, or any overwrite of the VDP has also set this parameter to at least 3.|

**Parent topic:**[Syntax: IF statements](../html/WERLTSIF0.md)

