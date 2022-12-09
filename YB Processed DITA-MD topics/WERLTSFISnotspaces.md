# Syntax: function ISNOTSPACES {#WERLTSFISnotspaces .reference}

## How do I use ISNOTSPACES? { .section}

If you provide an input field or lookup path then ISNOTSPACES returns true if the input field or lookup path field is not spaces, and false if the value is spaces.

ISNOTSPACES can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISNOTSPACES_01.gif)

![](images/LTSF_ISNOTSPACES_02.gif)

![](images/LTSF_Date_01.gif)

![](images/LTSF_ISNOTSPACES_03.gif)

![](images/LTSF_ISNOTSPACES_04.gif)

## Rules for the syntax { .section}

ISNOTSPACES can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISNOTSPACES function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTSPACES({field2})
   THEN SELECT
ENDIF
```

|Select all input records where field2 is not spaces, and skip all other records. This example is the same as:```
SELECTIF(ISNOTSPACES({field2})
```

|

## Examples: ISNOTSPACES function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTSPACES({field3})
   THEN COLUMN = {field3}
   ELSE COLUMN = "NOT SET"
ENDIF
```

|If field3 for the current record is not spaces, then set the current column to field3, otherwise set the current column to "NOT SET".|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

