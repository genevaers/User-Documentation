# Syntax: function FISCALMONTH {#WERLTSFFiscalmonth .reference}

## How do I use FISCALMONTH? { .section}

FISCALMONTH returns a month based on the Fiscal Parameters in the control record for the environment for a view. This means that different views running in the same batch can have different Fiscal dates because they come from different environments. By comparison, RUNDAY is the same for all views in a batch.

The VDP can override the fiscal values in the control record - see the next section below.

The FISCALMONTH returns a date in CCYYMM format that is appropriate for the environment of that view.

The parameter for FISCALMONTH is a number of months to add or delete from the default FISCALMONTH. For example, FISCALMONTH\(-5\) provides the month that is five months before the date the view is run.

FISCALMONTH can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

## VDP for view can override fiscal values in a control record {#20 .section}

A view specifies a control record, and so the values in the control record normally apply to that view.

The VDP for a view can override the fiscal values in a control record. In those cases the view ignores the fiscal values in the control record and uses the VDP fiscal values.

For more, see the \[FISCAL DATES\] section in the configuration file for MR90 in as given in topic "**Program Runbook: MR90 Logic Table Generator**". A link to that overview is under **Related reference** below.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_FISCALMONTH_01.gif)

## Rules for the syntax { .section}

FISCALMONTH can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: FISCALMONTH function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field2} >= FISCALMONTH(-1))
   THEN SELECT
ENDIF
```

|Select any input records where field2 is the previous fiscal month or later, and skip all other records. Fiscal months means that if the date of running this view is fiscal month one, then only records from fiscal month one are selected. The example at left assumes that field2 is a fiscal month number. The code at left can also be written as:```
SELECTIF({field2} >= FISCALMONTH(-1))
```

|

## Examples: FISCALMONTH function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = FISCALMONTH()
```

|Set the current column to the current fiscal month number.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

