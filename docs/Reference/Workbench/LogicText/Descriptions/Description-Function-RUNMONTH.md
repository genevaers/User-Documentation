
# What is RUNMONTH?

Normally, the date PE runs is the "run date".

The run date can be set to a fixed value in the VDP. See the next section for details of possible values.

RUNMONTH returns a CCYYMM format date based on the run date. All views in a batch use the same base date for RUNMONTH.

# Possible values of the VDP run date

The date that PE runs is the VDP run date unless there is a specific value set in the VDP.  To set a specific value in the VDP see the RUNDATE parameter for the configuration file to MR91 as given in topic [Runbook - MR91 Control File Generator](../../PE Programs/Runbook - MR91 Control File Generator). 

# How do I use RUNMONTH? 

The parameter for RUNMONTH is a number of months to add or delete from the default RUNMONTH. For example, RUNMONTH\(-5\) provides the day five months before the date the view is run.

RUNMONTH can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.

