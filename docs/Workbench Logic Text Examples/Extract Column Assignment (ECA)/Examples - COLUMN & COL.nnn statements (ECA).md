---
layout: default
title: "Examples - COLUMN & COL.nnn statements (ECA)"
parent: Extract Column Assignment (ECA)
grand_parent: Workbench Logic Text Examples
nav_order: 2
---

# Examples - COLUMN & COL.nnn statements (ECA)
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  
 

# Examples: COLUMN & COL.nnn (ECA)

In all the following examples, **COLUMN can be replaced by COL.nnn**, for example COL.3. You can set the value of any COL.nnn from any other column. You can create multiple COL.nnn statements in Extract Column Assignment logic text.

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = ({field2}/{field1}) \* 100<br>COL.27 = {field1} \* {field26}<br>COL.28 = {field14} + {field1}<br>COL.29 = 0<br>COL.30 = "ABC"**|Set current column to field2 divided by field1<br>all multiplied by 100.<br>Set column 27 to field1 times field26.<br>Set column 28 to field14 plus field1.<br>Set column 29 to zero.<br>Set column 30 to "ABC".|
|**COLUMN = ALL("-")**|Set current column to all dashes.|
|**COLUMN = REPEAT("-", 13)**|Set current column to 13 dashes.|
|**COLUMN = "\xFF"**|Set current column to hexadecimal FF.|
|**COLUMN = {Lookup1.Field3}**|Set current column to Field3 found by<br>lookup path Lookup1|
|**COLUMN = {Lookup1.Field3,field7}**|Set current column to Field3 found by<br> lookup path Lookup1 using<br>effective date of field7.|
|**COLUMN = {Lookup1.Field3,;$SYM="A"}**|Set current column to Field3 found by<br>lookup path Lookup1 using<br>symbol SYM set to "A".|
|**COLUMN = {Lookup1.Field3,field7;$SYM1=3,$SYM2=0}**|Set current column to Field3 found by<br>lookup path Lookup1 using<br>effective date of field7 and symbols<br>SYM1 set to 3 and SYM2 set to zero.|
|**COLUMN = DAYSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set current column to the days between<br>the transaction date and the shipping date.|

# Examples: IF with COLUMN & COL.nnn (ECA)

In all the following examples, **COLUMN can be replaced by COL.nnn**, for example COL.3. You can set the value of any COL.nnn from any other column. You can create multiple IF statements in Extract Column Assignment logic text. However, you cannot inquire on COL.nnn \(for example, IF COL.4 = 0 is not allowed\).

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} > 0) THEN<br>&nbsp;&nbsp;&nbsp;&nbsp;COLUMN = ({field2}/{field1}) \* 100<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.27 = {field1} \* {field26}<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.28 = {field14} + {field1}<br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;COLUMN = 0<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.27 = 0<br>&nbsp;&nbsp;&nbsp;&nbsp;COL.28 = 0<br>ENDIF**|If field1 is greater than zero then set current column<br>to field2 divided by field1 all multiplied by 100,<br>set column 27 to field1 times field26<br>and set column 28 to field 14 plus field1.<br>If field1 is not greater than zero then set<br>current column and columns 27 and 28 to zero.|
|**IF (CURRENT({field5}) <> PRIOR({field5}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "PRODUCT: "<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If current record field5 has a different value<br>from the previous record,<br> set current column to "PRODUCT: "<br>otherwise set current column to blank.<br>This assumes the input file is sorted into field5 order.|
|**IF ({field5} = "Total")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = ALL("-")<br>ENDIF**|If field5 is "Total" then set current column<br>to all dashes.|
|**IF {field6} = ALL("-")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field2} + {field3}<br>ENDIF**|If field6 is all dashes, then set current column<br>to a total of fields 2 and 3.|
|**IF ({field5} = "Total")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = REPEAT("-", 13)<br>ENDIF**|If field5 is "Total" then set current column<br>to 13 dashes.|
|**IF ({field6} = REPEAT("-", 13))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field2} + {field3}<br>ENDIF**|If field6 is 13 dashes, then set current column<br>to a total of fields 2 and 3.|
|**IF ({field5} = "Total")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "\xFF"<br>ENDIF**|If field5 is "Total" then set current column<br>to hexadecimal FF.|
|**IF ({field6} = "\xFF")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field2} + {field3}<br>ENDIF**|If field6 is hexadecimal FF, then set current column<br> to a total of fields 2 and 3.|
|**IF ISNOTSPACES({field1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = "DEFAULT"<br>ENDIF**|If field1 is not spaces then set current column<br>to field1, otherwise set current column to "DEFAULT".|
|**IF ISFOUND({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {Lookup1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If the lookup path Lookup1 uses current record<br>to successfully find a target record,<br>then set current column to lookup path field found,<br>otherwise set current column to blank.|
|**IF ISFOUND({Lookup2;$SYM="A"})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {Lookup2;$SYM="A"}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = 0<br>ENDIF**|If lookup path Lookup2 with symbol SYM "A" works,<br>then set current column to that lookup field,<br> otherwise set current column to zero.|
|**IF ISNULL({field4}<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "EMPTY"<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field4}<br>ENDIF**|If field4 for current record has null values,<br>then set current column to "EMPTY",<br>otherwise set current column to field4.|
|**IF ISNUMERIC({field4}<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field4} \* 100<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = 0<br>ENDIF**|If field4 for current record is numeric,<br>then set current column to field4 times 100,<br>otherwise set current column to zero.|
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 10)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there are more than 10 days between the<br> transaction date and the shipping date,<br>then set current column to the shipping date,<br>otherwise set current column to the transaction date.|
|**IF ({field1} BEGINS_WITH "BBB")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field1 begins with characters "BBB"<br>then set current column to field1,<br>otherwise set current column to blank.|
|**IF ({field2} CONTAINS "CCC")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field2}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field2 contains characters "CCC"<br>then set current column to field2,<br>otherwise set current column to blank.|
|**IF ({field3} ENDS_WITH "EEE")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field3}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field3 ends with characters "EEE"<br>then set current column to field3,<br>otherwise set current column to blank.|
|**IF ({field4} MATCHES "...")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field4}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field4 has three characters<br>then set current column to field4,<br>otherwise set current column to blank.|
|**IF ({field1} LIKE "MA...")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|For input records with field1 exactly 5 characters<br>starting with "MA", then set current column to field1<br>otherwise set current column to one blank.|
|**IF ({field1} LIKE "..VA..")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|For input records with field1 exactly 6 characters<br>with characters 3 and 4 as "VA",<br>then set current column to field1<br>otherwise set current column to one blank.|
|**IF ({field1} LIKE ".....NA")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|For input records with field1 exactly 6 characters<br>ending in "NA", then set current column to field1<br>otherwise set current column to one blank.|
|**IF ({field1} LIKE "^BBB\*")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field1 begins with characters "BBB"<br>then set current column to field1,<br>otherwise set current column to one blank.|
|**IF ({field1} LIKE "*CCC*")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field1 contains characters "CCC" then<br>set current column to field1,<br>otherwise set current column to one blank.|
|**IF ({field1} LIKE "\*EEE$")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field1 ends with characters "EEE"<br>then set current column to field1,<br>otherwise set current column to one blank.|
|**IF ({field1} LIKE "^B\*C\*E$")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If field1 begins "B", contains "C" and ends "E"<br>then set current column to field1,<br>otherwise set current column to one blank.|


