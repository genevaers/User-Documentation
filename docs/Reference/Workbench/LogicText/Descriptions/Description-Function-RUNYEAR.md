
# What is RUNYEAR?

The RUNYEAR function is dependent on the **run date**, or execution date of the GenevaERS extract job. The default run date is the date when the extract job is run. You can override the run date with the extract job parameter RUN_DATE, to make the job appear to run on a different date.

See [GVBMR95 parameters.](../../GVBMR95_Parameter_File_Syntax.html)

All views in the extract job batch use the same run date.

RUNYEAR returns a CCYY format date based on the run date, plus or minus the number of years specified in the parameter. 

# How do I use RUNYEAR? 

The parameter for RUNYEAR is a number of years to add or subtract from the default RUNYEAR. For example, RUNYEAR\(-5\) provides a date five years before the date the view is run.

RUNYEAR can only be used in **Extract Logic**.
