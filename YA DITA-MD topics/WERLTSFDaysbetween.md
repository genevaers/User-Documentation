# Syntax: function DAYSBETWEEN {#WERLTSFDaysbetween .reference}

## How do I use DAYSBETWEEN? { .section}

Use DAYSBETWEEN to compare dates and return the difference in days.

DAYSBETWEEN can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_DAYSBTWDATE_01.gif)

![](images/LTSF_DATE_02.gif)

![](images/LTSF_DATE_03.gif)

![](images/LTSF_DATE_04.gif)

## Rules for the syntax { .section}

DAYSBETWEEN can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: function DAYSBETWEEN in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (DAYSBETWEEN({field1},{field2})
     > 7)
   THEN SELECT
ENDIF
```

|Select only records where there are more than 7 days between field1 and field2, and skip all other records. This example can also be written:```
SELECTIF(DAYSBETWEEN({field1},{field2})
           > 7)
```

|

## Examples: function DAYSBETWEEN in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = DAYSBETWEEN({BUY_DATE},{SHIP_DATE})
```

|Set the current column to the days between the transaction date and the shipping date.|
|```
IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 10)
   THEN COLUMN = {SHIP_DATE}
   ELSE COLUMN = {BUY_DATE}
ENDIF
```

|If there are more than 10 days between the transaction date and the shipping date, then set the current column to the shipping date, otherwise set the current column to the transaction date.|
|```
IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 30)
   THEN WRITE(SOURCE=VIEW,DEST=EXT=03)
ENDIF
```

|Write to extract 3 those records where there are more than 30 days between the transaction date and the shipping date.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

