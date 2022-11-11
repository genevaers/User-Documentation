
# Examples: DAYSBETWEEN function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF (DAYSBETWEEN({field1},{field2}) > 7)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<BR>ENDIF**|Select only records where<BR>there are more than 7 days<BR>between field1 and field2, <BR>and skip all other records. <BR>This example can also be written:<BR>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(DAYSBETWEEN({field1},{field2}) > 7**|
