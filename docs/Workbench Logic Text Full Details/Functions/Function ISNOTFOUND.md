---
layout: default
title: "Function ISNOTFOUND"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 11
---
# Function ISNOTFOUND
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use ISNOTFOUND? 

If you provide a lookup path then ISNOTFOUND returns true if the lookup path fails for the current input record and false if the lookup path is successful .

ISNOTFOUND can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment (ECA)** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function ISNOTFOUND 1](../../images/LTSF_ISNOTFOUND_01.gif)

![Function ISNOTFOUND 2](../../images/LTSF_Date_FR_FN_01.gif)

![Function ISNOTFOUND 3](../../images/LTSF_ISNOTFOUND_02.gif)

![Function ISNOTFOUND 4](../../images/LTSF_ISNOTFOUND_03.gif)

# Rules for the syntax 

ISNOTFOUND can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment(ECA)** logic text.

If **no effective date** is specified, ISNOTFOUND uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: ISNOTFOUND function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTFOUND({Lookup3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where lookup path Lookup3 does not successfully<br>find a target record, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNOTFOUND({Lookup3})**|



# Examples: ISNOTFOUND function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTFOUND({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "PROBLEM'<br>&nbsp;&nbsp;&nbsp;&nbsp;ELSE COLUMN = " "<br>ENDIF**|If the lookup path Lookup1 uses the current record and<br>does not successfully find a target record,<br>then set the current column to "PROBLEM",<br>otherwise set the current column to blank.|


  
  (Examples can be copied to the clipboard.)
  

