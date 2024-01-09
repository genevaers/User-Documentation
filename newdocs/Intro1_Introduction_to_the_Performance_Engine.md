---
title: Introduction to the Performance Engine
nav_order: 3
---

# Introduction to the GenevaERS Performance Engine

This page provides you with an introduction to the GenevaERS Performance Engine and how to use it, and will  help you:
- Identify the phases of the Performance Engine 
- Identify the main inputs and outputs for each phase
- Give a high-level overview of the reports from each phase 
- Run a Performance Engine job stream 

# GenevaERS Overview
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Overview" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide3.jpeg title="GenevaERS Overview"/>

As we noted in the “Introduction to GenevaERS Views," GenevaERS consists of two software components: a PC-based Workbench and a mainframe-based batch process known as the Performance Engine. Developers use the Workbench to build applications that are stored in a metadata repository in a database. These applications are then executed by the Performance Engine, which reads data from source files or databases, transforms it, and writes it to output files. In this sense, GenevaERS is an application development tool and is not fundamentally different from any other tool or language. 


# Performance Engine Phases
<img style="float: right;" width="50%" vspace="5" alt="GenevaERS Overview" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide4.jpeg title="GenevaERS Overview"/>

The Performance Engine comprises six phases: 
- The SELECT phase, where the desired views are selected from the Metadata Repository
- The COMPILE phase, where the selected views are converted to an executable form
- The LOGIC phase, where logic from multiple views is consolidated and optimized for execution
- The REFERENCE phase, where values are retrieved from lookup tables and optimized for execution
- The EXTRACT phase, where data from source files is retrieved, merged with lookup data, and transformed for output, and
- The optional FORMAT phase, where data is sorted, summarized, and formatted if necessary 


# Select Phase
 <img style="float: right;" width="50%" vspace="5" alt="GVBMR86" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide5.jpeg title="GVBMR86"/>

The primary GenevaERS program in the Select phase is GVBMR86 (The names of all programs in the GenevaERS Performance Engine start with the letters “GVB,” so it is common to refer to this program as MR86). MR86 reads a list of view numbers and finds the corresponding views in the GenevaERS Metadata Repository. It then processes these views and converts them to an Extensible Markup Language (or XML) file. It also produces a control report known as the MR86 Report, which indicates successful completion or displays errors that may have to be corrected before proceeding. 

## Specifying the View Number

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS JCL" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide6.jpeg title="GenevaERS JCL"/>

The view numbers for the desired views are placed in the JCL, using a DD name called VIEWLIST. In this example, we are specifying view 90, which is the view we created in the “Introduction to GenevaERS Views” module of this training course. 

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Error Select" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide7.jpeg title="GenevaERS Error Select"/>

For a view to be selected, it must first be set to Active status in the Workbench. If the view is not active, the MR86 Report will contain the error message "View is inactive.” A view that is inactive cannot be run.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Error Skip" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide8.jpeg title="GenevaERS Error Skip"/>

When errors occur, MR86 also issues a condition code of 8 for the job step, which typically causes the remaining job steps to be skipped.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Select Phase Success" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide9.jpeg title="GenevaERS Select Phase Success"/>

Once the view is activated in the GenevaERS Workbench, MR86 can be rerun and the view should be successfully selected for processing. If no other errors are encountered, the MR86 Report does not contain the word "ERROR" at the beginning of any row, and MR86 returns a condition code of 0 for the job step, allowing remaining jobs steps to run.


# Compile Phase Data Flow

<div style="clear: right" ><img style="float: right;" width="50%" vspace="5" alt="GenevaERS GVBMR84" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide10.jpeg title="GenevaERS GVBMR84"/>

The primary GenevaERS program in the Compile phase is GVBMR84. MR84 reads the XML file created by the previous step and converts it to a form that can be executed by the Extract phase later. This new file is called the View Definition Parameters (or VDP) file. Because multiple versions of the VDP file are used in the GenevaERS job stream, this one is referred to as the MR84 VDP to indicate the program that wrote it. MR84 also produces a control report known as the MR84 Report.

<div style="clear: right" ><img style="float: right;" width="50%" vspace="5" alt="GenevaERS Compile Phase Success" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide11.jpeg title="GenevaERS Compile Phase Success"/>

The MR84 Report indicates successful completion or displays XML syntax errors and view compile errors that have to be corrected before proceeding. If there are no errors, the process continues.  

The MR84 Report also shows how columns in the view are translated into a specialized GenevaERS construct known as a logic table. 

# Logic Phase Data Flow

<div style="clear: right" ><img style="float: right;" width="50%" vspace="5" alt="GenevaERS GVBMR90" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide12.jpeg title="GenevaERS GVBMR90"/>

The primary GenevaERS program in the Logic phase is GVBMR90. MR90 reads the MR84 VDP file created by the previous step and creates a new VDP and logic tables that are used by the next steps, the Reference and Extract phases. The new VDP is called the MR90 VDP to distinguish it from the input VDP file. The logic tables are known as the MR90 JLT (for “Join Logic Table”) and the MR90 XLT (for “the Extract Logic Table”). 

