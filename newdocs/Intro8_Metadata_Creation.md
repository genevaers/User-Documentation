---
title: Introduction to GenevaERS Metadata Creation
nav_order: 10
---

# Introduction to GenevaERS Metadata Creation

This page provides an overview of the GenevaERS metadata creation process, including  logical records and files, physical files, and methods for creating and then associating logical records, logical files, and physical files.  It will help you:
- Create physical file definitions 
- Create logical file definitions 
- Associate physical files with logical files 
- Create logical record definitions, and
- Associate logical files with logical records


<div style="clear: right" >

# Metadata Overview

<img style="float: right;" width="50%" vspace="5" alt="Metadata Overview" src=images/Module9-Metadata_Creation/Module9_Slide3.jpeg title="Metadata Overview"/>

This module describes creation of logical records, logical files, and physical files. Simple GenevaERS processes typically include the use of the following:
- A logical record to describe the input record 
- A logical file to describe a group of input files
- A physical file to describe an input file 

Specifying a logical file and a physical file for output is optional. 

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Metadata: PF, LF, and LR" src=images/Module9-Metadata_Creation/Module9_Slide4.jpeg title="Metadata: PF, LF, and LR"/>

Recall from an earlier lesson that: 
- A physical file definition describes a data source. Examples include customer files and order files. 
- A logical file definition describes a collection of one or more physical files. 
- A logical record definition, or LR, describes a record layout. In COBOL programs, record layouts are often found in copybooks. In relational databases, they are found in table definitions. 

<div style="clear: right" >

# Physical Files

<img style="float: right;" width="50%" vspace="5" alt="Metadata: Physical File" src=images/Module9-Metadata_Creation/Module9_Slide5.jpeg title="Metadata: Physical File"/>

To create a physical file, you begin by opening the Administration menu, selecting New, and then selecting Physical File. To select and edit an existing physical file, click the Physical File icon in the navigation pane, and then double-click the appropriate physical file to select it from the list.

<div style="clear: right" >

## Name

<img style="float: right;" width="50%" vspace="5" alt="Physical File – Named" src=images/Module9-Metadata_Creation/Module9_Slide6.jpeg title="Physical File – Named"/>

Begin by giving the physical file a descriptive name. All GenevaERS components must be uniquely named within an environment. The names may be up to 48 characters long, starting with a letter, and composed of letters, numbers, and the underscore (_). 

It is a good practice to add an underscore and the letters “PF” at the end of the name. This is not required, but it helps differentiate physical files from similarly named logical files and logical records. Typical names would be “CUSTOMER_PF,” “ORDER001_PF,” and “US_SALES_PF.”

<div style="clear: right" >

## File Type

<img style="float: right;" width="50%" vspace="5" alt="Physical File – File Type" src=images/Module9-Metadata_Creation/Module9_Slide7.jpeg title="Physical File – File Type"/>

Next, open the File Type list. Most GenevaERS processes use disk files. Select Tape File only when GenevaERS high-speed tape processing is required. Pipes and tokens are special internal GenevaERS virtual files that are never written to disk or tape. Find out more about them in the “Physical File” subsection of the “Metadata” section of the GenevaERS help documentation, which can be opened from the Help menu of the Workbench. 

<div style="clear: right" >

## Access Method

<img style="float: right;" width="50%" vspace="5" alt="Physical File – Access Method" src=images/Module9-Metadata_Creation/Module9_Slide8.jpeg title="Physical File – Access Method"/>

Next, open the Access Method list. Again, typical GenevaERS processes use sequential - standard access. Information about other types of access methods can be found in the GenevaERS help documentation.

<div style="clear: right" >

## Exits

<img style="float: right;" width="50%" vspace="5" alt="Physical File – Exits" src=images/Module9-Metadata_Creation/Module9_Slide9.jpeg title="Physical File – Exits"/>

The Read User-Exit Routine field, the parameters field, and the Comments field are optional. Read user-exits are custom-developed programs called by the Extract Engine to read data from files for input to GenevaERS, rather than the engine reading the files directly. Parameters may be passed to the exits when they are called. 

<div style="clear: right" >

## SQL

<img style="float: right;" width="50%" vspace="5" alt="Physical File – SQL" src=images/Module9-Metadata_Creation/Module9_Slide10.jpeg title="Physical File – SQL"/>

