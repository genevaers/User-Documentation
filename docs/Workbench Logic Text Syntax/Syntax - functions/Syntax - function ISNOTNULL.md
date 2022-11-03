---
layout: default
title: "Syntax - function ISNOTNULL"
parent: Syntax - functions
grand_parent: Workbench Logic Text Syntax
nav_order: 12
---
# Syntax - function ISNOTNULL
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use ISNOTNULL? 


If you provide an input field or lookup path then ISNOTNULL returns true if the input field or lookup path field is something other than null values, and false if the value is null values.

ISNOTNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function ISNOTNULL 1](../../images/LTSF_ISNOTNULL_01.gif)

![Function ISNOTNULL 2](../../images/LTSF_ISNOTNULL_02.gif)

![Function ISNOTNULL 3](../../images/LTSF_Date_01.gif)

![Function ISNOTNULL 4](../../images/LTSF_ISNOTNULL_03.gif)

![Function ISNOTNULL 5](../../images/LTSF_ISNOTNULL_04.gif)


# Rules for the syntax 

ISNOTNULL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If this functions checks a lookup, and **no effective date** is specified, ISNOTNULL uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: ISNOTNULL function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNULL({field3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field3 does not contain null values,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTNULL({field3})**|
|**IF ISNOTNULL({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where the lookup field for lookup path Lookup1<br>does not contain null values, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTNULL({Lookup1})**|


# Examples: ISNOTNULL function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNULL({field4})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field4}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = "NOT AVAILABLE"<br>ENDIF**|If field4 for the current record does not contain null values,<br>then set the current column to field4,<br>otherwise set the current column to "NOT AVAILABLE".|


  
  (Examples can be copied to the clipboard.)
  
