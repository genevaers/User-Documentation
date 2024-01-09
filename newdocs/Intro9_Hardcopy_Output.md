---
title: Introduction to GenevaERS Hardcopy Output
nav_order: 11
---

# Introduction to GenevaERS Hardcopy Output

This page provides you with an overview of GenevaERS hardcopy formatted output. It will help you to: 
- Create a hardcopy report in detail format 
- Create a hardcopy report in summary format 
- Properly set column widths to avoid truncating data 
- Create reports with display modes of “As Data” and “Categorized” 
- Use record aggregation and group aggregation functions

<div style="clear: right" >

# Hardcopy Overview

## Performance Engine Phases

<img style="float: right;" width="50%" vspace="5" alt="Performance Engine Phases" src=images/Module10-Hardcopy_Output/Module10_Slide3.jpeg title="Performance Engine Phases"/>

Recall that the GenevaERS Performance Engine consists of six phases. The Extract phase determines which source data records are selected for output. The Extract phase can produce final output files, but if the data requires sorting, summarizing, or special formatting, the Extract phase instead writes the output to temporary work files. These files are then read by the Format phase. Hardcopy reports are produced in the Format phase.

<div style="clear: right" >

## Hardcopy Report – Examples

<img style="float: right;" width="50%" vspace="5" alt="Hardcopy Report – Examples" src=images/Module10-Hardcopy_Output/Module10_Slide4.jpeg title="Hardcopy Report – Examples"/>

GenevaERS provides numerous options for formatting hardcopy or printed reports. The report images shown here illustrate the most commonly used report formats and are not intended to represent actual report content. Common report choices include:
- Summarized or detailed reports
- Sort data categorized or displayed in a column
- Subtotaling, and
- Others, including column width and headers

We’ll begin by setting up the basic canvas. 

<div style="clear: right" >

# View Properties

## General Tab

<img style="float: right;" width="50%" vspace="5" alt="View Properties – General Tab" src=images/Module10-Hardcopy_Output/Module10_Slide5.jpeg title="View Properties – General Tab"/>

Begin on the View Properties tab and select Hardcopy Report. Enter the number of lines to be printed per page, which is normally about 60. Then enter the report width. Note that the width depends upon the tools that will be used for display or printing; this is typically 80 to 255 characters. 

<div style="clear: right" >

## Extract Phase Tab

<img style="float: right;" width="50%" vspace="5" alt="View Properties – Extract Phase Tab" src=images/Module10-Hardcopy_Output/Module10_Slide6.jpeg title="View Properties – Extract Phase Tab"/>
Next, click the Extract Phase tab. Normally, record aggregation, or the summarizing of numeric values for a group of records, occurs in the Format phase of a GenevaERS job stream, but a certain amount of aggregation can be accomplished in the Extract phase. 

This feature can be selected in the Extract-Phase Record Aggregation section of the screen. However, if you want to produce a detailed listing of all extracted records, select Do not aggregate records. If you do not select this option for a detailed report, the report might contain an inconsistent mix of aggregated and detail records.

Because hardcopy reports require the use of the Format phase, you must assign the extract output to an Extract Work file. This example uses file number 1. Format phase job number 1 will read file number 1. 

<div style="clear: right" >

## Format Phase Tab

<img style="float: right;" width="50%" vspace="5" alt="Format Phase Tab" src=images/Module10-Hardcopy_Output/Module10_Slide7.jpeg title="Format Phase Tab"/>

Next, perform the following steps:
- Click the Format Phase tab. 
- To create a detailed report of all records extracted, select Do not aggregate records. 
- Select Write all eligible records. 
- Enter the error fill and truncation fill values. The error fill value is displayed in numeric columns if the data source is nonnumeric. The truncation fill value is displayed if a numeric value does not fit in the space provided by the column width. 

<div style="clear: right" >

## Header/Footer Tab

