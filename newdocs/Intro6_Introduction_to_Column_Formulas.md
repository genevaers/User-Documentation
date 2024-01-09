---
title: Introduction to Column Formulas
nav_order: 8
---

# Introduction to GenevaERS Column Formulas

This page explains GenevaERS column formulas.  It will help you:
- Explain the difference between column assignment and record selection
- Set column attributes and assign simple constant values
- Use if-then-else logic in setting column values
- Create column formulas

# Column Formula Overview
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Column Formula Overview" src=images/Module7-Column_Formulas/Module7_Slide3.jpeg title="Column Formula Overview"/>

In contrast to record filtering, GenevaERS provides column assignment logic and column calculations, which also use GenevaERS logic text. Column logic is used to populate output columns with field values, constants, or calculations.

In the top example, record filtering excluded all customers with orders prior to January 2000. In the bottom example, columns are populated based upon customer type, either retail or commercial. Note that no value is assigned for the third record because this record refers to a government customer.

<div style="clear: right" > 

## Constant Assignment

<img style="float: right;" width="50%" vspace="5" alt="Column Formula Simple" src=images/Module7-Column_Formulas/Module7_Slide4.jpeg title="Column Formula Simple"/>

Remember that a constant can be applied to a column by clicking in the View Source cell and then selecting the Column Source Type constant in the Column Source Properties pane.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Column Formula Alphanumeric" src=images/Module7-Column_Formulas/Module7_Slide5.jpeg title="Column Formula Alphanumeric"/>

An alphanumeric value is entered “as is.” It is not included in single or double quotation marks. If spaces are assigned to the column, they will not be visible in this cell. Later you’ll see a better way of assigning a space to a column.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Column Source Type" src=images/Module7-Column_Formulas/Module7_Slide6.jpeg title="Column Source Type"/>

An alternative approach to assigning values to a column is to use a column formula. To enter a formula, select Formula in the Column Source Type field. Then double-click anywhere in the Column Source Value cell to display the icon, and click the icon.

<div style="clear: right" > 

## Logic Text Editor

<img style="float: right;" width="50%" vspace="5" alt="Logic Text Editor" src=images/Module7-Column_Formulas/Module7_Slide7.jpeg title="Logic Text Editor"/>

The Logic Text Editor includes the Logic Text Helper, which enables you to place keywords, field names, and column numbers into logic for column assignment. These functions are similar to functions provided by record filtering.

<div style="clear: right" > 

## Column Assignment

<img style="float: right;" width="50%" vspace="5" alt="Column Assignment" src=images/Module7-Column_Formulas/Module7_Slide8.jpeg title="Column Assignment"/>

A very simple “column equals” statement can be used to assign a constant value to a column. In this example, a constant value of a space is assigned to a column. Constants surrounded with double quotation marks create alphanumeric constants. 

<div style="clear: right" > 

## Column Attributes

<img style="float: right;" width="50%" vspace="5" alt="Column Formulas and Column Attributes" src=images/Module7-Column_Formulas/Module7_Slide9.jpeg title="Column Formulas and Column Attributes"/>

Field values and constants assigned in logic text must fit within the column output attributes that will be used to define the output. In this example, the value of ORDER_TOTAL_AMOUNT is written as a 4-byte binary field in the output file. 

<div style="clear: right" > 

## If Then Else

<img style="float: right;" width="50%" vspace="5" alt="IF THEN ELSE" src=images/Module7-Column_Formulas/Module7_Slide10.jpeg title="IF THEN ELSE"/>

Column logic can include if-then-else logic as well. The column output will contain the result of the THEN or the ELSE conditions. Nested IFs are also permitted.

In this example, the value of ORDER_TOTAL_AMOUNT or the constant of 0 is written to the output file. 

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Alternative IF THEN ELSE" src=images/Module7-Column_Formulas/Module7_Slide11.jpeg title="Alternative IF THEN ELSE"/>

If then else logic can be written several ways. In addition to the typical IF THEN ELSE, a value can be assigned to a column and then a test can be performed to see whether that value should be overwritten. 

All three logic statements seem to result in the same output. However, the third statement, without an implicit ELSE condition, is not recommended and may have unpredictable results. The second statement is also less efficient because the assignment is overwritten when the IF condition is true.

<div style="clear: right" > 

## Functions

<img style="float: right;" width="50%" vspace="5" alt="Functions" src=images/Module7-Column_Formulas/Module7_Slide12.jpeg title="Functions"/>

In addition to using field names in logic text, you can use functions. This column uses the ISSPACES function, which tests a field value equal to spaces. If true, the output column contains the text “***Error***”; if not true, it contains the store ID.

<div style="clear: right" > 

## Value Reassignment

<img style="float: right;" width="50%" vspace="5" alt="Column Value Reassignment" src=images/Module7-Column_Formulas/Module7_Slide13.jpeg title="Column Value Reassignment"/>

