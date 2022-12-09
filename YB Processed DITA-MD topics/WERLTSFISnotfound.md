# Syntax: function ISNOTFOUND {#WERLTSFISnotfound .reference}

## How do I use ISNOTFOUND? { .section}

If you provide a lookup path then ISNOTFOUND returns true if the lookup path fails for the current input record and false if the lookup path is successful .

ISNOTFOUND can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISNOTFOUND_01.gif)

![](images/LTSF_Date_FR_FN_01.gif)

![](images/LTSF_ISNOTFOUND_02.gif)

![](images/LTSF_ISNOTFOUND_03.gif)

## Rules for the syntax { .section}

ISNOTFOUND can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If **no effective date** is specified, ISNOTFOUND uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISNOTFOUND function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTFOUND({Lookup3})
   THEN SKIP
ENDIF
```

|Skip all input records where the lookup path Lookup3 does not successfully find a target record, and select all other records. This example is the same as:```
SKIPIF(ISNOTFOUND({Lookup3})
```

|

## Examples: ISNOTFOUND function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISNOTFOUND({Lookup1})
   THEN COLUMN = "PROBLEM"
   ELSE COLUMN = " "
ENDIF
```

|If the lookup path Lookup1 uses the current record and does not successfully find a target record, then set the current column to "PROBLEM", otherwise set the current column to blank.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

