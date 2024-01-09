---
title: Introduction to Record Filtering
nav_order: 7
---

# Introduction to GenevaERS Record Filtering

This page explains GenevaERS record filtering.  It will help you:
- Use GenevaERS logic text facilities to create record filters
- Read GenevaERS logic text and identify keywords, fields, lookup paths, and constants
- Construct complex record filters
- Interpret the results of processing

# Record Filtering Overview
## Record Filters
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Record Filtering Overview" src=images/Module6-Record_Filtering/Module6_Slide3.jpeg title="Record Filtering Overview"/>

GenevaERS record filters use conditional processing to include or exclude records, based upon specific criteria. GenevaERS filters both input records and output records. Input record filtering is performed in the extract phase, and output record filtering is performed in the format phase. 

Both input and output record filtering work on entire records. If no record filters are created, all records are selected for input, and are written to the output.

Extract and Format Phase filters have differing uses. 

Extract Record Filters: 
- Select source records to process.
- Are performed first, before any other criteria.
- If omitted, all records will be selected as input.

Format Phase Record Filters: 
- Select records to be written to output.
- Are performed last, after all criteria, before the write is performed.
- If omitted, all records will be written to output.

Record filters are written in GenevaERS logic text.

<div style="clear: right" > 

## Column Assignment

<img style="float: right;" width="50%" vspace="5" alt="Record Filtering vs Column Assignment" src=images/Module6-Record_Filtering/Module6_Slide4.jpeg title="Record Filtering vs Column Assignment"/>

In contrast to record filtering, GenevaERS also provides column assignment logic and column calculations, which also use GenevaERS logic text. Column logic is used to populate output columns with field values, constants, or calculations. 

In the top example of the slide to the right, record filtering excluded all customers with orders before January 2000. In the bottom example, columns are populated based upon customer type, either retail or commercial. Note that no value is assigned for the third record because it is for a “government” customer.



# Creating Filters

<div style="clear: right" >

## Extract Filters

 <img style="float: right;" width="50%" vspace="5" alt="Creating Extract Filters" src=images/Module6-Record_Filtering/Module6_Slide5.jpeg title="Creating Extract Filters"/>


The extract record filter is opened on the View Source Properties tab. 

First, open the View Source Properties tab with a single left-click in the blue cell. Open the Extract Record Filter tab by double-clicking anywhere in the record filter cell to display the icon, and then click the icon.

<div style="clear: right" >

## Format Filters

 <img style="float: right;" width="50%" vspace="5" alt="Creating Format Filters" src=images/Module6-Record_Filtering/Module6_Slide6.jpeg title="Creating Fomrat Filters"/>

The Format phase record filter is opened on the Format Phase tab on the View Properties screen. Simply click the Edit button to work with output record filters.

<div style="clear: right" >

## Logic Text

<img style="float: right;" width="50%" vspace="5" alt="Logic Text" src=images/Module6-Record_Filtering/Module6_Slide7.jpeg title="Logic Text"/>

GenevaERS logic text is constructed in the Logic Text Editor. The left panel displays the logic, and the right panel displays the Logic Text Helper, which displays key-words and values that can be used in logic text. 

Within logic text, comments are preceded by an apostrophe, and are shown in green. Keywords are shown in blue. Field names are shown in black, and alphanumeric constants are shown in pink, enclosed in pink double quotes.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="Fields versus Column Numbers" src=images/Module6-Record_Filtering/Module6_Slide8.jpeg title="Fields versus Column Numbers"/>

Because the Extract process has access to the original input record, extract record filters use field names and LR names. In GenevaERS meta-data, for example, field names are enclosed in brackets. 

Format phase logic text filters refer only to column numbers, not to field names.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper" src=images/Module6-Record_Filtering/Module6_Slide9.jpeg title="Logic Text Helper"/>

The logic text helper enables you to build logic text by selecting the text to include in the filter. Double-clicking any listed keyword or field places that value in the logic text. 

Constants, such as the pink zeros shown here, are the only portion of the logic text that requires manual entry.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Operators" src=images/Module6-Record_Filtering/Module6_Slide10.jpeg title="Logic Text Helper - Operators"/>

The Logic Text Helper includes operators, such as these: 
- Logical operators (AND, OR, NOT)
- Arithmetic operators
- Comparisons such as GREATER THAN or LESS THAN, and 
- Keywords, such as LIKE and CONTAINS.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Language Constructs" src=images/Module6-Record_Filtering/Module6_Slide11.jpeg title="Logic Text Helper - Language Constructs"/>

