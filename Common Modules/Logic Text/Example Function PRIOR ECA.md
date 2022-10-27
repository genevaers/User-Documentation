
|Example logic text|Meaning|
|------------------|-------|
|IF (CURRENT({field2}) <> PRIOR({field2}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "PRODUCT: "<br>&nbsp;&nbsp;&nbsp;&nbsp;    ELSE COLUMN = " "<br>ENDIF|If the current record has a different value of field2 from<br>the previous record, set the current column to "PRODUCT: "<br>otherwise set the current column to blank.<br>This assumes the input file is sorted into field2 order.|
  