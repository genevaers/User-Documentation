# Syntax: function DATE {#WERLTSFDate .reference}

## How do I use DATE? { .section}

DATE is used whenever you want to specify some date. You can use DATE to set a value, or as part of a comparison.

DATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSF_Date_01.gif)

![](images/LTSF_DATE_02.gif)

![](images/LTSF_DATE_03.gif)

![](images/LTSF_DATE_04.gif)

![](images/LTZZ_Syntax_legend.gif)

## Rules for the syntax { .section}

DATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: DATE function in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF {field1}
   = DATE("20111201",CCYYMMDD)
   THEN SELECT
ENDIF
```

|Select those input records where field1 is December 1, 2011. The code at left can also be written as:```
SELECTIF({field1}
         = DATE("20111201",CCYYMMDD))
```

|

## Examples: DATE function in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
COLUMN = DATE("20111201",CCYYMMDD)
```

|Set the current column to a date of December 1, 2011 in CCYYMMDD format.

|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

