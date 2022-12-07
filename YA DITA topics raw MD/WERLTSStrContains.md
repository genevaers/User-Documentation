# Syntax: CONTAINS {#WERLTSStrContains .reference}

## How do I use CONTAINS? { .section}

CONTAINS is a keyword that is used as a string comparison operator. You can check a string contains with certain characters.

For example, a field with "LONDON" contains the string "ON" and "DO" and even "LONDON".

CONTAINS is an example of string comparisons that return a true or false value that can be part of an IF statement.

CONTAINS can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSStr_CONTAINS_01.gif)

## Rules for the syntax { .section}

CONTAINS can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: CONTAINS in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
SELECTIF({field2} 
        CONTAINS "CCC")
```

|Select input records where field2 contains characters "CCC", and skip all other records.|
|```
IF ({field2} 
   CONTAINS "CCC")
   THEN SELECT
ENDIF
```

|Select input records where field2 contains characters "CCC", and skip all other records. This example can be written:```
SELECTIF({field2} CONTAINS "CCC")
```

|

## Examples: CONTAINS in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field2} |
   CONTAINS "CCC")
   THEN COLUMN = {field2}
   ELSE COLUMN = " "
ENDIF
```

|If field2 contains characters "CCC" then set the current column to field2, otherwise set the current column to blank.|

**Parent topic:**[Syntax: string comparison](../html/WERLTSStrAAStrComp.md)

