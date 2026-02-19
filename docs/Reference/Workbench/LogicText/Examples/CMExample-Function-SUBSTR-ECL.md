
# Examples: SUBSTR function in ECL 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = SUBSTR({Cust_Code},2,4)**|Set the current column to the four bytes starting at position 2 of field Cust_Code.|
|**IF (SUBSTR({Cust_Code},3,2) = "ZZ")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {Business_name}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {Name}<br>ENDIF**|If the Cust_Code contains the characters ZZ<br>at position 3for length 2<br>then set current column to Business_name,<br>otherwise set current column to Name.|
|**IF (SUBSTR({Cust_Code},3,8) contains "AA")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>the Cust_code contains "AA" anywhere in the eight characters starting from position 3.|
