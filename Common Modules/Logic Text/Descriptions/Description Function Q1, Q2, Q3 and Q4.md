
These functions return a range of dates that are part of a quarter year \(a three month period\). You can test if a date is inside that quarter.

For example, this logic text tests if field1 is in the first quarter of this year:

 >         IF ({field1} = Q1()) THEN

Since there is no parameter for Q1, then the year that the view runs is the year for the quarter.

If you provide a year in CCYY format, then the quarter applies to that year. For example, this logic text tests if field2 is in the third quarter of 2008:

>          IF ({field2} = Q3(2008)) THEN

Q1, Q2, Q3 and Q4 can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