If source data resides in an IBM® DB2® database, the “DB2 via SQL” access method or the “DB2 via VSAM” access method is chosen. This SQL section of the Physical File tab allows you to define the DB2 connection. Details about how to set up a DB2 connection can be found in the GenevaERS help.

<div style="clear: right" >

# Data Set Input

<img style="float: right;" width="50%" vspace="5" alt="Physical File – Data Set Input" src=images/Module9-Metadata_Creation/Module9_Slide11.jpeg title="Physical File – Data Set Input"/>

The Dataset tab allows for specification of the input and output parameters for physical files. For input data sets, GenevaERS processes typically use the input DD name. This 8-character name should match what is placed in the JCL for the Extract phase step of the Performance Engine.

The data set name (or DSN), read disposition (or ReadDISP), and record length parameters are optional. If the actual fully qualified data set name is provided and the input DD name is not found in the JCL, the Extract Engine attempts to dynamically allocate this file. If no disposition is specified here, it defaults to Share. 

<div style="clear: right" >

## Data Set Output

<img style="float: right;" width="50%" vspace="5" alt="Physical File – Data Set Output" src=images/Module9-Metadata_Creation/Module9_Slide12.jpeg title="Physical File – Data Set Output"/>

The Output DD Name field enables you to specify the DD name that will receive output from a view. The other output data set parameters, which correspond to typical JCL file parameters, may be used for dynamic file allocation. Depending upon your operating system configuration, the Performance Engine may not be able to dynamically allocate output files.

<div style="clear: right" >

## Associated Logical Files

<img style="float: right;" width="50%" vspace="5" alt="Physical File – Associated Logical Files" src=images/Module9-Metadata_Creation/Module9_Slide13.jpeg title="Physical File – Associated Logical Files"/>

When the physical file is saved, it is assigned a unique GenevaERS ID. The time stamps show when the file was created, and when it was last updated.

Physical files are contained within one or more logical files. A list of the associated logical files is presented on this screen for reference. The association of a physical file with a logical file can be done on the Logical File screen, which will be shown later. 

<div style="clear: right" >

# Logical Files

<img style="float: right;" width="50%" vspace="5" alt="Logical File" src=images/Module9-Metadata_Creation/Module9_Slide14.jpeg title="Logical File"/>

Depending on how Workbench security is set up, the Workbench menu bar displays either the Administration menu (for system administrators) or the Components menu (for non-administrators). To create a logical file, you begin by opening the Administration or Components menu, selecting New, and then selecting Logical File. To select and edit an existing logical file, click the Logical File icon in the navigation pane and then double-click the appropriate logical file to select it from the list.

<div style="clear: right" >

## Name

<img style="float: right;" width="50%" vspace="5" alt="Logical File – Name" src=images/Module9-Metadata_Creation/Module9_Slide15.jpeg title="Logical File – Name"/>

Remember that a physical file definition must have a unique name. A logical file definition must also have a unique name. The name may be up to 48 characters long, starting with a letter, and composed of letters, numbers, and the underscore (_). 

It is a good practice to add an underscore and the letters “LF” at the end of the name. This is not required, but it helps differentiate logical files from similarly named physical files and logical records. Typical names are “CUSTOMER_LF,” “ORDER_LF,” and “SALES_LF.” 

You can use the Comments field to describe this logical file and its purpose.

<div style="clear: right" >

## Physical File Association

<img style="float: right;" width="50%" vspace="5" alt="Logical File – Physical File Association" src=images/Module9-Metadata_Creation/Module9_Slide16.jpeg title="Logical File – Physical File Association"/>

Logical files are associated with one or more physical files. To make the association, click Add and select the physical file to be associated. After you click OK, the physical file is displayed in the Associated Physical Files area.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Logical File – Physical File Association" src=images/Module9-Metadata_Creation/Module9_Slide17.jpeg title="Logical File – Physical File Association"/>

If we return now to the Physical File screen that we were discussing a few slides ago, we can see that the association is also shown here. In this case, CUSTOMER_LF is displayed as a logical file associated with the CUSTOMER_PF physical file. 

<div style="clear: right" >

## Associated LRs

<img style="float: right;" width="50%" vspace="5" alt="Logical File – Associated LRs" src=images/Module9-Metadata_Creation/Module9_Slide18.jpeg title="Logical File – Associated LRs"/>

