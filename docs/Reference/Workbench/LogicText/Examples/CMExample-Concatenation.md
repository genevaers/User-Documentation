# Examples: Extract Column Logic with concatenation

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = {field1} & {field2} & {field3}**|Assign three concatenated fields to the column.|
|**COLUMN = {field4} & "/" & {field5} &  "/" & {field5}**|Concatenate a combination of fields and constants<br>and assign to the column.|
|**COLUMN = COL.2 & "/" & COL.3 &  "/" & COL.4**|Assign the values in columns 2, 3 and 4, delimited<br>by "/", to the current column. In this example the current column must be column 5 or greater.|
