
## Examples: IF with WRITE (ERL)

|Example logic text|Meaning|
|------------------|-------|
|**IF {State_code} = "IL" THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE (SOURCE=VIEW,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEST=EXT=001 <br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE (SOURCE=VIEW,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEST=EXT=002<br>ENDIF**|If field State_code = "IL", then write<br> output record to extract file 01, otherwise<br> write to extract file 02.|

