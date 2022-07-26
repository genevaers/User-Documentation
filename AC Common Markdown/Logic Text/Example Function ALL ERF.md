
|Example logic text|Meaning|
|------------------|-------|
|```
IF NOT ({field1} = ALL("-"))
   THEN SELECT
ENDIF
```

|Select for output those records with field1 is not equal to all dashes. Skip all other records. This example gives the same result as:```
SKIPIF({field1} = ALL("-"))
```

|
|```
IF ({field2} = ALL("-"))
   THEN SKIP
ENDIF
```

|Skip for output those records with field2 is equal to all dashes. Select all other records. This example gives the same result as:```
SKIPIF({field2} = ALL("-"))
```

|

