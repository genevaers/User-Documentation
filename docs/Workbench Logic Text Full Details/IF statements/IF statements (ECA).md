---
layout: default
title: "IF statements (ECA)"
nav_order: 2
parent: IF statements
grand_parent: Workbench Logic Text Full Details
---
# IF statements (ECA)
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  
 


# How do I use IF statements in ECA? 

IF statements can be part of any logic text. An IF statement allows a condition to control if one or more statements are executed.

Even though IF statements are allowed in all logic text, the statements that can be called in an IF statement change depending on the particular logic text.

An IF statement can call another IF statement - this is called "nesting" of IF statements, and is allowed in all logic text.

The syntax details of an IF statement in Extract Column Assignment are shown below.

![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function IF ECA 01](../../images/LTS_IF_2ECA_01.gif)

![Function IF ECA 02](../../images/LTS_IF_2ECA_02.gif)

![Function IF ECA 03](../../images/LTS_IF_2ECA_03.gif)

![Function IF ECA 04](../../images/LTS_IF_2ECA_04.gif)

![Function IF ECA 05](../../images/LTS_IF_2ECA_05.gif)

![Function IF ECA 06](../../images/LTS_IF_2ECA_06.gif)

![Function IF ECA 07](../../images/LTS_IF_2ECA_07.gif)

![Function IF ECA 08](../../images/LTS_IF_2ECA_08.gif)

![Function IF ECA 09](../../images/LTS_IF_2ECA_09.gif)

![Function IF ECA 10](../../images/LTS_IF_2ECA_10.gif)

![Function IF ECA 11](../../images/LTS_COLUMN_2ECA_01Z.gif)

![Function IF ECA 12](../../images/LTS_COLnnn_2ECA_01Z.gif)

![Function IF ECA 13](../../images/LTS_WRITE_01_Stmt.gif)

![Function IF ECA 14](../../images/LTS_WRITE_02_Source_2ECA.gif)

![Function IF ECA 15](../../images/LTS_WRITE_03_Dest_2ECA.gif)

![Function IF ECA 16](../../images/LTS_WRITE_04_Exit.gif)

![Function IF ECA 17](../../images/LTS_WRITE_05_Ext_File_Num.gif)

![Function IF ECA 18](../../images/LTS_WRITE_06_Names.gif)

![Function IF ECA 19](../../images/LTS_WRITE_07_String.gif)



# Rules for the syntax 

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


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
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE})<br>&nbsp;&nbsp;&nbsp;&nbsp;> 10)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there are more than 10 days between the<br> transaction date and the shipping date,<br>then set current column to the shipping date,<br>otherwise set current column to the transaction date.|
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


# Examples: IF with WRITE (ECA)

|Example logic text|Meaning|
|------------------|-------|
|**IF (ISNUMERIC({field4}) AND<br>&nbsp;&nbsp;&nbsp;&nbsp;({field5} > {field6} \* 10) AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(ISNOTSPACES{field7}<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE (SOURCE=DATA,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USEREXIT={DB2_Update})<br>ENDIF**|If field4 is numeric and field5 is greater than field6 times 10 and<br>field7 is not spaces, then call the user-exit routine DB2\_Update<br>for the columns up to the current point.<br>This effectively writes to a DB2 table the columns in that record<br>up to the current point.|
|**IF (ISNOTNULL({field3}) AND<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;({field2} = {field1} + {field5}<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE (SOURCE=INPUT,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEST=FILE={LogicalFile3})<br>ENDIF**|If field3 is not nulls and field2 equals field1 plus field 5<br>then write the entire input record to LogicalFile3.<br>All columns in the input record are included,<br>no matter what column contains this logic text.|
|**IF (DAYSBETWEEN({field12},{field15})<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;> 10) AND<br>&nbsp;&nbsp;&nbsp;&nbsp;(ISFOUND({Lookup3;$SYM="A"}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE (SOURCE=VIEW,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DEST=EXT=03)<br>ENDIF**|If field12 and field15 are more than 10 days apart and the<br>lookup path Lookup3 works with symbol SYM set to "A",<br>then write the columns up to the current point<br>to extract work file \(EXT\) 3.<br>This assumes that the control record for this environment<br>has a Maximum Extract File Number that is at least 3,<br> or any overwrite of the VDP has also set this parameter<br>to at least 3|


  
  (Examples can be copied to the clipboard.)
  




