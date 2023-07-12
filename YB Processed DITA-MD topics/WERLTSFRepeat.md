# Syntax: function REPEAT {#WERLTSFRepeat .reference}

## How do I use REPEAT? { .section}

If you provide a text string and an integer, then REPEAT can create a string that consists of the given text string with integer repetitions. REPEAT is different from ALL because REPEAT has a fixed number of repetitions, whereas ALL is flexible and compares with fields of different lengths.

REPEAT can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_REPEAT_01.gif)

## Rules for the syntax { .section}

-   REPEAT can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.
-   REPEAT has a maximum length of 256 characters.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: REPEAT function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF NOT ({field7} =
        REPEAT("-", 13))
   THEN SELECT
ENDIF
```

|Select for output those records with field7 is not equal to 13 dashes. Skip all other records. This example gives the same result as:```
SKIPIF({field7} = REPEAT("-", 13))
```

|
|```
IF ({field8} =
     REPEAT("-", 13))
   THEN SKIP
ENDIF
```

|Skip for output those records with field8 is equal to 13 dashes. Select all other records. This example gives the same result as:```
SKIPIF({field8} = REPEAT("-", 13))
```

|

## Examples: REPEAT function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field9} = "Total")
   THEN COLUMN =
        REPEAT("-", 13)
ENDIF
```

|If field9 is "Total" then set the current column to 13 dashes.|
|```
IF ({field10} =
   REPEAT("-", 13))
   THEN COLUMN =
        {field1} + {field2}
ENDIF
```

|If field10 is 13 dashes, then set the current column to a total of fields 1 and 2.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

