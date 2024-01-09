---
title: Introduction to Multiple Step Lookups
nav_order: 15
---

# Introduction to Multiple Step Lookup

This page provides you with an overview of GenevaERS Multi-step Lookups.  It will help you to: 
- Describe a multi-step lookup
- Read a Logic Table and Trace with multi-step lookups 
- Explain the Function Codes used in the example
- Identify lookup and other patterns in a larger logic table
- Debug a multi-step lookup not-found condition  

This page covers the following Logic Table Function Codes:
- CFEL, Compares fields, Event File Field to Looked-up Field
- CFLC, Compares fields, Looked-up field to Constant
- LKLR, like the Join function, identifies join targets for multi-step joins
- LKL, builds a look up key using data from a looked-up record
Other related function codes without examples include:
- CFEE, Compares fields, Event File Field to Event File Field
- CFLL, Compares fields, Looked-up field to Looked-up field
- CNL, a Class Test Numeric on a looked up value, similar to a CNE

[Other Logic Table Functions Codes can be located here.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" >

# Lookup Review

<img style="float: right;" width="50%" vspace="5" alt="Lookup Review" src=images/Module14-Multi_Step_Lookups/Module14_Slide4.jpeg title="Lookup Review"/>

In this page, we will extend the example used in [Introduction to Single Step Lookups](Intro13_Single_Step_Lookups.md), where we joined from the Order file to the Customer file to find Customer related data, including the Customer Gender Code, either M or F.  In this page, we’ll use the Gender Code to look up to the Gender Description table to find a description of the M or F, either Male or Female.

GenevaERS Lookup Definitions specify the full “path” or route from the source data to the final target data.  In the last page we used the “Customer from Order” Lookup Path.  In this page we’ll use the “Gender Description from Order” Look up Path to go through the Customer table to find the Gender Description.

<div style="clear: right" >

## Lookup Definition and Field Formats

<img style="float: right;" width="50%" vspace="5" alt="Lookup Definition and Field Formats" src=images/Module14-Multi_Step_Lookups/Module14_Slide5.jpeg title="Lookup Definition and Field Formats"/>

Creating a multi-step look up requires using the “Steps” portion of the workbench.  Each step allows definition of a new target table.  All fields from prior steps can be used as sources for key values with which to search these tables.  

Care should be taken when building paths with respect to required data format conversions.  All GenevaERS joins use binary searches, meaning it matches byte for byte the key to a potential target record.  Joins on numeric keys can fail if the source field formats do not match the target formats.  GenevaERS will perform the necessary data conversations in the logic table when building keys to convert field formats if they are specified properly in the Look-up Path definition.  

<div style="clear: right" >

## Example View

<img style="float: right;" width="50%" vspace="5" alt="Example View" src=images/Module14-Multi_Step_Lookups/Module14_Slide6.jpeg title="Example View"/>

Our example lookup View reads the Order logical record as the source event file.  It has three columns, containing the:
- Order ID from the source event file
- Customer ID from the Customer Logical Record
- The Customer Gender Description from the Gender Description Logical Record

The Customer Logical file requires the Customer ID from the source event file, a single step lookup.  The Gender Description requires the Gender Code from the Customer logical record, thus creating a multi-step look up.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Example View Logic" src=images/Module14-Multi_Step_Lookups/Module14_Slide7.jpeg title="Example View Logic"/>

The view also contains logic, both Extract Record Filtering and column logic.

The Extract Record Filtering logic selects records for customers with a Gender type of “M” and orders where the Order Date is later than the new customer date, or orders which have no associated customer record.  Like column 2, this logic only requires a single step lookup.

The column logic, for column 3, inserts the Customer Gender description either “MALE” or “FEMALE” if found, and the value “UNKNOWN” for those orders with no associated customer record.  This logic requires a multi-step lookup.
IBM Security AppScan Source V8.6 User Administration
© Copyright IBM Corp. 2013, licensed under Apache 2.0 to the GenevaERS project    

<div style="clear: right" >

## The Core Image File

<img style="float: right;" width="50%" vspace="5" alt="The Core Image File" src=images/Module14-Multi_Step_Lookups/Module14_Slide8.jpeg title="The Core Image File"/>

GVBMR90 recognizes the view requires two reference tables because it uses the “Gender Description from Order” Look up Path.  It then generates additional Extract Only views in the JLT, creating another Core Image file by reading and extracting data from the Gender Description file, including the Gender Code 1 byte key, and the 20 byte Gender Description.  

The REH file also will contain two header records with counts and sizes of reference data for the Customer Reference table, and the Gender Description table.  Both these Core Image files will be loaded into memory during the Extract phase processing. 

Note that the standard Performance Engine Process does not sort the Core Image files, but these files must be in key sequence before being loaded into memory or an error will occur.  Therefore these files should be sorted prior to beginning the Join Phase process.

<div style="clear: right" >

## The Complete Logic Table

<img style="float: right;" width="50%" vspace="5" alt="The Complete Logic Table" src=images/Module14-Multi_Step_Lookups/Module14_Slide9.jpeg title="The Complete Logic Table"/>

This is the complete logic table.    Note that this single view requires 38 logic table rows (40 rows less the HD and RENX rows which are shared by all views in this logic table). Logic tables for complex views can be hundreds of rows in length.  Determining which part of a view generated the logic table rows can be important.  

Rows 4 – 14 are generated from the extract record filter logic.   These rows have no sequence numbers.  Rows 15 – 38 have column sequence numbers assigned.  They contain column logic and build column values.

We’ll examine each of these portions individually.

<div style="clear: right" >

## General Selection

<img style="float: right;" width="50%" vspace="5" alt="General Selection" src=images/Module14-Multi_Step_Lookups/Module14_Slide10.jpeg title="General Selection"/>

When the same look up path is used multiple times within extract record filter or a column, the lookup path steps are duplicated multiple times in the logic table.  Join optimization may skip rows, but the logic table still contains them.  

In our example, the Extract Record Filter logic requires three lookups to the Customer LR.  Each is accomplished using the same Lookup Path.  Thus each has the same Join, LKE and LUSM functions and the target Customer LR ID is 7.
- Rows 4 – 6 tests for “M” type customer Gender Codes generates a lookup to the Customer LR. 
- Rows 8 – 10 tests dates generates.
- Rows 12 – 14 test for not found customers in the OR condition.

<div style="clear: right" >

## CF Functions

<img style="float: right;" width="50%" vspace="5" alt="CF Functions" src=images/Module14-Multi_Step_Lookups/Module14_Slide11.jpeg title="CF Functions"/>

Extract Filtering Lookups are often followed by CF functions to test for inclusion or exclusion of records.  In our example, lookup for both clauses 1 and 2 are followed by Compare Field functions.  

The test for an “M” requires a CFLC function, Compare Field Looked-up value to Constant.  The CFLC compares the looked up Customer Gender Code to the constant of “M”. If the test is true (the field equals “M”), the CFLC GOTO Row 1 continues to test on row 8 for the AND condition.  If the test is false, then it branches to 12 to begin the OR test for a Not Found condition.

Testing the dates requires a CFEL function, Compare Field Event file field to Looked-up field value.  The comparison type is a “003” meaning a greater than test.  If this test proves true the record should be selected; there is no need to test the OR Not Found condition.  Thus GOTO Row 1 jumps to the row 15 DTE function to begin building columns.  If the date tests proves false, then the OR condition is tested, beginning on row 12.

Although not shown in this example, a CFEE and CFLL functions are similar in format to the CFEL.  A CFEE compares two source Event File Fields, for equal, not equal, greater or less than, etc.  A CFLL compares two looked-up field values.

<div style="clear: right" >

## Not Found Keyword

<img style="float: right;" width="50%" vspace="5" alt="Not Found Keyword" src=images/Module14-Multi_Step_Lookups/Module14_Slide12.jpeg title="Not Found Keyword"/>

The NOT FOUND keyword of the filter logic clause 3 also determines if records are selected for processing or not.  However, it does not generate a Compare Field function.  Rather the Found and Not Found rows of the LUSM cause the selection.  In other words, the true and false rows typically placed on a CF function are placed right on the LUSM (and the Join in case Join Optimization occurs).

In this example, if the LUSM test on row 14 finds a corresponding customer record in the lookup, then the record will be skipped by jumping to logic table row 40, the ES function.  If a corresponding customer record is not found (GOTO Row 2), then the column build processing will begin on logic table row 15.

If instead of the NOT FOUND keyword, FOUND had been used, the GOTO Rows 1 and 2 on the LUSM function would have been switched.

<div style="clear: right" >

## AND and OR Logic

<img style="float: right;" width="50%" vspace="5" alt="AND and OR Logic" src=images/Module14-Multi_Step_Lookups/Module14_Slide13.jpeg title="AND and OR Logic"/>

Being able to identify GOTO Row patterns typical of AND and OR logic can help in debugging.  

In this example, the repeated GOTO Row 2 value of 12 pointing to a CF function is indicative of a OR condition.  

The nearly sequential nature of GOTO Row 1 for clauses 1 and 2 are indicative of an AND condition because both must be satisfied before logic can jump from logic table row 11 to 15 to build the columns.  

<div style="clear: right" >

## Columns

<img style="float: right;" width="50%" vspace="5" alt="Columns" src=images/Module14-Multi_Step_Lookups/Module14_Slide14.jpeg title="Columns"/>

Column logic can also be broken into segments by looking at the pattern of sequence numbers.  In this example, the three columns of our view require three different types of logic to be completed.  

- Column 1, the Order ID from the source event file, only requires a DTE function.
- Column 2, the Customer ID from the Customer Logical Record, requires a single step lookup, followed by a DTL and DTC functions.
- Column 3, the Customer Gender Description from the Gender Description Logical Record, requires a multiple step look up.  We’ll focus our attention here.

<div style="clear: right" >

## Column 3

<img style="float: right;" width="50%" vspace="5" alt="Column 3" src=images/Module14-Multi_Step_Lookups/Module14_Slide15.jpeg title="Column 3"/>

Even the logic for a single column can be broken down into its individual parts.  

In this example, Column 3 logic can be divided by the clauses of the logic text:  
The Found test to find a matching Gender Description record
Locating the actual Gender Description for use in the extract file
Or placing the value “UNKNOWN” in the column if the Gender Description is not found

Next let’s focus on part clause A logic

<div style="clear: right" >

## First Step of Multi Step Join

<img style="float: right;" width="50%" vspace="5" alt="First Step of Multi Step Join" src=images/Module14-Multi_Step_Lookups/Module14_Slide16.jpeg title="First Step of Multi Step Join"/>

Patterns of single step joins can often be found as pieces of multi-step joins.  In this example the single step join from column 2 is nearly identical to the first part of our multi-step join, which also joins the Order LR to the Customer LR.  They have nearly identical JOIN, LKE and LUSM functions.  When debugging joins, the correct Lookup path must be identified.

The one significant difference is that the GOTO ROW 1 and 2 are substantially larger on the multi-step join, 6 to 16 steps away as opposed to 3 to 5 steps.  This is because column 3’s multi-step Join covers the entire join, not just the first step.  During Join Optimization, if the join has been performed before, these GOTO ROW 1 and 2 values are used immediately.

<div style="clear: right" >

## LKLR and LKL Function Codes

<img style="float: right;" width="50%" vspace="5" alt="LKLR and LKL Function Codes" src=images/Module14-Multi_Step_Lookups/Module14_Slide17.jpeg title="LKLR and LKL Function Codes"/>

The second and subsequent steps of multi-step joins all begin with LKLR functions, Prepare a Lookup to an LR.  This, like the JOIN function code, identifies what core image file in memory to search.  In our example, the next step in the join goes form the LR ID of 7 to the Gender Description table, LR ID 63.

Often a multi-step join includes an LKL function, build a Lookup Key from a Looked Up value.  This moves a value from a looked up field to the search key for the core image file.  In this example, the value in Gender Code field ID 478 on the Customer table will be used to search the Gender Description table for a value, an “M” or an “F” depending upon the customer.

Our example target reference file only includes a single field for the key, the “M” or “F” values.  Multi key tables require multiple LKE and LKL functions, one right after the other in the logic table.  These build the keys for binary searches from left to right.

<div style="clear: right" >

## Multi-step join repeated

<img style="float: right;" width="50%" vspace="5" alt="Multi-step join repeated" src=images/Module14-Multi_Step_Lookups/Module14_Slide18.jpeg title="Multi-step join repeated"/>

Again repeated patterns are visible in the logic table, even within logic for one column.  Column 3 of our example performs the same look up twice.  
Test to see if a join is successful using the Found Keyword
If it is, then use the join to place the Gender Description in the column

Thus our multiple step join is repeated in the column logic.

<div style="clear: right" >

## Multi-step join repeated

<img style="float: right;" width="50%" vspace="5" alt="Final DTL and DTC Functions" src=images/Module14-Multi_Step_Lookups/Module14_Slide19.jpeg title="Final DTL and DTC Functions"/>

Some join steps will never be executed during a run because of join optimization.  There can be other functions which will never be executed as well.  

In this example, there is a default Not Found DTC, the companion to the DTL moving the Gender Description code.  Note that it does not have constant “UNKNOWN” assigned to it. This DTC will never be executed because the GOTO ROW2 on both LUSM rows 30 and 33 would never be triggered; rather jumps to row 38 would have already happened on the JOIN on row 22, or LUSM rows 24 or 27.

Having completed our analysis of the logic table, next we’ll execute this view with the Trace Parameter enabled.

<div style="clear: right" >

# Logic Table Trace

## Initial Steps and Column 1

<img style="float: right;" width="50%" vspace="5" alt="Trace" src=images/Module14-Multi_Step_Lookups/Module14_Slide20.jpeg title="Trace"/>

This trace example output does not show the record number of the Event DD Name, in order to show the Value 1 and Value 2 output.

Most of the records from the input file meet the selection criteria of being Male Customers and were recorded Customers before placing orders.  The trace for the CFLC, the Compare Field Lookup to Constant, shows the looked-up value as Value 1, and the Constant value as Value 2.  The CFLC function was an equal test, thus because the two are equal the record continues evaluation.

For the CFEL function, Compare Field Event Field to Lookup Field, Value 1 is the source Event field value, and Value 2 is the Looked-up field value.  In this case the Value 1 and Value 2 are different, but the comparison is a Greater Than comparison, so thus the records are selected for processing.

Having passed record filtering logic, the trace shows the DTE function for the first column

<div style="clear: right" >

## Column 2 Join Trace Multi-step Join

<img style="float: right;" width="50%" vspace="5" alt="Column 2" src=images/Module14-Multi_Step_Lookups/Module14_Slide21.jpeg title="Column 2"/>

The join required for Column 2 to obtain the Customer ID is the same join already performed to find the customer Gender Code for the record filter test.  Thus the LKE and LUSM functions are skipped by join optimization.  The Join function on row 16 immediately jumps to the DTL function on row 19 to populate column 2 with the Customer ID from the Customer file.

<div style="clear: right" >

## Column 3 Join Trace Multi-step Join

<img style="float: right;" width="50%" vspace="5" alt="Column 3" src=images/Module14-Multi_Step_Lookups/Module14_Slide22.jpeg title="Column 3"/>

The multi-step join is then executed, to test for found on Customer Gender Description by joining first the Customer table.  Having done so successfully, the join uses the Gender Code key for the LKL function to search the Gender Description table.  

Join optimization shortens the next lookup.  The same lookup path just used to test for a Found is used again to actually get the Gender Description starting on Logic Table row 28.  Thus through optimization the B clause logic of this column only requires row 28 Join function.

The DTL function then moves the Gender Description of “MALE” to extract record.

<div style="clear: right" >

## CFLC False on Trace

<img style="float: right;" width="50%" vspace="5" alt="CFLC False on Trace" src=images/Module14-Multi_Step_Lookups/Module14_Slide23.jpeg title="CFLC False on Trace"/>

Let’s move on to a new Event File record.  A number of customers are Female according to the Customer file.  On these records the trace shows the Extract Record Filtering CFLC Compare Field Lookup to Constant test failing; the “F” value does not match the constant of “M”.

LT row 12 is also executed to tests to see if the join is Not Found and thus should be included in the output, but of course the look up was successful, and so the record is skipped.  

<div style="clear: right" >

## Trace Input 1st Join Step Not Found

<img style="float: right;" width="50%" vspace="5" alt="Trace Input 1st Join Step Not Found" src=images/Module14-Multi_Step_Lookups/Module14_Slide24.jpeg title="Trace Input 1st Join Step Not Found"/>

For multi-step lookups, not found conditions can occur anywhere along the lookup.  First we’ll examine a failure in the first step, the same failure noted in the prior page.  The join from the Order file to the Customer File fails for column 3 because no customer “0000000000” is found.  Instead of proceeding to the LKLR function to get ready for the second join, execution jumps to row 38 DTC to place “UKNOWN” Gender Description in the output file.

<div style="clear: right" >

## Trace Input 2nd Join Step Not Found

<img style="float: right;" width="50%" vspace="5" alt="Trace Input 2nd Join Step Not Found" src=images/Module14-Multi_Step_Lookups/Module14_Slide25.jpeg title="Trace Input 2nd Join Step Not Found"/>

To simulate a second step failure, let’s modify the Customer Gender code for Customer 1, from “M” to “O”.  If we do this the first lookup, Logic Table Row 24, would complete successfully.  We would then execute the LKLR, LKL and the second LUSM to search the Gender table.  The LKL function would have used a Gender code of “O”, which will not be found on the Gender table, causing a branch by the second LUSM to the same DTC used on the first step failure we just examined, resulting in the same output value.

Thus the final value in the output file may not indicate which step of a join failed.  Only by tracing through the logic table can this be determined.  The trace might highlight incorrect input data, like a Gender code of “O” or a different data format for numeric keys.  It may also highlight an incorrect LR or Join definition, or improper logic in the view.  

<div style="clear: right" >

## Join Field Formats on Numbers

<img style="float: right;" width="50%" vspace="5" alt="Join Field Formats on Numbers" src=images/Module14-Multi_Step_Lookups/Module14_Slide26.jpeg title="Join Field Formats on Numbers"/>

As noted earlier, incorrect number format conversion can cause look-ups to fail.  For example, source and targets that use Binary, Packed and Zoned Decimal field can all have the proper field lengths for use in a lookup path.  However, if the sign characteristics are not properly converted, the correct matching record will not be found. Therefore it is important for LRs to be defined correctly to match the actual data type.  GenevaERS will do the necessary conversions between data types.

The GVBMR95 Trace output prints the binary data for LKE and other functions.  At times this data is not printable, but using the appropriate command to display hex data on output data (such as “Set Hex On” depending upon the JES configuration) will show the data for debugging.

<div style="clear: right" >

# GVBMR95 Control Report

<img style="float: right;" width="50%" vspace="5" alt="GVBMR95 Control Report" src=images/Module14-Multi_Step_Lookups/Module14_Slide27.jpeg title="GVBMR95 Control Report"/>

The Extract Engine GVBMR95 control report again shows the results of Lookup processing.   Remember that the Found and Not Found counts are the results of LUSM functions, whether in 1st step or subsequent steps of joins, and do not include Join optimizations.  

In our example we used two different lookup paths, the single step lookup for the Customer ID, and the multi-step lookup for the Gender description.  Thus although we have only two output records with not found conditions on them, we have 4 not founds in the count, 2 for the Customer ID join failure and 2 for the Gender Description join.

<div style="clear: right" >

# Function Overview

<img style="float: right;" width="50%" vspace="5" alt="Function Overview" src=images/Module14-Multi_Step_Lookups/Module14_Slide28.jpeg title="Function Overview"/>

This logic table and page has introduced the following Logic Table Function Code:
- CFEL, Compares fields, Event File Field to Looked-up Field
- CFLC, Compares fields, Looked-up field to Constant
- LKLR, like the Join function, identifies join targets for multi-step joins
- LKL, builds a look up key using data from a looked-up record
Other related function codes without examples include:
- CFEE, Compares fields, Event File Field to Event File Field
- CFLL, Compares fields, Looked-up field to Looked-up field
- CNL, a Class Test Numeric on a looked up value, similar to a CNE

[Click here to access the list of the most common Logic Table Functions for reference.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" > 

