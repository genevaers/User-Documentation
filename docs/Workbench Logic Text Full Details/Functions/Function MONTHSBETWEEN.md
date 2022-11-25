---
layout: default
title: "Function MONTHSBETWEEN"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 18
---
# Function MONTHSBETWEEN
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use MONTHSBETWEEN? 

Use MONTHSBETWEEN to compare dates and return the difference in months.

MONTHSBETWEEN can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment (ECA)** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function MONTHSBETWEEN 1](../../images/LTSF_MTHSBTWDATE_01.gif)

![Function MONTHSBETWEEN 2](../../images/LTSF_DATE_02.gif)

![Function MONTHSBETWEEN 3](../../images/LTSF_DATE_03.gif)

![Function MONTHSBETWEEN 4](../../images/LTSF_DATE_04.gif)

# Rules for the syntax 

MONTHSBETWEEN can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment(ECA)** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: MONTHSBETWEEN function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (MONTHSBETWEEN({field1},{field2}) >= 3)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where there are at least 3 months between field1 and field2,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(MONTHSBETWEEN({field1},{field2}) >= 3)**|



# Examples: MONTHSBETWEEN function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column to the months between<br>the transaction date and the shipping date.|
|**IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE}) > 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there is more than one month between the transaction date and the shipping date,<br>then set the current column to the shipping date,<br>otherwise set the current column to the transaction date.|
|**IF (MONTHSBETWEEN({BUY_DATE},{SHIP_DATE})> 6)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>there are more than 6 months between the<br>transaction date and the shipping date.|


  
  (Examples can be copied to the clipboard.)
  

