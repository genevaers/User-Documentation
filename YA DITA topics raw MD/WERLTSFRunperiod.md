# Syntax: function RUNPERIOD {#WERLTSFRunperiod .reference}

## What is RUNPERIOD? { .section}

RUNPERIOD is a similar concept to month. The difference is that there can be 13 periods in a year instead of 12. Periods are defined in the control record for the environment of the view.

Normally, the date that PE runs is the "run date".

The run date can be set in the VDP to a fixed value. See the next section for details of possible values.

RUNPERIOD returns a CCYYMM format date based on the run date and the period definition in the control record. All views in a batch use the same base date for RUNPERIOD.

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


## How do I use RUNPERIOD? { .section}

The parameter for RUNPERIOD is a number of periods to add or delete from the default RUNPERIOD. For example, RUNPERIOD\(-5\) provides the day five periods before the date the view is run.

RUNPERIOD can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_RUNPERIOD_01.gif)

## Rules for the syntax { .section}

RUNPERIOD can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: RUNPERIOD function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field3} >= RUNPERIOD(-1))
   THEN SELECT
ENDIF
```

|Select any input records where field3 is the previous period or later, and skip all other records. The example at left assumes that field3 is a period number. The code at left can also be written as:```
SELECTIF({field3} >= RUNPERIOD(-1))
```

|

## Examples: RUNPERIOD function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = RUNPERIOD()
```

|Set the current column to the current period number.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

