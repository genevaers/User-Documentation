
# What is RUNMONTH?

The RUNMONTH function is dependent on the **run date**, or execution date of the GenevaERS extract job. The default run date is the date when the extract job is run. You can override the run date with the extract job parameter RUN_DATE, to make the job appear to run on a different date.

See [GVBMR95 parameters.](../../GVBMR95_Parameter_File_Syntax.html)

All views in the extract job batch use the same run date.

RUNMONTH returns a CCYYMM format date based on the run date, plus or minus the number of months specified in the parameter.
 
# How do I use RUNMONTH? 

The parameter for RUNMONTH is a number of months to add or subtract from the default RUNMONTH. For example, RUNMONTH\(-5\) provides the date five months before the date the view is run.

RUNMONTH can only be used in **Extract-Phase Logic**.
