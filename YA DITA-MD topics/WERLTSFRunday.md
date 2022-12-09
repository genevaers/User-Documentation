# Syntax: function RUNDAY {#WERLTSFRunday .reference}

## What is RUNDAY? { .section}

Normally, the date PE runs is the "run date".

The run date can be set to a fixed value in the VDP. See the next section for details of possible values.

RUNDAY returns a CCYYMMDD format date based on the run date. All views in the batch use the same base date for RUNDAY.

## Possible values of the VDP run date {#VDPrundate .section}

The date that PE runs is the VDP run date unless there is a value set in the VDP by one of the following methods. Each method below overrides the previous methods given above.

-   Set a RUNDATE parameter in the input configuration file to MR86.

    For more, see topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

-   Set a -R value in the PARM options for MR86. This overrides the RUNDATE parameter in the input configuration file for MR86.

    For more, see topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

-   Set a RUNDATE parameter in the input configuration file to MR90. This overwrites any rundate supplied by MR86 above.

    For more, see topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.

-   Set a -R value in the PARM options for MR86. This overrides the RUNDATE parameter in the input configuration file for MR90.

    For more, see topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.


## How do I use RUNDAY? { .section}

The parameter for RUNDAY is a number of days to add or delete from the default RUNDAY. For example, RUNDAY\(-5\) provides the day five days before the date the view is run.

RUNDAY can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_RUNDAY_01.gif)

## Rules for the syntax { .section}

RUNDAY can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: RUNDAY function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field1} < RUNDAY(-7))
   THEN SKIP
ENDIF
```

|Skip any input records where field1 is more than 7 days before the date of running this view, and select all other records. This example assumes that field1 is a date. The code at left can also be written as:```
SKIPIF({field1} < RUNDAY(-7))
```

|

## Examples: RUNDAY function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = RUNDAY()
```

|Set the current column to the same day number as the view is run.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

