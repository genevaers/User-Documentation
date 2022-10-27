
|Example logic text|Meaning|
|------------------|-------|
|IF NOT ({field1} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF|Select for output those records with field1 is not equal<br> to all dashes. Skip all other records. This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;SKIPIF({field1} = ALL("-"))|
|IF ({field2} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF|Skip for output those records with field2 is equal to all dashes.<br> Select all other records. This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;SKIPIF({field2} = ALL("-"))|

