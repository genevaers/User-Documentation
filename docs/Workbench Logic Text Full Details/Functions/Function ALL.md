---
layout: default
title: "Function ALL"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 1
---
# Function ALL
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  

# How do I use function ALL? 


If you provide a text string then ALL can check if all of a field value is that text string \(repeated\). ALL is different from REPEAT because REPEAT has a fixed number of repetitions, whereas ALL is flexible and compares with fields of different lengths.

ALL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![(Function ALL)](../../images/LTSF_ALL_01.gif )

# Rules for the syntax 

ALL can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: ALL function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF NOT ({field1} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output those records with field1 is not equal<br> to all dashes. Skip all other records. This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} = ALL("-"))**|
|**IF ({field2} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with field2 is equal to all dashes.<br> Select all other records. This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field2} = ALL("-"))**|


# Examples: ALL function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**IF (field3} = "Total")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = ALL("-")<br>ENDIF**|If field3 is "Total" then set the<br> current column to all dashes.|
|**IF (field4} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = (field5} + (field6}<br>ENDIF**|If field4 is all dashes, then set the current column<br> to a total of fields 5 and 6.|

  

  
  (Examples can be copied to the clipboard.)
  
