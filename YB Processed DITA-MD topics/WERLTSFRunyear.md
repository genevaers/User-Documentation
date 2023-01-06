# Syntax: function RUNYEAR {#WERLTSFRunyear .reference}

## What is RUNYEAR? { .section}

Normally, the date that PE runs is the "run date".

The run date can be set in the VDP to a fixed value. See the next section for details of possible values.

RUNYEAR returns a CCYY format date based on the run date. All views in a batch use the same base date for RUNYEAR.

## Possible values of the VDP run date { .section}

The date that PE runs is the VDP run date unless there is a value set in the VDP by one of the following methods. Each method below overrides the previous methods given above.

-   Set a RUNDATE parameter in the input configuration file to MR86.

    For more, see topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

-   Set a -R value in the PARM options for MR86. This overrides the RUNDATE parameter in the input configuration file for MR86.

    For more, see topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

-   Set a RUNDATE parameter in the input configuration file to MR90. This overwrites any rundate supplied by MR86 above.

    For more, see topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.

-   Set a -R value in the PARM options for MR86. This overrides the RUNDATE parameter in the input configuration file for MR90.

    For more, see topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.


## How do I use RUNYEAR? { .section}

The parameter for RUNYEAR is a number of years to add or delete from the default RUNYEAR. For example, RUNYEAR\(-5\) provides a date five years before the date the view is run.

RUNYEAR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_RUNYEAR_01.gif)

## Rules for the syntax { .section}

RUNYEAR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: RUNYEAR function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field4} = RUNYEAR(-1))
   THEN SELECT
ENDIF
```

|Select any input records where field4 is the previous year, and skip all other records. The example at left assumes that field4 is a year number. The code at left can also be written as:```
SELECTIF({field4} = RUNYEAR(-1))
```

|

## Examples: RUNYEAR function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = RUNYEAR()
```

|Set the current column to the current year number.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)
