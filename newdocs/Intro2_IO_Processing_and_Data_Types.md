---
title: IO Processing and Data Types
nav_order: 4
---

# Introduction to the GenevaERS IO Processing and Data Type

This page explains GenevaERS IO Processing and Data Types.  It will help you:
- Describe a logical record, and demonstrate its use
- Describe the attributes of a view column definition
- Name the various data formats that GenevaERS can read and write, and
- Locate the input and output DD names in the metadata, and update the Extract phase JCL to include these names

# Input and Output Overview
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="IO Overview" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide3.jpeg title="IO Overview"/>

To briefly review GenevaERS components, the Performance Engine reads source data using definitions in the GenevaERS Metadata Repository, and produces outputs. Logical records describe the inputs to the Performance Engine. The view definitions define the outputs, using the columns to specify the fields. Most outputs from GenevaERS are data files; however, GenevaERS is able to produce printable reports as well.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Logical Record" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide4.jpeg title="Logical Record"/>

A logical record is similar to a COBOL copybook. It describes the input record structure, defining each field, the data it contains, and the format of that data. The Performance Engine reads input logical records, extracting data from fields to produce various outputs. It can transform the format of input fields depending upon the outputs required.

# Input or Constant Value Specification

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="Constants" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide5.jpeg title="Constants"/>

The value placed in the output field is defined by the column source properties. Output formats are defined by the column properties. 

In this example, the constant with the value of 1234567890 will be written as a 10-byte zoned decimal field in position 11 of the file.

Zoned decimal format will be described later in this page.

<div style="clear: right" > 

## Column Definition – File Output Attributes
<img style="float: right;" width="50%" vspace="5" alt="Column Attributes" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide6.jpeg title="Column Attributes"/>

The start position is calculated, and indicates where that field will be placed in the output file. It is dependent upon the length of prior columns. The data type, date/time format, decimal places, and visible and signed indicators are primarily important in views that produce files. 

<div style="clear: right" > 

## Column Definition – Hardcopy Attributes

<img style="float: right;" width="50%" vspace="5" alt="Harcopy Attributes" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide7.jpeg title="Hardcopy Attributes"/>

The highlighted attributes are primarily important for views that produce hardcopy reports. The column headings are actually printed on hard copy reports. In views that produce files, the headings are often used to document notes about the column. The other parameters will be detailed more in a later module.

<div style="clear: right"> 

# Column Definition – Data Types

<img style="float: right;" width="50%" vspace="5" alt="Column Definition" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide8.jpeg title="Column Definition"/>

The Performance Engine transforms data into numerous different types, many of which are not available as standard formats in COBOL or other languages. The choice of this attribute affects other column attributes, such as length, sign, decimal place, and mask, and thus is very important in building file output views. The following slides will help you understand how values are stored.

<div style="clear: right" > 

## Column Definition – Hex Display

<img style="float: right;" width="50%" vspace="5" alt="Hex Display" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide9.jpeg title="Hex Display"/>

To understand these data types, we’ll use hexadecimal display or “hex” for short, to highlight differences between each data type. The example here is the zoned decimal formatted number 1234567890. In most mainframe editors, hex can be displayed by using the command hex or set hex while viewing file contents. The first line shows the display value. Below each character, two digits, one on top of the other, show the hexadecimal values. Note that a number can be stored in just one hexadecimal position.

<div style="clear: right" > 

### Column Definition – Signed and Unsigned

<img style="float: right;" width="50%" vspace="5" alt="Signed and Unsigned" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide10.jpeg title="Signed and Unsigned"/>

The Signed check box determines whether a sign is stored with the number. In the example hex display for a zone decimal field type, an F means no sign is stored, a C means the number is positive, and a D means it is negative. The location of this sign, and in some cases, the actual value for positive and negative, is dependent on the data type.

All the data types discussed on the following slides can be defined as either input (in the logical record) or as output (in the view).

<div style="clear: right" > 

### Data Types – Alphanumeric

<img style="float: right;" width="50%" vspace="5" alt="Alphanumeric" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide11.jpeg title="Alphanumeric"/>

The tables here and on the following slides show the output value for different data types. Alphanumeric is a general format, but it cannot be used to maintain the sign of numbers. It is the same as a PIC X variable type in COBOL. It is the only format applicable for text data. The contents can be read in data files, but at the cost of wasted storage for numbers. 

<div style="clear: right" > 

### Data Types – Zoned Decimal

<img style="float: right;" width="50%" vspace="5" alt="Zoned Decimal" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide12.jpeg title="Zoned Decimal"/>

Zoned decimal is a general format for storing numbers with a sign indicator. It is the same as a PIC 9 or PIC S9 variable in COBOL. If the Signed checkbox is selected, a sign is stored in the top last hex position of the number, which makes the display version of the number unreadable. In this example, the sign is an opening brace. So, although the data is generally readable, it still requires more storage for numbers than other formats require.

