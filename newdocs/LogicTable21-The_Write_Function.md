---
title: Introduction to the Write Function
nav_order: 22
---

# Introduction to the Write Function

This page provides you with more information about GenevaERS User Exits.  It will help you to: 
- Describe uses for GenevaERS Write Function
- Read a Logic Table and Trace with explicit Write Functions
- Properly use Write Function parameters
- Debug views containing Write Functions

The Write Function can produce any of these Logic Table Function codes.  
- WRIN - Write (copy) the input record to the extract file
- WRDT - Write the "DT" Data area of the extract file
- WRXT - Write a standard extract record to the extract file
- WRSU - Write an extract time summarized record to the extract file

 [Logic Table Functions Codes can be located here.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" >

# Write Function Purpose

<img style="float: right;" width="50%" vspace="5" alt="Write Function Purpose" src=images/Module21-The_Write_Function/Module21_Slide4.jpeg title="Write Function Purpose"/>

Standard GenevaERS views always contain one of these four write functions, either 
- 1. Writing a copy of the input record, 
- 2. The DT area of an extract record, 
- 3. A standard extract record, or 
- 4. A summarized extract record.  

Typically views contain an implicit WR function in the Logic Table, almost always at the last function of the view.  This can be seen in the logic table on the left.  

In constructing more complex GenevaERS applications, at times greater control over what type of records are written, where, how many and when they are written is required.   The Write Function is a Logic Table verb which gives greater control over when WR functions are place in the Logic Table. The Write Function, inserted into a view as logic text, creates additional WR functions like the logic table shown on the right.

Let’s look at two examples of problems the Write Verb can help solve.

<div style="clear: right" >

## Examples 
### “Flattening” embedded arrays

<img style="float: right;" width="50%" vspace="5" alt="Example Used: Flattening embedded arrays" src=images/Module21-The_Write_Function/Module21_Slide5.jpeg title="Example Used: Flattening embedded arrays"/>

The Write Function can be used to “flatten” records that have embedded arrays, creating normalized records.  This is possible because for each record read by GVBMR95, multiple records can be written.  In this example, from Customer record 1, three records can be written, for products A, Q and C.  

<div style="clear: right" >

### File Partitioning

<img style="float: right;" width="50%" vspace="5" alt="Example Use: File Partitioning" src=images/Module21-The_Write_Function/Module21_Slide6.jpeg title="File Partitioning"/>

Another typical use of the Write Verb is to split a file into multiple partitions.  Partitioning is important to be able to increase parallelism of the system in later steps.  

For example, suppose the day’s transactions are delivered in a single file.  Yet the GenevaERS environment has multiple partitions, a master file for each set of customers, perhaps by state, or for a range of customer IDs.  To be able to add the day’s transactions to customer master file, the daily file must be split into multiple files, one to be used in each master file update process.

To do this, the Write Verb is inserted into Logic Text “If” statements, testing the Customer ID and writing the record to the appropriate file.

The Write Verb and associated parameters control all aspects of writing records, including specifying which record type to write, which file (DD Name) to write it to, and if a Write User Exit should be called.  Let’s first review how these parameters are controlled on standard views, when the Write Verb is not used.  

<div style="clear: right" >

# Write Function Details

## Logic Table Function Type 

<img style="float: right;" width="50%" vspace="5" alt="Output Record Type Specification" src=images/Module21-The_Write_Function/Module21_Slide7.jpeg title="Output Record Type Specification"/>

The following rules determine which Logic Table Function is generated when a view contains no Write Verb and calls no Write Exit:  

- Views which use the Format Phase, either for File Format Output or for Hard Copy Reports, contain an implicit WRXT Functions to write standard extract records.  
- Views which use Extract Time Summarization, which requires standard extract file format records, contain an implicit WRSU to write summarized extract records.
- File output views which DO NOT use the Format Phase are Extract Only views.  Views which are Copy Input views—specified by selecting “Source-Record Structure”—contain WRIN Functions. All others contain WRDT functions to write the DT Data area of the extract record.

Almost all use of the Write Verb is for extract only views—views which do not use the Format Phase.  Because the WRXT and WRSU functions write standard extract file records (which are typically processed in the Format Phase), they are rarely used in conjunction with the Write Verb.  

<div style="clear: right" >

## DD Name Definition

The DD Name used for Extract Only views can be specified three ways:

<img style="float: right;" width="50%" vspace="5" alt="Output DD Name Definition, with Associated File" src=images/Module21-The_Write_Function/Module21_Slide8.jpeg title="Output DD Name Definition, with Associated File"/>



1. If an output physical file is specified in the View Properties, the Output DD Name associated with the physical file will be used.  In this example, the output physical file is OUTPUT01.  If we find the DD name for physical file OUTPUT01 by selecting Physical Files from the Navigator pane opening the OUTPUT01 physical file shows the output DD name of OUTPUT01.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Output DD Name Definition, with Associated File" src=images/Module21-The_Write_Function/Module21_Slide9.jpeg title="Output DD Name Definition, with Associated File"/>


2. If the physical file value is blank, a new DD name will be generated at runtime.  The most common generated name is the letter “F” followed by the last seven digits of the view number, using leading zeros if required.   In this left hand example, the DD Name is “F0000099”.

3. Alternatively, an Extract File Suffix can be used.  If the Extract File Number is assigned a value, the Extract Engine concatenates the assigned number to the value “EXTR” with three digits representing the Extract Work File Number, beginning with zeros if necessary to form the DD Name to be used.  In the right hand example, the extract records will be written to the file assigned to the DD Name EXTR001.


<div style="clear: right" >

## Write Exit Specification

<img style="float: right;" width="50%" vspace="5" alt="Write Exit Specification" src=images/Module21-The_Write_Function/Module21_Slide10.jpeg title="Write Exit Specification"/>

The last parameter the Write Verb controls is whether a Write Exit is called.  When the Write Verb is not used, write exits are assigned in view properties, in the Extract Phase tab.  The write exit is called as part of the implicit WR function generated for the view.

<div style="clear: right" >

# Write Function Syntax

<img style="float: right;" width="50%" vspace="5" alt="Write Function Syntax" src=images/Module21-The_Write_Function/Module21_Slide11.jpeg title="Write Function Syntax"/>

These are the elements of the Write Function syntax.  The Write verb keyword can be followed by three parameters which specify:
- Source
- Destination
- User Exit

The source parameter can be used to specify three possible sources:
- Input data, which means the view is a Copy Input view, the extract file containing a copy of the input record
- Data, which means the DT area data is written to the output file
- View, which means the standard view extract record is written to the output file.

The destination parameter allows modification of the target for the write:
- The Extract parameter allows specifying the DD Name suffix of the extract file
- The File parameter allows associating the write to a specific logical file

The user exit parameter allows specifying a user exit to be used

<div style="clear: right" >

# Example Write Function

<img style="float: right;" width="50%" vspace="5" alt="Example Write Function" src=images/Module21-The_Write_Function/Module21_Slide12.jpeg title="Example Write Function"/>

The following are examples of Write Functions.  Each of these example statements first tests field 4 to see if it is numeric.  If it is, then data will be written in some way:

### Example 1:  Copy Input to Physical File
```
IF (ISNUMERIC({field4})

	THEN WRITE (SOURCE=INPUT, 
     
     DEST=FILE= {LogicalFile3})

ENDIF
``` 

In example 1, the input data will be copied to an assigned Copy Input (Source=Input) Physical File associated with a specific Logical File (Destination=File)

### Example 2:  Call the DB2_Update Exit passing it the DT Data
```
IF (ISNUMERIC({field4})

	THEN WRITE (SOURCE=DATA, USEREXIT={DB2_Update}) 

ENDIF 
```

In example 2, the write verb causes a call to the DB2_Update User Exit (Userexit=DB2_Update).  It passes the exit the DT area data of the view. (Source=Data) 


### Example 3:  Write a Standard Extract Record to DD Name EXTR003
```
IF (ISNUMERIC({field4})

	 WRITE (SOURCE=VIEW, DEST=EXT=03) 

ENDIF 
```

In example 3, the write verb writes a Standard Extract Record (Source=View) to DD Name EXTR003 (Destination=Extension=03)

<div style="clear: right" >

## Record Filtering Example Logic

<img style="float: right;" width="50%" vspace="5" alt="Record Filtering Example Logic" src=images/Module21-The_Write_Function/Module21_Slide13.jpeg title="Record Filtering Example Logic"/>


The Write Verb can be used in either Record Level Filtering Logic, or Column Assignment Logic.  When a Write Verb is used in Record Filtering, the Select and Skip verbs cannot be used.  The Write Verb replaces the need for these keywords.

The logic shown here is Record Level Filtering logic, and could be used to partition a file containing multiple customers into individual files.  Record level filtering requires the use of the Source=Input parameter is used.  This parameter copies input records to the extract file.  This is required because no columns are created prior to executing Record Level Filtering logic.  The only valid output is to copy the input record.

```
If(CustomerID=“Cust1” Then

      Write(Source=Input,Destination=01)

Endif
```
```
If(CustomerID=“Cust4” Then

      Write(Source=Input,Destination=04)

Endif
```

In this example, the logic in the record filter first tests the Customer ID.  If it is “Cust1,” then the record is copied to the DD Name EXTR001 because of the Destination=01 parameter.  The second If statement will copy Customer 4 records to the EXTR004.  Because the logic is mutually exclusive, (the Customer ID can only be either Cust1 or Cust4, not both), the total output records will equal the input records, except they will be in two different files.

<div style="clear: right" >

## Column Filtering Example Logic

<img style="float: right;" width="50%" vspace="5" alt="Column Filtering Example Logic" src=images/Module21-The_Write_Function/Module21_Slide14.jpeg title="Column Filtering Example Logic"/>

Column Assignment Logic can use the Source=Input parameter if desired.  More frequently, it uses the Source=Data parameter.  This parameter writes all DT columns that have been built in the extract record to that point.  Thus logic can be used to select particular fields from the event file, and write a fixed length record to the output extract file.

Remember that the logic table creates fields in order by column numbers, from left to right.  This affects which column should contain the Write Verb. With a Write Verb in multiple columns, multiple records, of different lengths, will likely be written to the extract file.  

```
Column=CustID
Write(Source=Data)

Column=TranDate
Write(Source=Data)

Column=ProdID1
Write(Source=Data)

Column=Amount1
Write(Source=Data)
```

This example attempts to break a record with an array into multiple individual records.  The Write Verb in each column causes an extract record to be written with the DT data built to that point in the Logic Table.  As each field is added, the record become longer.  This is not typically a desired GenevaERS output.

<div style="clear: right" >

## Column Referencing Logic Example

<img style="float: right;" width="50%" vspace="5" alt="Column Referencing Logic Example" src=images/Module21-The_Write_Function/Module21_Slide15.jpeg title="Column Referencing Logic Example"/>

Alternatively, the Write Verb is often placed only in the last column of the view, thus acting upon the extract record after all columns have been built.  In order to change pervious columns, the logic text can reference those columns specifically.  Thus values in prior columns can be manipulated within the last column, prior to use of the Write Verb.

```
Column=CustID
Column=TranDate
```
No Logic in Column 3, only output column format specifications, followed by this logic in Column 4

```
Column.3=ProdID1
Column 4=Amount1
Write(Source=Data)

Column.3=ProdID2
Column.4=Amount2
Write(Source=Data)

Column.3=ProdID3
Column.4=Amount3
Write(Source=Data)
```
This example again attempts to break the array into multiple records.  

Because logic text can refer to previous columns, logic can be placed in column four which changes the value of column 3.  Thus 

- Both the Product ID and the Amount fields are set in column 4, and then a record is written.  

- Then these values are overwritten by the next Product ID and Amount combination, and another record is written.  

- Finally the last two fields are moved, and the last record written.  

This is a more common design of a view containing multiple Write Verbs.

<div style="clear: right" >

# Write Verb vs. Multiple Views

<img style="float: right;" width="50%" vspace="5" alt="Write Verb vs. Multiple Views" src=images/Module21-The_Write_Function/Module21_Slide16.jpeg title="Write Verb vs. Multiple Views"/>

Let’s take a moment and contrast the prior view with multiple write statements in one view, with using multiple views.  Because each view contains its own implicit Write function, by writing multiple views we could break apart the array.  To do so, the first view would reference the 1st array fields, Product and Amount 1; the second view the 2nd set of fields, and the third the 3rd set of fields.  Thus by reading one event file record, three extract records would be written.

The downside of this approach is that the logic to populate fields 1 and 2, the Customer ID and Tran Date, would be replicated in all three views; changes to these fields would need to be made in three places.  

<div style="clear: right" >

# Function Overview

<img style="float: right;" width="50%" vspace="5" alt="Sample Logic Table for Write Functions" src=images/Module21-The_Write_Function/Module21_Slide17.jpeg title="Sample Logic Table for Write Functions"/>

Using the Write Function keywords, any of the WR functions can be generated in a logic table.

- WRIN - Write (copy) the input record to the extract file
- WRDT - Write the "DT" Data area of the extract file
- WRXT - Write a standard extract record to the extract file
- WRSU - Write an extract time summarized record to the extract file

In these example logic tables, a standard extract only view without a Write Verb is shown on the left.  This view has one WR function, as the last function in the logic table.

The logic table on the right shows the write verb, with Source=Data, has been coded multiple times in logic text.  

Note that the sequence number is 001, meaning all these write verbs are contained in the logic text of column 1.  Each of the logic table functions immediately preceding these WRDT functions may modify the extracted data during the Extract Phase.  Each will result in a different extract record being written to the extract file.

[Click here to access the list of the most common Logic Table Functions for reference.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" > 

