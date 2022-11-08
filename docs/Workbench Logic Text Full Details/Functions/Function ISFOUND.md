---
layout: default
title: "Function ISFOUND"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 10
---
# Function ISFOUND
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  

# How do I use ISFOUND? 


If you provide a lookup path then ISFOUND returns true if the lookup path is successful for the current input record, and false if the lookup path fails.

ISFOUND can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function ISFOUND 1](../../images/LTSF_ISFOUND_01.gif)

![Function ISFOUND 2](../../images/LTSF_Date_FR_FN_01.gif)

![Function ISFOUND 3](../../images/LTSF_ISFOUND_02.gif)

![Function ISFOUND 4](../../images/LTSF_ISFOUND_03.gif)

# Rules for the syntax 

ISFOUND can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

If **no effective date** is specified, ISFOUND uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: ISFOUND function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF ISFOUND({Lookup2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where lookup path Lookup2 successfully<br>finds a target record, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISFOUND({Lookup2})**|


# Examples: ISFOUND function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**IF ISFOUND({Lookup2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {Lookup2}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If the lookup path Lookup2 uses the current record to<br>successfully find a target record, then set the current column<br>to the lookup field, otherwise set the<br>current column to blank.|


  
  (Examples can be copied to the clipboard.)
  

