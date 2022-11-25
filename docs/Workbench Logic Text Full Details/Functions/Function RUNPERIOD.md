---
layout: default
title: "Function RUNPERIOD"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 24
---
# Function RUNPERIOD
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# What is RUNPERIOD?

RUNPERIOD is a similar concept to month. The difference is that there can be 13 periods in a year instead of 12. Periods are defined in the control record for the environment of the view.

Normally, the date PE runs is the "run date".

The run date can be set to a fixed value in the VDP. See the next section for details of possible values.

RUNPERIOD returns a CCYYMM format date based on the run date and the period definition in the control record. All views in a batch use the same base date for RUNPERIOD.

# Possible values of the VDP run date

The date that PE runs is the VDP run date unless there is a specific value set in the VDP.  To set a specific value in the VDP see the RUNDATE parameter for the configuration file to MR91 as given in topic [Runbook - MR91 Control File Generator](../../PE Programs/Runbook - MR91 Control File Generator). 

# How do I use RUNPERIOD? 

The parameter for RUNPERIOD is a number of periods to add or delete from the default RUNPERIOD. For example, RUNPERIOD\(-5\) provides the day five periods before the date the view is run.

RUNPERIOD can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment (ECA)** logic text.


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function RUNPERIOD 1](../../images/LTSF_RUNPERIOD_01.gif)

# Rules for the syntax 

RUNPERIOD can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment(ECA)** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: RUNPERIOD function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field3} >= RUNPERIOD(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field3 is the previous period or later,<br>and skip all other records.<br>The example at left assumes that field3 is a period number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field3} >= RUNPERIOD(-1))**|



# Examples: RUNPERIOD function in ECA 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = RUNPERIOD()**|Set current column to the current period number.|


  
  (Examples can be copied to the clipboard.)
  

