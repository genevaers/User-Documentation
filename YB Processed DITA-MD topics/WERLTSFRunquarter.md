# Syntax: function RUNQUARTER {#WERLTSFRunquarter .reference}

## What is RUNQUARTER? { .section}

Normally, the date that PE runs is the "run date".

The run date can be set in the VDP to a fixed value. See the next section for details of possible values.

RUNQUARTER returns a CCYYMM format date \(at the start of a quarter\) based on the run date. All views in a batch use the same base date for RUNQUARTER.

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


## How do I use RUNQUARTER? { .section}

The parameter for RUNQUARTER is a number of quarters to add or delete from the default RUNQUARTER. For example, RUNQUARTER\(-5\) provides the day five quarters before the date the view is run.

RUNQUARTER can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_RUNQUARTER_01.gif)

## Rules for the syntax { .section}

RUNQUARTER can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

