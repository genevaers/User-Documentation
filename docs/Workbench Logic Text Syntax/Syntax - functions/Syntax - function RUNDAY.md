---
layout: default
title: "Syntax - function RUNDAY"
parent: Syntax - functions
grand_parent: Workbench Logic Text Syntax
nav_order: 21
---
# Syntax - function RUNDAY
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# What is RUNDAY?


Normally, the date PE runs is the "run date".

The run date can be set to a fixed value in the VDP. See the next section for details of possible values.

RUNDAY returns a CCYYMMDD format date based on the run date. All views in the batch use the same base date for RUNDAY.

# Possible values of the VDP run date

The date that PE runs is the VDP run date unless there is a specific value set in the VDP.  To set a specific value in the VDP see the RUNDATE parameter for the configuration file to MR91 as given in topic [Runbook MR91 Control File Generator](../../PE Programs/Runbook MR91 Control File Generator). 

# How do I use RUNDAY? 

The parameter for RUNDAY is a number of days to add or delete from the default RUNDAY. For example, RUNDAY\(-5\) provides the day five days before the date the view is run.

RUNDAY can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function RUNDAY 1](../../images/LTSF_RUNDAY_01.gif)

# Rules for the syntax 

The parameter for RUNDAY is a number of days to add or delete from the default RUNDAY. For example, RUNDAY\(-5\) provides the day five days before the date the view is run.

RUNDAY can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: RUNDAY function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} < RUNDAY(-7))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip any input records where field1 is more than 7 days before the<br>date of running this view, and select all other records.<br>This example assumes that field1 is a date.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} < RUNDAY(-7))**|


# Examples: RUNDAY function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNDAY()**|Set current column to the same day number as the view is run.|


  
  (Examples can be copied to the clipboard.)
  
