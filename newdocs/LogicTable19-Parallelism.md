---
title: GenevaERS Parallelism
nav_order: 20
---

# GenevaERS Parallelism

This page provides you with more information about the GenevaERS Parallelism.  It will help you to: 
- Describe GenevaERS’s Parallel Processing feature
- Read a Logic Table and Trace with multiple sources
- Set Trace parameters to filter out unneeded rows 
- Configure shared extract files across parallel threads
- Set thread governors to conserve system resources 
- Debug a GenevaERS execution with multiple sources 

GenevaERS Parallelism does not include any new Logic Table Functions: [Prior Logic Table Functions Codes can be located here.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" >

# Multiple Job Parallelism

<img style="float: right;" width="50%" vspace="5" alt="Multiple Job Parallelism" src=images/Module19-Parallelism/Module19_Slide3.jpeg title="Multiple Job Parallelism"/>

In a prior page we noted that the Extract Engine, GVBMR95, is a parallel processing engine, the Format Phase, GVBMR88, is not.  It is possible to run multiple Format Phase jobs in parallel, one processing each extract file.  Yet each job is independent of each other.  They share no resources, such as look-up tables for join processing.  In this page we will highlight the benefits of GVBMR95 multi-thread parallelism, how to enable, control, and debug it.

<div style="clear: right" >

## Parallel Processing Benefits

<img style="float: right;" width="50%" vspace="5" alt="Parallel Processing Benefits" src=images/Module19-Parallelism/Module19_Slide4.jpeg title="Parallel Processing Benefits"/>

Parallelism allows for use of more resources to complete a task in a shorter period of time.  For example if the view requires reading 1 million records to produce the appropriate output and the computer can process 250,000 records a second, it will require 4 seconds at a minimum to produce this view.  If the file is divided into 4 parts then the output could be produced in 1 second.

Doing so requires adequate system resources, in the form of I/O Channels, CPUs, and memory.  If for example, our computer only has 1 CPU, then each file will effectively be processed serially, no matter how many files we have.  All parallel processing is resource constrained in some way.

<div style="clear: right" >

## Multiple Thread Parallelism

<img style="float: right;" width="50%" vspace="5" alt="Multiple Thread Parallelism" src=images/Module19-Parallelism/Module19_Slide5.jpeg title="Multiple Thread Parallelism"/>

GVBMR95 is a multi-task parallel processing engine.  It does not require multiple jobs to create parallelism.  Using the Logic Table and VDP, GVBMR95 actually creates individual programs from scratch and then asks the operating system to execute each program, called sub tasks, one for each input Event File to be scanned for the required views.  This is done all within one z/OS job step.  Each of these sub tasks independently reads data from the Event File, and writes extract records to extract files for all views reading that event file.

In this example, the combination of views contained in the VDP and Logic Table require reading data from four different event files.  These views write output data to six different extract files.  The main GVBMR95 program will generate four different sub tasks, corresponding to the four different input event files to be read.

<div style="clear: right" >

## Multi-threaded Benefits

<img style="float: right;" width="50%" vspace="5" alt="Multi-threaded Benefits" src=images/Module19-Parallelism/Module19_Slide6.jpeg title="Multi-threaded Benefits"/>


Multi-threaded parallelism can provide certain benefits over Multi-job parallelism.  These benefits include:
- Shared Memory.  Only one copy of the reference data to be joined to must be loaded into memory.  Sharing memory across different jobs is much less efficient than within a single job.  Thus all sub tasks can efficiently access the memory resident tables
- Shared I/O.  Data from multiple input files can be written to a single extract file for that view, allowing for shared output files
- Shared Control.  Only one job needs to be controlled and monitored, since all work occurs under this single job step
- Shared Processing.  In certain cases, data may be shared between threads when required, through the use of GenevaERS Piping or exit processing

<div style="clear: right" >

## Multi-threaded Limits: Physical Files

<img style="float: right;" width="50%" vspace="5" alt="MR95" src=images/Module19-Parallelism/Module19_Slide7.jpeg title="MR95"/>

Recall from an earlier lesson that: 
- A physical file definition describes a data source like the Order Files
- A logical file definition describes a collection of one or more physical files
- Views specify which Logical Files to read

The degree of potential parallelism is determined by the number of Physical Files.  GVBMR95 generates subtasks to read each Physical File included in every Logical File read by any View included in the VDP.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Physical Files" src=images/Module19-Parallelism/Module19_Slide8.jpeg title="Physical Files"/>

The GenevaERS metadata component Physical File contains the DD Name to be used to read the input event file.  This DD Name is used throughout the GVBMR95 trace process to identify the thread being processed.

<div style="clear: right" >

## Input File Names and Dynamic Allocation

<img style="float: right;" width="50%" vspace="5" alt="Input File Names and Dynamic Allocation" src=images/Module19-Parallelism/Module19_Slide9.jpeg title="Input File Names and Dynamic Allocation"/>

Remember that GVBMR95 can also perform dynamic allocation of input files.  This means that even if a file is NOT listed in the JCL, if the file name is listed in the GenevaERS Physical File entity, GVBMR95 will instruct the operating system to allocate this named file.  

GVBMR95 will first test if the file is listed in the JCL before performing dynamic allocation.  Thus the GenevaERS Physical Entity file name can be over-ridden in the JCL if required.  Dynamic allocation can allow an unexpected view included in the VDP to successfully run even though no updates were made to the JCL.  

<div style="clear: right" >

## Logical Files

<img style="float: right;" width="50%" vspace="5" alt="Logical Files" src=images/Module19-Parallelism/Module19_Slide10.jpeg title="Logical Files"/>

The same Physical File can be included in multiple logical files.  This allows the GenevaERS developer to embed in file’s meaning that may be useful for view processing, like a partition for stores within each state.  Another Logical File can be created which includes all states in a particular region, and another to include all states in the US.

In this page’s example, we have the ORDER001 Logical File reading the Order_001 physical file, the ORDER005 Logical File reading the ORDER-005 physical File, and the ORDERALL Logical File, reading the ORDER001, 002, 003, 004 and 005 physical files.

<div style="clear: right" >

# Example

## Views

<img style="float: right;" width="50%" vspace="5" alt="Example Views" src=images/Module19-Parallelism/Module19_Slide11.jpeg title="Example Views"/>

In this page we have three sample views, each Extract Only Views with the same column definitions (3 DT columns).  The only difference is the Logical File each is reading.  View 148 reads only the ORDER 001 file, while view 147 reads only the ORDER 005 file, and view 19 reads all Order files, including 1, 2, 3, 4 and 5.

<div style="clear: right" >

## Output DD Names

<img style="float: right;" width="50%" vspace="5" alt="Output DD Names" src=images/Module19-Parallelism/Module19_Slide12.jpeg title="Output DD Names"/>

In the first run, each view in our example writes its output to its own extract file.  Output files are selected in the view properties tab.  The GenevaERS Physical File meta data component lists the output DD Name for each, similar to the Input Event Files.  

<div style="clear: right" >

## Logic Table ES Sets

<img style="float: right;" width="50%" vspace="5" alt="Logic Table ES Sets" src=images/Module19-Parallelism/Module19_Slide13.jpeg title="Logic Table ES Sets"/>

As GVBMR90 builds the logic table, it copies each view into the “ES Set” which reads a unique combination of source files.  Doing so creates the template needed by GVBMR95 to generate the individualized program needed to read each source. Note that Output files are typically a single file for an entire view, and thus typically are shared across ES sets.

In our example, three ES Sets are created.  The first includes views 148 and 19, each with their NV, DTEs, and WRDT functions.  The second ES Set is only view 19.  And the third is views 19 and 147.  The Output04 file will be written to by multiple ES Sets, which contain view 19.

<div style="clear: right" >

## Generated Logic Table

<img style="float: right;" width="50%" vspace="5" alt="Generated Logic Table" src=images/Module19-Parallelism/Module19_Slide14.jpeg title="Generated Logic Table"/>

This is the generated logic table for our sample views.  It contains only one HD Header Function, and one EN End function at the end.  But unlike any of the pervious Logic Tables, it has multiple RENX Read Next functions, and ES End of Set Functions.  Each RENX is preceded by a File ID row, with a generated File ID for that unique combination of files which are to be read.  Between the RENX and the ES is the logic for each view; only the Goto True and False rows differ for the same logic table functions between each ES set.

In our example, begins with the HD function, then ES Set 1, reading File “22” (a generated file ID for the ORDER001 file) contains view logic 48 and 19.  The second ES Set for File “23” (Order files 2, 3, and 4) contains only View ID 19, and the third set for file ID “24” (the ORDER005 file) contains the view logic for view 47 and 19 and ends with the EN function.

Next we’ll look at the initial messages for the Logic Table Trace.

<div style="clear: right" >

# Trace 

## Header Messages

<img style="float: right;" width="50%" vspace="5" alt="Trace Header Messages" src=images/Module19-Parallelism/Module19_Slide15.jpeg title="Trace Header Messages"/>

When Trace is activated, GVBMR95 prints certain messages during initialization, before parallel processing begins.  Let’s examine these messages.

- MR95 validates any input parameters listed in the JCL for proper keywords and values
- MR95 loads the VDP file from disk to memory
- MR95 next loads the Logic Table from disk to memory
- MR95 clones ES Sets to create threads, discussed more fully on the next slide
- MR95 loads the REH Reference Data Header file into memory, and from this table then loads each RED Reference Data file into memory.  During this process it check for proper sort order of each key in each reference table
- Using each function code in the logic table, MR95 creates a customized machine code program in memory.  The data in this section can assist GenevaERS support in locating in memory the code generated for specific LT Functions
- Next MR95 opens each of the output files to be used.  Opening of input Event files is done within each thread, but because threads can share output files, they are opened before beginning parallel processing
- MR95 updates various addresses in the generated machine code in memory

Having loaded all necessary input and reference data, generated the machine code for each thread, and opened output files, MR95 then begins parallel processing.  It does this by instructing the operating system to execute each generated program.  

The main MR95 program (sometimes called the “Mother Task”) then goes to sleep until all the subtasks are completed.  At this point, if no errors have occurred in any thread, the mother task wakes up, closes all extract files, and prints the control report.

<div style="clear: right" >

## ES Set Cloning = Threads

<img style="float: right;" width="50%" vspace="5" alt="ES Set Cloning = Threads" src=images/Module19-Parallelism/Module19_Slide16.jpeg title="ES Set Cloning = Threads"/>

The GVBMR90 logic table only includes ES Sets, not individual threads.  When GVBMR95 begins, it detects if multiple files must be read by a single ES Set.  If so, it clones the ES Set logic to create multiple threads from the same section of the logic table.

In our example views, the single ES Set for the Order 2, 3 and 4 files is cloned during MR95 initialization to create individual threads for each input file.

<div style="clear: right" >

## JES Message Log

<img style="float: right;" width="50%" vspace="5" alt="JES Message Log" src=images/Module19-Parallelism/Module19_Slide17.jpeg title="JES Message Log"/>

During parallel processing GVBMR95 prints certain messages to the JES Message Log 
- The first message shows the number of threads started, and the time parallel processing began
- As each thread finishes processing, it also prints a message showing 
    - The time it completed
    - The thread number completed
    - The DD Name of the input file being read, and 
    - The record count of the input file records read for that thread

Each thread is independent (asynchronous) with any other thread (and the sleeping Mother Task during thread processing).  The order and length of work each performs is under the control of the operating system.  A thread may process one or many input event records in bursts, and then be swapped off the CPU to await some system resource or higher priority work.  Thus the timing of starting and stopping for each thread cannot be predicted.

<div style="clear: right" >

## Parallel Processing Trace

<img style="float: right;" width="50%" vspace="5" alt="Parallel Processing Trace" src=images/Module19-Parallelism/Module19_Slide18.jpeg title="Parallel Processing Trace"/>

The Trace output is a shared output for all processing threads.  Because threads process independently, under the control of the operating system, the order of the records written to the trace is unpredictable.  There may be long bursts of trace records from one thread, followed by a long burst of processing within another thread.  This would be the case if only two threads were being processed (for two input event files) on a one CPU machine (there would be no parallel processing in this case either)  How long each thread remains on the CPU is determined by the operating system.  

Alternatively, records from two or more threads may be interleaved in the trace output, as they are processed by different CPUs.  Thus the EVENT DDNAME column become critical to determining which thread a specific trace record is for.  The DD Name value is typically the input Event file DD name.  The Event Record count (the next column) always increases for a particular thread.  Thus record 3 is always processed after record 2 for one specific DD Name.

In this example, 
- The ORDER002 thread begins processing, and processes input event records 1 – 13 for view 19 before any other thread processes.  
- It stops processing for a moment, and ORDER001 begins processing, but only completes 1 input event record for views 148 and view 19 before stopping to process.  
- ORDER002 picks back up and processes record 14 for its one view.  
- ORDER005 finally begins processing, completing input record 1 for both views 147 and 19.  
- ORDER001 begins processing again, record 2 for both views 148 and 19.

Note that this portion of the trace does not show any processing for thread ORDER003 and ORDER004.

<div style="clear: right" >

## Logic Table Trace Parameters

<img style="float: right;" width="50%" vspace="5" alt="Logic Table Trace Parameters" src=images/Module19-Parallelism/Module19_Slide19.jpeg title="Logic Table Trace Parameters"/>
		
In [Introduction to the Logic Table and Trace Function](Intro11_Logic_Table_and_Trace_Introduction.md#trace-parameters) we showed examples of Trace parameters which control what trace outputs are written to the trace file.  One of the most useful is the TRACEINPUT parameter, which allows tracing a specific thread or threads.  It uses the thread DD Name to restrict output to that thread. 

<div style="clear: right" >

# GVBMR95 Control Report Parameter Messages

<img style="float: right;" width="50%" vspace="5" alt="GVBMR95 Control Report Parameter Messages" src=images/Module19-Parallelism/Module19_Slide20.jpeg title="GVBMR95 Control Report Parameter Messages"/>

The heading section of the GVBMR95 control report provides information about the GVBMR95 environment and execution.  It includes:
- GenevaERS executable version information
- The system date and time of the execution of the GenevaERS process.  (This is not the “Run Date” parameter, but the actual system date and time)
- The GVBMR95 parameters provided for this execution, including overall parameters, environment variables, and trace parameters
- zIIP processing status information

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="GVBMR95 Control Report Multiple Output File" src=images/Module19-Parallelism/Module19_Slide21.jpeg title="GVBMR95 Control Report Multiple Output File"/>

The remainder of the control report shows additional information when running in parallel mode:
- The number of threads executed, 5 in this example, is shown
- The number of views run is not simply a count of the views in the VDP, but the replicated ES Set views.  In this example, because view 19 read 5 sources, it counts as 5, plus view 147 and view 148 equals 7
- The greater the number of views and threads that are run, the larger the size of the generated machine code programs,  in bytes.  
- The input record count for each thread is shown, along with it’s DD name.  Because GVBMR95 ran in full parallel mode, the record counts for the thread are the same as the record counts for each input file.  Later we’ll explain how these numbers can be different.
- The results of each view against each input DD Name (thread in this case) is shown, including lookups found and not found, records extracted, DD name where those records were written to, and the number of records read from that DD Name.  

Certain additional features, explain in a later page, can cause the record counts read for a view to be different than the record counts for the input file.

<div style="clear: right" >

# Shared Extract Files

<img style="float: right;" width="50%" vspace="5" alt="All Views to One File" src=images/Module19-Parallelism/Module19_Slide22.jpeg title="All Views to One File"/>

Because GenevaERS allows sharing output files across threads, it is possible to have many views writing to a single output file.  The outputs may either be all the same record formats, or differing formats as variable length records.  This can allow for complex view logic to be broken up multiple views, each containing a portion of the logic for a particular type of record output.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="GVBMR95 Control Report Single Output File" src=images/Module19-Parallelism/Module19_Slide23.jpeg title="GVBMR95 Control Report Single Output File"/>

This control report shows the results of changing our views to write their outputs to one file.  The total record count of all records written remains the same.  They are now consolidated into one single file, rather than 3 files.

Similar to the Trace output, the order of the records written to the extract file by two or more threads is unpredictable.  

As we’ll discuss in a later page, there is a performance impact for multiple threads writing to a single output file.  Threads ready to write a record may have to wait, and the coordination of which thread should wait consumes resources.  Therefore it can be more efficient to limit the amount of sharing of output files when possible, and combine files (through concatenation, etc.) after GenevaERS processing.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="GVBMR95 Control Report for Multiple Views & Threads" src=images/Module19-Parallelism/Module19_Slide24.jpeg title="GVBMR95 Control Report for Multiple Views & Threads"/>

In this execution, we have included additional views, reading the same input event files, but which produce Format Phase views.  The rows showed in red are added to the prior control report as additional outputs from the single scan of the input event files.  This also demonstrates how the standard extract files can be shared across multiple threads.

<div style="clear: right" >

# Thread Governors

<img style="float: right;" width="50%" vspace="5" alt="Thread Governors" src=images/Module19-Parallelism/Module19_Slide25.jpeg title="Thread Governors"/>

GenevaERS provides the ability to control the overall number of threads executed in parallel without changing the views.  The GVBMR95 parameters Disk and Tape Threads specify how many parallel threads GVBRM95 should execute in parallel.  Disk threads control the number of threads reading input Event Files on disk, as specified in the GenevaERS Physical File meta data; tape threads control those input Event Files which are on tape.  

The default value for these parameters is 999 meaning effectively all threads should be executed in parallel.  If one of the parameters is set to a number less than the number of input Event Files of a specific type, GenevaERS will generate only that many threads.  

GVBMR95 will then process multiple event files serially within one of those threads.  As one event file completes processing, that thread will then examine if more event files remain to be processed and if so, it will process another Event file under the same thread.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Thread Governors" src=images/Module19-Parallelism/Module19_Slide26.jpeg title="Thread Governors"/>

The GVBMR95 Control reports show the results of thread governor.  In the top, the disk governor parameters are shown, and the number of records read by each thread are shown.  Because each thread only processed one event file, and all were done in parallel, the records read from the event file and for the thread are the same.

In the bottom example, the thread governor has been set to 1, meaning only one thread will be run.  In this instance the control report shows that the total records read for the thread equal the total reads read for all event files because this thread processed each event file serially until all threads were complete.  

<div style="clear: right" >

# Extract Performance Statistics with Parallelism

<img style="float: right;" width="50%" vspace="5" alt="Extract Performance Statistics" src=images/Module19-Parallelism/Module19_Slide29.jpeg title="Extract Performance Statistics"/>

This graphic highlights the key z/OS statistics often tracked from GVBMR95 runs.  These include CPU time, elapsed time, memory usage, and IO counts.

The top set of statistics are from the run _with_ parallelism, the bottom from a run using the Thread Governor _with no_ parallelism.  The impact of parallelism can be seen in the difference between the elapsed time for a job with parallelism and one without. Parallelism cut the elapsed time in half.  

The Extract Program, GVBMR95, is subject to all standard z/OS control features, including job classes, workload class, priority, etc.  In other words, even with parallel processing, the z/OS job class or priority may be set to such a low level, and the other workloads in higher classes on the machine may be so significant that effectively no parallel processing occurs even though GVBMR95 instructs z/OS to execute multiple threads.  Each of these threads receive the same job class, priority, etc. as the entire Extract Phase job.  In this way the operator and system program remain in control of all GenevaERS jobs.

The following give more details about each of these runs for comparison

<div style="clear: right" >

### WITH Parallelism

<img style="float: right;" width="50%" vspace="5" alt="Extract Performance Statistics with Parallelism" src=images/Module19-Parallelism/Module19_Slide27.jpeg title="Extract Performance Statistics with Parallelism"/>


<div style="clear: right" >

### WITHOUT Parallelism

<img style="float: right;" width="50%" vspace="5" alt="Extract Performance Statistics without Parallelism" src=images/Module19-Parallelism/Module19_Slide28.jpeg title="Extract Performance Statistics without Parallelism"/>

<div style="clear: right" > 
