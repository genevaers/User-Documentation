---
layout: default
title: "Function ISNUMERIC"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 16
---
# Function ISNUMERIC
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use ISNUMERIC? 

If you provide an input field or lookup path then ISNUMERIC returns true if the input field or lookup path field has a numeric value, and false if the value is anything else.

ISNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function ISNUMERIC 1](../../images/LTSF_ISNUMERIC_01.gif)

![Function ISNUMERIC 2](../../images/LTSF_ISNUMERIC_02.gif)

![Function ISNUMERIC 3](../../images/LTSF_Date_01.gif)

![Function ISNUMERIC 4](../../images/LTSF_ISNUMERIC_03.gif)

![Function ISNUMERIC 5](../../images/LTSF_ISNUMERIC_04.gif)


# Rules for the syntax 

ISNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: ISNUMERIC function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNUMERIC({field5})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field5 is numeric, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNUMERIC({field5})**|



# Examples: ISNUMERIC function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNUMERIC({field6})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field6} \* 100<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = 0<br>ENDIF**|If field6 for the current record is numeric,<br>then set the current column to field6 times 100,<br>otherwise set the current column to zero.|


  
  (Examples can be copied to the clipboard.)
  

