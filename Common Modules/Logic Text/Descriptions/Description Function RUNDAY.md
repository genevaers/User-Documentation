
Normally, the date PE runs is the "run date".

The run date can be set to a fixed value in the VDP. See the next section for details of possible values.

RUNDAY returns a CCYYMMDD format date based on the run date. All views in the batch use the same base date for RUNDAY.

# Possible values of the VDP run date

The date that PE runs is the VDP run date unless there is a specific value set in the VDP.  To set a specific value in the VDP see the RUNDATE parameter for the configuration file to MR91 as given in topic [Runbook - MR91 Control File Generator](../../PE Programs/Runbook - MR91 Control File Generator). 

# How do I use RUNDAY? 

The parameter for RUNDAY is a number of days to add or delete from the default RUNDAY. For example, RUNDAY\(-5\) provides the day five days before the date the view is run.

RUNDAY can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