<div style="clear: right" > 

### Data Types – Packed

<img style="float: right;" width="50%" vspace="5" alt="Packed" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide13.jpeg title="Packed"/>

The packed data type stores the number in a more compressed form and is commonly used in many languages, such as COBOL, where it is a COMP 3 variable. Because it is compressed, numbers can only be read in hex mode, each digit taking one hex position. The last hex position is reserved for the sign, regardless of whether the Signed checkbox is selected. Selecting the Signed checkbox determines whether “C” for positive or “D” for negative is placed in the position for the sign.

<div style="clear: right" > 

### Data Types – Binary

<img style="float: right;" width="50%" vspace="5" alt="Binary" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide14.jpeg title="Binary"/>

Binary numbers are not naturally readable.
Input constant = 1234567890
Binary is also a common compressed format, defined in COBOL as a COMP variable. Because binary format is compressed, the Signed checkbox has no impact on positive numbers.

Binary format is even more compressed than packed, and cannot be read without a conversion tool, such as a scientific calculator with hex mode. 

<div style="clear: right" > 

### Data Types – Masked and Edited Numeric 

<img style="float: right;" width="50%" vspace="5" alt="Masked and Edited Numeric" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide15.jpeg title="Masked and Edited Numeric"/>

GenevaERS provides two other masked formats, masked numeric and edited numeric. Both are similar to a masked, printable COBOL variable. The sign becomes a dash, which is not appropriate for subsequent processing on the mainframe. 

After selecting the masked numeric data type in a column, you can can also select the specific mask to apply. 

In the edited numeric format, a fixed mask is used, with no commas or leading spaces. This format is often used when preparing files for transfer to another platform for continued processing.

<div style="clear: right" > 

### Other Data Types 

<img style="float: right;" width="50%" vspace="5" alt="Other Data Types" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide16.jpeg title="Other Data Types"/>


The following data types have no COBOL equivalent.

- Binary Coded Decimal (BCD)
Input constant = 1234567890
Users can define three other data types: binary coded decimal, sortable packed, and sortable binary. None of these data types have a COBOL equivalent. 

- Despite its name, binary coded decimal is not binary. It is more like packed, without a reserved place for the sign. It is often used to store dates and times. 

- Sortable packed and sortable binary can be sorted from large negative numbers, descending to zero, and continue to large positive numbers. Negative numbers in both these formats are difficult to decipher without a technical aid.

<div style="clear: right" > 

## Column Definition

### Masks, Decimals, and Signs 

<img style="float: right;" width="50%" vspace="5" alt="Column Definition – Masks, Decimals, and Signs" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide17.jpeg title="Column Definition – Masks, Decimals, and Signs"/>

Masks override any value in the decimal field, regardless of whether the Signed checkbox is selected. In this example, the parentheses on the mask are used for negative numbers, and the output is signed even though the Signed checkbox is not selected. The mask has two decimal places, not the one decimal place defined in the Decimal Places field.

The Performance Engine aligns the decimal points from the input with the output and truncates or zero-pads if necessary. In this example, the input constant has three digits after the decimal place, but the mask has only two. The last digit is truncated in the output, and the negative constant is reflected in the parentheses.

<div style="clear: right" > 

### Other Decimal Places

<img style="float: right;" width="50%" vspace="5" alt="Other Decimal Places" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide18.jpeg title="Other Decimal Places"/>

Zoned decimal, packed, binary, and binary coded decimal all have implicit decimals. The output will have no explicit decimal point. However, again the Performance Engine aligns decimal points from input to output and fills with zeros if necessary.

In this example, the constant has three decimal points, but the output column specifies only one. Thus the final two digits, the 9 and 0, are truncated in the output.

<div style="clear: right" > 

### Field Attributes

<img style="float: right;" width="50%" vspace="5" alt="Field Attributes" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide19.jpeg title="Field Attributes"/>

In this example, we have replaced the constant input with a source field input. When the value of this field is moved from the input to the output, it will be transformed. It will be read as a 6-byte packed field and written as a 14-byte zone decimal. It will also have two decimal points added to it. 

Note that you convert from one data type to another, the column widths may have to change. In this example, if the input 6-byte packed field were placed in a 6-byte zoned decimal output field, five digits would be truncated. On the other hand, if an input zoned decimal field is placed in a packed output field of the same size, space will be wasted.

<div style="clear: right" > 

### Field Limits

<img style="float: right;" width="50%" vspace="5" alt="Field Limits" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide20.jpeg title="Field Limits"/>


This table shows the field limits for the different fields, and the number of decimals allowed in each field format. Each decimal place counts as a space in the maximum value of the number. For example, a packed field can be up to 31 digits in length, composed of 30 digits to the left and 1 digit to the right of the decimal point, or 22 digits to the left and 9 decimal places.