The SELECT and SKIP key words tell the Performance Engine which record to select or skip. The logic shown in this example selects all records with an order date greater than January 1, 2000. All other records will be skipped.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- IF Language Constructs" src=images/Module6-Record_Filtering/Module6_Slide12.jpeg title="Logic Text Helper - IF Language Constructs"/>

The SELECTIF and SKIPIF statements provide a shorthand way of specifying the same condition. Note that the greater-than sign has been switched to a less-than-or-equal-to sign, so that both statements will select the same records.

<div style="clear: right" >

## Extract Filter Fields and Paths

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Fields" src=images/Module6-Record_Filtering/Module6_Slide13.jpeg title="Logic Text Helper - Fields"/>
 
The Logic Test Helper includes a listing of all fields from the input logical record. To avoid syntax errors, place the cursor at the correct location in the GenevaERS keyword, and double-click to insert the selected field name.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Paths" src=images/Module6-Record_Filtering/Module6_Slide14.jpeg title="Logic Text Helper - Paths"/>

The Logic Text Helper also shows all lookup paths and fields on LRs available through joins. When used in logic text, these field names are preceded by the lookup path name.

In this example, the logic tests the customer date-of-birth field, looking for records with specific dates to include or exclude.

<div style="clear: right" >

## Format Phase Columns

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Columns" src=images/Module6-Record_Filtering/Module6_Slide15.jpeg title="Logic Text Helper - Columns"/>

Format filtering can be performed only on records that have made it through record selection, in the Extract phase. Format phase output record filtering refers to columns rather than field numbers. The only columns available for output filtering are columns that are numeric, perform aggregation, or are the results of calculations. Format filtering is applied after aggregation is performed.

In this example, only records where column 6 is greater than 0 are written to the final output file. The accumulated order count in column 6 for Johnson is 0, so this record is not written to the output file, but the Philips record, with a total of 3, is.

<div style="clear: right" >

## Format Phase Functions

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Functions" src=images/Module6-Record_Filtering/Module6_Slide16.jpeg title="Logic Text Helper - Functions"/>


Logic text functions test numerous conditions, including various date conditions, nulls, numeric values, and found and not-found conditions on joins. In this example, all records with spaces in the ORDER DATE field will be skipped. 

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- If Statements" src=images/Module6-Record_Filtering/Module6_Slide17.jpeg title="Logic Text Helper - If Statements"/>

Logic text supports nested IF statements. GenevaERS logic text follows the typical order of operations and logic constructs of other programming languages.

In this example, all order records for customer 0 at stores 1 and 2 are selected. In addition, all orders for customer 2 at any store, with an amount less than or equal to 0, are selected for processing.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- IfFound Statements" src=images/Module6-Record_Filtering/Module6_Slide18.jpeg title="Logic Text Helper - IfFound Statements"/>

The ISFOUND (is found) and ISNOTFOUND (is not found) functions test the results of joins. If a corresponding join record is found, the ISFOUND condition tests true. The parameter for these functions is simply the lookup path to be tested for a valid join.

In this example, order records are selected if a customer record is found using the order-to-customer lookup path.

<div style="clear: right" >

## Help and Syntax Checker

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Help" src=images/Module6-Record_Filtering/Module6_Slide19.jpeg title="Logic Text Helper - Help"/>

To view a quick syntax snapshot, hover over the Logic Text Helper keywords. GenevaERS online help provides full syntax help for all keywords. To access help, open the Help menu and, select Logic Text.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Syntax Checker" src=images/Module6-Record_Filtering/Module6_Slide20.jpeg title="Logic Text Helper - Syntax Checker"/>

Logic text syntax checking tests logic text for errors, such as mistyped keywords or invalid field names. Error messages are displayed at the bottom of the screen. Views cannot be activated until all errors are cleared.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="Logic Text Helper- Syntax Errors" src=images/Module6-Record_Filtering/Module6_Slide21.jpeg title="Logic Text Helper - Syntax Errors"/>

Logic text syntax checking displays errors when syntax is not correct. The error message displays the line followed by the character number where the error was detected. 

In this example, the syntax is missing a second right parenthesis after the constant “2.” 



<div style="clear: right" > 
