# Examples: lookup paths in Extract Column Logic

|Example logic text&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|Meaning|
|------------------|-------|
|**COLUMN = {Lookup1.Field2}**|Set the current column using lookup path Lookup1 to provide Field2 in the target logical record.|
|**COLUMN = {Lookup1.Field2, Field7}**|Set the current column using lookup path Lookup1 to provide Field2 in the target logical record using effective date of Field7.|
|**COLUMN = {Lookup1.Field2;<br>&nbsp;&nbsp;&nbsp;&nbsp;\$SYM="ABC"}**|Set the current column using lookup path Lookup1 to provide Field2 in the target logical record using symbol SYM set to 'ABC".|
|**COLUMN = {Lookup3.Field4,<br>&nbsp;&nbsp;&nbsp;&nbsp;Field7;\$SYM1=3,\$SYM2=0}**|Set the current column using lookup path Lookup3 to provide Field4 in the target logical record using effective date of Field7 and symbols SYM1 set to 3 and SYM2 set to zero.|
|**IF ISFOUND({Lookup4;\$SYM="A"})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {Lookup4;\$SYM="A"}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = 0 <br>ENDIF**|If lookup path Lookup4 successfully finds a value using symbol SYM set to "A", then set the current column to that lookup field, otherwise set the current column to zero.|