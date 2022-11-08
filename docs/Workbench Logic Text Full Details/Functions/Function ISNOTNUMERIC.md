---
layout: default
title: "Function ISNOTNUMERIC"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 13
---
# Function ISNOTNUMERIC
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  

# How do I use ISNOTNUMERIC? 


If you provide an input field or lookup path then ISNOTNUMERIC returns true if the input field or lookup path field not a numeric value, and false if the value is numeric.

ISNOTNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function ISNOTNUMERIC 1](../../images/LTSF_ISNOTNUMERIC_01.gif)

![Function ISNOTNUMERIC 2](../../images/LTSF_ISNOTNUMERIC_02.gif)

![Function ISNOTNUMERIC 3](../../images/LTSF_Date_01.gif)

![Function ISNOTNUMERIC 4](../../images/LTSF_ISNOTNUMERIC_03.gif)

![Function ISNOTNUMERIC 5](../../images/LTSF_ISNOTNUMERIC_04.gif)


# Rules for the syntax 

ISNOTNUMERIC can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: ISNOTNUMERIC function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNUMERIC({field7})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field7 is not numeric, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNOTNUMERIC({field7})**|


# Examples: ISNOTNUMERIC function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNUMERIC({field8})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = 0<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field8}<br>ENDIF**|If field8 for the current record is not numeric,<br>then set the current column to zero,<br>otherwise set the current column to field8.|


  
  (Examples can be copied to the clipboard.)
  

