# Syntax: ENDS\_WITH {#WERLTSStrEndsWith .reference}

## How do I use ENDS\_WITH? { .section}

ENDS\_WITH are keywords that are used as string comparison operators. You can check a string ends with certain characters.

For example, a field with "LONDON" begins with the string "N" and "ON" and even "LONDON".

ENDS\_WITH is an example of string comparisons that return a true or false value that can be part of an IF statement.

ENDS\_WITH can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSStr_ENDSWITH_01.gif)

## Rules for the syntax { .section}

ENDS\_WITH can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ENDS\_WITH in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
SELECTIF({field3} 
        ENDS_WITH "EEE")
```

|Select input records where field3 ends with characters "EEE", and skip all other records.|
|```
IF ({field3} 
   ENDS_WITH "EEE")
   THEN SELECT
ENDIF
```

|Select input records where field3 ends with characters "EEE", and skip all other records. This example can be written:```
SELECTIF({field3} ENDS_WITH "EEE")
```

|

## Examples: ENDS\_WITH in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field3} 
   ENDS_WITH "EEE")
   THEN COLUMN = {field3}
   ELSE COLUMN = " "
ENDIF
```

|If field3 ends with characters "EEE" then set the current column to field3, otherwise set the current column to blank.|

**Parent topic:**[Syntax: string comparison](../html/WERLTSStrAAStrComp.md)

