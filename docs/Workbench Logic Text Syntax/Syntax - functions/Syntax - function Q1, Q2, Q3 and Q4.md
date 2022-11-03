---
layout: default
title: "Syntax - function Q1, Q2, Q3 and Q4"
parent: Syntax - functions
grand_parent: Workbench Logic Text Syntax
nav_order: 20
---
# Syntax - function Q1, Q2, Q3 and Q4
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use Q1, Q2, Q3 and Q4? 


These functions return a range of dates that are part of a quarter year \(a three month period\). You can test if a date is inside that quarter.

For example, this logic text tests if field1 is in the first quarter of this year:

 >         IF ({field1} = Q1()) THEN

Since there is no parameter for Q1, then the year that the view runs is the year for the quarter.

If you provide a year in CCYY format, then the quarter applies to that year. For example, this logic text tests if field2 is in the third quarter of 2008:

>          IF ({field2} = Q3(2008)) THEN

Q1, Q2, Q3 and Q4 can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function Q1, Q2, Q3 and Q4 1](../../images/LTS_Q1_Q2_Q3_Q4_01.gif)


# Rules for the syntax 

Q1, Q2, Q3 and Q4 can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: Q1, Q2, Q3 and Q4 function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} = Q1())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where field1 is a date in Q1 of the current year,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field1} = Q1())**|


# Examples: Q1, Q2, Q3 and Q4 function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} = Q1())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q1"<br>ENDIF**<br>**IF ({field1} = Q2())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q2"<br>ENDIF**<br>**IF ({field1} = Q3())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q3"<br>ENDIF**<br>**IF ({field1} = Q4())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "Q4"<br>ENDIF**<br>|Set the current column to "Q1" or "Q2" etc. based on date in field1.|


  
  (Examples can be copied to the clipboard.)
  
