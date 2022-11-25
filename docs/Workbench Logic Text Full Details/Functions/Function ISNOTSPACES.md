---
layout: default
title: "Function ISNOTSPACES"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 14
---
# Function ISNOTSPACES
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use ISNOTSPACES? 

If you provide an input field or lookup path then ISNOTSPACES returns true if the input field or lookup path field is not spaces, and false if the value is spaces.

ISNOTSPACES can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment (ECA)** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function ISNOTSPACES 1](../../images/LTSF_ISNOTSPACES_01.gif)

![Function ISNOTSPACES 2](../../images/LTSF_ISNOTSPACES_02.gif)

![Function ISNOTSPACES 3](../../images/LTSF_Date_01.gif)

![Function ISNOTSPACES 4](../../images/LTSF_ISNOTSPACES_03.gif)

![Function ISNOTSPACES 5](../../images/LTSF_ISNOTSPACES_04.gif)


# Rules for the syntax 

ISNOTSPACES can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment(ECA)** logic text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: ISNOTSPACES function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTSPACES({field2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field2 is not spaces, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTSPACES({field2})**|



# Examples: ISNOTSPACES function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTSPACES({field3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = {field3}<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = "NOT SET"<br>ENDIF**|If field3 for the current record is not spaces,<br>then set the current column to field3,<br>otherwise set the current column to "NOT SET".|


  
  (Examples can be copied to the clipboard.)
  