<img style="float: right;" width="50%" vspace="5" alt="Header/Footer Tab" src=images/Module10-Hardcopy_Output/Module10_Slide8.jpeg title="Header/Footer Tab"/>

Click the Header/Footer tab to enter the report headings. Report headings can be entered as a combination of text constants and variable values. The variable values are represented as functions and are shown in the center frame of the screen. 

These functions are predefined keywords that can be used to define the headings. The most common keywords (Date, Time, Page Number, and View ID) are available as buttons, and many others are available in the drop-down list in the Functions area. 

<div style="clear: right" >

# View Editor

<img style="float: right;" width="50%" vspace="5" alt="View Editor" src=images/Module10-Hardcopy_Output/Module10_Slide9.jpeg title="View Editor"/>

Now the view properties are defined and it is time to build the view columns. 

Hardcopy views must have one or more alphanumeric columns containing items such as names, dates, or codes. At least one of these columns must be a sort field, sometimes referred to as a sort key. In addition, one or more numeric columns can be subtotaled. 

In this example, the view consists of three columns: the two sort key fields (Store_ID and Customer_ID) and Order_Total_Amount. 

The column headings that are printed on the report can be specified on this screen. A column heading value defaults to the heading value in the logical record. If there is no heading value in the logical record, the field name is used. You can overtype this value as needed. 

<div style="clear: right" >

## Sort Keys

<img style="float: right;" width="50%" vspace="5" alt="Sort Key #1" src=images/Module10-Hardcopy_Output/Module10_Slide10.jpeg title="Sort Key #1"/>

The simplest report contains a sort field displayed as simple data and includes no subtotals. To produce a report that is formatted to display information as data and to have no sort key footer, you open the Sort Key Properties tab and select As Data for the display mode and Suppress Print for the sort key footer option. If all sort keys have these same parameters, the report will look much like a spreadsheet with columns and rows of data.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Sort Key #2" src=images/Module10-Hardcopy_Output/Module10_Slide11.jpeg title="Sort Key #2"/>
The second column has the same sort key attributes. 

Note the other key attributes. For example, the spaces before column attribute places blank spaces between columns. This can be adjusted to accommodate more columns or improve the appearance of the report layout.

You must be careful when assigning the column length or width. The column width must be large enough to fit the numbers that will be placed within it. This will help prevent truncation.
The next page shows the output from this view.

<div style="clear: right" >

## Hardcopy Header

<img style="float: right;" width="50%" vspace="5" alt="Hardcopy Header" src=images/Module10-Hardcopy_Output/Module10_Slide12.jpeg title="Hardcopy Header"/>

This output header displays the three pieces defined on the View Properties Header/Footer tab: the view ID, the label “Hardcopy Report Example,” and the processing date. The output also displays three columns. Although the column widths were large enough to store the data in the input file, they are not wide enough to display the data properly in the report columns. 

Also, the column headings defaulted to the field names but were truncated because they are longer than the defined column widths. Finally, additional spaces are needed for masking characters, so the overflow characters from the View Properties panel were inserted in place of the numeric values. 

<div style="clear: right" >

## Spacing and Column Sizes

<img style="float: right;" width="50%" vspace="5" alt="Spacing and Column Sizes" src=images/Module10-Hardcopy_Output/Module10_Slide13.jpeg title="Spacing and Column Sizes"/>

To format the report output so that it is easier to read and understand, we can adjust the column length from 6 to 12 for column 3 and use more than one row to accommodate more descriptive column headers. For example, instead of a column heading of “STORE_ID,” we now have a row for “STORE” and a row for “ID.” Both values fit within the column length of 5.

Note also that we have increased the spaces before columns from 2 to 5, simply to improve the look of the report.

<div style="clear: right" >

## Detailed Report

<img style="float: right;" width="50%" vspace="5" alt="Detailed Report" src=images/Module10-Hardcopy_Output/Module10_Slide14.jpeg title="Detailed Report"/>

