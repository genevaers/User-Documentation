# Syntax: function YEARSBETWEEN {#WERLTSFYearsbetween .reference}

## How do I use YEARSBETWEEN? { .section}

Use YEARSBETWEEN to compare dates and give an different in years.

YEARSBETWEEN can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_YRSBTWDATE_01.gif)

![](images/LTSF_Date_01.gif)

![](images/LTSF_DATE_02.gif)

![](images/LTSF_DATE_03.gif)

![](images/LTSF_DATE_04.gif)

## Rules for the syntax { .section}

YEARSBETWEEN can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: function YEARSBETWEEN in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (YEARSBETWEEN({field1},{field2})
    >= 1)
   THEN SELECT
ENDIF
```

|Select only records where there is at least one year between field1 and field2, and skip all other records This example can also be written:```
SELECTIF(YEARSBETWEEN({field1},{field2})
         >= 1)
```

|

## Examples: function YEARSBETWEEN in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = YEARSBETWEEN({BUY_DATE},{SHIP_DATE})
```

|Set the current column to the years between the transaction date and the shipping date.|
|```
IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE})
      >= 1)
   THEN COLUMN = {SHIP_DATE}
   ELSE COLUMN = {BUY_DATE}
ENDIF
```

|If there is at least one year between the transaction date and the shipping date, then set the current column to the shipping date, otherwise set the current column to the transaction date.|
|```
IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE}
    ) >= 1)
   THEN WRITE(SOURCE=VIEW,DEST=EXT=03)
ENDIF
```

|Write to extract 3 those records where there is at least one year between the transaction date and the shipping date.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

