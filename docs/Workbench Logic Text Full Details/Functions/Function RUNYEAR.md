---
layout: default
title: "Function RUNYEAR"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 26
---
# Function RUNYEAR
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  
 


# What is RUNYEAR?

Normally, the date PE runs is the "run date".

The run date can be set to a fixed value in the VDP. See the next section for details of possible values.

RUNYEAR returns a CCYY format date based on the run date. All views in a batch use the same base date for RUNYEAR.

# Possible values of the VDP run date

The date that PE runs is the VDP run date unless there is a specific value set in the VDP.  To set a specific value in the VDP see the RUNDATE parameter for the configuration file to MR91 as given in topic [Runbook - MR91 Control File Generator](../../PE Programs/Runbook - MR91 Control File Generator). 

# How do I use RUNYEAR? 

The parameter for RUNYEAR is a number of years to add or delete from the default RUNYEAR. For example, RUNYEAR\(-5\) provides a date five years before the date the view is run.

RUNYEAR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function RUNYEAR 1](../../images/LTSF_RUNYEAR_01.gif)

# Rules for the syntax 

RUNYEAR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: RUNYEAR function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = RUNYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous year,<br>and skip all other records.<br>The example at left assumes that field4 is a year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} = RUNYEAR(-1))**|



# Examples: RUNYEAR function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNYEAR()**|Set current column to the current year number.|


  
  (Examples can be copied to the clipboard.)
  

