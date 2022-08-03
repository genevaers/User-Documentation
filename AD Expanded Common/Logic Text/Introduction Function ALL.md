# Syntax: function ALL

## How do I use ALL? 

If you provide a text string then ALL can check if all of a field value is that text string \(repeated\). ALL is different from REPEAT because REPEAT has a fixed number of repetitions, whereas ALL is flexible and compares with fields of different lengths.

ALL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![(Syntax Legend)](../images/LTZZ_Syntax_legend.gif )

## Syntax 

![(Function ALL)](../images/LTSF_ALL_01.gif )

## Rules for the syntax 

ALL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**".

## Examples: ALL function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|```
IF NOT ({field1} = ALL("-"))
   THEN SELECT
ENDIF
```

|Select for output those records with field1 is not equal to all dashes. Skip all other records. This example gives the same result as:```
SKIPIF({field1} = ALL("-"))
```

|
|```
IF ({field2} = ALL("-"))
   THEN SKIP
ENDIF
```

|Skip for output those records with field2 is equal to all dashes. Select all other records. This example gives the same result as:```
SKIPIF({field2} = ALL("-"))
```

|


## Examples: ALL function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|```
IF (field3} = "Total")
   THEN COLUMN = ALL("-")
ENDIF  Eugene Fix 01
```
|If field3 is "Total" then set the current column to all dashes.|
  
|```
IF (field4} = ALL("-"))
   THEN COLUMN = (field5} + (field6}
ENDIF
```
|If field4 is all dashes, then set the current column to a total of fields 5 and 6.|



