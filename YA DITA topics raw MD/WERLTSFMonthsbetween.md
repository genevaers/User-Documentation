# Syntax: function MONTHSBETWEEN {#WERLTSFMonthsbetween .reference}

## How do I use MONTHSBETWEEN? { .section}

Use MONTHSBETWEEN to compare dates and give an different in months.

MONTHSBETWEEN can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_MTHSBTWDATE_01.gif)

![](images/LTSF_DATE_02.gif)

![](images/LTSF_DATE_03.gif)

![](images/LTSF_DATE_04.gif)

## Rules for the syntax { .section}

MONTHSBETWEEN can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: function MONTHSBETWEEN in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (MONTHSBETWEEN({field1},{field2})
    >= 3)
   THEN SELECT
ENDIF
```

|Select only records where there are at least 3 months between field1 and field2, and skip all other records. This example can also be written:```
SELECTIF(MONTHSBETWEEN({field1},{field2})
           >= 3)
```

|

## Examples: function MONTHSBETWEEN in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})
```

|Set the current column to the months between the transaction date and the shipping date.|
|```
IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})
     > 1)
   THEN COLUMN = {SHIP_DATE}
   ELSE COLUMN = {BUY_DATE}
ENDIF
```

|If there is more than one month between the transaction date and the shipping date, then set the current column to the shipping date, otherwise set the current column to the transaction date.|
|```
IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})
     > 6)
   THEN WRITE(SOURCE=VIEW,DEST=EXT=03)
ENDIF
```

|Write to extract 3 those records where there are more than 6 months between the transaction date and the shipping date.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

