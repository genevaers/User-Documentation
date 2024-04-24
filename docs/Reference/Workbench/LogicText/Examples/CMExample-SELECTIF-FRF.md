## Examples: SELECTIF in Format Record Filter

|Example logic text|Meaning| 
|------------------|-------|
|**SELECTIF(COL.3 > 1000)**|Select for output only those records with column 3 greater than 1000. Skip all other records. |
|**SELECTIF(COL.2 = "ABC")**|Select for output only those records with column 2 equal to "ABC". Skip all other records.|
|**SELECTIF(NOT COL.2 = "ABC")**|Select those output records with field column 2 not equal to "ABC". Skip all other records. This example gives the same result as: SKIPIF(COL.2 = "ABC")|
|**SELECTIF ( COL.2 = "A" OR <br>&nbsp;&nbsp;&nbsp;&nbsp;COL.2 = "D" )**|Select for output only those records with column 2 equal to "A" or "D". Skip all other records.|
|**SELECTIF ( COL.2 = "A" AND <br>&nbsp;&nbsp;&nbsp;&nbsp;COL.3 > 10 )**|Select for output only those records with column 2 equal to "A" and column 3 greater than 10. Skip all other records.|
|**SELECTIF(COL.3 + Col.4 > Col.5)**|Select for output only those records with column 3 plus column 4 is greater than column 5. Skip all other records.|
|**SELECTIF(NOT COL.6 = ALL("-"))**|Select for output those records with column 6 is not equal to all dashes. Skip all other records. This example gives the same result as: SKIPIF(COL.6 = ALL("-"))|
|**SELECTIF(NOT COL.6 = "\xFF")**|Select for output those records with column 6 is not equal to hexadecimal FF. Skip all other records. This example gives the same result as: SKIPIF(COL.6 = "\xFF")|