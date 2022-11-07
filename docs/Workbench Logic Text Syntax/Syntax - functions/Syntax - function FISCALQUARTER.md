---
layout: default
title: "Syntax - function FISCALQUARTER"
parent: Syntax - functions
grand_parent: Workbench Logic Text Syntax
nav_order: 8
---
# Syntax - function FISCALQUARTER
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use FISCALQUARTER? 


FISCALQUARTER returns a month \(at a quarter start\) based on the Fiscal Parameters in the control record for the environment for a view. This means that different views running in the same batch can have different Fiscal dates because they come from different environments. By comparison, RUNDAY is the same for all views in a batch.

The VDP can override the fiscal values in the control record - see the next section below.

The FISCALQUARTER returns a date in CCYYMM format that is appropriate for the environment of that view.

The parameter for FISCALQUARTER is a number of quarters to add or delete from the default FISCALQUARTER. For example, FISCALQUARTER\(-5\) provides the month that is five quarters before the date the view is run.

FISCALQUARTER can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

# VDP for view can override fiscal values in a control record

A view specifies a control record, and so the values in the control record normally apply to that view.

The VDP for a view can override the fiscal values in a control record. In those cases the view ignores the fiscal values in the control record and uses the VDP fiscal values.

For more, see the \[FISCAL DATES\] section in the configuration file for MR91 in as given in topic [Runbook - MR91 Control File Generator](../../PE Programs/Runbook MR91 Control File Generator). 


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function FISCALQUARTER](../../images/LTSF_FISCALQUARTER_01.gif)

# Rules for the syntax 

FISCALQUARTER can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: FISCALQUARTER function in Extract Record Filter 


|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= FISCALQUARTER(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous fiscal quarter<br>or later,and skip all other records. Fiscal quarter means that if<br>the date of running this view is fiscal quarter one, then<br>only records from fiscal quarter one are selected.<br>The example at left assumes that field2 is a fiscal quarter number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field2} >= FISCALQUARTER(-1))**|

# Examples: FISCALQUARTER function in Extract Column Assignment 


|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = FISCALQUARTER()**|Set the current column to the current fiscal quarter number.|

  

  
  (Examples can be copied to the clipboard.)
  
