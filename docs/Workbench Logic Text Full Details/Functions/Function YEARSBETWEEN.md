---
layout: default
title: "Function YEARSBETWEEN"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 27
---
# Function YEARSBETWEEN
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# What is YEARSBETWEEN?

Use YEARSBETWEEN to compare dates and give the difference in years.

YEARSBETWEEN can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment (ECA)** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function RUNYEAR 1](../../images/LTSF_YRSBTWDATE_01.gif)

![Function RUNYEAR 2](../../images/LTSF_Date_01.gif)

![Function RUNYEAR 3](../../images/LTSF_DATE_02.gif)

![Function RUNYEAR 4](../../images/LTSF_DATE_03.gif)

![Function RUNYEAR 5](../../images/LTSF_DATE_04.gif)


# Rules for the syntax 

YEARSBETWEEN can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment(ECA)** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: YEARSBETWEEN function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = RUNYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous year,<br>and skip all other records.<br>The example at left assumes that field4 is a year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} = RUNYEAR(-1))**|
|**IF (YEARSBETWEEN({field1},{field2}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where there is at least one year<br>between field1 and field2, and skip all other records.<br>This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(YEARSBETWEEN({field1},{field2}) >= 1)**|



# Examples: YEARSBETWEEN function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = YEARSBETWEEN({BUY_DATE},{SHIP_DATE})**|Set the current column to the years<br>between the transaction date<br>and the shipping date.|
|**IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {SHIP_DATE}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {BUY_DATE}<br>ENDIF**|If there is at least one year between<br>the transaction date and the shipping date,<br>then set current column to the shipping date,<br>otherwise set current column to the<br>transaction date.|
|**IF (YEARSBETWEEN({BUY_DATE},{SHIP_DATE}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN WRITE(SOURCE=VIEW,DEST=EXT=03)<br>ENDIF**|Write to extract 3 those records where<br>there is at least one year between<br>the transaction date and the shipping date.|


  
  (Examples can be copied to the clipboard.)
  

