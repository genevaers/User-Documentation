# Syntax: MATCHES {#WERLTSStrMatches .reference}

## How do I use MATCHES? { .section}

MATCHES is a keyword that is used as a string comparison operator. You can check a string contains certain characters in certain positions.

For example, a field with "It is raining in London " starts with "I" and contains "rain" and ends with "on". All these things can be checked in one use of MATCHES.

MATCHES is an example of string comparisons that return a true or false value that can be part of an IF statement.

MATCHES can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

MATCHES has exactly the same effect as LIKE \(another string comparison operator\).

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTSStr_MATCHES_01.gif)

## Rules for the syntax { .section}

-   MATCHES can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.
-   MATCHES has exactly the same effect as **LIKE** \(another string comparison operator\).

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: MATCHES in Extract Record Filter { .section}

Character "^" means the start of a string.

Character "$" means the end of a string.

Character "." means any single character.

Character "\*" means zero or more characters at this point.

|Example logic text|Meaning|
|------------------|-------|
|```
SELECTIF({field1} MATCHES "MA...")
```

|Select input records where field1 is exactly 5 characters starting with "MA", and skip all other records.|
|```
SELECTIF({field1} MATCHES "..VA..")
```

|Select input records where field1 is exactly 6 characters with characters 3 and 4 as "VA", and skip all other records.|
|```
SELECTIF({field1} MATCHES ".....NA")
```

|Select input records where field1 is exactly 6 characters ending in "NA", and skip all other records.|
|```
SELECTIF({field1} MATCHES "^BBB*")
```

|Select input records where field1 begins with characters "BBB", and skip all other records. This example has the same effect as:```
SELECTIF({field1} BEGINS_WITH "BBB")
```

It is better to use BEGINS\_WITH because the logic text executes faster.

|
|```
IF ({field1} MATCHES "^BBB*")
   THEN SELECT
ENDIF
```

|Select input records where field1 begins with characters "BBB", and skip all other records. This example has the same effect as:```
SELECTIF({field1} BEGINS_WITH "BBB")
```

It is better to use BEGINS\_WITH because the logic text executes faster.

|
|```
SELECTIF({field1} MATCHES "*CCC*")
```

|Select input records where field1 contains characters "CCC", and skip all other records. This example has the same effect as:```
SELECTIF({field1} CONTAINS "CCC")
```

It is better to use CONTAINS because the logic text executes faster.

|
|```
IF ({field1} MATCHES "*CCC*")
   THEN SELECT
ENDIF
```

|Select input records where field1 contains characters "CCC", and skip all other records. This example has the same effect as:```
SELECTIF({field1} CONTAINS "CCC")
```

It is better to use CONTAINS because the logic text executes faster.

|
|```
SELECTIF({field1} MATCHES "*EEE$")
```

|Select input records where field1 ends with characters "EEE", and skip all other records. This example has the same effect as:```
SELECTIF({field1} ENDS_WITH "EEE")
```

It is better to use ENDS\_WITH because the logic text executes faster.

|
|```
IF ({field1} MATCHES "*EEE$")
   THEN SELECT
ENDIF
```

|Select input records where field1 ends with characters "EEE", and skip all other records. This example has the same effect as:```
SELECTIF({field1} ENDS_WITH "EEE")
```

It is better to use ENDS\_WITH because the logic text executes faster.

|
|```
SELECTIF({field1} 
        MATCHES "^B*C*E$")
```

|Select input records where field1 begins with "B", contains "C" and ends with "E", and skip all other records.|
|```
IF ({field1} 
   MATCHES "^B*C*E$")
   THEN SELECT
ENDIF
```

|Select input records where field1 begins with "B", contains "C" and ends with "E", and skip all other records. T|

## Examples: MATCHES in Extract Column Assignment { .section}

Character "^" means the start of a string.

Character "$" means the end of a string.

Character "." means any single character.

Character "\*" means zero or more characters at this point.

|Example logic text|Meaning|
|------------------|-------|
|```
IF ({field1} 
   MATCHES "MA...")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|Select input records where field1 is exactly 5 characters starting with "MA", and skip all other records.|
|```
IF ({field1} 
   MATCHES "..VA..")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|Select input records where field1 is exactly 6 characters with characters 3 and 4 as "VA", and skip all other records.|
|```
IF ({field1} |
   MATCHES ".....NA")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|Select input records where field1 is exactly 6 characters ending in "NA", and skip all other records.|
|```
IF ({field1} 
   MATCHES "^BBB*")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 begins with characters "BBB" then set the current column to field1, otherwise set the current column to blank.|
|```
IF ({field1} 
   MATCHES "*CCC*")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 contains characters "CCC" then set the current column to field1, otherwise set the current column to blank.|
|```
IF ({field1} 
   MATCHES "*EEE$")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 ends with characters "EEE" then set the current column to field1, otherwise set the current column to blank.|
|```
IF ({field1} 
   MATCHES "^B*C*E$")
   THEN COLUMN = {field1}
   ELSE COLUMN = " "
ENDIF
```

|If field1 begins with "B", contains "C" and ends with "E" then set the current column to field1, otherwise set the current column to blank.|

**Parent topic:**[Syntax: string comparison](../html/WERLTSStrAAStrComp.md)

