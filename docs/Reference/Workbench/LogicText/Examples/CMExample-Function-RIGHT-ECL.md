
# Examples: RIGHT function in ECL 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RIGHT({Cust_Code},4)**|Set the current column to the last four bytes of field Cust_Code.|
|**COLUMN = RIGHT(COL.3,8)**|Set the current column to the last eight bytes of column 3. This column must be after column 3.|
|**IF (RIGHT({Cust_Code},8) CONTAINS "AA") THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>the Cust_code contains "AA" anywhere in the last eight characters.|
