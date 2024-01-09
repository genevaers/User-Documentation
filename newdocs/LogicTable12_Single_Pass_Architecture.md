---
title: Introduction to the Single Pass Architecture
nav_order: 13
---

# Introduction to the Single Pass Architecture

This page provides you with an overview of GenevaERS Single Pass Architecture, a key feature of the tool.  How this feature works is explained through understand more of the Logic Table. It will help you to: 
- Describe the Single Pass Architecture
- Read an Extract only Logic Table and Trace
- Explain the Function Codes used in the example
- Debug AND and OR selection logic

This page covers the following Logic Table Function Codes:
- WRDT - Write DT Area Only
- CNE - Compare, Numeric
- GOTO - Unconditional Go To 
- DTC - Build DT Area From Constant
- DTE - Build DT Area From Event Field

[Other Logic Table Functions Codes can be located here.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" >

# Single Pass Overview

<img style="float: right;" width="50%" vspace="5" alt="Single Pass Overview" src=images/Module12-Single_Pass_Architecture/Module12_Slide4.jpeg title="Single Pass Overview"/>

One of the most powerful features of GenevaERS is the single pass architecture.  Input / Output processing or IO is often the slowest part of data processing, at times thousands of times slower than other functions.  GenevaERS’s single pass architecture allows for a single read of the input data to produce many different outputs.  Each output can be unique, as specified by individual views.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Single Pass Overview" src=images/Module12-Single_Pass_Architecture/Module12_Slide5.jpeg title="Single Pass Overview"/>

In this module, we will continue to build on the prior lesson, where a Copy Only view was processed alone.  In this module, we will add an Extract Only view.  Both of these views do not require the Reference and Format phases of the GenevaERS Performance Engine.

In this example, we'll also execute the Copy View at the same time as the Extract Only View, demonstrating how the GenevaERS Single Pass Architecture works.  The logic table will contain two views in one logic table.  The Extract Engine, GVBMR95 will produce two outputs.

<div style="clear: right" >

# Extract Only View
## Columns 1, 2, 3 and 5

<img style="float: right;" width="50%" vspace="5" alt="Extract Only View" src=images/Module12-Single_Pass_Architecture/Module12_Slide6.jpeg title="Extract Only View"/>

Instead of copying all fields on the input records to the output files, the Extract Only view writes selected fields to the output file.  Any field may be written to the extract file, in any order, regardless of the order or position on the input file. Field formats may also be changed, for example changing a zoned decimal to a packed field format. These columns will cause DTE Logic Table functions to be generated in the Logic Table.  Constants can also be written to the output file.   

Constants use DTC functions in the Logic Table.  Extract only views can also contain looked-up fields, which will be explained in the next module, and which generate DTL logic table function codes.

In our example, columns 1, 2, 3 and 5 of the view will extract the Cost Center field, Legal Entity, and the Account and Record Count respectively.

<div style="clear: right" >

## Column 4

<img style="float: right;" width="50%" vspace="5" alt="Extract Only View Column 4" src=images/Module12-Single_Pass_Architecture/Module12_Slide7.jpeg title="Extract Only View Column 4"/>

Logic text in Column 4 will cause the output file to contain a constant of either the value Asset Account or Liability Account. “AssetAcct” will be assigned if the account number field on the input file contains the values “111,”  “121” or “123”.  

Otherwise column 4 will contain the Liability account constant "which is the value "LiabAcct”.  This logic text will create multiple CFEC functions, introduced in the prior module.

<div style="clear: right" >

## Column 6

<img style="float: right;" width="50%" vspace="5" alt="Extract Only View Column 6" src=images/Module12-Single_Pass_Architecture/Module12_Slide8.jpeg title="Extract Only View Column 6"/>

Column 6 contains Logic Text that tests the input amount field.  If the amount is a valid number (is numeric), it will be written to the output file.  If the amount on the input file is not numeric, a constant of a zero will be written to the output file.  This logic will generate a CNE function in the logic table.

<div style="clear: right" >

# Logic Table Standard Structures

<img style="float: right;" width="50%" vspace="5" alt="Logic Table Standard Structures" src=images/Module12-Single_Pass_Architecture/Module12_Slide9.jpeg title="Logic Table Standard Structures"/>


This is the Logic Table generated for both the Copy View and the Extract Only view.  

The portions of the logic table generated for the Copy Only view example in the last module remain mostly unchanged.  It includes the HD Header, RENX Read Next, and logic table rows 3, 4 and 5.  

The last two rows of the logic table, the ES End of Source (sometimes called End of String) and EN End of Logic Table functions are very similar as well.  Only the row numbers on these last two rows have changed

<div style="clear: right" >

## New View

<img style="float: right;" width="50%" vspace="5" alt="New View" src=images/Module12-Single_Pass_Architecture/Module12_Slide10.jpeg title="New View"/>


Our new Extract Only view, number 3262, is inserted in the middle of the logic table.  So each record read from the input file will first be passed through all the Logic Table Functions for the Copy Only view, and then through the logic table functions of our new Extract Only view.

<div style="clear: right" >

## NV and WR Functions

<img style="float: right;" width="50%" vspace="5" alt="NV and WR Functions" src=images/Module12-Single_Pass_Architecture/Module12_Slide11.jpeg title="NV and WR Functions"/>

Our Extract only view again includes an NV - New View function, and concludes with a WR function.  In this case, instead of a WRIN function which writes the input record (makes a copy), it is a WRDT function, Write the Data area of the extracted record.  

<div style="clear: right" >

## DTE Functions

<img style="float: right;" width="50%" vspace="5" alt="DTE Functions" src=images/Module12-Single_Pass_Architecture/Module12_Slide12.jpeg title="DTE Functions"/>

Columns 1, 2, 3 and 5 simply move fields from the input file to the output file.  These columns cause DTE functions to be generated in the logic table.  The DTE function simply moves data.  The “DT” is derived from “Data” , the “E” means the source is the input Event File field. 

Each DTE function is followed by a Sequence Number.   The Sequence Number for each DTE shows the column number causing that logic to be generated.

<div style="clear: right" >

## DTE Functions

<img style="float: right;" width="50%" vspace="5" alt="DTE Functions" src=images/Module12-Single_Pass_Architecture/Module12_Slide13.jpeg title="DTE Functions"/>

Each DTE row also contains the position and length in the source Event file.  These positions, lengths, formats and numbers of decimal places are taken from the Logical Record describing the input file.

Each DTE row also contains the length and format to be placed in the output file.    A difference between the length, format, or number of decimals between the Source and Target columns indicates GenevaERS has performed a transformation before writing that field. In this example no transformations occurred.

The report does not show the position in the output file. The start position in the final output file is shown in the view editor of the Work Bench.  But the final output file position may be different than the extract file position, depending on the view type.  The extract file position can be calculated by accumulating the lengths of all preceding column outputs.  

<div style="clear: right" >

# CFEC Functions

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions" src=images/Module12-Single_Pass_Architecture/Module12_Slide14.jpeg title="CFEC Functions"/>


The first part of the Logic Text in Column 4 contains the text “If Account = 111 or Account = 121 or Account = 123”.  This clauses causes multiple CFEC functions, (Compare Field, from the Event file to a Constant) to be generated in the Logic Table.  The CFEC functions in logic table rows 10, 11 and 12 are generated by this specific IF statement.  

The Sequence Number field of the report shows the column number that contains the logic that created the CFEC.  In this instance, the logic is contained in column 4 of the view. 

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Three CFEC Tests" src=images/Module12-Single_Pass_Architecture/Module12_Slide15.jpeg title="Three CFEC Tests"/>


CFEC functions work together to complete a complex OR or AND test.  In this example, the “OR” statements caused three CFEC functions to be created.  

The first test for Account equal to 111 is performed on Logic Table Row 10.  The second test for Account equal to 121 on Logic Table Row 11, and the third test for Account equal to 123 on Row 12.

<div style="clear: right" >

## Source Attributes

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions Source Attributes" src=images/Module12-Single_Pass_Architecture/Module12_Slide16.jpeg title="CFEC Functions Source Attributes"/>


Because each CFEC tests the ACCOUNT Field—the “E” or Event File field portion of the CFEC—the position, length and format of the ACCOUNT field is shown in the Source attribute columns.  Because the ACCOUNT is used three times in the logic text, the same position, length and format are used on all three CFEC rows.

<div style="clear: right" >

## Constant Attributes

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions Constant Attributes" src=images/Module12-Single_Pass_Architecture/Module12_Slide17.jpeg title="CFEC Functions Constant Attributes"/>

The constants—the second “C” of the CFEC—are also placed in the logic table.  These three constants are placed at the end of the respective logic table rows.  These three constants all are a comparison type of 001 which is equal, and are all 3 bytes long

<div style="clear: right" >

## OR True Condition

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions and OR True Condition" src=images/Module12-Single_Pass_Architecture/Module12_Slide18.jpeg title="CFEC Functions and OR True Condition"/>


The OR condition of the logic text determines the numbers placed in the GOTO rows.  If the value in the Account field on the input Event file is “111”, then the result of the first test is “true” and the record should be selected for additional processing within the column.  Thus executing will jump to row 13, as specified in the Goto Row1 which is the true condition branch.  

<div style="clear: right" >

## OR False Condition

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions and OR False Condition" src=images/Module12-Single_Pass_Architecture/Module12_Slide19.jpeg title="CFEC Functions and OR False Condition"/>


If the logic table row tests false, then the other tests of the OR condition must be evaluated, including testing for “121” or “123”.  Thus the False GOTO Row is row 11, the next logic table row, where the next CFEC function will test against a constant of “121” rather than “111”

<div style="clear: right" >

## OR Conditions

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions and OR Conditions" src=images/Module12-Single_Pass_Architecture/Module12_Slide20.jpeg title="CFEC Functions and OR Conditions"/>


The second OR condition creates a similar pattern on the next CFEC function, testing against constant “121” on logic table row 11.  If true, then the next row to be executed is row 13 where the column will use the input record in some way.  If the value in not “121”, then the next row executed is row 12, the next OR condition to test against value “123”.

<div style="clear: right" >


<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions and OR Conditions" src=images/Module12-Single_Pass_Architecture/Module12_Slide21.jpeg title="CFEC Functions and OR Conditions"/>

Row 12 tests the Account field on the input Event file for value “123”.  If it test true, then the next row to be executed is again row 13 which will move a constant to the output record.  

If the value in not “123”, then the next row executed is row 15 which means the else condition for the column value will be used.

<div style="clear: right" >

# DTC Function

<img style="float: right;" width="50%" vspace="5" alt="DTC Function" src=images/Module12-Single_Pass_Architecture/Module12_Slide22.jpeg title="DTC Function"/>

The THEN and ELSE portions of the logic text cause additional rows to be generated in the Logic Table.  If a field was to be moved from the input to the output file, they would be DTE functions, like those generated for columns 1 and 2 and others.  In this example, constants are to be moved to the output record, so DTC functions are generated, DTC meaning Data from a Constant.

Logic Table rows 13 and 15 are both DTC functions.  Row 13 places the constant for Asset Account in the output file if any of the CFEC functions tested true.  Only if the ACCOUNT field on the Input File has the value “111”, “121” or “123” will the output column receive the value of “AssetAcct” in it.  

On the other hand, row 15 places a value for Liability Accounts.  It is executed if ALL CFEC tests are false.  Thus any ACCOUNT value besides those three tested will result in a value of “LiabAcct” in column four of the output file.

<div style="clear: right" >

# GOTO Function

<img style="float: right;" width="50%" vspace="5" alt="GOTO Function" src=images/Module12-Single_Pass_Architecture/Module12_Slide23.jpeg title="GOTO Function"/>

If all rows in the Logic Table were executed sequentially in order without skipping any rows the constant of Liability Account would overwrite all the Asset Account constants place in the output record.  To prevent this, a GOTO row is used to skip the DTC for Liability Account whenever an Asset Account is used.

In our example, Row 14 is a GOTO row.  If Row 13 placed the Asset Account value in the output file, the program naturally falls through to row 14.  The Logic Table then tells the program to jump to row 16, skipping row 15.  This prevents the value of Asset Account from being overwritten with the Liability Account constant.

<div style="clear: right" >

# CFEC Functions AND Conditions

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions AND Conditions" src=images/Module12-Single_Pass_Architecture/Module12_Slide24.jpeg title="CFEC Functions AND Conditions"/>

With OR logic, all three CFEC rows execute row 13, which places the Asset Account value in the output.  If any one of the rows is true, Asset Account is placed in the output.  

If our logic text were changed, and we used AND logic to test three different fields, our GOTO ROW1 and ROW2 would be swapped. AND conditions require that all three rows test true. The effect is that the True and False row numbers switch places for AND verses OR logic.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="CFEC Functions AND Rows" src=images/Module12-Single_Pass_Architecture/Module12_Slide25.jpeg title="CFEC Functions AND Rows"/>


With AND logic, a true condition on each CFEC causes the logic to continue to the next row of the logic table to continue the test.  After the final test of the AND condition, if all tests have proven true, the DTC function on Logic Table Row 13 is executed to build the Asset Account constant.  If any of the CFEC functions prove untrue, execution continues at Logic Table Row 15, the Liability Account DTC function.

A common debugging problem occurs if logic text requires the same field to contain multiple values by using AND when OR was intended.  The same field on a single input record can never contain multiple values. For example the field Account can never equal "111" AND "121".  The condition would always prove false. Using the Logic Table to read how the logic is interpreted can help uncover these types of problems.

<div style="clear: right" >

# CNE Functions

<img style="float: right;" width="50%" vspace="5" alt="CNE Functions for Column 6" src=images/Module12-Single_Pass_Architecture/Module12_Slide26.jpeg title="CNE Functions for Column 6"/>

The last column of the view tests to ensure only valid numeric values are placed in the output file using the Logic Function “ISNUMERIC”.  The “Is Numeric” function in Column six of the view generates a CNE function, a Class Numeric test of an input Event file field.  The CNE function is similar to a CFEC function.  It tests a value and directs execution to the GOTO 1 or 2 rows depending on the results of the test.

The CNE function on row 17 in our example tests if the input field AMOUNT contains a valid numeric value.  If so row 18 is executed.  If the input field is NOT numeric, GOTO ROW 2 will cause row 20 to be executed.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="CNE Functions for Column 6" src=images/Module12-Single_Pass_Architecture/Module12_Slide27.jpeg title="CNE Functions for Column 6"/>

The THEN and ELSE conditions of Logic Text  for column 6 perform different functions.  The THEN Condition causes a field from the input file to be moved to the output file.  The ELSE condition causes a constant of zero to be placed in the output file.  

The true test of the THEN condition of the CNE test on row 17  will execute row 18, a DTE function, moving the Amount from the input record to the output.  

The false ELSE condition on NON numeric causes row 20 to be executed, a DTC function placing a constant of 0 in the output file.

<div style="clear: right" >

# WR Function

<img style="float: right;" width="50%" vspace="5" alt="WR Function" src=images/Module12-Single_Pass_Architecture/Module12_Slide28.jpeg title="WR Function"/>

The final instruction of the Extract Only view is the WRDT function. This function  is generated by default at the end of a view if there is no WRITE Logic Text function in the view.  In these cases, it is always executed.  

In contrast to the WRIN function which moves the Input Record to the output file, the WRDT function moves data from the Extract record area to the output file.  All of the data moved to the extract record through the DT functions, both DTCs or DTEs, are actually written to the output file.

The WRDT is followed by a Sequence Number 1, meaning it writes its data to file number 1.  This is the same file the WRIN function of the Copy View uses.  Thus after the first input record is processed, the first record in the output file may be the copy of the input record selected by the Copy View, followed by the Extract Only data of the second view. 

<div style="clear: right" >

# Logic Table Trace

## Record 1

<img style="float: right;" width="50%" vspace="5" alt="Logic Table Trace" src=images/Module12-Single_Pass_Architecture/Module12_Slide29.jpeg title="Logic Table Trace"/>

Having examined the Logic Table, let’s use our three record file again to see how it behaves through the trace process.  Trace is turned on by setting the TRACE parameter to “Y” in the MR95 Parameters file.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Trace Input Record 1 Copy View CFEC" src=images/Module12-Single_Pass_Architecture/Module12_Slide30.jpeg title="Trace Input Record 1 Copy View CFEC"/>

The first three rows of the trace are for view 3261, our Copy View from the last module. The first input record is compared against the constant in the CFEC function.  The comparison is true, and so the next row of the logic table is executed.  

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Trace Input Record 1 Copy View WRIN" src=images/Module12-Single_Pass_Architecture/Module12_Slide31.jpeg title="Trace Input Record 1 Copy View WRIN"/>

Because the test proved true, the input record is copied to the output file by the WRIN function.

<div style="clear: right" >

## Single Pass Architecture

<img style="float: right;" width="50%" vspace="5" alt="Single Pass Architecture" src=images/Module12-Single_Pass_Architecture/Module12_Slide32.jpeg title="Single Pass Architecture"/>

Because our GenevaERS execution included running more than one view, instead of looping to the next Event File record and the Copy Input View processing it, the input record is passed to our new Extract Only view, number 3262

<div style="clear: right" >

## Extract Only View

<img style="float: right;" width="50%" vspace="5" alt="Extract Only View" src=images/Module12-Single_Pass_Architecture/Module12_Slide33.jpeg title="Extract Only View"/>

Note that some rows of the logic table are not executed as record 1 is processed in this example.  Rows 11 and 12 are not executed because the OR condition in the Logic Text; the first condition proved true, so test 2 and 3 was not necessary.  

Also, Row 15 which would have placed the Liability Account in the output file, was skipped by the GO TO Function on row 14.

Row 20 was also skipped, because the amount was a valid number, so it was not replaced by a constant zero.

Note that the trace does not convert Packed and other “un-printable data” to a printable format.  The number tested on row 17 appears to print as a “p”, but if viewed in HEX mode, will display as a valid packed number based upon the format of the field used in the Numeric test.  

<div style="clear: right" >

## Record 1 Write Functions

<img style="float: right;" width="50%" vspace="5" alt="Record 1 Write Functions" src=images/Module12-Single_Pass_Architecture/Module12_Slide34.jpeg title="Record 1 Write Functions"/>

The Single Pass architecture allowed the same record to be used to create two output records, one which was an identical copy, and one which contained selected fields and constants. The second record in the output file contains many of the same fields as the input, but in a different order, for the Cost Center and Legal Entity, each built by DTE functions.

The Account value of “111” is written to the same position as in the input record by a DTE function

The Account Description is next, in this case Asset Account, built by a DTC function.  

Having tested the amount on the input file and found it to be numeric, the view copies it in the last position to the output file using a DTE function.

Both views are able to make use of the same input record, without having to read the file twice.  By making changes to the view, these output records could also have been written to different output files if desired.

<div style="clear: right" >

## Trace Records 2

<img style="float: right;" width="50%" vspace="5" alt="Trace Records 2" src=images/Module12-Single_Pass_Architecture/Module12_Slide35.jpeg title="Trace Records 2"/>

Record 2 follows a similar pattern.  Record 2 is passed first to the Copy view which writes it to the extract file.  Record 2 is then passed to the Extract Only View.  

Note that the AMOUNT field on the input record two has a non-numeric amount of “alpha” in it.  This causes the Extract Only CNE test to be false, and thus this value is not moved to the output record.  Rather a packed constant of zero is moved to the output file (which is unprintable in this slide and shown as a series of periods).

<div style="clear: right" >

## Trace Records 3

<img style="float: right;" width="50%" vspace="5" alt="Trace Records 3" src=images/Module12-Single_Pass_Architecture/Module12_Slide36.jpeg title="Trace Records 3"/>

Record 3 is read, which then is NOT selected by the Copy Only view because the Legal Entity tests false; the Legal Entity is 731, not the 999 required.  Thus this record is not written to the extract file, and the input records is passed to the Extract Only view.

When record 3 is processed by the Extract Only view, it is written to the output file.

<div style="clear: right" >

## GVBMR95 Control Report

<img style="float: right;" width="50%" vspace="5" alt="GVBMR95 Control Report" src=images/Module12-Single_Pass_Architecture/Module12_Slide37.jpeg title="GVBMR95 Control Report"/>

The GVBMR95 Control Report shows that the three records in the input file have become 5 records in the output files:  2 for the Copy Only view, and 3 for the Extract Only view.

The Extract Engine in this process has significantly increased efficiency over alternative methods of producing these two outputs, because in a single pass of the file, one IO to get the event file into memory for processing has allowed both outputs to be done. Certainly programs can be written to do this same thing, but it demands a programmer writing the program to design it that way. With GenevaERS, two people independently can create views, and the tool will resolve them efficiently.

Remember, though, that this process does not include any parallelism. View number 2 is executed after view number 1 has seen the event record.  We’ll explain parallelism in a later module.

<div style="clear: right" >

# Function Overview

<img style="float: right;" width="50%" vspace="5" alt="Function Overview" src=images/Module12-Single_Pass_Architecture/Module12_Slide38.jpeg title="Function Overview"/>

This logic table and module has introduced the following Logic Table Function Code:
- CNE, a Class test Numeric on an event file field. 
- DTE, which moves an input field to the output buffer
- DTC, which moves a constant from the logic table to the output buffer
- WRDT, which writes the DT data to the extract file

[Click here to access the list of the most common Logic Table Functions for reference.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" > 
