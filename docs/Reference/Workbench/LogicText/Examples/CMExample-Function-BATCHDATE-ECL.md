
# Examples: BATCHDATE function in ECL

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = BATCHDATE()**|Set the current column to the date<br> that this view is run.|
|**COLUMN = BATCHDATE(-7)**|Set the current column to the date<br> that is 7 days before the view is run.|
|**COLUMN = {Lookup3.Field4,BATCHDATE(-32)**|Set the current column to Field4 found by Lookup3<br> as of 32 days before the view is run.|

  