Column logic can be used to assign values to a prior column, which is called reassignment. Column logic is applied to columns starting from the left and moving to the right. Thus columns are populated left to right within GenevaERS, and previously assigned values can be overwritten by later columns.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Column Value Reassignment" src=images/Module7-Column_Formulas/Module7_Slide14.jpeg title="Column Value Reassignment"/>

Within the logic text, COLUMN= assigns a value to the current column, and COL.nn= refers to a prior column, where nn is the column number. Because columns are populated left to right, only prior columns can be referenced within column formulas. This feature does not require the same logic to be repeated in multiple columns; all columns depending upon the logic statement can be assigned within one column.

In this example, the logic within column 6 assigns, first, a space to column 6, second, the value XYZ to column 4, and third, asterisks to column 5.

<div style="clear: right" > 

## Field Calculations

<img style="float: right;" width="50%" vspace="5" alt="Field Calculations" src=images/Module7-Column_Formulas/Module7_Slide15.jpeg title="Field Calculations"/>

Column logic allows calculations to be performed against numeric fields. Any calculation referencing a field name is performed at extract time because the Extract phase has visibility into all fields on the input LR.

<div style="clear: right" > 

## Format Phase Formulas

<img style="float: right;" width="50%" vspace="5" alt="Format Phase" src=images/Module7-Column_Formulas/Module7_Slide16.jpeg title="Format Phase"/>

Format phase column formulas are accessed by double-clicking anywhere in the Format-Phase Calculation cell to display the icon, and then clicking the icon.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Format Phase" src=images/Module7-Column_Formulas/Module7_Slide17.jpeg title="Format Phase"/>

Format calculations can be performed only on records that have made it through record selection, via the Extract phase. Format phase calculations refer to columns rather than field numbers. The only columns available for calculations are columns that are numeric, perform aggregation, or are the results of calculations.

In this example, column 4 is populated with the results of column 3 divided by column 2.

<div style="clear: right" > 

# Record Filter versus Column Assignments

<img style="float: right;" width="50%" vspace="5" alt="Record Filter versus Column Assignments" src=images/Module7-Column_Formulas/Module7_Slide18.jpeg title="Record Filter versus Column Assignments"/>

The following explains the interaction of all four types of record and column filtering in the order they are applied by the Performance Engine. 
The order is: 
1. Extract phase record filtering
2. Extract phase column filtering and assignment
3. Format phase column calculations, and
4. Format phase output record filtering

<div style="clear: right" > 

## Record Filtering

<img style="float: right;" width="50%" vspace="5" alt="Record Filter: Record Filter versus Column Assignments" src=images/Module7-Column_Formulas/Module7_Slide19.jpeg title="Record Filter: Record Filter versus Column Assignments"/>

The Extract phase performs input record filtering, determining which records should be selected for processing. In this example, record number 4 is not selected for further processing because its date is less than January 2000.

These examples of selected records are used on the next slide to illustrate column assignment.

<div style="clear: right" > 

## Column Assignment

<img style="float: right;" width="50%" vspace="5" alt="Column Assignment: Record Filter versus Column Assignments" src=images/Module7-Column_Formulas/Module7_Slide20.jpeg title="Column Assignment: Record Filter versus Column Assignments"/>

Column assignment is performed on each record that passes record level filtering. It assigns specific values to the columns.

In this example, a zero is assigned to columns where the true condition failed on the first and third rows. The third column assigns similar logic based upon commercial customers, whereas the first column is assigned a 1 on every row.

These examples of extracted columns are used on the next slide to illustrate column calculations.

<div style="clear: right" > 

## Format Phase Column Calculation

<img style="float: right;" width="50%" vspace="5" alt="Format Phase Assignment: Record Filter versus Column Assignments" src=images/Module7-Column_Formulas/Module7_Slide21.jpeg title="Format Phase Assignment: Record Filter versus Column Assignments"/>

The Format phase performs column calculations using column values assigned in the Extract process, and then performs record filtering, based upon the final records.

In this example, column 4 is added to the output in the Format phase, based upon the column calculation. Because column 4 subtracts the value in either column 2 or column 3, it ends up being a count of non-retail, non-commercial customers.

These examples of calculated columns are used on the next slide to illustrate Format phase output filtering.

<div style="clear: right" > 

## Format Phase Filter

<img style="float: right;" width="50%" vspace="5" alt="Format Phase Filter: Record Filter versus Column Assignments" src=images/Module7-Column_Formulas/Module7_Slide22.jpeg title="Format Phase Filter: Record Filter versus Column Assignments"/>

The Format phase performs record filtering as the last step before writing to the output file. It works against aggregated records if the view summarizes records. Otherwise it works against detailed records, as in this example.

In this example, the filter tests column 4 selects only non-zero records. 

In conclusion, because of the combination of record filtering, column assignment, column calculation logic, and this final output record filter, the output file ends up being an extract of all non-retail, non-commercial customers.


<div style="clear: right" > 

# Links

Place following text in the topic:  
    ````
    [Topic A](TopicA)
    ````

The link displays as:   
[Topic A](TopicA)