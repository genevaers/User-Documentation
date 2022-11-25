---
layout: default
title: "Examples - COLUMN & COL.nnn statements (FRF)"
parent: Examples - Format Record Filter (FRF)
grand_parent: Workbench Logic Text Examples
nav_order: 2
---

# Examples - COLUMN & COL.nnn statements (FRF)
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  

 COLUMN statements are **not permitted** in **Format Record Filter** logic text.


# Examples: SELECTIF with COL.nnn (FRF)

|Example logic text|Meaning|
|------------------|-------|
|**SELECTIF(COL.3 > 1000)**|Select for output only those records with<br>column 3 greater than 1000.<br>Skip all other records.<br>The code at left is a shorthand for:<br>**&nbsp;&nbsp;&nbsp;&nbsp;IF (COL.3 > 1000)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDIF**|
|**SELECTIF(COL.2 = "ABC")**|Select for output only those records with<br>column 2 equals "ABC". Skip all other records.|
|**SELECTIF(NOT COL.2 = "ABC")**|Select for output only those records with<br>column 2 not equal to "ABC". Skip all other records.<br>This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(COL.2 = "ABC")**|
|**SELECTIF(COL.2 = "A" OR<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.2 = "D")**|Select for output only those records with<br>column 2 equal to "A" or "D".<br>Skip all other records.|
|**SELECTIF(COL.2 = "A" AND<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.3 > 10)**|Select for output only those records with<br>column 2 equal to "A" and column 3 greater than 10.<br>Skip all other records.|
|**SELECTIF(COL.3 + Col.4 > Col.5)**|Select for output only those records with<br>column 3 plus column 4 greater than column 5.<br>Skip all other records.|
|**SELECTIF(NOT COL.6 = "\xFF")**|Select for output those records with column 6<br>is not equal to hexadecimal FF.<br>Skip all other records.<br>This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(COL.6 = "\xFF")**|

# Examples: SKIPIF with COL.nnn (FRF)

|Example logic text|Meaning|
|------------------|-------|
|**SKIPIF(COL.3 > 1000)**|Skip for output those records with<br>column 3 greater than 1000.<br>Select all other records.<br>The code at left is a shorthand for:<br>**&nbsp;&nbsp;&nbsp;&nbsp;IF (COL.3 > 1000)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDIF**|
|**SKIPIF(COL.2 = "ABC")**|Skip for output those records with<br>column 2 equals "ABC". Select all other records.|
|**SKIPIF(NOT COL.2 = "ABC")**|Skip for output those records with<br>column 2 not equal to "ABC". Select all other records.<br>This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(COL.2 = "ABC")**|
|**SKIPIF(COL.2 = "A" OR<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.2 = "D")**|Skip for output those records with<br>column 2 equal to "A" or "D".<br>Select all other records.|
|**SKIPIF(COL.2 = "A" AND<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.3 > 10)**|Skip for output those records with<br>column 2 equal to "A" and column 3 greater than 10.<br>Select all other records.|
|**SKIPIF(COL.3 + Col.4 > Col.5)**|Skip for output those records with<br>column 3 plus column 4 greater than column 5.<br>Select all other records.|
|**SKIPIF(COL.6 = "\xFF")**|Skip for output those records with column 6<br>equal to hexadecimal FF.<br>Select all other records.|

# Examples: IF with COL.nnn and SELECT (FRF)

