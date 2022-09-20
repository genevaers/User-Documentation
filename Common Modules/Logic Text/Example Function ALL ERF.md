
|Example logic text|Meaning|
|------------------|-------|
|IF NOT ({field1} = ALL("-"))<br>THEN SELECT<br>ENDIF|Select for output those records with field1 is not equal<br> to all dashes. Skip all other records. This example gives the same result as:<br>SKIPIF({field1} = ALL("-"))|
|IF ({field2} = ALL("-"))<br>THEN SKIP<br>ENDIF|Skip for output those records with field2 is equal to all dashes.<br> Select all other records. This example gives the same result as:<br>SKIPIF({field2} = ALL("-"))|

