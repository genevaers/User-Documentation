{: .no_toc}
# Date Processing Functions

TABLE OF CONTENTS 
1. TOC
{:toc}  

## Date Processing Functions

GenevaERS logic text allows for dates and date functions. For example the RUNDAY keyword creates a constant of the execution date. Thus the logic text

    Selectif(ORDER_DATE < RUNDAY())

that is run on January 3, 2020 will compare ORDER_DATE to the constant “20200103”

Many of the keywords allow math. For example, if the RUNDAY contains a +3 inside the parenthesis, and were run on the same date the constant would be “20200106” rather than “20200103”

These functions create very efficient processes as constant manipulation is not required during run time. Only the comparison is required.

## Run Date processing

The Run Date defaults to the execution date of the extract job, unless an override has been specified in the JCL of the Performance Engine.
The following functions use the Run Date in one form or another, and can be specified in logic text.

See [RUNDAY reference](../Reference/Workbench/LogicText/Function-RUNDAY.md).

See [RUNMONTH reference](../Reference/Workbench/LogicText/Function-RUNMONTH.md).

See [RUNYEAR reference](../Reference/Workbench/LogicText/Function-RUNYEAR.md).

For the JCL parameter, see [GVBMR95 parameters](../Reference/GVBMR95_Parameter_File_Syntax.md).  


## Fiscal Date processing

The Fiscal Date is another parameter which allows multiple views running at the same time to use the same date, or a variation on that date.

The Fiscal Date keywords enable “moving” or “sliding” selection criteria using date criteria. Using the Fiscal Date and Control Record, the resolved constant in the logic text changes without requiring any changes to the view.

For example, to select data from the current fiscal month use the logic text  

    SELECTIF(ORDER_DATE = FISCALMONTH(+0))
    
When this is executed with a Fiscal Date parameter of June, it results in a constant selecting June records. Without updating the view but changing the Fiscal Date parameter to October results in selection of October records.

If the Fiscal Date constant is updated each month, this effectively creates “moving” criteria for the current month. This gives more control over the records reports are run against, than using Run Date.

Also note that the Fiscal Date parameter is useful when processing on a subsequent day, perhaps passed midnight after all business is closed for the prior day. The Fiscal Date can be set to the prior day or month, recognizing that the data is from the last day of the month, while the Batch Date reflects when the process was actually run. 

See [FISCALDAY reference](../Reference/Workbench/LogicText/Function-FISCALDAY.md).

See [FISCALMONTH reference](../Reference/Workbench/LogicText/Function-FISCALMONTH.md).

See [FISCALYEAR reference](../Reference/Workbench/LogicText/Function-FISCALYEAR.md).

The default Fiscal Date is the run date, unless a Fiscal Date default has been specified in the JCL. Fiscal Date overrides can be set for each view using a control record and parameters for the overrides in the JCL for the Performance Engine. 

See [GVBMR95 parameters](../Reference/GVBMR95_Parameter_File_Syntax.md).  

## Control Records

The fiscal logic text functions return dates based on the fiscal values indicated by the control record specified for a view. Each view specifies which control record should be used for its fiscal date processing, then the control record can be referenced in the Performance Engine JCL at run time.

This means that different views in the same batch run can have different fiscal dates because they are associated with different control records. This is useful for processing views for multiple companies that have differing fiscal year ends. By comparison, RUNDAY is the same for all views in a batch.

See [creating control records](../AdvancedFeatures/MetaData/CreateControlRecord.md).
