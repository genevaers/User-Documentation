# Syntax: function ISNULL {#WERLTSFISnull .reference}

## How do I use ISNULL? { .section}

If you provide an input field or lookup path then ISNULL returns true if the input field or lookup path field is null values, and false if the value is anything else.

ISNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISNULL_01.gif)

![](images/LTSF_ISNULL_02.gif)

![](images/LTSF_Date_01.gif)

![](images/LTSF_ISNULL_03.gif)

![](images/LTSF_ISNULL_04.gif)

## Rules for the syntax { .section}

ISNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISNULL function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNULL({field1})
   THEN SKIP
ENDIF
```

|Skip all input records where field1 contains null values, and select all other records. This example is the same as:```
SKIPIF(ISNULL({field1})
```

|

## Examples: ISNULL function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNULL({field2})
   THEN COLUMN = "EMPTY"
   ELSE COLUMN = {field2}
ENDIF
```

|If field2 for the current record contains null values, then set the current column to "EMPTY", otherwise set the current column to field2.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

