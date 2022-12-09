# Syntax: function BATCHDATE {#WERLTSFBatchdate .reference}

## How do I use BATCHDATE? { .section}

The BATCHDATE returns a date in CCYYMMDD format that is when the view is run. The group of views all running in the same batch in the Performance Engine all use the same BATCHDATE.

The parameter for BATCHDATE is a number of days to add or delete from the default BATCHDATE. For example, BATCHDATE\(-5\) provides the day five days before the date the view is run.

BATCHDATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_BATCHDATE_01.gif)

## Rules for the syntax { .section}

BATCHDATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: BATCHDATE function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field1} < BATCHDATE(-7))
   THEN SKIP
ENDIF
```

|Skip any input records where field1 is more than 7 days before the date of running this view. Select all other records. This example can also be written:```
SKIPIF({field1} < BATCHDATE(-7))
```

|

## Examples: BATCHDATE function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = BATCHDATE()
```

|Set the current column to the date that this view is run.

|
|```
COLUMN = BATCHDATE(-7)
```

|Set the current column to the date that is 7 days before the view is run.

|
|```
COLUMN = {Lookup3.Field4,BATCHDATE(-32))
```

|Set the current column to Field4 found by Lookup3 as of 32 days before the view is run.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

