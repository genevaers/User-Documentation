---
layout: default
title: "Examples - Functions (ECA)"
parent: Examples - Extract Column Assignment (ECA)
grand_parent: Workbench Logic Text Examples
nav_order: 3
---

# Examples - Functions (ECA)
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  
 


# Examples: ALL function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF (field3} = "Total")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = ALL("-")<br>ENDIF**|If field3 is "Total" then set the<br> current column to all dashes.|
|**IF (field4} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = (field5} + (field6}<br>ENDIF**|If field4 is all dashes, then set the current column<br> to a total of fields 5 and 6.|

  


# Examples: BATCHDATE function in ECA

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = BATCHDATE()**|Set the current column to the date<br> that this view is run.|
|**COLUMN = BATCHDATE(-7)**|Set the current column to the date<br> that is 7 days before the view is run.|
|**COLUMN = {Lookup3.Field4,BATCHDATE(-32)**|Set the current column to Field4 found by Lookup3<br> as of 32 days before the view is run.|

  


# Examples: DATE function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = DATE("20111201",CCYYMMDD)**|Set the current column to a date of<br>December 1, 2011 in CCYYMMDD format.|

  


# Examples: DAYSBETWEEN function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = DAYSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column<BR>to the days between the transaction<BR>date and the shipping date.|
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 10)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<BR>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<BR>ENDIF**|If there are more than<BR>10 days between the transaction date<BR> and the shipping date, then<BR>set the current column to the<BR>shipping date, otherwise set the<BR>current column to the transaction date.|
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 30)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<BR>ENDIF**|Write to Extract 3 those<BR> records where there are<BR> more than 30 days between the<BR>transaction date and the shipping date.|
  


# Examples: FISCALDAY function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = FISCALDAY()**|Set the current column to the<BR>fiscal day number of the day<BR>the view is run.|
  


# Examples: FISCALMONTH function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = FISCALMONTH()**|Set the current column to the current fiscal month number.|

  


# Examples: FISCALQUARTER function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = FISCALQUARTER()**|Set the current column to the current fiscal quarter number.|

  


# Examples: FISCALYEAR function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = FISCALYEAR()**|Set the current column to the current fiscal year number.|

  


# Examples: ISFOUND function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISFOUND({Lookup2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {Lookup2}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If the lookup path Lookup2 uses the current record to<br>successfully find a target record, then set the current column<br>to the lookup field, otherwise set the<br>current column to blank.|



# Examples: ISNOTFOUND function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTFOUND({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "PROBLEM'<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If the lookup path Lookup1 uses the current record and<br>does not successfully find a target record,<br>then set the current column to "PROBLEM",<br>otherwise set the current column to blank.|



# Examples: ISNOTNULL function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNULL({field4})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field4}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = "NOT AVAILABLE"<br>ENDIF**|If field4 for the current record does not contain null values,<br>then set the current column to field4,<br>otherwise set the current column to "NOT AVAILABLE".|



# Examples: ISNOTNUMERIC function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNUMERIC({field8})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = 0<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field8}<br>ENDIF**|If field8 for the current record is not numeric,<br>then set the current column to zero,<br>otherwise set the current column to field8.|



# Examples: ISNOTSPACES function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTSPACES({field3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field3}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = "NOT SET"<br>ENDIF**|If field3 for the current record is not spaces,<br>then set the current column to field3,<br>otherwise set the current column to "NOT SET".|



# Examples: ISNULL function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNULL({field2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "EMPTY"<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field2}<br>ENDIF**|If field2 for the current record contains null values,<br>then set the current column to "EMPTY",<br>otherwise set the current column to field2.|



# Examples: ISNUMERIC function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNUMERIC({field6})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field6} \* 100<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = 0<br>ENDIF**|If field6 for the current record is numeric,<br>then set the current column to field6 times 100,<br>otherwise set the current column to zero.|



# Examples: ISSPACES function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISSPACES({field1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "DEFAULT"<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field1}<br>ENDIF**|If field1 for the current record is spaces,<br>then set the current column to "DEFAULT",<br>otherwise set the current column to field1.|



# Examples: MONTHSBETWEEN function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column to the months between<br>the transaction date and the shipping date.|
|**IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE}) > 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there is more than one month between the transaction date and the shipping date,<br>then set the current column to the shipping date,<br>otherwise set the current column to the transaction date.|
|**IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})> 6)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>there are more than 6 months between the<br>transaction date and the shipping date.|



# Examples: PRIOR function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF (CURRENT({field2}) <> PRIOR({field2}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "PRODUCT: "<br>&nbsp;&nbsp;&nbsp;&nbsp;    ELSE COLUMN = " "<br>ENDIF**|If the current record has a different value of field2 from<br>the previous record, set the current column to "PRODUCT: "<br>otherwise set the current column to blank.<br>This assumes the input file is sorted into field2 order.|
  


# Examples: Q1, Q2, Q3 and Q4 function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} = Q1())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q1"<br>ENDIF**<br>**IF ({field1} = Q2())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q2"<br>ENDIF**<br>**IF ({field1} = Q3())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q3"<br>ENDIF**<br>**IF ({field1} = Q4())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q4"<br>ENDIF**<br>|Set the current column to "Q1" or "Q2" etc. based on date in field1.|



# Examples: REPEAT function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field9} = "Total")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = REPEAT("-", 13)<br>ENDIF**|If field9 is "Total" then set the current column to 13 dashes.|
|**IF ({field10} = REPEAT("-", 13))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field1} + {field2}<br>ENDIF**|If field10 is 13 dashes, then set the current column<br>to a total of fields 1 and 2.|



# Examples: RUNDAY function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNDAY()**|Set current column to the same day number as the view is run.|



# Examples: RUNMONTH function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNMONTH()**|Set current column to the same month number as the view is run.|



# Examples: RUNPERIOD function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNPERIOD()**|Set current column to the current period number.|



# Examples: RUNQUARTER function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNQUARTER()**|Set current column to the start of the current quarter<br>in CCYYMM format.|



# Examples: RUNYEAR function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNYEAR()**|Set current column to the current year number.|



# Examples: YEARSBETWEEN function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = YEARSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column to the years<br>between the transaction date<br>and the shipping date.|
|**IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there is at least one year between<br>the transaction date and the shipping date,<br>then set current column to the shipping date,<br>otherwise set current column to the<br>transaction date.|
|**IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>there is at least one year between<br>the transaction date and the shipping date.|

