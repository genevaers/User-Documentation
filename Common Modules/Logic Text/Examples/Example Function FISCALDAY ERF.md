
|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} < FISCALDAY(-7))<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<BR>ENDIF**|Skip any input records where field1 is more than 7 fiscal days before<BR>the date of running this view, and select all other records.<BR>Fiscal days means that if the date of running this view is fiscal day five<BR>of a fiscal year, then only records from fiscal days one to five<BR> are selected. This example assumes that field1 is a fiscal day number.<BR>The code at left can also be written as<BR>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} < FISCALDAY(-7))**|
