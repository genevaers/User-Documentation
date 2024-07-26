{: .no_toc}
# Create Views

TABLE OF CONTENTS 
1. TOC
{:toc}  

A view is a GenevaERS metadata component that defines a data transformation. See [Overview of views](../OverviewViews.md) and [overview of summary views](../OverviewFormatViews.md) for a detailed description.

## Extract-only Views

All views described in this section only require an extract phase to be defined and executed.

Create an [Extract-only view with data transformation](./CreateExtractView.md).

Create a [Copy view](./CreateCopyView.md).

## Summary Views

All views described in this section are **summary views** that require an extract phase and a format phase to be defined and executed.

Create a view with sorted and [Fixed-Width Field output, no aggregation.](./CreateSummaryViewNoAggr.md)

Create a view with sorted and [Fixed-Width Field output and aggregated numeric fields.](./CreateSummaryViewAggr.md)

Create a view with sorted and [Delimited Field output.](./CreateSummaryViewDelimited.md)  
 
GenevaERS provides numerous options for formatting output in a report.  

Create a sorted and formatted view - [Detailed Report](./CreateSummaryViewReportDet.md).  

Create a sorted and formatted view with aggregation - [Aggregated Report](./CreateSummaryViewReportAggr.md).  

## Organizing Views

In the workbench views can be grouped together in **View Folders**. To list existing views:  

- Click **View Folders** > **ALL_VIEWS** or,
- Click **View Folders** > *folder-name* in the Navigator pane.

The views are shown in the metadata list at the bottom of the workbench screen.  

For details of how to create view folders, and add views to view folders go to [View Folders](./xxx.md)
