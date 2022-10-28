---
layout: default
title: "Syntax - function DATE"
parent: Syntax - functions
grand_parent: Workbench Logic Text Syntax
nav_order: 4
---
# Syntax - function DATE
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  
 
 


# How do I use DATE? 

DATE is used whenever you want to specify some date. You can use DATE to set a value, or as part of a comparison.

DATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![(Function DATE 1)](../../images/LTSF_Date_01.gif)

![(Function DATE 2)](../../images/LTSF_DATE_02.gif)

![(Function DATE 3)](../../images/LTSF_DATE_03.gif)

![(Function DATE 4)](../../images/LTSF_DATE_04.gif)

# Rules for the syntax 

DATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: DATE function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF {field1} = DATE("20111201",CCYYMMDD)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select those input records where<br>field1 is December 1, 2011.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field1}= DATE("20111201",CCYYMMDD))**|


# Examples: DATE function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = DATE("20111201",CCYYMMDD)**|Set the current column to a date of<br>December 1, 2011 in CCYYMMDD format.|

  


