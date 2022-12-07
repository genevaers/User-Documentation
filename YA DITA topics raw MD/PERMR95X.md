# Program Runbook: MR95 Extract Data {#PERMR95X .reference}

## WARNING - this topic is Work In Progress. { .section}

## 01 Summary of this topic {#01 .section}

For **MR95 parameters**, see Section [50 DD MR95PARM - Configuration](PERMR95X.md#50).

The sections in this topic are as follows:

-   [02 Diagram](PERMR95X.md#02)
-   [03 What MR95 does in the extract phase](PERMR95X.md#03)
-   [05 Checklist for extract phase](PERMR95X.md#05)
-   [10 PARM options for MR95 Extract step](PERMR95X.md#10)
-   [20 DD \(from metadata\) - Event files](PERMR95X.md#20)
-   [22 DD \(from metadata\) - View Output File\(s\)](PERMR95X.md#22)
-   [24 DD EXTRx - Extract work files](PERMR95X.md#24)
-   [26 DD F<ViewNbr\> - View Output File\(s\)](PERMR95X.md#26)
-   [28 DD GREFx - RED files](PERMR95X.md#28)
-   [30 DD MERGPARM - Common Key Buffer parameters](PERMR95X.md#30)
-   [35 DD MR95BILL - DUMMY](PERMR95X.md#35)
-   [40 DD MR95ENVV - Environment variables](PERMR95X.md#40)
-   [45 DD MR95LTBL - XLT file](PERMR95X.md#45)
-   [50 DD MR95PARM - Configuration](PERMR95X.md#50)
-   [55 DD MR95REH - REH file](PERMR95X.md#55)
-   [60 DD MR95RPT](PERMR95X.md#60)
-   [65 DD MR95TRAC - Trace file](PERMR95X.md#65)
-   [70 DD MR95VDP - VDP file](PERMR95X.md#70)
-   [75 Trace config and output](PERMR95X.md#75)
-   [80 JCL Sample](PERMR95X.md#80)
-   [99 Troubleshooting](PERMR95X.md#99)
-   [100 Need this page completed?](PERMR95X.md#100)

## 02 Diagram {#02 .section}

![](images/MR95_Action_02_Ext.gif)

## 03 What MR95 does in the extract phase {#03 .section}

See these overviews:

-   "**MR95 Reference & Extract overview**"
-   "**Extract phase overview**"
-   "**EXT file overview**"
-   "**RED file overview**"
-   "**REH file overview**"
-   "**RTH file overview**"
-   "**SXT file overview**"
-   "**Logic tables and codes overview**"
-   "**JLT file overview**"
-   "**XLT file overview**"
-   "**VDP file overview**"
-   "**Event and Reference files overview**"

Links to the above overviews are under **Related concepts** below.

## 05 Checklist for extract phase {#05 .section}

See help topic "**Checklist: Extract phase**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR95 Extract step {#10 .section}

No PARM options.

## 20 DD \(from metadata\) - Event files {#20 .section}

Some DDNAMEs for MR95 in the reference phase do not appear in Section [02 Diagram](PERMR95X.md#02).

These DDNAMEs are for event files, which MR95 reads in the extract phase

See these overviews:

-   "**Event and Reference files overview**"
-   "**MR95 Reference & Extract overview**"
-   "**Extract phase overview**"

Links to the above overviews are under **Related concepts** below.

## 22 DD \(from metadata\) - View Output File\(s\) {#22 .section}

Some DDNAMEs for MR95 in the reference phase do not appear in Section [02 Diagram](PERMR95X.md#02).

These DDNAMEs are for view output file\(s\) created by MR95 in the extract phase.

See these overviews:

-   "**View output file overview**"
-   "**MR95 Reference & Extract overview**"
-   "**Extract phase overview**"

Links to the above overviews are under **Related concepts** below.

## 24 DD EXTRx - Extract work files {#24 .section}

2

DDNAMEs EXTRx are for the Extract work files that are also called EXT files. The EXTRx files are read by MR95 in the extract phase.

See help topic "**EXT file overview**". A link to that overview is under **Related concepts** below.

## 26 DD F<ViewNbr\> - View Output File\(s\) {#26 .section}

Some DDNAMEs for MR95 in the reference phase do not appear in Section [02 Diagram](PERMR95X.md#02).

These DDNAMEs are for view output file\(s\) created by MR95 in the extract phase.

See these overviews:

-   "**View output file overview**"
-   "**MR95 Reference & Extract overview**"
-   "**Extract phase overview**"

Links to the above overviews are under **Related concepts** below.

## 28 DD GREFx - RED files {#28 .section}

DDNAMEs GREFx are for the RED files that are input to the extract phase.

See help topic "**RED file overview**". A link to that overview is under **Related concepts** below.

Note the following:

-   The GREFx files are RED files that are **created** by MR95 in the reference phase.
-   The GREFx files that are needed for lookups in the extract phase are listed in the REH file - see section [55 DD MR95REH - REH file](PERMR95X.md#55).
-   The GREFx files that are needed for lookups in Sort Key Titles in the format phase are listed in the RTF file.

    See help topic "**RTH file overview**". A link to that overview is under **Related concepts** below.


## 30 DD MERGPARM - Common Key Buffer parameters {#30 .section}

DDNAME MERGPARM is for parameters required to configure a Common Key Buffer in the extract phase.

See the following topics:

-   Topic "**Common Key Buffers overview**".

    A link to that overview is under **Related concepts** below.

-   FAQ Topic "**MERGPARM parameters for MR95**".

    A link to that overview is under **Related reference** below.


## 35 DD MR95BILL - DUMMY {#35 .section}

DDNAME MR95BILL is obsolete and should always be DD DUMMY. The DDNAME MR95BILL is still required.

In earlier versions of SAFR, DDNAME MR95BILL produced statistics to allow your company to perform internal billing.

## 40 DD MR95ENVV - Environment variables {#40 .section}

DDNAME MR95ENVV is a parameter file that sets values for environment variables.

To be completed.

## 45 DD MR95LTBL - XLT file {#45 .section}

DDNAME MR95LTBL is the XLT file which is a key input to MR95 in the extract phase.

See help topic "**XLT file overview**". A link to that overview is under **Related concepts** below.

## 50 DD MR95PARM - Configuration {#50 .section}

DDNAME MR95PARM is the configuration file for MR95.

An asterisk \(\*\) in the first column indicates the line is a comment only.

**Example configuration file:**

```
*   MR95 PARAMETERS  UPDATED DD MONTH, 20XX
 LENVINIT=Y              BUILD LANGUAGE ENVIRONMENT? (Y/N)
 DB2SQL=GVBMRSQR         PLAN NAME FOR DB2/SQL
 DB2VSAM=GVBMRDVR        PLAN NAME FOR DB2/VSAM
 STDEXTR=001             NUMBER OF STANDARD EXTRACT FILES
 EXTFILES=001            LIMIT FOR NUMBER OF ALL EXTRACT FILES
 LTROWS=10000            LIMIT FOR NUMBER OF LOGIC TABLE ROWS
 READBUF=05              NUMBER OF INPUT BUFFERS
 WRITEBUF=15             NUMBER OF OUTPUT BUFFERS
 S0C7TRAP=Y              TRAP NUMERIC ERRORS AND CONTINUE? (Y/N)
 DISABABEND=N            ABEND PROCESS IF VIEW IS DISABLED? (Y/N)
 DISKTHRDS=005           MAXIMUM NUMBER OF DISK THREADS
 TAPETHRDS=000           MAXIMUM NUMBER OF TAPE THREADS
 VDPBYTES=10000          VDP TABLE SIZE (KILOBYTES)
 REFBYTES=0500           NUMBER OF MEGABYTES AVAILABLE IN PRIMARY
*                        ADDRESS SPACE FOR REFERENCE TABLES
*                        (VALID VALUES: 0000 - 1536)
*
*** DEBUGGING PARAMETERS
*1STTHREAD=Y             EXECUTE FIRST THREAD ONLY
 SNAP=N                  SNAPSHOT DUMP OF LOGIC TABLE AND CODE
*EXTDUMMY=Y              TREAT MISSING EXTRACT FILES AS DD DUMMY
*MSGABEND=123            ABEND WHEN THIS MESSAGE NUMBER IS ENCOUNTERED
*LTABEND=123             ABEND WHEN THIS LOGIC TABLE ROW IS ENCOUNTERED
*RLIMIT=100              SIMULATE E-O-F AFTER THIS MANY EVENT RECORDS
*TRACE=N                 TRACE LOGIC TABLE EXECUTION
*
***TRACE PARAMETERS MUST BE ON ONE LINE PER SET; MULTIPLE SETS ARE OK
*TRACE KEYWORDS:
*VIEW=,FROMREC=,THRUREC=,FROMLTROW=,THRULTROW=,LTFUNC=,DDNAME=
*VPOS=,VLEN=,VALUE=
*
*TRACE EXAMPLES (where TRACE=Y is included on a seperate line):
*VIEW=9999,LTFUNC=WR
*VPOS=17,VLEN=10,VALUE=24CXA01501,VIEW=9999
*VIEW=9999
*TRACEINPUT=DDABC
```

The **configuration file** is coded as follows:

|Parameter|Details|
|---------|-------|
|1STTHREAD|\(Optional.\) This parameter controls the number of threads that MR95 executes. The values are:-   **1STTHREAD=A**

Execute one thread that serially performs all partitions \(threads\).

-   **1STTHREAD=N**

Execute all threads. This is the default value.

-   **1STTHREAD=Y**

Execute the first thread only. The thread that is "first thread" is not predictable, and so this may vary from run to run, especially for views with DB2 access via VSAM.


|
|DB2SQL|\(Optional.\) Only applies if MR95 accesses DB2 data using SQL. Code as follows:**DB2SQL=Planname**

The value of "Planname" is available from the DB2 Administrators in your company.

|
|DB2VSAM|\(Optional.\) Only applies if MR95 accesses DB2 data using the underlying VSAM files. Code as follows: . **DB2VSAM=Planname**

The value of "Planname" is available from the DB2 Administrators in your company.

|
|DDNAME|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file. This parameter defines the file for trace output. This parameter has a default value of **MR95TRAC**. Code as follows:

**DDNAME=JCLddname**

The value of "JCLddname" is a DD name in the JCL for the MR95 step.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|DISABABEND|\(Optional.\) This parameter controls how MR95 processes a disabled view. A view is disabled if the view receives at least one of these problems:

-   A **System OC7 error** , OR
-   An **exit return code =12** or higher.

MR95 processes such a disabled view as follows:

-   **DISABABEND=Y**

MR95 abends a disabled view. This is a very safe setting because MR95 abends and stops immediately one of the above serious problems is detected.

-   **DISABABEND=N**

MR95 does not abend a disabled view. This is the default value. This setting allows many problems to be found because the view continues processing after MR95 detects the above serious problems.


|
|DISKTHRDS|\(Optional.\) The maximum number of disk threads. A related parameter is TAPETHRDS which is the maximum number of tape threads. The values for both DISKTHRDS and TAPETHRDS are 3 digits each and both have a default value of 999. It is recommended that values for DISKTHRDS and TAPETHRDS are explicitly coded in the MR95 configuration parameters.

The values for DISKTHRDS and TAPETHRDS affect each other. The appropriate values for both parameters depend on the phase for MR95, and the files MR95 is processing.

In the **reference** phase, MR95 cannot run both disk and tape threads in parallel. In this phase, MR95 reads either disk or tape files. This is decided by the relevant definitions of Physical Files, and not by the JCL. MR95 abends in the reference phase if both disk and tape files are specified as source files for lookups in a view.

In the **reference** phase, if all lookup source files are on disk, then set **DISKTHRDS=001** and **TAPETHRDS=000**. If all lookup source files are on tape, then set **DISKTHRDS=000** and **TAPETHRDS=001**.

In the **extract** phase, MR95 can run both disk and tape in parallel. If MR95 reads DB2 using VSAM files and the tablespace contains many partitions, then set **DISKTHRDS=030** or higher. Otherwise, use the guidelines given below:

-   For the **extract** phase in testing, if MR95 reads both types of files then set **DISKTHRDS=999** and **TAPETHRDS=999** . If MR95 does not read tape files, then set **TAPETHRDS=000**. If MR95 does not read disk files, then set **DISKTHRDS=000**.
-   For the **extract** phase in production, your company may set standards for these parameters. Consult also your IBM representative for advice on how to optimize resources and performance of MR95.

|
|EXTDUMMY|\(Optional.\) This parameter controls output files from MR95. The output files may be extract work files or view output files. The values are:-   **EXTDUMMY=N**

Abend if an output file does not have a DDNAME in the JCL. This is the default value.

-   **EXTDUMMY=Y**

Treat as DD DUMMY any output files that do not have a DDNAME in the JCL.


A typical use of the parameter is in the following situation. Your company has an existing MR95 extract phase job that runs multiple views. Your company requires that this job is rerun to obtain the output from only one view. This is achieved by the following steps:

1.  Comment out all the MR95 output DDNAME statements in that job, except for the output file\(s\) still required.
2.  Set **EXTDUMMY=Y** in the MR95 configuration file.
3.  Rerun the job. The missing output DDNAMES are automatically DD DUMMY.

|
|EXTFILES|\(Optional.\) The maximum number for the sum of extract work files \(called EXT files\) plus view output files that can be created by MR95. EXTFILES sets a table size in memory. Typically, use **EXTFILES=100** for both the reference and extract phases.

If EXTFILES is set in the extract phase, the value of **EXTFILES** must be equal to or larger than the value of parameter **STDEXTR** \(see below in this table\).

The value must be three digits between **001** and **999** \(inclusive\). The default value is 100.

For more on EXT files, see topic "**EXT file overview**". A link to that overview is under **Related concepts** below.

For more on view output files, see topic "**View output file overview**". A link to that overview is under **Related concepts** below.

|
|FROMLTROW|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file.The value of **FROMLTROW** defines the first row in the logic table to trace.

If **THRULTROW** is not set, tracing starts from the row given by FROMLTROW and applies to all the remaining rows in the logic table. If THRULTROW is also set, tracing starts at the row of FROMLTROW and applies to all rows up to and including the row given by THRULTROW. If FROMLTROW is not set and THRULTROW is set, tracing starts at row 1 and applies to all rows up to and including the row given by THRULTROW.

If set, the value of THRULTROW must be equal to or larger than the value of FROMLTROW, and both must not be larger than the total number of rows in the logic table.

If the **LTFUNC** parameter is set, the trace only applies to rows that satisfy the range defined by FROMLTROW and THRULTROW and also satisfy the value of LTFUNC. For more, see the LTFUNC parameter below.

Both FROMLTROW and THRULTROW are trace parameters. - see **Section 60 Trace config and output.**

The logic table that MR95 reads is the**JLT \(reference phase\)** or the **XLT \(extract phase\)**. For more on the logic tables, see these overviews:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

|
|FROMREC|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file. The FROMREC parameter defines which MR95 input records to trace.

This can apply to MR95 in the reference phase or to the extract phase. The FROMREC and THRUREC parameters are often combined with the DDNAME parameter above to clearly define which input file the trace applies to.

If set, the value of FROMREC is the first input record to trace. The default is 001 which means the first record. If set, the value for THRUREC is the last record to trace. If both parameters are set, the value for FROMREC must be equal to or lower than the value of THRUREC, and both must be equal to or lower than the number of records in the event file.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|LENVINIT|\(Optional.\) This parameter determines if the Language Environment is initialized. The values are:-   **LENVINIT=N**

MR95 does not initialize the language environment. This is default and save unnecessary memory space used by the language environment.

-   **LENVINIT=S**

This value means "skip" and has the same effect as LENVINIT=N. It is recommended to use the value of N rather than S .

-   **LENVINIT=Y**

MR95 initializes the language environment. This is necessary if the run of MR95 includes an exit that is coded in a language other than assembler. Assembler exits do not require the language environment. A COBOL exit, for example, requires the language environment, and hence requires LENVINIT=Y.


|
|LTABEND|\(Optional.\) This parameter specifies a row in the logic table. If MR95 executes this row, then MR95 abends. This is useful for debugging.If set, LTABEND must be a number between 001 and the last row in the logic table.

The logic table that MR95 reads is the**JLT \(reference phase\)** or the **XLT \(extract phase\)**. For more on the logic tables, see these overviews:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

|
|LTFUNC|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file. The LTFUNC parameter specifies a type of function code in the logic table. MR95 traces execution of this type of function code in the logic table.

This is useful for debugging. The tracing specified by LTFUNC may be affected by use of the FROMLTROW and THRULTROW parameters - see parameter FROMLTROW above.

If set, LTFUNC must be a valid function code in a logic table. For valid codes, see topic "**Logic tables and codes overview**".

A link to that overviews is under **Related concepts** below.

This is one of the trace parameters - see **Section 60 Trace config and output.**

The logic table that MR95 reads is the**JLT \(reference phase\)** or the **XLT \(extract phase\)**. For more on the logic tables, see these overviews:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

|
|LTROWS|\(Optional.\) The maximum number of rows in the logic table for MR95. A value that is too low causes MR95 to abend with a logic table overflow error message. If the value is too high, then the unneeded space is released.The value must be eight digits less than or equal to **99999999**. The default value is 00040000. For a small view, it is recommended to use **LTROWS=00010000**.

MR95 reads the **JLT** in the reference phase, or the **XLT** in the extract phase. For more on logic tables, see these overviews:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

|
|MSGABEND|\(Optional.\) This parameter specifies a message number. If MR95 produces the given error message number, then MR95 abends at the point where that message is generated. This is useful for debugging.The message numbers for MR95 are given in help topic "**Troubleshooting MR95**".

A link to that topic is under **Related reference** below.

|
|READBUF|\(Optional.\) The maximum number of read buffers shared by all input files.A high value may waste memory. A low value may slow your view.

The value must be two digits between **01** and **99** \(inclusive\). The default value is 05.

|
|REFBYTES|\(Optional.\) The number of megabytes you want to allocate below the 2GB bar for reference tables. If REFBYTES is set to 0000, all reference tables are allocated above the 2GB bar. Your company may set standards for this memory usage.For the reference phase, this is set to **0000** because the reference data in the RED files is being prepared.

For the extract phase, a typical value is **1024**. The maximum value is **1536**.

|
|RLIMIT|\(Optional.\) This parameter specifies how many event file records to read per thread. MR95 simulates end-of-file after reading the given number of event records in a thread. This is useful for debugging.|
|S0C7TRAP|\(Optional.\) This parameter controls whether MR95 traps S0C7 errors to avoid an abend. The values are:-   **S0C7TRAP=Y**

Trap S0C7 errors and ignore them so that MR95 continues processing. There is very little performance penalty for this setting.

-   **S0C7TRAP=N**

Allow S0C7 errors to abend MR95 in the usual way. This is the default value.


|
|SNAP|\(Optional.\) This parameter allows a snapshot dump of the logic table and code. The values are:-   **SNAP=N**

MR95 does not provide a snapshot dump.

-   **SNAP=Y**

MR95 provides a snapshot dump.


|
|STDEXTR|\(Optional.\) The maximum number of extract work files \(called EXT files\) that can be created by MR95 in the extract phase. For the reference phase, set **STDEXTR=000**.If set in the extract phase, the value of **STDEXTR** must be the same as the value of parameter **MAXIMUMFILENUM in MR86**. If these values are different, then unpredictable results can occur.

The value must be three digits between **000** and **999** \(inclusive\). A value of 000 means the view has no format phase. The default value is 001.

See also parameter EXTFILES above in this table.

For more on MAXIMUMFILENUM in MR86, see help topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

For more on EXT files, see topic "**EXT file overview**". A link to that overview is under **Related concepts** below.

|
|TAPETHRDS|\(Optional.\) The maximum number of tape threads. For details, see parameter **DISKTHRDS** above.

|
|THRULTROW|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file. The THRULTROW parameter helps define a trace of parts of the logic table for MR95. For details, see parameter **FROMLTROW** above.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|THRUREC|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file. The THRUREC parameter defines the last MR95 input record to trace. For details, see parameter **FROMREC** above.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|TRACE|\(Optional.\) This parameter creates a trace of processing in MR95. The values are:-   **TRACE=N**.

MR95 does not create a trace. This is the default value.

-   **TRACE=Y**.

MR95 traces processing as directed by these parameters:

    -   **DDNAME**,
    -   **FROMLTROW**,
    -   **FROMREC**,
    -   **LTFUNC**,
    -   **THRULTROW**,
    -   **THRUREC**,
    -   **VALUE**,
    -   **VIEW**,
    -   **VLEN**,
    -   **VPOS**.
For more on tracing, see **Section 60 Trace config and output.**


|
|TRACEINPUT|\(Optional.\) This parameter is entirely independent of the other parameters, and is not one of the trace parameters given in **Section 60 Trace config and output.** TRACEINPUT does require that **TRACE=Y** is included in the configuration file.TRACEINPUT results in a dump of the each source input record for a given DD name . Code as follows:

**TRACEINPUT=JCLddname**

The value of "JCLddname" is a DD name for a source physical file in the JCL for the MR95 step.

|
|VALUE|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file and a **VIEW** parameter is included.For tracing to occur, the **VALUE** parameter must be stored in the source logical record location given by **VPOS** and a length given by **VLEN**.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|VIEW|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file. The VIEW parameter specifies a view to trace, for example,

"**VIEW=987**"

where "987" is a valid ID number for a view already included in the VDP file for MR95.

The extent of the tracing performed for the given view depends on the other trace parameters, which are:

-   **DDNAME**,
-   **FROMLTROW**,
-   **FROMREC**,
-   **LTFUNC**,
-   **THRULTROW**,
-   **THRUREC**,
-   **VALUE**,
-   **VLEN**,
-   **VPOS**.

The number of digits in a view ID number is not restricted.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|VDPBYTES|\(Optional.\) The VDP table size in kilobytes. If the value is too high, then the unneeded space is released. If the value is not large enough, MR95 will abend. A typical value is **010000**.

The value must be six digits less than or equal to **999999**. The default value is 001000.

|
|VLEN|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file and a **VIEW** parameter is included. For tracing to occur, the **VALUE** parameter must be stored in the source logical record location given by **VPOS** and a length given by **VLEN**.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|VPOS|\(Optional.\) This parameter is active only if **TRACE=Y** is included in the configuration file and a **VIEW** parameter is included. For tracing to occur, the **VALUE** parameter must be stored in the source logical record location given by **VPOS** and a length given by **VLEN**.

This is one of the trace parameters - see **Section 60 Trace config and output.**

|
|WRITEBUF|\(Optional.\) The maximum number of write buffers shared by all output files.A high value may waste memory. A low value may results in an 878 error.

The value must be two digits between **01** and **99** \(inclusive\). The default value is 15.

|

## 55 DD MR95REH - REH file {#55 .section}

DDNAME MR95REH is for the input REH file in the extract phase.

See help topic "**REH file overview**". A link to that overview is under **Related concepts** below.

## 60 DD MR95RPT {#60 .section}

DDNAME MR95RPT is for a report. An example is below:

![](images/MR95_Extract_Rpt_01.GIF)

## 65 DD MR95TRAC - Trace file {#65 .section}

DDNAME MR95TRAC is for the optional trace file. This is often coded as **DD SYSOUT=\***.

The name MR95TRAC is overridden by the value of optional parameter DDNAME - see section [50 DD MR95PARM - Configuration](PERMR95X.md#50).

For more on tracing, see section [75 Trace config and output](PERMR95X.md#75).

## 70 DD MR95VDP - VDP file {#70 .section}

DDNAME MR95VDP is the input VDP file to MR95.

See help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 75 Trace config and output {#75 .section}

Trace parameters in the configuration file can result in MR95 creating trace output. MR95 can produce trace output in the reference and extract phases. You must have **TRACE=Y** on a line by itself in the configuration file for the trace parameters to be active.

Note the following:

-   A **set** of trace parameters must all be coded on the same line. There can be multiple sets of trace parameters in the configuration file. Each set is on a line that can be no longer than 80 characters. Note that TRACE=Y is on a line by itself and is not part of a set.
-   The set has parameters effectively linked by a logical AND operation. This means that all the conditions in that set must be true to generate trace output.
-   If none of the trace sets include a **VIEW** parameter, only the first trace set is executed.
-   If **at least one** trace set has a **VIEW** parameter, then **only** trace sets with a **VIEW** parameter are executed.
-   For views using multiple threads, the trace output may be in random order. To control this, use parameters **1STTHREAD**, **DISKTHRDS** and **TAPETHRDS**.

A set of trace parameters can include the following parameters:

-   **DDNAME**,
-   **FROMLTROW**,
-   **FROMREC**,
-   **LTFUNC**,
-   **THRULTROW**,
-   **THRUREC**,
-   **TRACE**,
-   **VALUE**,
-   **VIEW**,
-   **VLEN**,
-   **VPOS**.

For details of these trace parameters \(and all the other parameters\), see the section on **DD MR95PARM**. Notice that TRACEINPUT is not a trace parameter like the others and is not included in a "trace set". TRACEINPUT only requires that **TRACE=Y** is included in the configuration file.

An **trace example** is given below.

The configuration file has these parameters, which trace only the first four records processed:

![](images/MR95_Trace01_Config_01.gif)

The MR95 report contains these lines showing the trace configuration:

![](images/MR95_Trace01_Output_01.gif)

The actual trace output is given in full below. The images alternate between the left and right side of the mainframe data.

![](images/MR95_Trace01_TRACFile_01Left.gif)

![](images/MR95_Trace01_TRACFile_01Right.gif)

![](images/MR95_Trace01_TRACFile_02Left.gif)

![](images/MR95_Trace01_TRACFile_02Right.gif)

![](images/MR95_Trace01_TRACFile_03Left.gif)

![](images/MR95_Trace01_TRACFile_03Right.gif)

![](images/MR95_Trace01_TRACFile_04Left.gif)

![](images/MR95_Trace01_TRACFile_04Right.gif)

![](images/MR95_Trace01_TRACFile_05Left.gif)

![](images/MR95_Trace01_TRACFile_05Right.gif)

![](images/MR95_Trace01_TRACFile_06Left.gif)

![](images/MR95_Trace01_TRACFile_06Right.gif)

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

The sample JCL below runs a job for the entire extract phase.

|```
//V9999EE JOB (ACCT),'VIEW 9999 EXTRACT  ',                             00010000
//          NOTIFY=&SYSUID.,                                            00020000
//          CLASS=A,                                                    00030000
//          MSGLEVEL=(1,1),                                             00040000
//          MSGCLASS=H                                                  00050000
//*                                                                     00060000
//JOBLIB   DD DISP=SHR,DSN=SAFR.BTCHLOAD                                00070000
//         DD DISP=SHR,DSN=DB2.SDSNEXIT                                 00080000
//*                                                                     00090000
//********************************************************************* 00100000
//*                                                                     00110000
//*   EXTRACT EVENT DATA                                                00120000
//*                                                                     00130000
//********************************************************************* 00140000
//*                                                                     00150000
// SET HISPN='MYCO.DATA' INPUT SAFR PVT NON-VSAM                        00160000
// SET HISPV='MYCO.DATA' INPUT SAFR PVT VSAM                            00170000
// SET HISSN='MYCO.DATA' INPUT SAFR SHR NON-VSAM                        00180000
// SET HISSV='MYCO.DATA' INPUT SAFR SHR VSAM                            00190000
// SET HIUPN='USERNAME.V9999' INPUT USER PVT NON-VSAM                   00200000
// SET HIUPV='USERNAME.V9999' INPUT USER PVT VSAM                       00210000
// SET HIUSN='USERNAME.V9999' INPUT USER SHR NON-VSAM                   00220000
// SET HIUSV='USERNAME.V9999' INPUT USER SHR VSAM                       00230000
// SET HOSPN='MYCO.DATA' OUTPUT SAFR PVT NON-VSAM                       00240000
// SET HOSPV='MYCO.DATA' OUTPUT SAFR PVT VSAM                           00250000
// SET HOSSN='MYCO.DATA'  OUTPUT SAFR SHR NON-VSAM                      00260000
// SET HOSSV='MYCO.DATA'  OUTPUT SAFR SHR VSAM                          00270000
// SET HOUPN='USERNAME.V9999' OUTPUT USER PVT NON-VSAM                  00280000
// SET HOUPV='USERNAME.V9999' OUTPUT USER PVT VSAM                      00290000
// SET HOUSN='USERNAME.V9999' OUTPUT USER SHR NON-VSAM                  00300000
// SET HOUSV='USERNAME.V9999' OUTPUT USER SHR VSAM                      00310000
// SET JOBLIB='USERNAME.SAFR.JOB' JOB LIB                               00320000
// SET PARMLIB='USERNAME.SAFR.PARM' PARM LIB                            00330000
// SET UNIT='SYSDA'  DASD POOL FOR PERM DATASETS                        00340000
//*                                                                     00350000
//********************************************************************* 00360000
//* PSTEP500 - PRINT LOGIC TABLE REPORT                                 00370000
//*                                                                     00380000
//* NORMAL RETURN CODE = 0                                              00390000
//*                                                                     00400000
//* IF THIS STEP ABENDS:                                                00410000
//* 1) FIX APPLICATION IF POSSIBLE                                      00420000
//* 2) RESTART THE JOB IN THIS STEP                                     00430000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00440000
//*                                                                     00450000
//********************************************************************* 00460000
//*                                                                     00470000
//PSTEP500 EXEC PGM=GVBUT90,                                            00480000
//          PARM='A'                                                    00490000
//*                                                                     00500000
//GV4LT    DD DSN=&HISPN..MR76.XLT,                                     00510000
//            DISP=SHR                                                  00520000
//*                                                                     00530000
//SYSIN    DD DUMMY                                                     00540000
//*                                                                     00550000
//UT90RPT  DD SYSOUT=*                                                  00560000
//SYSOUT   DD SYSOUT=*                                                  00570000
//CEEDUMP  DD SYSOUT=*                                                  00580000
//SYSMDUMP DD SYSOUT=*                                                  00590000
//*                                                                     00600000
//********************************************************************* 00610000
//* IF THIS STEP ABENDS:                                                00620000
//* FOLLOW RESTART GIVEN IN STEP PSTEP500                               00630000
//*                                                                     00640000
//********************************************************************* 00650000
//*                                                                     00660000
//PSTEP501 EXEC PGM=GVBUT99,                                            00670000
//            COND=(0,EQ,PSTEP500),                                     00680000
//            PARM='1099'                                               00690000
//*                                                                     00700000
//SYSMDUMP DD SYSOUT=*                                                  00710000
//*                                                                     00720000
//**********************************************************************00730000
//* PSTEP520 - DELETE FILE(S) CREATED IN NEXT STEP                      00740000
//*                                                                     00750000
//* NORMAL RETURN CODE = 0                                              00760000
//*                                                                     00770000
//* IF THIS STEP ABENDS:                                                00780000
//* 1) FIX APPLICATION IF POSSIBLE                                      00790000
//* 2) RESTART THE JOB IN THIS STEP                                     00800000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00810000
//*                                                                     00820000
//**********************************************************************00830000
//*                                                                     00840000
//PSTEP520 EXEC PGM=IDCAMS                                              00850000
//*                                                                     00860000
//SYSPRINT DD SYSOUT=*                                                  00870000
//*                                                                     00880000
//SYSIN    DD *                                                     %%% 00890000
 /* USER-DEFINED DATA SETS: */                                          00900000
                                                                        00910000
 DELETE  ??.V9999.F0000000              PURGE                           00920000
 IF LASTCC > 0  THEN   /* IF FAILS,  */ -                               00930000
     SET MAXCC = 0     /* KEEP GOING */                                 00940000
                                                                        00950000
                                                                        00960000
 /* SAFR WORK DATA SETS */                                              00970000
                                                                        00980000
 DELETE  ??.V9999.EXT.BIL PURGE                                         00990000
 IF LASTCC > 0  THEN   /* IF FAILS,  */ -                               01000000
     SET MAXCC = 0     /* KEEP GOING */                                 01010000
                                                                        01020000
 DELETE  ??.V9999.EXTR001.EXT PURGE                                     01030000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01040000
     SET MAXCC = 0      /* KEEP GOING */                                01050000
                                                                        01060000
 DELETE  ??.V9999.EXTR002.EXT PURGE                                     01070000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01080000
     SET MAXCC = 0      /* KEEP GOING */                                01090000
                                                                        01100000
 DELETE  ??.V9999.EXTR003.EXT PURGE                                     01110000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01120000
     SET MAXCC = 0      /* KEEP GOING */                                01130000
                                                                        01140000
 DELETE  ??.V9999.EXTR004.EXT PURGE                                     01150000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01160000
     SET MAXCC = 0      /* KEEP GOING */                                01170000
                                                                        01180000
 DELETE  ??.V9999.EXTR005.EXT PURGE                                     01190000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01200000
     SET MAXCC = 0      /* KEEP GOING */                                01210000
                                                                        01220000
 DELETE  ??.V9999.EXTR006.EXT PURGE                                     01230000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01240000
     SET MAXCC = 0      /* KEEP GOING */                                01250000
                                                                        01260000
 DELETE  ??.V9999.EXTR001.SXT PURGE                                     01270000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01280000
     SET MAXCC = 0      /* KEEP GOING */                                01290000
                                                                        01300000
 DELETE  ??.V9999.EXTR002.SXT PURGE                                     01310000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01320000
     SET MAXCC = 0      /* KEEP GOING */                                01330000
                                                                        01340000
 DELETE  ??.V9999.EXTR003.SXT PURGE                                     01350000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01360000
     SET MAXCC = 0      /* KEEP GOING */                                01370000
                                                                        01380000
 DELETE  ??.V9999.EXTR004.SXT PURGE                                     01390000
 IF LASTCC > 0  THEN    /* IF FAILS,   */ -                             01400000
     SET MAXCC = 0      /* KEEP GOING */                                01410000
                                                                        01420000
 DELETE  ??.V9999.EXTR005.SXT PURGE                                     01430000
 IF LASTCC > 0  THEN    /* IF FAILS,   */ -                             01440000
     SET MAXCC = 0      /* KEEP GOING */                                01450000
                                                                        01460000
 DELETE  ??.V9999.EXTR006.SXT PURGE                                     01470000
 IF LASTCC > 0  THEN    /* IF FAILS,   */ -                             01480000
     SET MAXCC = 0      /* KEEP GOING */                                01490000
                                                                        01500000
//*                                                                     01510000
//********************************************************************* 01520000
//* PSTEP540 - EXTRACT DATA FOR VIEWS                                   01530000
//*                                                                     01540000
//* NORMAL RETURN CODE = 0                                              01550000
//*                                                                     01560000
//* IF THIS STEP ABENDS:                                                01570000
//* 1) FIX APPLICATION IF POSSIBLE                                      01580000
//* 2) RESTART THE JOB IN PSTEP520                                      01590000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01600000
//*                                                                     01610000
//********************************************************************* 01620000
//*                                                                     01630000
//PSTEP540 EXEC PGM=GVBMR95,                                            01640000
// REGION=0M                                                            01650000
//*                                                                     01660000
//*            INPUT SAFR FILES                                         01670000
//*                                                                     01680000
//MR95PARM DD DSN=&PARMLIB.(V9999E95),                                  01690000
//            DISP=SHR                                                  01700000
//*                                                                     01710000
//MR95VDP  DD DSN=&HISPN..MR77.VDP,                                     01720000
//            DISP=SHR                                                  01730000
//*                                                                     01740000
//MR95LTBL DD DSN=&HISPN..MR76.XLT,                                     01750000
//            DISP=SHR                                                  01760000
//*                                                                     01770000
//MR95ENVV DD DSN=&PARMLIB.(EMPTY),                                     01780000
//            DISP=SHR                                                  01790000
//*                                                                     01800000
//MR95REH  DD DSN=&HISPN..REH,                                          01810000
//            DISP=SHR                                                  01820000
//*                                                                     01830000
//GREF003  DD DISP=SHR,DSN=&HISPN..FILE003.RED                          01840000
//GREF004  DD DISP=SHR,DSN=&HISPN..FILE004.RED                          01850000
//GREF005  DD DISP=SHR,DSN=&HISPN..FILE005.RED                          01860000
//GREF006  DD DISP=SHR,DSN=&HISPN..FILE006.RED                          01870000
//GREF007  DD DISP=SHR,DSN=&HISPN..FILE007.RED                          01880000
//GREF008  DD DISP=SHR,DSN=&HISPN..FILE008.RED                          01890000
//GREF009  DD DISP=SHR,DSN=&HISPN..FILE009.RED                          01900000
//GREF010  DD DISP=SHR,DSN=&HISPN..FILE010.RED                          01910000
//GREF011  DD DISP=SHR,DSN=&HISPN..FILE011.RED                          01920000
//GREF012  DD DISP=SHR,DSN=&HISPN..FILE012.RED                          01930000
//*                                                                     01940000
//*            INPUT EVENT FILES                                        01950000
//*                                                                 %%% 01960000
//* MASTER SALES FILES                                                  01970000
//CA000001 DD DISP=SHR,DSN=??.CA.CURR.YR                                01980000
//CO000001 DD DISP=SHR,DSN=??.CO.CURR.YR                                01990000
//IL000001 DD DISP=SHR,DSN=??.IL.CURR.YR                                02000000
//MO000001 DD DISP=SHR,DSN=??.MO.CURR.YR                                02010000
//OH000001 DD DISP=SHR,DSN=??.OH.CURR.YR                                02020000
//NJ000001 DD DISP=SHR,DSN=??.NJ.CURR.YR                                02030000
//NY000001 DD DISP=SHR,DSN=??.NY.CURR.YR                                02040000
//TX000001 DD DISP=SHR,DSN=??.TX.CURR.YR                                02050000
//VA000001 DD DISP=SHR,DSN=??.VA.CURR.YR                                02060000
//*                                                                     02070000
//* REFERENCE FILES AS EVENT FILES                                      02080000
//PROD0001 DD DISP=SHR,DSN=??.PRD                                       02090000
//PRODADV1 DD DISP=SHR,DSN=??.PRD.ADVANCED                              02100000
//PRODNUM1 DD DISP=SHR,DSN=??.PRD.NUMERIC.ERRORS                        02110000
//STE00001 DD DISP=SHR,DSN=??.STE                                       02120000
//CUST0001 DD DISP=SHR,DSN=??.CUS                                       02130000
//TYPE0001 DD DISP=SHR,DSN=??.TYP                                       02140000
//*                                                                     02150000
//*            OUTPUT SAFR FILES                                        02160000
//*                                                                     02170000
//*                                                                     02230000
//EXTR001  DD DSN=&HOSPN..EXTR001.EXT,                                  02240000
//            DISP=(NEW,CATLG,DELETE),                                  02250000
//            UNIT=(&UNIT.,10),                                         02260000
//            SPACE=(TRK,(1,1000),RLSE),                                02270000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02280000
//*                                                                     02290000
//EXTR002  DD DSN=&HOSPN..EXTR002.EXT,                                  02300000
//            DISP=(NEW,CATLG,DELETE),                                  02310000
//            UNIT=(&UNIT.,10),                                         02320000
//            SPACE=(TRK,(1,1000),RLSE),                                02330000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02340000
//*                                                                     02350000
//EXTR003  DD DSN=&HOSPN..EXTR003.EXT,                                  02360000
//            DISP=(NEW,CATLG,DELETE),                                  02370000
//            UNIT=(&UNIT.,10),                                         02380000
//            SPACE=(TRK,(1,1000),RLSE),                                02390000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02400000
//*                                                                     02410000
//EXTR004  DD DSN=&HOSPN..EXTR004.EXT,                                  02420000
//            DISP=(NEW,CATLG,DELETE),                                  02430000
//            UNIT=(&UNIT.,10),                                         02440000
//            SPACE=(TRK,(1,1000),RLSE),                                02450000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02460000
//*                                                                     02470000
//EXTR005  DD DSN=&HOSPN..EXTR005.EXT,                                  02480000
//            DISP=(NEW,CATLG,DELETE),                                  02490000
//            UNIT=(&UNIT.,10),                                         02500000
//            SPACE=(TRK,(1,1000),RLSE),                                02510000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02520000
//*                                                                     02530000
//EXTR006  DD DSN=&HOSPN..EXTR006.EXT,                                  02540000
//            DISP=(NEW,CATLG,DELETE),                                  02550000
//            UNIT=(&UNIT.,10),                                         02560000
//            SPACE=(TRK,(1,1000),RLSE),                                02570000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02580000
//*                                                                     02590000
//SORT001  DD DSN=&HOSPN..EXTR001.SXT,                                  02600000
//            DISP=(NEW,CATLG,DELETE),                                  02610000
//            UNIT=&UNIT.,                                              02620000
//            SPACE=(TRK,(1,1),RLSE),                                   02630000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02640000
//*                                                                     02650000
//SORT002  DD DSN=&HOSPN..EXTR002.SXT,                                  02660000
//            DISP=(NEW,CATLG,DELETE),                                  02670000
//            UNIT=&UNIT.,                                              02680000
//            SPACE=(TRK,(1,1),RLSE),                                   02690000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02700000
//*                                                                     02710000
//SORT003  DD DSN=&HOSPN..EXTR003.SXT,                                  02720000
//            DISP=(NEW,CATLG,DELETE),                                  02730000
//            UNIT=&UNIT.,                                              02740000
//            SPACE=(TRK,(1,1),RLSE),                                   02750000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02760000
//*                                                                     02770000
//SORT004  DD DSN=&HOSPN..EXTR004.SXT,                                  02780000
//            DISP=(NEW,CATLG,DELETE),                                  02790000
//            UNIT=&UNIT.,                                              02800000
//            SPACE=(TRK,(1,1),RLSE),                                   02810000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02820000
//*                                                                     02830000
//SORT005  DD DSN=&HOSPN..EXTR005.SXT,                                  02840000
//            DISP=(NEW,CATLG,DELETE),                                  02850000
//            UNIT=&UNIT.,                                              02860000
//            SPACE=(TRK,(1,1),RLSE),                                   02870000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02880000
//*                                                                     02890000
//SORT006  DD DSN=&HOSPN..EXTR006.SXT,                                  02900000
//            DISP=(NEW,CATLG,DELETE),                                  02910000
//            UNIT=&UNIT.,                                              02920000
//            SPACE=(TRK,(1,1),RLSE),                                   02930000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02940000
//*                                                                     02950000
//MR95RPT  DD SYSOUT=*                                                  02960000
//MR95TRAC DD SYSOUT=*                                                  02970000
//SNAPDATA DD SYSOUT=*                                                  02980000
//SYSOUT   DD SYSOUT=*                                                  02990000
//CEEDUMP  DD SYSOUT=*                                                  03000000
//*                                                                     03010000
//MR95BILL DD DUMMY                                                     03015000
//SYSMDUMP DD SYSOUT=*                                                  03020000
//*                                                                     03030000
//*            OUTPUT VIEW FILES                                        03040000
//*                                                                 %%% 03050000
//F0000000 DD DSN=&HIUPV..F0000000,                                     03060000
//            DISP=(NEW,CATLG,DELETE),                                  03070000
//            UNIT=SYSDA,                                               03080000
//            SPACE=(TRK,(100,100),RLSE),                               03090000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=1)                           03100000
//*                                                                     03110000
//F0001111 DD SYSOUT=*,RECFM=FBA,LRECL=250                              03120000
//*                                                                     03130000
//********************************************************************* 03140000
//* IF THIS STEP ABENDS:                                                03150000
//* FOLLOW RESTART GIVEN IN STEP PSTEP540                               03160000
//*                                                                     03170000
//********************************************************************* 03180000
//*                                                                     03190000
//PSTEP541 EXEC PGM=GVBUT99,                                            03200000
//            COND=(1,GE,PSTEP540),                                     03210000
//            PARM='1099'                                               03220000
//*                                                                     03230000
//SYSMDUMP DD SYSOUT=*                                                  03240000
//*                                                                     03250000
//*******************************************************************   03260000
//* JSTEP560 - CREATE SWITCH FILE                                       03270000
//*******************************************************************   03280000
//*                                                                     03290000
//*JSTEP560 EXEC PGM=IDCAMS                                             03300000
//*                                                                     03310000
//*SYSIN    DD *                                                        03320000
//* DELETE -                                                            03330000
//*     (??.V9999.CLEANUP.SWT) PURGE                                    03340000
//* IF LASTCC > 0  THEN    /* IF FAILS,   */ -                          03350000
//*     SET MAXCC = 0      /* KEEP GOING */                             03360000
//*                                                                     03370000
//* DEFINE CLUSTER -                                                    03380000
//*     (NAME(??.V9999.CLEANUP.SWT) -                                   03390000
//*     STORAGECLASS(SCSTD) -                                           03400000
//*     NONINDEXED -                                                    03410000
//*     RECSZ(9999 9999) -                                              03420000
//*     SHR(2 3) -                                                      03430000
//*     SPEED -                                                         03440000
//*     ) -                                                             03450000
//* DATA -                                                              03460000
//*     (NAME(??.V9999.CLEANUP.SWT.DATA) -                              03470000
//*     CISZ(10240) -                                                   03480000
//*     TRK(1 1) -                                                      03490000
//*     )                                                               03500000
//*                                                                     03510000
//* IF LASTCC > 0 THEN    /* IF FAILS, */ -                             03520000
//*     SET MAXCC = 16    /* SKIP LATER STEPS  */                       03530000
//*                                                                     03540000
//* REPRO -                                                             03550000
//*     INFILE(INFILE) -                                                03560000
//*     OUTDATASET(??.V9999.CLEANUP.SWT)                                03570000
//*                                                                     03580000
//* IF LASTCC > 0 THEN    /* IF FAILS,   */ -                           03590000
//*     SET MAXCC = 16    /* SKIP LATER STEPS  */                       03600000
//*                                                                     03610000
//*                                                                     03620000
//*INFILE   DD DSN=&HIUPV..DUMMY.SWT,                                   03630000
//*            DISP=SHR                                                 03640000
//*                                                                     03650000
//*SYSPRINT DD SYSOUT=*                                                 03660000
//*                                                                     03670000
//********************************************************************* 03680000
//* IF THIS STEP ABENDS:                                                03690000
//* FOLLOW RESTART GIVEN IN STEP JSTEP560                               03700000
//*                                                                     03710000
//********************************************************************* 03720000
//*                                                                     03730000
//*JSTEP561 EXEC PGM=GVBUT99,                                           03740000
//*            COND=(0,EQ,JSTEP560),                                    03750000
//*            PARM='1099'                                              03760000
//*                                                                     03770000
//*SYSMDUMP DD SYSOUT=*                                                 03780000
//*                                                                     03790000
//*******************************************************************   03800000
//* JSTEPN10 - SUBMIT NEXT JOB                                          03810000
//*******************************************************************   03820000
//*                                                                     03830000
//*JSTEPN10 EXEC PGM=IEBGENER                                           03840000
//*                                                                     03850000
//*SYSIN    DD DUMMY                                                    03860000
//*                                                                     03870000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF1),                                  03880000
//*            DISP=SHR                                                 03890000
//*                                                                     03900000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        03910000
//*                                                                     03920000
//*SYSPRINT DD SYSOUT=*                                                 03930000
//*                                                                     03940000
//********************************************************************* 03950000
//* IF THIS STEP ABENDS:                                                03960000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN10                               03970000
//*                                                                     03980000
//********************************************************************* 03990000
//*                                                                     04000000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           04010000
//*            COND=(0,EQ,JSTEPN10),                                    04020000
//*            PARM='1099'                                              04030000
//*                                                                     04040000
//*SYSMDUMP DD SYSOUT=*                                                 04050000
//*                                                                     04060000
//*******************************************************************   04070000
//* JSTEPN20 - SUBMIT NEXT JOB                                          04080000
//*******************************************************************   04090000
//*                                                                     04100000
//*JSTEPN20 EXEC PGM=IEBGENER                                           04110000
//*                                                                     04120000
//*SYSIN    DD DUMMY                                                    04130000
//*                                                                     04140000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF2),                                  04150000
//*            DISP=SHR                                                 04160000
//*                                                                     04170000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04180000
//*                                                                     04190000
//*SYSPRINT DD SYSOUT=*                                                 04200000
//*                                                                     04210000
//********************************************************************* 04220000
//* IF THIS STEP ABENDS:                                                04230000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN20                               04240000
//*                                                                     04250000
//********************************************************************* 04260000
//*                                                                     04270000
//*JSTEPN21 EXEC PGM=GVBUT99,                                           04280000
//*            COND=(0,EQ,JSTEPN20),                                    04290000
//*            PARM='1099'                                              04300000
//*                                                                     04310000
//*SYSMDUMP DD SYSOUT=*                                                 04320000
//*                                                                     04330000
//*******************************************************************   04340000
//* JSTEPN30 - SUBMIT NEXT JOB                                          04350000
//*******************************************************************   04360000
//*                                                                     04370000
//*JSTEPN30 EXEC PGM=IEBGENER                                           04380000
//*                                                                     04390000
//*SYSIN    DD DUMMY                                                    04400000
//*                                                                     04410000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF3),                                  04420000
//*            DISP=SHR                                                 04430000
//*                                                                     04440000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04450000
//*                                                                     04460000
//*SYSPRINT DD SYSOUT=*                                                 04470000
//*                                                                     04480000
//********************************************************************* 04490000
//* IF THIS STEP ABENDS:                                                04500000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN30                               04510000
//*                                                                     04520000
//********************************************************************* 04530000
//*                                                                     04540000
//*JSTEPN31 EXEC PGM=GVBUT99,                                           04550000
//*            COND=(0,EQ,JSTEPN30),                                    04560000
//*            PARM='1099'                                              04570000
//*                                                                     04580000
//*SYSMDUMP DD SYSOUT=*                                                 04590000
//*                                                                     04600000
//*******************************************************************   04610000
//* JSTEPN40 - SUBMIT NEXT JOB                                          04620000
//*******************************************************************   04630000
//*                                                                     04640000
//*JSTEPN40 EXEC PGM=IEBGENER                                           04650000
//*                                                                     04660000
//*SYSIN    DD DUMMY                                                    04670000
//*                                                                     04680000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF4),                                  04690000
//*            DISP=SHR                                                 04700000
//*                                                                     04710000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04720000
//*                                                                     04730000
//*SYSPRINT DD SYSOUT=*                                                 04740000
//*                                                                     04750000
//********************************************************************* 04760000
//* IF THIS STEP ABENDS:                                                04770000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN40                               04780000
//*                                                                     04790000
//********************************************************************* 04800000
//*                                                                     04810000
//*JSTEPN41 EXEC PGM=GVBUT99,                                           04820000
//*            COND=(0,EQ,JSTEPN40),                                    04830000
//*            PARM='1099'                                              04840000
//*                                                                     04850000
//*SYSMDUMP DD SYSOUT=*                                                 04860000
//*                                                                     04870000
//*******************************************************************   04880000
//* JSTEPN50 - SUBMIT NEXT JOB                                          04890000
//*******************************************************************   04900000
//*                                                                     04910000
//*JSTEPN50 EXEC PGM=IEBGENER                                           04920000
//*                                                                     04930000
//*SYSIN    DD DUMMY                                                    04940000
//*                                                                     04950000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF5),                                  04960000
//*            DISP=SHR                                                 04970000
//*                                                                     04980000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04990000
//*                                                                     05000000
//*SYSPRINT DD SYSOUT=*                                                 05010000
//*                                                                     05020000
//********************************************************************* 05030000
//* IF THIS STEP ABENDS:                                                05040000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN50                               05050000
//*                                                                     05060000
//********************************************************************* 05070000
//*                                                                     05080000
//*JSTEPN51 EXEC PGM=GVBUT99,                                           05090000
//*            COND=(0,EQ,JSTEPN50),                                    05100000
//*            PARM='1099'                                              05110000
//*                                                                     05120000
//*SYSMDUMP DD SYSOUT=*                                                 05130000
//*                                                                     05140000
//*******************************************************************   05150000
//* JSTEPN60 - SUBMIT NEXT JOB                                          05160000
//*******************************************************************   05170000
//*                                                                     05180000
//*JSTEPN60 EXEC PGM=IEBGENER                                           05190000
//*                                                                     05200000
//*SYSIN    DD DUMMY                                                    05210000
//*                                                                     05220000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF1),                                  05230000
//*            DISP=SHR                                                 05240000
//*                                                                     05250000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        05260000
//*                                                                     05270000
//*SYSPRINT DD SYSOUT=*                                                 05280000
//*                                                                     05290000
//********************************************************************* 05300000
//* IF THIS STEP ABENDS:                                                05310000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN60                               05320000
//*                                                                     05330000
//********************************************************************* 05340000
//*                                                                     05350000
//*JSTEPN61 EXEC PGM=GVBUT99,                                           05360000
//*            COND=(0,EQ,JSTEPN60),                                    05370000
//*            PARM='1099'                                              05380000
//*                                                                     05390000
//*SYSMDUMP DD SYSOUT=*                                                 05400000
//*                                                                     05410000
//*                                                                     05420000
```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR95**". A link to that overviews is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

