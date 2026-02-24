# Examples: Extract Column Logic with concatenation

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = {field1} & {field2} & {field3}<br><br>COLUMN = {field4} & "/" & {field5} &  "/" & {field5}<br><br>COLUMN = COL.2 & "/" & COL.3 &  "/" & COL.4<br>**|Assign three concatenated fields to the column<br><br>Concatenate a combination of fields and constants and assign to the column.<br><br>Assign the values in columns 2, 3 and 4, delimited by "/", to the current column. In this example the current column must be column 5 or greater.<br>|
