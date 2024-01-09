---
title: Introduction to User Exits
nav_order: 21
---

# Introduction to User Exits

This page provides you with more information about GenevaERS User Exits.  It will help you to: 
- Describe uses for SAFR user-exit routines 
- Read a Logic Table and Trace which use exits 
- Explain the Function Codes used in the example
- Debug views using exits  

In this page, we examine the following Logic Table Functions:
- REEX - Read a new source Record with a user exit
- LUEX - Lookup calling a user exit
- WR* with user-exit - All Write functions calling a user-exit

 [Prior Logic Table Functions Codes can be located here.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" >

# GenevaERS Performance Engine

Let’s briefly review the GenevaERS Performance Engine processes.

<div style="clear: right" >

## Metadata and View Creation

GenevaERS begins by developers creating metadata describing records, files, fields, relationships between files and fields, and user exits which might be called to perform processing in the Workbench.  They then create views, which specify the logic to be applied to the data through the scan processes.  The metadata and the views are managed in the GenevaERS repository using the Workbench, then exported into an XML format, awaiting the start the Performance Engine. The exported XML files can be managed using any source control tool, if required.

<div style="clear: right" >

## Run Control Phase

The first part of the Performance engine creates the files required for the reference phase and the extract phase.  It reads the data provided in the GenevaERS XML files, performs optimization logic, then creates a VDP, View Definition Parameter file, a JLT, Join Logic Table, and XLT, Extract Logic Table. The JLT is required for the Reference File Phase, and the XLT for the Extract Phase. The logic tables contain the functions codes described in this and the prior pages.

<div style="clear: right" >

## Reference Phase

The Reference File Logic Table is used to extract a core image file from the reference files.  The Reference File Logic Table does not contain any selection logic, thus it does not remove any rows of data.  Rather, the core image file contains only those fields needed to be loaded into memory for lookups, plus the keys required for the lookup processes and any effective dates.

<div style="clear: right" >

## Extract Phase

The Extract Phase begins by loading the VDP, Extract Phase Logic Table and Reference Data from disk.  It then uses the logic table to generate highly optimized reenterant machine code. It opens the output (extract) files. It opens the source files, each one in a new thread, and executes these threads in parallel.  Each source file record is read and processed through the logic table, performing lookups, functions, and calling user exits as required, then writing data to the output extract files. 

The Extract Phase includes multiple types of user exits, including read, write and look-up exits.

<div style="clear: right" >

## Format Phase

The format phase, which is optional depending on the view requirements, begins by sorting each extract file using a custom generated sort card based upon the sort criteria of the views written to that extract file.  During the final phase of sort processing—that which writes data to disk—the records are passed in memory to the format engine.  These records are formatted according to the VDP specifications.  The data is written to the final output file.

The Format Phase includes the Format Exit.  Sort utilities also allow creating sort input exits.

<div style="clear: right" >

# User Exit Overview

User exits, which can also be thought of as API points, are custom programs to perform functions GenevaERS does not do natively.  For example, GenevaERS does not perform an exponential mathematical calculation.  A customer could create a program to perform this function, and call it from GenevaERS to return the results of the calculation.

As noted, GenevaERS has four major points which can invoke a user exit, read, lookup, write and format exits.  The first three are Extract Phase exits, and are used much more frequently than the fourth Format Phase exit.  They are:

- Read Exits stand between the actual input source file and the GenevaERS views.  These exits can modify input records to be presented to GenevaERS threads for processing. 
- Lookup Exits stand between GenevaERS views and the look-up data loaded into memory.  Lookup exits accept lookup parameters and return looked up records in response to individual lookups. These exits can also be used as simple function calls which do not actually perform any lookup.  For example, the exponential calculation discussed above could be written as a lookup exit.
- Write Exits stand between GenevaERS and the extract files.  They receive extract records and can manipulate them before being written to extract files.  
- Format Exits, the only GVBMR88 exit, accepts summarized and formatted Format Phase output records prior to being written to files. Format exits are very similar to write exits, except that the record used is the final output record, rather than the extract record.  

At the end of this page we will touch on a non-GenevaERS exit, the Sort Input Exits.

<div style="clear: right" >

## Read Exit Functionality

Read exits sit between the extract engine, and the input source file. The GenevaERS generated machine code satisfying the views, is only aware of the virtual file which is output by the read exit. Read Exits are assigned to a physical file, and are associated with the REEX logic table function.

Examples of read exits that have been written for GenevaERS applications include:
- Read a specialized database structure and extract records to be passed to GenevaERS
- Merge multiple sequential files and compare snap shot records with the history file into a single master file, then used to produce reports
- Process sets of records, and perform functions across the entire set, where one record can affect other either later, or earlier records.  GenevaERS does not easily perform these functions in view.  After all affects are determined and applied, the file is passed to GenevaERS for report generation.

Read exits are typically the most complex to write, because they must perform some IO of some kind.  They are further complicated because it is very inefficient to call a read exit for each record; so instead they are usually written to do block level processing.

<div style="clear: right" >

## Look-up Exits Functionality

Lookup exits sit between the extract engine, and a potential lookup file. The GenevaERS views are only aware of the virtual lookup record returned by the lookup exit. A sample application could be doing direct reads to a database table to retrieve a reference value for processing.  However, most often lookup exits do not actually load any data from disk; rather they simply use input parameters passed to them by the views to do some function. Thus the exit is basically a simple function call.  

Look-up exits are the easiest type of exit to create. The parameters passed to the lookup exit are the values placed in the fields of the lookup key. These can be constants, fields from the source file, or fields from another lookup, including calls to other exits. The output from the lookup exit is a record that must match the LR for the “reference file” record it is to return.  Although it appears to a GenevaERS developer as if GenevaERS has taken the keys and performed a search of a reference table to find the appropriate record, the exit may have done no such thing.  In fact, it could do something as simple as reordering the fields passed to it and returning the record.

Lookup Exits are assigned to a target lookup LR.  When used, the typical LUSM functions are changed to LUEX functions. The exit is called each time the LUEX function is executed.

<div style="clear: right" >

## Write Exit Functionality

Write exits sit between the extract engine, and a potential extract or output file. Each write exit is tightly coupled to it’s GenevaERS view, because the exit receives the view output. Extract exits are called whenever a view is ready to write an extract record. In addition to the view’s extract record the write exit has access to the current source record. 

Write exits are defined in the WRITE statement within a view.

The write exit can tell GVBMR95 to do any one of the following:
- Tell GVBMR95 to write a record the exit specifies (could be any record), and continue with source file processing
- Tell GVBMR95 to skip this extract record and go on
- Tell GVBMR95 to write a record the exit specifies (could be any record) and return to the exit to do more processing

The exit can manipulate the extract record; substitute a new record, table the extract record in some way and then dump the table at the end of source file processing, or any other number of things. Note, though, that unlike read exits which do open and actually read files, write exits typically do not. They return records to GenevaERS to write to the extract file. They could do their own IO, but there is typically no benefit to doing so. GenevaERS’s write routines are very efficient.

Some examples of write exits include the following:
- Table multiple records, summarize them if they have common sort keys, and write a record when the key changes. 
- Read a set of parameters giving scoring requirements, table multiple records and upon a key change, score records.  Create a completely new record with the scoring results, write this new record, and drop all the tabled records.
  
Write exits are in between read and lookup exits for complexity. Write exits must know what the extract record will look like for a particular view. A LR representing the output of a view can be generated using the Workbench.

The write functions WRDT, WRXT, WRIN, WRSU do not change when a user exit is specified.

<div style="clear: right" >

## Format Exit Functionality

Format exits are very much like write exits, except that they are called at the end of GVBMR88. They are also dependent upon the view specification.  They are called for each format output record.  Like write exits, they are specified on each view. They are specified only in the VDP; there is no logic table impact for them.

<div style="clear: right" >

## Metadata Setup

### User-Exit Routine

Exits require a definition that can be added using the User Exit-Routine screens within the Workbench. The name can be anything desired. The type can be either Read, Lookup, Write, or Format. The language must be defined. The executable must match the load page name stored within an accessible loadlib for either GVBMR95 or GVBMR88. 
The Optimizable flag is only applicable for lookup exits. Remember that GenevaERS bypasses certain lookups when the lookup has already been performed. In these cases, the look-up exit would not be called in the subsequent cases. If the lookup exit is stateless, in other words, it does not function differently from one execution to another given the same input parameters, the exit can be optimized. If the exit retains its state from one call to another, then it must be called each time and cannot be optimized.

For example, one exit was written to detect the first time it was called for a particular source file record. In this case, it would return a return code of 0; every subsequent call would return a code of 1. This exit cannot be optimized; each potential call must actually call the exit.  Otherwise the exit would always return a code of 0.

<div style="clear: right" >

### Read Exits

Once the user exits are entered into the User Exit table, they can be assigned to the other appropriate metadata components. For Read Exits, the exit must be assigned to specific Physical File entities.

The data returned by the read exit must match the Logical Records that are associated with this physical file.

<div style="clear: right" >

### Look-up Exits

Standard lookups require the data that is referenced to be defined by an LR. For lookup exits, the data to be returned by the exit must also match a specific LR, and it is in this LR definition that the Lookup User-Exit routine is defined. Select the LR Properties tab, then select the appropriate User-Exit Routine from the drop down list. You can also specify Parameter data that will be passed to the Lookup User-Exit Routine.

When defining the logical record fields to be returned by the exit in the LR Fields tab, define any of the fields the exit will require as “keys,” as if the exit were going to search a reference file table to find the required answer. 

Next define a path that will provide the needed inputs to the exit (keys). The values in the path can be provided as constants in the views, or in the path, or as values passed from the source file or looked up from another reference table, requiring a multi-level look-up.

<div style="clear: right" >

### Write Exits

Write Exits are assigned in WRITE statements.

Write exits do not return data to GenevaERS views; therefore no logical record defines the outputs from these exits. The view columns define what this exit will receive, so changes to the view layout will affect write exits.

### Format Exits

Format User-Exits are assigned in view properties on the Format Phase tab.  

Again no logical record defines the outputs from Format User-exits. The view columns and format (file, hardcopy, etc.) define what these exits will receive.  Changes to the view layout will affect the exit.

<div style="clear: right" >

## Start-up (“Fixed”) Parameters

Each exit has the potential to receive a fixed set of parameters upon start up.  These parameters are assigned for each instance that an exit is invoked.  

For example, a lookup exit may function differently depending on which LR it is supposed to return; perhaps data can be returned in compressed format in one instance, and not in another.  The LR for the compressed data may pass in a start-up parameter of “CMPSD” and the uncompressed LR would pass in a start-up parameter of “UNCMPSD”.  In this way the same exit program can be used, and which LR should be returned can be indicated as a parameter to the exit.  


<div style="clear: right" >

## Exit Parameters

Read exits receive only the start-up parameters.  

Write and Format exits also receive start-up parameters; they also receive the extracted record from the view.  

Write exits also have visibility to the source file record.

Lookup exits, receive start-up parameters; they also have visibility to the source file record. Additionally, Lookup exits receive all the parameters built in the lookup path. These values must match the required key for the logical record.

Note the difference between these two types of parameters: 
- The start-up parameters do not change throughout the entire run of GenevaERS.  They are constant.  They are typically only used by the exit at start up to determine which mode the program should function in.
- The lookup key values can change based upon every source file record processed.  Customer ID 1 on the first record may become Customer ID 10,000 on the next record.  

<div style="clear: right" >

# Lookup Exit Example View

<img style="float: right;" width="50%" vspace="5" alt="Example View" src=images/Module20-User-Exit_Routines/Module20_Slide21.jpeg title="Example View"/>

We will use this view to show the GVBMR95 Logic Table and MR95 Trace.  Our example will use a lookup exit, which returns various thread parameters that can be of interest for technical reasons in a view.  The lookup exit has been assigned on the LR and path.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Look Up Exit Logic Table" src=images/Module20-User-Exit_Routines/Module20_Slide22.jpeg title="Look Up Exit Logic Table"/>

This is the logic table for the example view.  Note that lookups, which would normally have the function code of LUSM, have been changed to the function code of LUEX.  Also, for each LUEX, the ID associated with the User Exit is assigned, in this case, ID 13.  This is the ID assigned to the page GVBXLENV.  

Our path required a single character value be passed to the exit.  This “key” value—a constant of “D”—built by the LKC function, will be passed to the exit as part of the lookup.

<div style="clear: right" >

## Not Optimized

<img style="float: right;" width="50%" vspace="5" alt="Lookup Exit Trace, Not Optimized" src=images/Module20-User-Exit_Routines/Module20_Slide23.jpeg title="Lookup Exit Trace, Not Optimized"/>

This is the GVBMR95 Trace for the logic table.  

For source file record 1, the LKC function builds a key with a value “D” in it.  This value is passed to the exit GVBXLENV during the LUEX function.  The exit is called.  The view then uses the data, through a DTL function, placing a value 0001 into column 2.  GVBXLENV did not search any data.  It simply queried the GenevaERS thread number to return a value of 0001.  

Note the number of times the exit is called in this trace.  Each lookup actually required calling the exit.

<div style="clear: right" >

## Optimized

<img style="float: right;" width="50%" vspace="5" alt="Lookup Exit Trace, Optimized" src=images/Module20-User-Exit_Routines/Module20_Slide24.jpeg title="Lookup Exit Trace, Optimized"/>

This is the same view but a new trace.  In this trace the “Optimize” flag was turned on. This means that the logic table only has one executed LUEX function for the entire first source file record. Because the LKC value of “D” did not change between calls to the exit, the exit is not called again.  

<div style="clear: right" >

## Optimized vs Non-Optimized

<img style="float: right;" width="50%" vspace="5" alt="Optimized vs Non-Optimized" src=images/Module20-User-Exit_Routines/Module20_Slide25.jpeg title="Optimized vs Non-Optimized"/>

The difference between the logic tables for optimized and non-optimized is very clear. The Optimized trace on the right saves significant CPU time, including the overhead for linking to the user exit multiple times on each source file record.  Exits require CPU time by their nature, and the efficiency of the language run-time can also have an impact.  Efficiency should carefully be considered when creating any exit.

<div style="clear: right" >

## Static Parameters

<img style="float: right;" width="50%" vspace="5" alt="Static Parameters" src=images/Module20-User-Exit_Routines/Module20_Slide26.jpeg title="Static Parameters"/>

The trace shows the values placed in the key by the LKE, LKC and other lookup key functions, the value of “D” in our example view.  These parameters are passed to the lookup exit. It also shows the static parameters passed as well. These are shown on the end of the LUEX function row, after the Lookup Exit name.  Similar parameters can be seen in the trace for Read and Write exits if start-up parameters are passed.

<div style="clear: right" >

## Exit Program Specification and Linkage

Exits must be written following the GenevaERS User Exit guidelines. These specify a standard set of linkage parameters to interact with GVBMR95 and GVBMR88.

More details about how to create a user exit can be found in the [User Exit Programming Guide](UserExitGuide.md)

- Environment data, including the Phase Code, Open, Read, or Close, informing the exit what the status of processing is.  Exits are called during the 
    - Open phase, to prepare for processing, 
    - Read phase as event file records are processed, and 
    - Close phase, to print out control reports, flush final records, or clean up.

- Return codes values, informing GenevaERS of the results of processing.  These can include:
    - A Found, Not Found, or Skip Event Record condition on a Look-up Exit, 
    - An End of File on for a Read exit, or 
    - Write the standard extract record, Write a different record and then return to the exit for processing, or Skip the extract record and continue processing for Write Exits

All Exits may signal view or process level errors as well.

More details about how to create a user exit can be found in the [User Exit Programming Guide](UserExitGuide.md)

<div style="clear: right" >

## GenevaERS Standard Sort Exit

As noted earlier there is potential for a Sort Utility Input or Read Exit.  GenevaERS uses standard sort utilities provided with the operating system or otherwise.  These utilities typically allow for a read exit to the sort utility, a program which stands between the sort utility and the file to be sorted.  Procedures for writing these exits depend upon the sort utility used.  Refer to the sort utility documentation for instructions.

# Function Overview

<img style="float: right;" width="50%" vspace="5" alt="Function Overview" src=images/Module20-User-Exit_Routines/Module20_Slide29.jpeg title="Function Overview"/>

This page has introduced the following Logic Table Function Code:
- REEX - Read a new Source Record with a user exit
- LUEX - Lookup calling a user exit
- WR* with user exit - All Write functions calling a user exit

[Click here to access the list of the most common Logic Table Functions for reference.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" > 