Note that the column headings are now understandable. Also, the order total amounts are now visible and are properly formatted. 

Because this is a detail report, the rows of data on this report show one extracted record from the Extract phase. There are no subtotals.

<div style="clear: right" >

## Categorize

<img style="float: right;" width="50%" vspace="5" alt="Sort Key 1 – Categorize" src=images/Module10-Hardcopy_Output/Module10_Slide15.jpeg title="Sort Key 1 – Categorize"/>

As an alternative to displaying sort key values “as data” (that is, in columnar format), you can display sort key values on the left side of the page, with indentation, and group records with the same sort key values together. This is known as the “categorized” format. 

The Sort Key Properties list for the second column specifies data that is categorized with a CUSTOMER sort key label.

Our report will still not include any subtotals because both sort keys still suppress the Sort Key Footer, or Subtotal, option.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Hardcopy Report – Categorized" src=images/Module10-Hardcopy_Output/Module10_Slide16.jpeg title="Hardcopy Report – Categorized"/>

The modified view now produces the report shown here. In this report, sort keys are shown on the left side of the report and are only shown only when their value changes. Because this report shows all detailed records, the headings are printed once, followed by values.

Because subtotals are still suppressed, a summarized amount accumulating the orders for Customers 1, 2, and 3 for Store 1 is not shown yet.

<div style="clear: right" >

## Subtotaling

<img style="float: right;" width="50%" vspace="5" alt="Subtotaling" src=images/Module10-Hardcopy_Output/Module10_Slide17.jpeg title="Subtotaling"/>

If we select Print instead of Suppress for the sort key footer option on both sort keys, the report will also contain subtotals at each sort break. The subtotals will be prefaced with the value in the Sort Key Footer Label field; in this example, the sort key footer label is “Subtotal.”

The value to be placed in this subtotal field is determined by the group aggregation function, which in this example is Sum. The subtotal will contain a simple sum of the more detailed values.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Subtotal Example" src=images/Module10-Hardcopy_Output/Module10_Slide18.jpeg title="Subtotal Example"/>

The output now shows subtotaled rows after each sort key break. In this example, the subtotal for Customer 1 at Store 1 is 10,249.01, which is the accumulated value of the three individual orders of 58.25, 10,065.43, and 125.33.

The subtotals for Store 1 also include the order totals for Customers 2 and 3, plus a store total at the bottom of this section of the report. 

<div style="clear: right" >

## Aggregate Records

<img style="float: right;" width="50%" vspace="5" alt="Aggregate Records" src=images/Module10-Hardcopy_Output/Module10_Slide19.jpeg title="Aggregate Records"/>

On the View Properties Format Phase tab, if you modify the aggregation parameter to aggregate similar records, your report will show only one row for each subtotaled value.

<div style="clear: right" >

## Subtotaling

<img style="float: right;" width="50%" vspace="5" alt="Subtotaling" src=images/Module10-Hardcopy_Output/Module10_Slide20.jpeg title="Subtotaling"/>

No changes to the sort keys are required. However, note that the footer options become unavailable on the lowest sort key. By definition, aggregated views do not print the individual records that are extracted in the Extract phase. 

In aggregated views, the lowest level of detail is the record aggregated to the lowest sort key. In this instance, subtotaling would be meaningless because there would be only one record with those values in the entire report.

<div style="clear: right" >

## Specify Column Aggregation Function

<img style="float: right;" width="50%" vspace="5" alt="Specify Column Aggregation Function" src=images/Module10-Hardcopy_Output/Module10_Slide21.jpeg title="Specify Column Aggregation Function"/>

The column aggregation functions specify what should occur within the column at aggregation time. 

The record aggregation function specifies what should happen on the lowest print level (the record aggregated across all sort keys). In this example, that is the record aggregated to Store and Customer. 

The group aggregation function specifies the action at all higher-level sort breaks. In this example, it applies to sort breaks on the store ID.

