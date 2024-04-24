
## What is RUNDAY?

The RUNDAY function is dependent on the **run date**, or execution date of the GenevaERS extract job. The default run date is the date when the extract job is run. You can override the run date with the extract job parameter RUN_DATE, to make the job appear to run on a different date.

See [GVBMR95 parameters.](../../GVBMR95_Parameter_File_Syntax.html)

All views in the extract job batch use the same run date.

RUNDAY returns a CCYYMMDD format date based on the run date, plus or minus the number of days specified in the parameter.

This date can be used for setting column values, for comparisons, and evaluating lookup "effective dates". 

## How do I use RUNDAY? 

The parameter for RUNDAY is a number of days to add or subtract from the default RUNDAY. For example, RUNDAY\(-5\) provides the date five days before the date the view is run.

RUNDAY can only be used in **Extract logic**.
