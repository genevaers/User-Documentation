# Syntax: functions Q1, Q2, Q3 and Q4 {#WERLTSFQ1234 .reference}

## How do I use Q1 or Q2 or Q3 or Q4? { .section}

These functions return a range of dates that are part of a quarter year \(a three month period\). You can test if a date is inside that quarter.

For example, this logic text tests if field1 is in the first quarter of this year:

```
          IF ({field1} = Q1()) THEN
```

Since there is no parameter for Q1, then the year that the view runs is the year for the quarter.

If you provide a year in CCYY format, then the quarter applies to that year. For example, this logic text tests if field2 is in the third quarter of 2008:

```
          IF ({field2} = Q3(2008)) THEN
```

Q1, Q2, Q3 and Q4 can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTS_Q1_Q2_Q3_Q4_01.gif)

## Rules for the syntax { .section}

-   If there is no CCYY parameter, then the year that the view runs is the year for the quarter.
-   Q1, Q2, Q3 and Q4 can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

