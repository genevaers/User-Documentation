
## Examples: SELECTIF with COL.nnn (FRF)

|Example logic text|Meaning|
|------------------|-------|
|**SELECTIF(COL.3 > 1000)**|Select for output only those records with<br>column 3 greater than 1000.<br>Skip all other records.|
|**SELECTIF(COL.2 = "ABC")**|Select for output only those records with<br>column 2 equals "ABC". Skip all other records.|
|**SELECTIF(NOT COL.2 = "ABC")**|Select for output only those records with<br>column 2 not equal to "ABC". Skip all other records.<br>This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(COL.2 = "ABC")**|
|**SELECTIF(COL.2 = "A" OR<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.2 = "D")**|Select for output only those records with<br>column 2 equal to "A" or "D".<br>Skip all other records.|
|**SELECTIF(COL.2 = "A" AND<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.3 > 10)**|Select for output only those records with<br>column 2 equal to "A" and column 3 greater than 10.<br>Skip all other records.|
|**SELECTIF(COL.3 + Col.4 > Col.5)**|Select for output only those records with<br>column 3 plus column 4 greater than column 5.<br>Skip all other records.|
|**SELECTIF(NOT COL.6 = "\xFF")**|Select for output those records with column 6<br>is not equal to hexadecimal FF.<br>Skip all other records.<br>This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(COL.6 = "\xFF")**|

## Examples: SKIPIF with COL.nnn (FRF)

|Example logic text|Meaning|
|------------------|-------|
|**SKIPIF(COL.3 > 1000)**|Skip for output those records with<br>column 3 greater than 1000.<br>Select all other records.|
|**SKIPIF(COL.2 = "ABC")**|Skip for output those records with<br>column 2 equals "ABC". Select all other records.|
|**SKIPIF(NOT COL.2 = "ABC")**|Skip for output those records with<br>column 2 not equal to "ABC". Select all other records.<br>This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(COL.2 = "ABC")**|
|**SKIPIF(COL.2 = "A" OR<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.2 = "D")**|Skip for output those records with<br>column 2 equal to "A" or "D".<br>Select all other records.|
|**SKIPIF(COL.2 = "A" AND<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.3 > 10)**|Skip for output those records with<br>column 2 equal to "A" and column 3 greater than 10.<br>Select all other records.|
|**SKIPIF(COL.3 + Col.4 > Col.5)**|Skip for output those records with<br>column 3 plus column 4 greater than column 5.<br>Select all other records.|
|**SKIPIF(COL.6 = "\xFF")**|Skip for output those records with column 6<br>equal to hexadecimal FF.<br>Select all other records.|

