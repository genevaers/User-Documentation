# Examples: lookup paths in Extract Record Filter

|Example logic text&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|Meaning|
|------------------|-------|
|**IF ISFOUND({Lookup3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where the lookup path Lookup3 successfully finds a target record,and skip all other records. This example is the same as:<br>**SELECTIF(ISFOUND({Lookup3}))**|
|**SELECTIF(ISFOUND({Lookup2;\$SYM="ABC"}))**|Select all input records where the lookup path Lookup2 successfully finds a target record using symbol SYM set to "ABC", and skip all other records.|
|**SELECTIF(ISFOUND({Lookup2, field7 }))**|Select all input records where the lookup path Lookup2 successfully finds a target record using effective date of field7, and skip all other records.|
|**SELECTIF(ISFOUND({Lookup5, field7; \$SYM1=3,\$SYM2=0}))**|Select all input records where the lookup path Lookup5 successfully finds a target record using effective date of field7 and symbol SYM1 set to 3 and symbol SYM2 set to zero. Skip all other records.|
|**IF ISNOTFOUND({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where the lookup path Lookup1 does not successfully find a target record, and select all other records. This example is the same as:<br>**SKIPIF(ISNOTFOUND({Lookup1}))**|
|**SKIPIF(ISNOTFOUND({Lookup2,field7; \$SYM1=3,\$SYM2=0}))**|Skip all input records where the lookup path Lookup2 does not successfully find a target record using effective date of field7 and symbol SYM1 set to 3 and symbol SYM2 set to zero. Select all other records.|