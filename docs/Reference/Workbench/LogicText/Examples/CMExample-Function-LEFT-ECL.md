
# Examples: LEFT function in ECL 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = LEFT({Cust_Code},4)**|Set the current column to the first four bytes of field Cust_Code.|
|**COLUMN = LEFT(COL.3,8)**|Set the current column to the first eight bytes column 3. This column must be after column 3.|
|**IF (LEFT({Cust_Code},8) CONTAINS "AA") THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>the Cust_code contains "AA" anywhere in the first eight characters.|
