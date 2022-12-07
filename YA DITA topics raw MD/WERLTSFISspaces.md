# Syntax: function ISSPACES {#WERLTSFISspaces .reference}

## How do I use ISSPACES? { .section}

If you provide an input field or lookup path then ISSPACES returns true if the input field or lookup path field contains spaces, and false if the value is anything else.

ISSPACES can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISSPACES_01.gif)

![](images/LTSF_ISSPACES_02.gif)

![](images/LTSF_Date_01.gif)

![](images/LTSF_ISSPACES_03.gif)

![](images/LTSF_ISSPACES_04.gif)

## Rules for the syntax { .section}

ISSPACES can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISSPACES function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISSPACES({field9})
   THEN SKIP
ENDIF
```

|Skip all input records where field9 is spaces, and select all other records. This example is the same as:```
SKIPIF(ISSPACES({field9})
```

|

## Examples: ISSPACES function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISSPACES({field1})
   THEN COLUMN = "DEFAULT"
   ELSE COLUMN = {field1}
ENDIF
```

|If field1 for the current record is spaces, then set the current column to "DEFAULT", otherwise set the current column to field1.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

