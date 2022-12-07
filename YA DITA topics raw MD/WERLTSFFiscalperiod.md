# Syntax: function FISCALPERIOD {#WERLTSFFiscalperiod .reference}

## How do I use FISCALPERIOD? { .section}

FISCALPERIOD is a similar concept to FISCALMONTH. The difference is that there can be 13 periods in a year rather than 12. FISCALPERIOD returns a period based on the Fiscal Parameters in the control record for the environment for a view. This means that different views running in the same batch can have different Fiscal dates because they come from different environments. By comparison, RUNDAY is the same for all views in a batch.

The VDP can override the fiscal values in the control record - see the next section below.

The FISCALPERIOD returns a date in CCYYMM format that is appropriate for the environment of that view.

The parameter for FISCALPERIOD is a number of periods to add or delete from the default FISCALPERIOD. For example, FISCALPERIOD\(-5\) provides the month that is five periods before the date the view is run.

FISCALPERIOD can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

## VDP for view can override fiscal values in a control record {#20 .section}

A view specifies a control record, and so the values in the control record normally apply to that view.

The VDP for a view can override the fiscal values in a control record. In those cases the view ignores the fiscal values in the control record and uses the VDP fiscal values.

For more, see the \[FISCAL DATES\] section in the configuration file for MR90 in as given in topic "**Program Runbook: MR90 Logic Table Generator**". A link to that overview is under **Related reference** below.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_FISCALPERIOD_01.gif)

## Rules for the syntax { .section}

FISCALPERIOD can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: FISCALPERIOD function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field3} >= FISCALPERIOD(-1))
   THEN SELECT
ENDIF
```

|Select any input records where field3 is the previous fiscal period or later, and skip all other records. The example at left assumes that field3 is a fiscal period number. The code at left can also be written as:```
SELECTIF({field3} >= FISCALPERIOD(-1))
```

|

## Examples: FISCALPERIOD function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = FISCALPERIOD()
```

|Set the current column to the current fiscal period number.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

