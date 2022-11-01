
|Example logic text|Meaning|
|------------------|-------|
|**IF (CURRENT({field1}) <> PRIOR({field1}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records with unique values for field1.<br>This assumes the input file is sorted into field1 order.<br>This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(CURRENT({field1}) <> PRIOR({field1}))**|