Note that, for the edited and masked numeric formats, the field length may be 256 bytes, but the practical limit is 31 digits for any data involved in a calculation, subtotal, data type transformation, or masking.


<div style="clear: right" > 

### Date/Time Format

<img style="float: right;" width="50%" vspace="5" alt="Date/Time Format" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide21.jpeg title="Date/Time Format"/>

The Date/Time Format field further describes how dates and times are stored within the field. This enables certain date functions within GenevaERS. 

In this example, we’ve added a date column to the prior view. The source contains the date in CCYYMMDD format, but the column output specifies a DD/MM/CCYY format. The Performance Engine moves the day from the last position to the first. 

Note that, because the output requires slashes in the date, the column is a 10-byte field, not the 8 bytes on input.

<div style="clear: right" > 

# Connecting the View to the JCL


### Finding the Logical File for the View

<img style="float: right;" width="50%" vspace="5" alt="Finding the Logical File" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide22.jpeg title="Finding the Logical File"/>

DD names connect logical records and views to actual physical files read by the Performance Engine. 

To find the DD name associated with an LR, we must first locate its associated logical file. The logical record for the view is shown in the View Source cell. Open the view in the Workbench and click in the blue View Source cell. The View Source Properties frame opens and displays the logical file, which in this case is ORDER_001.

<div style="clear: right" > 

### Displaying the Logical and Physical Files

<img style="float: right;" width="50%" vspace="5" alt="Finding the Physical File" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide23.jpeg title="Finding the Physical File"/>

To display logical and physical files, follow these steps:
- Step 1: To see a list of all logical files, click the Logical File icon in the Navigator pane. The Logical File list opens.  
- Step 2: Scroll down the list until you find the ORDER_001 logical file, and then double-click the file name. The Logical File Editor opens. 
- Step 3: Find the physical file associated with this logical file by looking in the Associated Physical Files section of the page. The physical file here is named ORDER_001, which just happens to be the same as the name of the logical file.

<div style="clear: right" > 

### Finding the Physical File and Input DD Name

<img style="float: right;" width="50%" vspace="5" alt="Finding Input DD Name" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide24.jpeg title="Finding Input DD Name"/>

To display the physical file and Input DD name, follow these steps:
- Step 1: Click on the Physical File icon in the Navigator pane. A list of all physical files is displayed.
- Step 2: Scroll down the list until you find the ORDER_001 physical file, and then double-click the file name. The physical file is displayed.
- Step 3: To find the input DD name associated with this physical file, look in the Dataset section of the frame, and then the Input subsection. The input DD name in this case is ORDER001. 

<div style="clear: right" > 

### Specifying the Source Files in the JCL

<img style="float: right;" width="50%" vspace="5" alt="JCL Input DD Name" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide25.jpeg title="JCL Input DD Name"/>

Now that you know that your view retrieves data from the DD name ORDER001, make sure that a DD statement for ORDER001 is included in your JCL and is referencing the appropriate data set. 

Next let’s find the DD name for the output file.

<div style="clear: right" > 

### Displaying Extract Phase Properties

<img style="float: right;" width="50%" vspace="5" alt="Extract Properties" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide26.jpeg title="Extract Properties"/>

View output is written to the physical file listed in the view properties. If the view does not require the Format phase, find the output DD name to place in the JCL by opening the view in the Workbench, navigating to the View Properties tab and clicking the Extract Phase tab. 

Next, find the physical file in the Output File section of the tab. If the physical file value is blank, a new DD name will be generated at runtime. This name will consist of the letter “F” followed by the last seven digits of the view number, using leading zeros if required. If the physical file value is not blank, you must find the output DD name associated with the physical file. In this example, the output physical file is OUTPUT01.

<div style="clear: right" > 

### Displaying the Output Physical File

<img style="float: right;" width="50%" vspace="5" alt="Format Phase Properties" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide27.jpeg title="Format Phase Properties"/>

Find the DD name for physical file OUTPUT01 by selecting Physical Files from the Navigator pane and then scrolling down in the Physical File list until you find the OUTPUT01 physical file. Double-click the file name. 

The Physical File Editor frame for OUTPUT01 opens. 

Find the output DD name associated with this physical file by looking in the Dataset section of the frame and then looking in the Output subsection. The output DD name in this case is OUTPUT01, which happens to be the same as the physical file name, but this isn’t always the case.


<div style="clear: right" > 
<img style="float: right;" width="50%" vspace="5" alt="Format Phase DD Name" src=images/Module3-IO_Processing_and_Data_Types/Module3_Slide28.jpeg title="Format Phase DD Name"/>

Specifying the View Output Files
Now that you know that your view writes data to the DD name OUTPUT01, make sure that a DD statement for OUTPUT01 is included in your JCL and is referencing the appropriate data set. 




<div style="clear: right" > 

# Links

Place following text in the topic:  
    ````
    [Topic A](TopicA)
    ````

The link displays as:   
[Topic A](TopicA)