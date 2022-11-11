
# What is RUNYEAR?

Normally, the date PE runs is the "run date".

The run date can be set to a fixed value in the VDP. See the next section for details of possible values.

RUNYEAR returns a CCYY format date based on the run date. All views in a batch use the same base date for RUNYEAR.

# Possible values of the VDP run date

The date that PE runs is the VDP run date unless there is a specific value set in the VDP.  To set a specific value in the VDP see the RUNDATE parameter for the configuration file to MR91 as given in topic [Runbook - MR91 Control File Generator](../../PE Programs/Runbook - MR91 Control File Generator). 

# How do I use RUNYEAR? 

The parameter for RUNYEAR is a number of years to add or delete from the default RUNYEAR. For example, RUNYEAR\(-5\) provides a date five years before the date the view is run.

RUNYEAR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

