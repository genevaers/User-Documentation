
## Examples: COL.nnn (ERL)

|Example logic text|Meaning|
|------------------|-------|
|**COL.27 = {field1} \* {field26}<br>COL.28 = {field14} + {field1}<br>COL.29 = 0<br>COL.30 = "ABC"**|Set column 27 to field1 times field26.<br>Set column 28 to field14 plus field1.<br>Set column 29 to zero.<br>Set column 30 to "ABC".|
|**COL.5 = {Lookup1.Field3}**|Set column 5 to Field3 found by<br>lookup path Lookup1|

## Examples: IF with COL.nnn (ERL)

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} > 0) THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.27 = {field1} \* {field26}<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.28 = {field14} + {field1}<br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.27 = 0<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.28 = 0<br>ENDIF**|If field1 is greater than zero then set column 27<br>to field1 times field26 and set column 28 to field14 <br>plus field1. If field1 is not greater than zero then <br>set columns 27 and 28 to zero.|
|**IF COL.1 = ALL("-")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COL.2 = {field2} + {field3}<br>ENDIF**|If column 1 is all dashes, then set column 2<br>to a total of fields 2 and 3.|