After you save the logical file for the first time, an ID is assigned and the time stamps are updated. 
The records in logical files can be described by many logical records. A list of the associated logic records is presented on this screen for reference. You can associate a logical file with an LR on the Logical Record screen. You must first define an LR before you make the association.

<div style="clear: right" >

# Logical Record

<img style="float: right;" width="50%" vspace="5" alt="Logical Record" src=images/Module9-Metadata_Creation/Module9_Slide19.jpeg title="Logical Record"/>

To create a logical record, open the Administration or Components) menu, New, and then select Logical Record. To edit an existing logical record, select Logical Record in the navigation pane and then select the existing LR from the LR list.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Logical Record Properties" src=images/Module9-Metadata_Creation/Module9_Slide20.jpeg title="Logical Record Properties"/>

Logical records must be given a name. As with PF names and LF names, an LR name may be up to 48 characters long, starting with a letter, and composed of letters, numbers, and the underscore (_). 

Select Logical File for the type because this LR will be associated with a logical file. All LRs are inactive until they contain at least one field.

The lookup user-exit routine and parameters are used for custom-developed routines that are called instead of doing a lookup.

<div style="clear: right" >

## Fields

<img style="float: right;" width="50%" vspace="5" alt="Logical Record Fields" src=images/Module9-Metadata_Creation/Module9_Slide21.jpeg title="Logical Record Fields"/>


Click the LR Fields tab. The grid on this panel is used to create and maintain field definitions. Fields are defined with names, data types, start positions and lengths, and numbers of decimal points. All the data types discussed in the “I/O Processing and Data Types” module of this training course are available for each field. 

To begin, select Add Field from the Edit menu. Then click the Add Field icon (the plus sign) on the Logical Record Editor toolbar or press Alt+Insert. This enables you to fill in values to complete the field definition. As with LR names, a field name may be up to 48 characters long, starting with a letter, and composed of letters, numbers, and the underscore (_). 

<div style="clear: right" >

## Keys and Global Fields

<img style="float: right;" width="50%" vspace="5" alt="Logical Record Keys and Global Fields" src=images/Module9-Metadata_Creation/Module9_Slide22.jpeg title="Logical Record Keys and Global Fields"/>

When you save the logical record, the system automatically assigns a field ID to each field definition. 

For a logical record to be the target of a join, you must define the structure of the primary key. The primary key can be composed of one or more fields. Click in the Primary Key cell for the first field in the key, and select 1. Select 2 for the second field in the primary key, and continue in this way until all key fields are defined. 
The total length of all key fields in the LR is shown in the Total Key Length field. 

<div style="clear: right" >

## Redefines

<img style="float: right;" width="50%" vspace="5" alt="Logical Record Redefines" src=images/Module9-Metadata_Creation/Module9_Slide23.jpeg title="Logical Record Redefines"/>

Typically, as fields are added, the start position of the new field begins at the end position of the last added field. However, you can set field positions to overlap, using the Redefines check box. This check box allows modification of the Fixed Position field. 

Use the number in the Total Length field to ensure that the length of the LR is correct when adding redefined fields. 

In this example, the customer date of birth year and month field starts at the same position as the full customer date of birth field. 

<div style="clear: right" >

## Other Fields

<img style="float: right;" width="50%" vspace="5" alt="Logical Record Other Fields" src=images/Module9-Metadata_Creation/Module9_Slide24.jpeg title="Logical Record Other Fields"/>

Scrolling right on the grid reveals additional field attributes that can be assigned. The Date/Time Format field designates how the date is stored in fields, if applicable. A check mark in the Signed check box indicates that the field contains valid sign data. If this field is used as a column in a view, the headings entered here (1,2, & 3) are used as the headings for the column in that view.

<div style="clear: right" >

## Logical File Association

<img style="float: right;" width="50%" vspace="5" alt="Logical Record - Logical File Association" src=images/Module9-Metadata_Creation/Module9_Slide25.jpeg title="Logical Record - Logical File Association"/>

After you enter the field definitions, you click the Associated Logical Files tab. On this tab, you define which logical records contain records in the layout of the LR. Click Add and then select the logical files to be associated. After you click OK, the list is updated with the associated logical file.


<div style="clear: right" > 

