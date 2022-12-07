# Syntax: function ISFOUND {#WERLTSFISfound .reference}

## How do I use ISFOUND? { .section}

If you provide a lookup path then ISFOUND returns true if the lookup path is successful for the current input record, and false if the lookup path fails.

ISFOUND can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_ISFOUND_01.gif)

![](images/LTSF_Date_FR_FN_01.gif)

![](images/LTSF_ISFOUND_02.gif)

![](images/LTSF_ISFOUND_03.gif)

## Rules for the syntax { .section}

ISFOUND can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If **no effective date** is specified, ISFOUND uses RUNDAY\( \) - see topic "**Syntax: function RUNDAY**". A link is under **Related reference** below.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: ISFOUND function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISFOUND({Lookup2})
   THEN SELECT
ENDIF
```

|Select all input records where lookup path Lookup2 successfully finds a target record, and skip all other records. This example is the same as:```
SELECTIF(ISFOUND({Lookup2})
```

|

## Examples: ISFOUND function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ISFOUND({Lookup2})
   THEN COLUMN = {Lookup2}
   ELSE COLUMN = " "
ENDIF
```

|If the lookup path Lookup2 uses the current record to successfully find a target record, then set the current column to the lookup field, otherwise set the current column to blank.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

