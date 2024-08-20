
## What is FISCALDAY? 

FISCALDAY returns a day based on the fiscal values in the control record defined for the view. This means that different views in the same batch run can have different fiscal dates. By comparison, RUNDAY is the same for all views in a batch.

You can override the fiscal date(s) with the extract job parameters FISCAL_DATE_DEFAULT and FISCAL_DATE_OVERRIDE. See [GVBMR95 parameters.](../../GVBMR95_Parameter_File_Syntax.html)

FISCALDAY returns a date in CCYYMMDD format, based on the fiscal settings for the current view.

## How do I use FISCALDAY?

The parameter for FISCALDAY is a number of days to add or subtract from the default FISCALDAY. For example, FISCALDAY\(-5\) provides the day that is five days before the date the view is run.

FISCALDAY can only be used in **Extract-Phase Logic**.