In this example, at the lowest level (the record level) and on subsequent subtotals (at the group level), the order total amounts will be summed.

<div style="clear: right" >

## Summary Report Example

<img style="float: right;" width="50%" vspace="5" alt="Summary Report Example" src=images/Module10-Hardcopy_Output/Module10_Slide22.jpeg title="Summary Report Example"/>

Our new report will aggregate all records to the Store and Customer level as the lowest level of detail. These records are very similar to the subtotals printed on the detail report at the end of each customer section (the record aggregation function) and then at the sort break for stores (the group aggregation function). 

<div style="clear: right" >

## As Data Option

<img style="float: right;" width="50%" vspace="5" alt="As Data Option" src=images/Module10-Hardcopy_Output/Module10_Slide23.jpeg title="As Data Option"/>

It is possible to mix sort keys as categorized and as data, depending upon the report needs. In this example, we have changed the lowest sort key, Customer, from “Categorize” to “As Data.”

<div style="clear: right" >

## Categorized and As Data

<img style="float: right;" width="50%" vspace="5" alt="Categorized and As Data" src=images/Module10-Hardcopy_Output/Module10_Slide24.jpeg title="Categorized and As Data"/>

The report now shows the store on the left side of the screen, but the second sort key, Customer, is shown as columnar data. Note that the aggregated values are the same as on the previous report.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Both Sort Keys as Data (1 of 2)" src=images/Module10-Hardcopy_Output/Module10_Slide25.jpeg title="Both Sort Keys as Data (1 of 2)"/>

If we change the first sort key to display as data but leave the sort key footer option as “Print,” we will see subtotals for the store, but the data will be displayed in columnar format.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Both Sort Keys as Data (2 of 2)" src=images/Module10-Hardcopy_Output/Module10_Slide26.jpeg title="Both Sort Keys as Data (2 of 2)"/>

After the changes to the view, the sort keys are both shown as data. Subtotals are also shown on the report, unlike the first example report in this module, where no subtotals were shown. Note that the store ID is repeated on the subtotal line but the customer ID is not, indicating that this is a subtotal. 

<div style="clear: right" >

## Sort Keys Page Break Option

<img style="float: right;" width="50%" vspace="5" alt="Sort Keys Page Break Option" src=images/Module10-Hardcopy_Output/Module10_Slide27.jpeg title="Sort Keys Page Break Option"/>

We can also change the sort keys so that new page headings are printed on a page break. 

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Page Break Example" src=images/Module10-Hardcopy_Output/Module10_Slide28.jpeg title="Page Break Example"/>

The change to the view creates a report in which each page contains the value for one and only one store. The first character on the report heading line (which is not shown on this graphic) contains a character that causes the printer to advance to the next page.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Page Break Field Value" src=images/Module10-Hardcopy_Output/Module10_Slide29.jpeg title="Page Break Field Value"/>

You can use the list in the middle of the View Properties Header/Footer tab to promote a sort field into the header or footer. Once this is done, the sort field becomes a page break field, and any change in value begins a new page that contains the sort value in the header.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Page Break Header Example" src=images/Module10-Hardcopy_Output/Module10_Slide30.jpeg title="Page Break Header Example"/>

The results show that, in addition to each page of the report containing the value for one and only one store, the value is now shown in the heading of the report. Note that the store ID is no longer listed at the top of each store break. 

<div style="clear: right" >

## Max and Min Aggregation Functions

<img style="float: right;" width="50%" vspace="5" alt="Max and Min Aggregation Functions" src=images/Module10-Hardcopy_Output/Module10_Slide31.jpeg title="Max and Min Aggregation Functions"/>

When you are creating subtotals, the Format phase provides more options than simply summing column values. You can specify that, when a sort key value changes or “breaks,” one of two things happens:

The column calculation specified in logic text for the column is repeated, or

The more detailed records at the next lowest sort break level are examined and one of the following values is printed: 

