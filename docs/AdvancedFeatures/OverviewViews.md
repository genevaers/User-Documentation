{: .no_toc}
# View Overview

TABLE OF CONTENTS 
1. TOC
{:toc}  

## What is a view?

A GenevaERS view definition is analogous to a program or a query. Views are the basic units of work that are performed by the Performance Engine. A view describes input files, processing specifications and output files. Logical records definitions describe the inputs to the Performance Engine. The view definitions define the outputs, using columns to specify the fields. These are prepared in the GenevaERS Workbench.

Views are often grouped together into view folders for ease of maintenance. View folders can be named for a particular developer or function. Security can be applied to view folders to prevent unauthorized access. Groups of views can be executed at one time. This is sometimes referred to as a pass. See [Create View Folders](./MetaData/CreateViewFolder.md) and [Manage Views](./MetaData/ManageViews.md) for more details.

Views define the following:

-   The **input files** called view source files.
-   The **output type** which can be detailed data, sorted and summarized data, delimited data (for example a CSV file), a report, or input to another view.
-   The **output format** defined using columns. Each column is one of the following:
    -   a source file field,
    -   a constant,
    -   a formula which is implemented in **logic text**,
    -   a lookup field which uses a **lookup path**.
    -   If the view is to be summarized and sorted, then at least one column must be part of the **sort key.**
-   The **output file(s)** 

## Types of view

Views are classified by the output required, which determines the jobs, or phases, to be executed.

- Extract-Phase only views  
  Only the extract job will be run. The source records can be filtered, output layout can be defined using columns, lookups can be used, column logic can be applied, output can be written to one or many files. The output record format is fixed-width fields, or can simply be set to match the source record layout.
- Summary views  
  After the extract job, the format job will be run to sort and summarize the output from the extract job. Calculations and logic can be applied to summarized columns. The output can be fixed-width fields, delimited fields, or in a report format with headers and footers.  
  
See [Create Views](./MetaData/CreateView.md) for more information.  

## Creating views in the workbench

Here is a quick summary of the tasks that need to be completed to define a view. See [Create Views](./MetaData/CreateView.md) for a detailed description.

1) Select the kind of view you want; detailed, sorted and summarized, delimited output, a report. [Create a view](./MetaData/CreateView.md) with the required options.  
2) Define the inputs - see [Input and Output](./OverviewInputOutput.md) and [Create LR, LF, PF metatdata](./MetaData/CreateLRLFPFs.md).  
3) Define the output record format by defining columns - see [Column Assignment](./ColumnLogic.md) and [Data Types](./MetaData/DataTypes.md).  
4) If lookups are required, define the Lookup paths [Overview of lookup paths](./OverviewLookupPaths.md) and [Create Lookup Paths](./MetaData/CreateLookupPath.md).  
5) Define any input filters required - see [Overview of Record Filters](./OverviewRecordFilters.md) and [Create Record Filters](./MetaData/CreateRecordFilters.md).  
6) Define any overrides to the default output destination, or final output record processing - see [Extract-Phase Record Logic](../Reference/Workbench/LogicTextERLStatements.md).  
    
Note:  All the following will require an extract and format phase to be run at execution time.

### If the output is to be sorted:  

1) Define the sort key. This could be composed of multiple columns.  
2) Specify any Format-Phase Record filters required.  
3) Specify an override to the default output file for the format-phase, if required.  
4) Define any Format-Phase Column Logic.   
   
### If summarization is required:  

1)  The output must be sorted, so complete [If the output is to be sorted](#if-the-output-is-to-be-sorted) tasks.  
2)  Switch on Record Aggregation (FRA).  
3)  Define the Record Aggregation functions.  

### If delimited output is required:

1)  The output must be sorted, so complete [If the output is to be sorted](#if-the-output-is-to-be-sorted) tasks.  
2)  If summarization is required, complete [If summarization is required](#if-summarization-is-required) tasks.   
3)  Specify if header row is required.  
4)  Specify delimiter characters.

### If a report is required:

1)  The output must be sorted, so complete [If the output is to be sorted](#if-the-output-is-to-be-sorted) tasks.  
2)  If summarization is required, complete [If summarization is required](#if-summarization-is-required) tasks.   
3)  Define Group Aggregation functions if required.  
4)  Specify Report headers and footers.  
5)  Specify any Sort Key Titles.  

Other options include creating and specifying user defined exits.  See [User Exits.](./OverviewUserExits.md)

## Activating a view

During creation of a view, or immediately after modification of any part of a view, the view becomes "Inactive".  The view must be activated before the view can be run in the Performance Engine. Activation means all parts of the view are validated. The validation displays any error messages that prevent the view becoming "Active".