The next programs in the Logic phase, which are not shown here, read these files and produce converted versions known as the MR77 VDP, the MR76 JLT, and the MR76 XLT. 

<div style="clear: right" ><img style="float: right;" width="50%" vspace="5" alt="GenevaERS Logic Phase Success" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide13.jpeg title="GenevaERS Logic Phase Success"/>

The MR90 Report displays summary statistics for the Logic Table Creation process. In this case, the Extract Logic Table contains nine records. This view included no joins, so no records were written to the Join Logic Table. The report also displays, in detail format, the contents of the Extract Logic Table and the Join Logic Table if applicable.

# Reference Phase Data Flow

<div style="clear: right" ><img style="float: right;" width="50%" vspace="5" alt="GenevaERS Reference Phase" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide14.jpeg title="GenevaERS Reference Phase"/>

The primary GenevaERS program in the Reference phase is GVBMR95. MR95 reads the MR77 VDP file and the MR76 JLT file created by earlier steps and one or more Reference Data files. It then produces a Reference Extract Header (or REH) that describes the format of the reference data being processed. 

It also creates one Reference Extract Detail (or RED) file for each Reference Data file read. These files contain only the data required to perform joins in the Extract phase. Finally, MR95 produces a control report known as the MR95 Report, which indicates successful completion or displays errors that may have to be corrected before proceeding. 

<div style="clear: right" ><img style="float: right;" width="50%" vspace="5" alt="GenevaERS Reference Phase Warning" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide15.jpeg title="GenevaERS Reference Phase Warning"/>
If this job stream does not access any Reference Data files, the MR95 Report displays a warning message saying that there is an “empty or abbreviated logic table.” If you do not intend to access any Reference Data files, this is considered a normal condition and you may proceed to the next step. 

Note: To be processed correctly, reference data must be sorted in key sequence and have no records with duplicate keys. 

# Extract Phase Data Flow

<div style="clear: right" ><img style="float: right;" width="50%" vspace="5" alt="GenevaERS Extract Phase" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide16.jpeg title="GenevaERS Extract Phase"/>
The primary GenevaERS program in the Extract phase is GVBMR95, which is the same program that is run in the Reference phase. In reviewing the job stream output, you should take care not to confuse the outputs of the two executions of MR95. 

MR95 reads the MR77 VDP file, the MR76 XLT file, and the REH, and RED files created by earlier steps, along with source data for the process (Source data is sometimes referred to as business event data or just event data). 

MR95 executes various transformations and, depending on specifications in the selected views, produces one or more View Output files. It may also produce one or more Extract Work files, which are temporary files processed by the Format phase. Finally, it produces an MR95 Report, which presents summary statistics for the process.  

<div style="clear: right" >

## Specifying the Source Files in the JCL

<img style="float: right;" width="50%" vspace="5" alt="GenevaERS Extract JCL" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide17.jpeg title="GenevaERS Extract JCL"/>

Before running the Extract phase job, you must make sure that DD statements for any required input files are included, containing the data to be scanned and extracted according to the view requirements. The DD names (such as CUSTOMER or ORDER001) must match those in the Workbench physical files referenced by the views being run.

<div style="clear: right" > 

## Specifying the View Output Files
<img style="float: right;" width="50%" vspace="5" alt="GenevaERS Extract JCL 2" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide18.jpeg title="GenevaERS Extract JCL 2"/>


Similarly, you also must ensure that DD statements for any required output files are included. These DD names are determined by view parameters in the Workbench.

<div style="clear: right" >

## Extract Phase Report
<img style="float: right;" width="50%" vspace="5" alt="GenevaERS Extract Phase Success" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide19.jpeg title="GenevaERS Extract Phase Success"/>

The Extract phase MR95 Report displays statistics that are useful for audit trails and performance tuning. In this example, we can see that 12 records were read from the ORDER001 file, 12 records were processed by view 90, and 12 records were written to the OUTPUT01 file. 


<div style="clear: right" > 

## Logic Table Report

<img style="float: right;" width="50%" vspace="5" alt="GenevaERS Extract Phase Logict Table" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide20.jpeg title="GenevaERS Extract Phase Logic Table"/>
A secondary program in the Extract phase is GVBUT90, which produces the UT90 Report. This report displays information from the Extract Logic Table (XLT), which shows each step that is executed in a data transformation. This is useful information for debugging views. A more detailed discussion of the logic table is presented in the training module entitled “Basic Debugging.” 

<div style="clear: right" > 

## Format Phase Data Flow

<img style="float: right;" width="50%" vspace="5" alt="GenevaERS Extract Phase Logict Table" src=images/Module2-GenevaERS_Performance_Engine_Overview/Module2_Slide20.jpeg title="GenevaERS Extract Phase Logic Table"/>

The primary GenevaERS program in the Extract phase is GVBMR88. MR88 reads the MR77 VDP, REH, and RED files created by earlier steps, along with the temporary Extract Work files for the process. It then sorts, summarizes, and formats the data, producing one or more View Output files. Additional details will be provided in the training module entitled “Introduction to the Format Phase.” 

<div style="clear: right" > 

#