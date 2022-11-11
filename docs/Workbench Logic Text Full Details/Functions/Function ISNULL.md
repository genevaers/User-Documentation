---
layout: default
title: "Function ISNULL"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 15
---
# Function ISNULL
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use ISNULL? 

If you provide an input field or lookup path then ISNULL returns true if the input field or lookup path field is null values, and false if the value is anything else.

ISNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function ISNULL 1](../../images/LTSF_ISNULL_01.gif)

![Function ISNULL 2](../../images/LTSF_ISNULL_02.gif)

![Function ISNULL 3](../../images/LTSF_Date_01.gif)

![Function ISNULL 4](../../images/LTSF_ISNULL_03.gif)

![Function ISNULL 5](../../images/LTSF_ISNULL_04.gif)


# Rules for the syntax 

ISNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: ISNULL function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNULL({field1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field1 contains null values,<br>and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNULL({field1})**|



# Examples: ISNULL function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNULL({field2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "EMPTY"<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = {field2}<br>ENDIF**|If field2 for the current record contains null values,<br>then set the current column to "EMPTY",<br>otherwise set the current column to field2.|


  
  (Examples can be copied to the clipboard.)
  

