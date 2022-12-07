# Syntax: function FISCALDAY {#WERLTSFFiscalday .reference}

## How do I use FISCALDAY? {#10 .section}

FISCALDAY returns a day based on the fiscal values in the control record for the environment for a view. This means that different views in the same batch run can have different fiscal dates because they come from different environments. By comparison, RUNDAY is the same for all views in a batch.

The VDP can override the fiscal values in the control record - see the next section below.

The FISCALDAY returns a date in CCYYMMDD format that is appropriate for the environment of that view.

The parameter for FISCALDAY is a number of days to add or delete from the default FISCALDAY. For example, FISCALDAY\(-5\) provides the day that is five days before the date the view is run.

FISCALDAY can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

## VDP for view can override fiscal values in a control record {#20 .section}

A view specifies a control record, and so the values in the control record normally apply to that view.

The VDP for a view can override the fiscal values in a control record. In those cases the view ignores the fiscal values in the control record and uses the VDP fiscal values.

For more, see the \[FISCAL DATES\] section in the configuration file for MR90 in as given in topic "**Program Runbook: MR90 Logic Table Generator**". A link to that overview is under **Related reference** below.

## Syntax {#30 .section}

![](images/LTZZ_Syntax_legend.gif)

![](images/LTSF_FISCALDAY_01.gif)

## Rules for the syntax {#40 .section}

FISCALDAY can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: FISCALDAY function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field1} < FISCALDAY(-7))
   THEN SKIP
ENDIF
```

|Skip any input records where field1 is more than 7 fiscal days before the date of running this view, and select all other records. Fiscal days means that if the date of running this view is fiscal day five of a fiscal year, then only records from fiscal days one to five are selected. This example assumes that field1 is a fiscal day number. The code at left can also be written as:```
SKIPIF({field1} < FISCALDAY(-7))
```

|

## Examples: FISCALDAY function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = FISCALDAY()
```

|Set the current column to the fiscal day number of the day the view is run.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

