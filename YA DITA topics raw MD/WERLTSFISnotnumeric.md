# Syntax: function ISNOTNUMERIC {#WERLTSFISnotnumeric .reference}

## How do I use ISNOTNUMERIC? { .section}

If you provide an input field or lookup path then ISNOTNUMERIC returns true if the input field or lookup path field not a numeric value, and false if the value is numeric.

ISNOTNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISNOTNUMERIC_01.gif)

![](images/LTSF_ISNOTNUMERIC_02.gif)

![](images/LTSF_Date_01.gif)

![](images/LTSF_ISNOTNUMERIC_03.gif)

![](images/LTSF_ISNOTNUMERIC_04.gif)

## Rules for the syntax { .section}

ISNOTNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISNOTNUMERIC function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTNUMERIC({field7})
   THEN SKIP
ENDIF
```

|Skip all input records where field7 is not numeric, and select all other records. This example is the same as:```
SKIPIF(ISNOTNUMERIC({field7})
```

|

## Examples: ISNOTNUMERIC function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTNUMERIC({field8})
   THEN COLUMN = 0
   ELSE COLUMN = {field8}
ENDIF
```

|If field8 for the current record is not numeric, then set the current column to zero, otherwise set the current column to field8.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