|Example logic text|Meaning|
|------------------|-------|
|**IF (COL.3 > 1000)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output only those records with column 3<br>greater than 1000. Skip all other records.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(COL.3 > 1000)**|
|**IF (COL.2 = "ABC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output only those records with column 2<br>equal to "ABC". Skip all other records.|
|**IF NOT (COL.2 = "ABC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select those output records with column 2<br> not equal to "ABC". Skip all other records.<br>The code at left gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(COL.2 = "ABC")**|
|**IF (COL.2 = "A") OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.2 = "D")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output only those records with column 2<br>equal to "A" or "D". Skip all other records.|
|**IF (COL.2 = "A") AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.3 > 10)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output only those records with<br>column 2 equal to "A" and column 3 greater than 10.<br>Skip all other records.|
|**IF (COL.3 + Col.4 > Col.5 \* 100)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output only those records with<br>column 3 plus column 4 is greater than column 5 times 100.<br>Skip all other records.|
|**IF (COL.6 = "\xFF")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output those records with column 6<br>equal to hexadecimal FF. Skip all other records.|
|**IF (COL.2 = "A") AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.3 > 10)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE IF (COL.2 "D")<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ELSE IF (COL.2 "G")<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ENDIF<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDIF<br>ENDIF**|Select for output those records with<br>column 2 equal to "A" and column 3 greater than 10.<br>Also select for output those records with column 2 equal to "D".<br>Also select for output those records with column 2 equal to "G".<br>Skip all other records.<br>Notice that the logic text at left counts as<br>only one IF statement, because the extra IF statements<br>are nested inside the first.<br>The code at left can also be written as follows<br>\(note the use of brackets to control the evaluation<br>of the conditions\):<br>**IF (COL.2 = "A" AND COL.3 > 10) OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.2 = "D") OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.2 = "G")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|
|**IF (COL.2 = "A") AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.3 > 10)<br>THEN IF (COL.4 + COL.5<br>&nbsp;&nbsp;&nbsp;&nbsp;         > COL.6)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE IF (COL.7 = 0)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENDIF<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDIF<br>ENDIF**|Consider those records with column 2 equal to "A"<br> and column 3 greater than 10.<br>Of the considered records, select for output<br>those records with column 4 plus column 5<br>greater then column 6.<br>Of the considered records not yet selected,<br>select also for output those records with<br>column 7 equal to zero.<br>Skip all other records.<br>Notice that the logic text at left counts as only<br>one IF statement, because the extra IF<br> statements are nested inside the first.<br>The code at left can also be written as follows<br>\(note the use of brackets to control the evaluation of the conditions\):<br>**IF (COL.2 = "A" AND COL.3 > 10) AND<br>&nbsp;&nbsp;&nbsp;&nbsp;((COL.4 + COL.5 > COL.6) OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.7 = 0))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|

# Examples: IF with COL.nnn and SKIP (FRF)

|Example logic text|Meaning|
|------------------|-------|
|**IF (COL.3 > 1000)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with column 3 greater<br> than 1000. Select all other records.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(COL.3 > 1000)**|
|**IF (COL.2 = "ABC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with column 2<br>equal to "ABC". Select all other records.|
|**IF NOT (COL.2 = "ABC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip those output records with column 2<br>not equal to "ABC". Select all other records.<br>The code at left gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(COL.2 = "ABC")**|
|**IF (COL.2 = "A") OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.2 = "D")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with column 2<br> equal to "A" or "D". Select all other records.|
|**IF (COL.2 = "A") AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.3 > 10)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with<br>column 2 equal to "A" and column 3 greater than 10.<br>Select all other records.|
|**IF (COL.3 + Col.4<br>&nbsp;&nbsp;&nbsp;&nbsp;> Col.5 \* 100)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with column 3 plus column 4<br>is greater than column 5 times 100.<br>Select all other records.|
|**IF (COL.6 = "\xFF")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with column 6<br>is equal to hexadecimal FF. Select all other records.<br>This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(COL.6 = "\xFF")**|
|**IF (COL.2 = "A") AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.3 > 10)<br>THEN SKIP<br>ELSE IF (COL.2 = "D")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE IF (COL.2 = "G")<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          ENDIF<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDIF<br>ENDIF**|Skip for output those records with column 2<br> equal to "A" and column 3 greater than 10.<br>In addition, skip for output those records with<br>column 2 equal to "D".<br>In addition, skip for output those records with column 2 equal to "G".<br>Select all other records.<br>Notice that the logic text at left counts as only one IF statement,<br>because the extra IF statements are nested inside the first.<br>The code at left can also be written as follows<br>\(note the use of brackets to control the evaluation of the conditions\):<br>**IF (COL.2 = "A" AND COL.3 > 10) OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.2 = "D") OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.2 = "G")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|
|**IF (COL.2 = "A") AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.3 > 10)<br>THEN IF (COL.4 + COL.5<br>&nbsp;&nbsp;&nbsp;&nbsp;         > COL.6)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE IF (COL.7 = 0)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          ENDIF<br>&nbsp;&nbsp;&nbsp;&nbsp;ENDIF<br>ENDIF**|Consider those records with column 2 equal to "A"<br>and column 3 greater than 10.<br>Of the considered records, skip for output those records<br>with column 4 plus column 5 is greater then column 6.<br>Of the considered records not yet skipped,<br>skip also for output those records with column 7 equal to zero.<br>Select all other records.<br>Notice that the logic text at left counts as only one IF statement,<br>because the extra IF statements are nested inside the first.<br>The code at left can also be written as follows<br>\(note the use of brackets to control the evaluation of the conditions\):<br>**IF (COL.2 = "A" AND COL.3 > 10) AND<br>&nbsp;&nbsp;&nbsp;&nbsp;((COL.4 + COL.5 > COL.6) OR<br>&nbsp;&nbsp;&nbsp;&nbsp;(COL.7 = 0))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|


