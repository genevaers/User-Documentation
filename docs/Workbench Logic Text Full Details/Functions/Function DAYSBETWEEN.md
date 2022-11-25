---
layout: default
title: "Function DAYSBETWEEN"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 5
---
# Function DAYSBETWEEN
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use DAYSBETWEEN? 

Use DAYSBETWEEN to compare dates and return the difference in days.

DAYSBETWEEN can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment (ECA)** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function DAYSBETWEEN 1](../../images/LTSF_DAYSBTWDATE_01.gif)

![Function DAYSBETWEEN 2](../../images/LTSF_DATE_02.gif)

![Function DAYSBETWEEN 3](../../images/LTSF_DATE_03.gif)

![Function DAYSBETWEEN 4](../../images/LTSF_DATE_04.gif)

# Rules for the syntax 

DAYSBETWEEN can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment(ECA)** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: DAYSBETWEEN function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (DAYSBETWEEN({field1},{field2}) > 7)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<BR>ENDIF**|Select only records where<BR>there are more than 7 days<BR>between field1 and field2, <BR>and skip all other records. <BR>This example can also be written:<BR>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(DAYSBETWEEN({field1},{field2}) > 7**|


# Examples: DAYSBETWEEN function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = DAYSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column<BR>to the days between the transaction<BR>date and the shipping date.|
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 10)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<BR>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<BR>ENDIF**|If there are more than<BR>10 days between the transaction date<BR> and the shipping date, then<BR>set the current column to the<BR>shipping date, otherwise set the<BR>current column to the transaction date.|
|**IF (DAYSBETWEEN({BUY_DATE},{SHIP_DATE}) > 30)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<BR>ENDIF**|Write to Extract 3 those<BR> records where there are<BR> more than 30 days between the<BR>transaction date and the shipping date.|
  

  
  (Examples can be copied to the clipboard.)
  

