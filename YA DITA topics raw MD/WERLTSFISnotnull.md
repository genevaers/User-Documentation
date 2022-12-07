# Syntax: function ISNOTNULL {#WERLTSFISnotnull .reference}

## How do I use ISNOTNULL? { .section}

If you provide an input field or lookup path then ISNOTNULL returns true if the input field or lookup path field is some other than null values, and false if the value is null values.

ISNOTNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISNOTNULL_01.gif)

![](images/LTSF_ISNOTNULL_02.gif)

![](images/LTSF_Date_01.gif)

![](images/LTSF_ISNOTNULL_03.gif)

![](images/LTSF_ISNOTNULL_04.gif)

## Rules for the syntax { .section}

ISNOTNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISNOTNULL function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTNULL({field3})
   THEN SELECT
ENDIF
```

|Select all input records where field3 does not contain null values, and skip all other records. This example is the same as:```
SELECTIF(ISNOTNULL({field3})
```

|
|```
IF ISNOTNULL({Lookup1})
   THEN SELECT
ENDIF
```

|Select all input records where the lookup field for lookup path Lookup1 does not contain null values, and skip all other records. This example is the same as:```
SELECTIF(ISNOTNULL({Lookup1})
```

|

## Examples: ISNOTNULL function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTNULL({field4})
   THEN COLUMN = {field4}
   ELSE COLUMN = "NOT AVAILABLE"
ENDIF
```

|If field4 for the current record does not contain null values, then set the current column to field4, otherwise set the current column to "NOT AVAILABLE".|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

