
## What is FISCALMONTH? 

FISCALMONTH returns a month based on the fiscal values in the control record defined for a view. This means that different views running in the same batch can have different fiscal dates. By comparison, RUNDAY is the same for all views in a batch.

You can override the fiscal date(s) with the extract job parameters FISCAL_DATE_DEFAULT and FISCAL_DATE_OVERRIDE. See [GVBMR95 parameters.](../../GVBMR95_Parameter_File_Syntax.html)

The FISCALMONTH returns a date in CCYYMM format, based on the fiscal settings for the current view.

## How do I use FISCALMONTH?

The parameter for FISCALMONTH is a number of months to add or subtract from the default FISCALMONTH. For example, FISCALMONTH\(-5\) provides the month that is five months before the date the view is run.

FISCALMONTH can only be used in **Extract Logic**.
