
## What is FISCALYEAR? 

FISCALYEAR returns a year based on the fiscal values in the control record defined for the view. This means that different views running in the same batch can have different fiscal dates. By comparison, RUNDAY is the same for all views in a batch.

You can override the fiscal date(s) with the extract job parameters FISCAL_DATE_DEFAULT and FISCAL_DATE_OVERRIDE. See [GVBMR95 parameters.](../../GVBMR95_Parameter_File_Syntax.html)

The FISCALYEAR returns a date in CCYY format based on the fiscal settings for the current view.

## How do I use FISCALYEAR? 

The parameter for FISCALYEAR is a number of years to add or delete from the default FISCALYEAR. For example, FISCALYEAR\(-5\) provides the year that is five years before the date the view is run.

FISCALYEAR can only be used in **Extract Logic**.
