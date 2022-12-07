# Syntax: function ISNUMERIC {#WERLTSFISnumeric .reference}

## How do I use ISNUMERIC? { .section}

If you provide an input field or lookup path then ISNUMERIC returns true if the input field or lookup path field has a numeric value, and false if the value is anything else.

ISNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISNUMERIC_01.gif)

![](images/LTSF_ISNUMERIC_02.gif)

![](images/LTSF_Date_01.gif)

![](images/LTSF_ISNUMERIC_03.gif)

![](images/LTSF_ISNUMERIC_04.gif)

## Rules for the syntax { .section}

ISNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISNUMERIC function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNUMERIC({field5})
   THEN SELECT
ENDIF
```

|Select all input records where field5 is numeric, and skip all other records. This example is the same as:```
SELECTIF(ISNUMERIC({field5})
```

|

## Examples: ISNUMERIC function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNUMERIC({field6})
   THEN COLUMN = {field6} * 100
   ELSE COLUMN = 0
ENDIF
```

|If field6 for the current record is numeric, then set the current column to field6 times 100, otherwise set the current column to zero.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

