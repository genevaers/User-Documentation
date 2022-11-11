---
layout: default
title: "Function FISCALMONTH"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 7
---
# Function FISCALMONTH
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use FISCALMONTH? 

FISCALMONTH returns a month based on the Fiscal Parameters in the control record for the environment for a view. This means that different views running in the same batch can have different Fiscal dates because they come from different environments. By comparison, RUNDAY is the same for all views in a batch.

The VDP can override the fiscal values in the control record - see the next section below.

The FISCALMONTH returns a date in CCYYMM format that is appropriate for the environment of that view.

The parameter for FISCALMONTH is a number of months to add or delete from the default FISCALMONTH. For example, FISCALMONTH\(-5\) provides the month that is five months before the date the view is run.

FISCALMONTH can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

# VDP for view can override fiscal values in a control record

A view specifies a control record, and so the values in the control record normally apply to that view.

The VDP for a view can override the fiscal values in a control record. In those cases the view ignores the fiscal values in the control record and uses the VDP fiscal values.

For more, see the \[FISCAL DATES\] section in the configuration file for MR91 in as given in topic [Runbook - MR91 Control File Generator](../../PE Programs/Runbook - MR91 Control File Generator). 


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function FISCALMONTH](../../images/LTSF_FISCALMONTH_01.gif)

# Rules for the syntax 

FISCALMONTH can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: FISCALMONTH function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= FISCALMONTH(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous fiscal month or later,<br>and skip all other records. Fiscal months means that if the date of<br>running this view is fiscal month one, then only records from<br>fiscal month one are selected.<br>The example at left assumes that field2 is a fiscal month number.<br>The code at left can also be written as:<br>**SELECTIF({field2} >= FISCALMONTH(-1))**|


# Examples: FISCALMONTH function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = FISCALMONTH()**|Set the current column to the current fiscal month number.|

  

  
  (Examples can be copied to the clipboard.)
  