1. The value from the first record in the group 
2. The value from the last record in the group
3. The maximum value in the group, or
4. The minimum value in the group

In this example, one column will print the maximum value for the sort break and the other will print the minimum. When these functions are specified for record aggregation functions, they are repeated as the group-level aggregation function.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Max and Min Aggregation Functions" src=images/Module10-Hardcopy_Output/Module10_Slide32.jpeg title="Max and Min Aggregation Functions"/>

The output from this view shows that, for Customer 1, the highest order was $10,065.43 and the lowest order was $58.25. For Store 1, Customer 1’s order of $10,065.43 was the highest order amount, but Customer 2’s order of $33.12 was the lowest order amount. 

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Group Max and Min Aggregation Functions" src=images/Module10-Hardcopy_Output/Module10_Slide33.jpeg title="Group Max and Min Aggregation Functions"/>

Group-level functions may be different from record aggregation only when record aggregation is specified as Sum. When they are different, the detailed values for the lowest sort break will be aggregated. The group-level functions will be performed on each subtotal. 

In this example, we will see the accumulated orders for each customer, and the subtotals will be either the maximum accumulated customer orders or the minimum.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Group Max and Min Report Examples" src=images/Module10-Hardcopy_Output/Module10_Slide34.jpeg title="Group Max and Min Report Examples"/>

The results show the accumulation of all orders for Customer 1, rather than the highest or lowest individual order. At the store level, the group function is performed, which shows the highest or lowest accumulated orders for all customers at that store. For example, the accumulated order for Customer 1 is the highest for Store 1, and the accumulated orders for Customer 3 are the lowest.

<div style="clear: right" >

## Group First and Last Aggregation Functions

<img style="float: right;" width="50%" vspace="5" alt="Group First and Last Aggregation Functions" src=images/Module10-Hardcopy_Output/Module10_Slide35.jpeg title="Group First and Last Aggregation Functions"/>

In this example, we’ve selected First and Last as the “group by” functions. First will show the first record for a sort key break after the extract file has been sorted. Last will show the last record.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Group First and Last Aggregation Functions" src=images/Module10-Hardcopy_Output/Module10_Slide36.jpeg title="Group First and Last Aggregation Functions"/>

The first accumulated orders within Store 1 are for Customer 1; the last is for Customer 3. Using the “first” and “last” functions requires considering the interaction with the sort fields, particularly when using “first” or “last” record aggregation functions on summary views. 

If the sort order of the extract file is not predictable because of duplicate values in all the view sort fields, the results of the “first” or “last” functions may seem random. Sorting a view by a time stamp, even if the time stamp is hidden from the final printout, can make the results predictable.

<div style="clear: right" >

## Sort Titles

<img style="float: right;" width="50%" vspace="5" alt="Sort Titles" src=images/Module10-Hardcopy_Output/Module10_Slide37.jpeg title="Sort Titles"/>

The last feature is called Sort Titles. Sort Titles allows for descriptions to be placed next to sort keys by doing a lookup in a reference file. These are useful when sorting by codes, such as customer or store IDs. They are specified on the bottom panel when you view a sort key property. Select the sort key and then, on the Sort Key Title tab, select the title to be used to describe the sort field. To do this, first select the logical record from the View Source list and then select the field from the Title Field list. Be sure to adjust the length of the title field to be shown on the report. 
In this example, we have selected the customer email name to describe the customer ID.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Sort Titles Example" src=images/Module10-Hardcopy_Output/Module10_Slide38.jpeg title="Sort Titles Example"/>

The report now shows the customer email name next to the customer ID, which is used to sort the view. It is important to remember that sort titles do not affect the sort order of the view. 

Note: If no sort title is found, the value “NO TITLE FOUND” is printed instead. 

Sort titles are the only type of lookup performed in the Format phase. The data used for the lookup is prepared by the Reference phase in the same way that lookup data is used in the Extract phase.

<div style="clear: right" > 

#