{: .no_toc}
# Create Views

TABLE OF CONTENTS 
1. TOC
{:toc}  

A view is a GenevaERS metadata component that defines a data transformation. See [Overview of views](../OverviewViews.md) for a detailed description.

## Extract-only Views

All views described in this section only require an extract phase to be defined and executed.

Create an [Extract-only view with fixed-width fields](./CreateExtractView.md).

Create an [Extract-only view with source-record layout](./CreateCopyView.md). This is also known as a copy view.

## Summary Views

All views described in this section are summary views that require an extract phase and a format phase to be defined and executed.

Create a view with sorted and [Fixed-Width Field output, no aggregation.](./CreateSummaryViewNoAggr.md)

Create a view with sorted and [Fixed-Width Field output and aggregated numeric fields.](./CreateSummaryViewAggr.md)

Create a view with sorted and [Delimited Field output.](./CreateSummaryViewDelimited.md)  

## Reports
 
GenevaERS provides numerous options for formatting output in a report. Views with report output can write all records, or can specify aggregation and collapse the output data based on sort keys. Both detailed reports and aggregated reports can contain subtotals. Reports require an extract phase and a format phase to be defined and executed.

Create a sorted and formatted view - [Detailed Report](./CreateSummaryViewReportDet.md).  

Create a sorted and formatted view with aggregation - [Aggregated Report](./CreateSummaryViewReportAggr.md).  
