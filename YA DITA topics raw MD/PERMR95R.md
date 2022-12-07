# Program Runbook: MR95 Reference Data {#PERMR95R .reference}

## WARNING - this topic is Work In Progress. { .section}

## 01 Summary of this topic {#01 .section}

For **MR95 parameters**, see Section [50 DD MR95PARM - Configuration](PERMR95R.md#50).

The sections in this topic are as follows:

-   [02 Diagram](PERMR95R.md#02)
-   [03 What MR95 does in the reference phase](PERMR95R.md#03)
-   [05 Checklist for reference phase](PERMR95R.md#05)
-   [10 PARM options for MR95 reference step](PERMR95R.md#10)
-   [20 DD \(from metadata\) - Reference files](PERMR95R.md#20)
-   [22 DD GREFREH - REH file](PERMR95R.md#22)
-   [24 DD GREFRTH - RTH file](PERMR95R.md#24)
-   [26 DD GREFx - RED files](PERMR95R.md#26)
-   [30 DD MERGPARM - DUMMY](PERMR95R.md#30)
-   [35 DD MR95BILL - DUMMY](PERMR95R.md#35)
-   [40 DD MR95ENVV - Environment variables](PERMR95R.md#40)
-   [45 DD MR95LTBL - JLT file](PERMR95R.md#45)
-   [50 DD MR95PARM - Configuration](PERMR95R.md#50)
-   [55 DD MR95REH - DUMMY](PERMR95R.md#55)
-   [60 DD MR95RPT](PERMR95R.md#60)
-   [65 DD MR95TRAC - Trace file](PERMR95R.md#65)
-   [70 DD MR95VDP - VDP file](PERMR95R.md#70)
-   [75 Trace config and output](PERMR95R.md#75)
-   [80 JCL Sample](PERMR95R.md#80)
-   [99 Troubleshooting](PERMR95R.md#99)
-   [100 Need this page completed?](PERMR95R.md#100)

## 02 Diagram {#02 .section}

![](images/MR95_Action_01_Ref.gif)

## 03 What MR95 does in the reference phase {#03 .section}

See these overviews:

-   "**MR95 Reference & Extract overview**"
-   "**Reference phase overview**"
-   "**RED file overview**"
-   "**REH file overview**"
-   "**RTH file overview**"
-   "**Logic tables and codes overview**"
-   "**JLT file overview**"
-   "**VDP file overview**"
-   "**Event and Reference files overview**"

Links to the above overviews are under **Related concepts** below.

## 05 Checklist for reference phase {#05 .section}

See help topic "**Checklist: Reference phase**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR95 reference step {#10 .section}

No PARM options.

## 20 DD \(from metadata\) - Reference files {#20 .section}

Some DDNAMEs for MR95 in the reference phase do not appear in Section [02 Diagram](PERMR95R.md#02).

These DDNAMEs are for reference files, which MR95 reads in the reference phase. A reference file is a source logical file for a step in a lookup path. MR95 in the reference phase uses reference files to create RED files, REH files and RTH files.

See these overviews:

-   "**Lookup paths overview**"
-   "**MR95 Reference & Extract overview**"
-   "**Reference phase overview**"
-   "**RED file overview**"
-   "**REH file overview**"
-   "**RTH file overview**"
-   "**Event and Reference files overview**"

Links to the above overviews are under **Related concepts** below.

## 22 DD GREFREH - REH file {#22 .section}

DDNAME GREFREH is for the output REH file in the reference phase.

See help topic "**REH file overview**". A link to that overview is under **Related concepts** below.

## 24 DD GREFRTH - RTH file {#24 .section}

DDNAME GREFRTH is for the output RTH file in the reference phase.

See help topic "**RTH file overview**". A link to that overview is under **Related concepts** below.

## 26 DD GREFx - RED files {#26 .section}

DDNAMEs GREFx are for the RED files that are output in the reference phase.

See help topic "**RED file overview**". A link to that overview is under **Related concepts** below.

Note the following:

-   The GREFx files are RED files that are **created** by MR95 in the reference phase.
-   The GREFx files that are needed for lookups in the extract phase are listed in the REH file - see section [22 DD GREFREH - REH file](PERMR95R.md#22).
-   The GREFx files that are needed for lookups in Sort Key Titles in the format phase are listed in the RTH file - see section [24 DD GREFRTH - RTH file](PERMR95R.md#24).

## 30 DD MERGPARM - DUMMY {#30 .section}

DDNAME MERGPARM is for parameters required to configure a Common Key Buffer in the extract phase.

This DDNAME is DUMMY for the reference phase.

## 35 DD MR95BILL - DUMMY {#35 .section}

DDNAME MR95BILL is obsolete and should always be DD DUMMY. The DDNAME MR95BILL is still required.

In earlier versions of SAFR, DDNAME MR95BILL produced statistics to allow your company to perform internal billing.

## 40 DD MR95ENVV - Environment variables {#40 .section}

DDNAME MR95ENVV is a parameter file that sets values for environment variables.

To be completed.

## 45 DD MR95LTBL - JLT file {#45 .section}

DDNAME MR95LTBL is the JLT file which is a key input to MR95 in the reference phase.

See help topic "**JLT file overview**". A link to that overview is under **Related concepts** below.

## 50 DD MR95PARM - Configuration {#50 .section}

DDNAME MR95PARM is the configuration file for MR95.

An asterisk \(\*\) in the first column indicates the line is a comment only.

**Example configuration file:**

``` {#MR95Parm01}
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

## 55 DD MR95REH - DUMMY {#55 .section}

DDNAME MR95REH is for the input REH file in the extract phase.

This DDNAME is DUMMY for the reference phase.

## 60 DD MR95RPT {#60 .section}

DDNAME MR95RPT is for a report. To be completed.

## 65 DD MR95TRAC - Trace file {#65 .section}

DDNAME MR95TRAC is for the optional trace file. This is often coded as **DD SYSOUT=\***.

The name MR95TRAC is overridden by the value of optional parameter DDNAME - see section [50 DD MR95PARM - Configuration](PERMR95R.md#50).

For more on tracing, see section [75 Trace config and output](PERMR95R.md#75).

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

The sample JCL below runs a job for the entire reference phase.

|```
//V9999DR JOB (ACCT),'VIEW 9999 REFERENCE ',                            00010000
//          NOTIFY=&SYSUID.,                                            00020000
//          CLASS=A,                                                    00030000
//          MSGLEVEL=(1,1),                                             00040000
//          MSGCLASS=H                                                  00050000
//*                                                                     00060000
//JOBLIB   DD DISP=SHR,DSN=SAFR.BTCHLOAD                                00070001
//         DD DISP=SHR,DSN=DB2.SDSNEXIT                                 00080001
//*                                                                     00090000
//********************************************************************* 00100000
//*                                                                     00110000
//*   PREPARE REFERENCE DATA                                            00120000
//*                                                                     00130000
//********************************************************************* 00140000
//*                                                                     00150000
// SET HISPN='MYCO.DATA' INPUT SAFR PVT NON-VSAM                        00160000
// SET HISPV='MYCO.DATA' INPUT SAFR PVT VSAM                            00170000
// SET HISSN='MYCO.DATA' INPUT SAFR SHR NON-VSAM                        00180000
// SET HISSV='MYCO.DATA' INPUT SAFR SHR VSAM                            00190000
// SET HIUPN='USERNAME.V9999' INPUT USER PVT NON-VSAM                   00200001
// SET HIUPV='USERNAME.V9999' INPUT USER PVT VSAM                       00210001
// SET HIUSN='USERNAME.V9999' INPUT USER SHR NON-VSAM                   00220001
// SET HIUSV='USERNAME.V9999' INPUT USER SHR VSAM                       00230001
// SET HOSPN='MYCO.DATA' OUTPUT SAFR PVT NON-VSAM                       00240000
// SET HOSPV='MYCO.DATA' OUTPUT SAFR PVT VSAM                           00250000
// SET HOSSN='MYCO.DATA'  OUTPUT SAFR SHR NON-VSAM                      00260000
// SET HOSSV='MYCO.DATA'  OUTPUT SAFR SHR VSAM                          00270000
// SET HOUPN='USERNAME.V9999' OUTPUT USER PVT NON-VSAM                  00280001
// SET HOUPV='USERNAME.V9999' OUTPUT USER PVT VSAM                      00290001
// SET HOUSN='USERNAME.V9999' OUTPUT USER SHR NON-VSAM                  00300001
// SET HOUSV='USERNAME.V9999' OUTPUT USER SHR VSAM                      00310001
// SET JOBLIB='USERNAME.SAFR.JOB' JOB LIB                               00320001
// SET PARMLIB='USERNAME.SAFR.PARM' PARM LIB                            00330001
// SET UNIT='SYSDA'  DASD POOL FOR PERM DATASETS                        00340000
//*                                                                     00350000
//********************************************************************* 00360000
//* PSTEP300 - PRINT JOIN LOGIC TABLE REPORT                            00370000
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
//PSTEP300 EXEC PGM=GVBUT90,                                            00480000
// PARM='A'                                                             00490000
//*                                                                     00500000
//GV4LT    DD DSN=&HIUPN..MR76.JLT,                                     00510000
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
//* FOLLOW RESTART GIVEN IN STEP PSTEP300                               00630000
//*                                                                     00640000
//********************************************************************* 00650000
//*                                                                     00660000
//PSTEP301 EXEC PGM=GVBUT99,                                            00670000
//            COND=(0,EQ,PSTEP300),                                     00680000
//            PARM='1099'                                               00690000
//*                                                                     00700000
//SYSMDUMP DD SYSOUT=*                                                  00710000
//*                                                                     00720000
//**********************************************************************00730000
//* PSTEP320 - DELETE FILE(S) CREATED IN NEXT STEP                      00740000
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
//PSTEP320 EXEC PGM=IDCAMS                                              00850000
//*                                                                     00860000
//SYSPRINT DD SYSOUT=*                                                  00870000
//*                                                                     00880000
//SYSIN    DD *                                                         00890000
 DELETE  ??.V9999.REF.BIL PURGE                                         00900000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           00910000
     SET MAXCC = 0          /* KEEP GOING */                            00920000
                                                                        00930000
 DELETE  ??.V9999.FILE003.RED PURGE                                     00940000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           00950000
     SET MAXCC = 0          /* KEEP GOING */                            00960000
                                                                        00970000
 DELETE  ??.V9999.FILE004.RED PURGE                                     00980000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           00990000
     SET MAXCC = 0          /* KEEP GOING */                            01000000
                                                                        01010000
 DELETE  ??.V9999.FILE005.RED PURGE                                     01020000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01030000
     SET MAXCC = 0          /* KEEP GOING */                            01040000
                                                                        01050000
 DELETE  ??.V9999.FILE006.RED PURGE                                     01060000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01070000
     SET MAXCC = 0          /* KEEP GOING */                            01080000
                                                                        01090000
 DELETE  ??.V9999.FILE007.RED PURGE                                     01100000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01110000
     SET MAXCC = 0          /* KEEP GOING */                            01120000
                                                                        01130000
 DELETE  ??.V9999.FILE008.RED PURGE                                     01140000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01150000
     SET MAXCC = 0          /* KEEP GOING */                            01160000
                                                                        01170000
 DELETE  ??.V9999.FILE009.RED PURGE                                     01180000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01190000
     SET MAXCC = 0          /* KEEP GOING */                            01200000
                                                                        01210000
 DELETE  ??.V9999.FILE010.RED PURGE                                     01220000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01230000
     SET MAXCC = 0          /* KEEP GOING */                            01240000
                                                                        01250000
 DELETE  ??.V9999.FILE011.RED PURGE                                     01260000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01270000
     SET MAXCC = 0          /* KEEP GOING */                            01280000
                                                                        01290000
 DELETE  ??.V9999.FILE012.RED PURGE                                     01300000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01310000
     SET MAXCC = 0          /* KEEP GOING */                            01320000
                                                                        01330000
 DELETE  ??.V9999.REH PURGE                                             01340000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01350000
     SET MAXCC = 0          /* KEEP GOING */                            01360000
                                                                        01370000
 DELETE  ??.V9999.RTH PURGE                                             01380000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01390000
     SET MAXCC = 0          /* KEEP GOING */                            01400000
                                                                        01410000
//*                                                                     01420000
//********************************************************************* 01430000
//* PSTEP340 - PREPARE REFERENCE DATA                                   01440000
//*                                                                     01450000
//* NORMAL RETURN CODE = 0                                              01460000
//*                                                                     01470000
//* IF THIS STEP ABENDS:                                                01480000
//* 1) FIX APPLICATION IF POSSIBLE                                      01490000
//* 2) RESTART THE JOB IN PSTEP320                                      01500000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01510000
//*                                                                     01520000
//********************************************************************* 01530000
//*                                                                     01540000
//PSTEP340 EXEC PGM=GVBMR95,                                            01550000
// REGION=0M                                                            01560000
//*                                                                     01570000
//*            INPUT SAFR FILES                                         01580001
//*                                                                     01590000
//MR95PARM DD DSN=&PARMLIB.(V9999R95),                                  01600000
//            DISP=SHR                                                  01610000
//*                                                                     01620000
//MR95VDP  DD DSN=&HIUPN..MR77.VDP,                                     01630000
//            DISP=SHR                                                  01640000
//*                                                                     01650000
//MR95LTBL DD DSN=&HIUPN..MR76.JLT,                                     01660000
//            DISP=SHR                                                  01670000
//*                                                                     01680000
//MR95ENVV DD DSN=&PARMLIB.(EMPTY),                                     01690000
//            DISP=SHR                                                  01700000
//*                                                                     01710000
//*                                                                     01730000
//MR95REH  DD DUMMY,DCB=(LRECL=1,BLKSIZE=1)                             01740000
//*                                                                     01750000
//*            INPUT REFERENCE FILES                                    01760001
//*                                                                 %%% 01770000
//PRC00001    DD DISP=SHR,DSN=??.PRC                                    01780000
//PROD0001    DD DISP=SHR,DSN=??.PRD                                    01790000
//PRODADV1    DD DISP=SHR,DSN=??.PRD.ADVANCED                           01800000
//PRODNUM1    DD DISP=SHR,DSN=??.PRD.NUMERIC.ERRORS                     01810000
//STOR0001    DD DISP=SHR,DSN=??.STR                                    01820000
//STE00001    DD DISP=SHR,DSN=??.STE                                    01830000
//CUST0001    DD DISP=SHR,DSN=??.CUS                                    01840000
//TYPE0001    DD DISP=SHR,DSN=??.TYP                                    01850000
//TYPEEFF1    DD DISP=SHR,DSN=??.TYP.EFFDATE                            01860000
//TYPEADV1    DD DISP=SHR,DSN=??.TYP.ADVANCED                           01870000
//*                                                                     01880000
//*            OUTPUT SAFR FILES                                        01890001
//*                                                                     01900000
//*                                                                     01960000
//GREFREH  DD DSN=&HOUPN..REH,                                          01970000
//            DISP=(NEW,CATLG,DELETE),                                  01980000
//            UNIT=&UNIT.,                                              01990000
//            SPACE=(TRK,(10,1),RLSE),                                  02000000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=100)                         02010000
//*                                                                     02020000
//GREFRTH  DD DSN=&HOUPN..RTH,                                          02030000
//            DISP=(NEW,CATLG,DELETE),                                  02040000
//            UNIT=&UNIT.,                                              02050000
//            SPACE=(TRK,(10,1),RLSE),                                  02060000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=100)                         02070000
//*                                                                     02080000
//GREF003  DD DSN=&HIUPN..FILE003.RED,                                  02090000
//            DISP=(NEW,CATLG,DELETE),                                  02100000
//            UNIT=(&UNIT.,10),                                         02110000
//            SPACE=(TRK,(1,1000),RLSE),                                02120000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02130000
//*                                                                     02140000
//GREF004  DD DSN=&HIUPN..FILE004.RED,                                  02150000
//            DISP=(NEW,CATLG,DELETE),                                  02160000
//            UNIT=(&UNIT.,10),                                         02170000
//            SPACE=(TRK,(1,1000),RLSE),                                02180000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02190000
//*                                                                     02200000
//GREF005  DD DSN=&HIUPN..FILE005.RED,                                  02210000
//            DISP=(NEW,CATLG,DELETE),                                  02220000
//            UNIT=(&UNIT.,10),                                         02230000
//            SPACE=(TRK,(1,1000),RLSE),                                02240000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02250000
//*                                                                     02260000
//GREF006  DD DSN=&HIUPN..FILE006.RED,                                  02270000
//            DISP=(NEW,CATLG,DELETE),                                  02280000
//            UNIT=(&UNIT.,10),                                         02290000
//            SPACE=(TRK,(1,1000),RLSE),                                02300000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02310000
//*                                                                     02320000
//GREF007  DD DSN=&HIUPN..FILE007.RED,                                  02330000
//            DISP=(NEW,CATLG,DELETE),                                  02340000
//            UNIT=(&UNIT.,10),                                         02350000
//            SPACE=(TRK,(1,1000),RLSE),                                02360000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02370000
//*                                                                     02380000
//GREF008  DD DSN=&HIUPN..FILE008.RED,                                  02390000
//            DISP=(NEW,CATLG,DELETE),                                  02400000
//            UNIT=(&UNIT.,10),                                         02410000
//            SPACE=(TRK,(1,1000),RLSE),                                02420000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02430000
//*                                                                     02440000
//GREF009  DD DSN=&HIUPN..FILE009.RED,                                  02450000
//            DISP=(NEW,CATLG,DELETE),                                  02460000
//            UNIT=(&UNIT.,10),                                         02470000
//            SPACE=(TRK,(1,1000),RLSE),                                02480000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02490000
//*                                                                     02500000
//GREF010  DD DSN=&HIUPN..FILE010.RED,                                  02510000
//            DISP=(NEW,CATLG,DELETE),                                  02520000
//            UNIT=(&UNIT.,10),                                         02530000
//            SPACE=(TRK,(1,1000),RLSE),                                02540000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02550000
//*                                                                     02560000
//GREF011  DD DSN=&HIUPN..FILE011.RED,                                  02570000
//            DISP=(NEW,CATLG,DELETE),                                  02580000
//            UNIT=(&UNIT.,10),                                         02590000
//            SPACE=(TRK,(1,1000),RLSE),                                02600000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02610000
//*                                                                     02620000
//GREF012  DD DSN=&HIUPN..FILE012.RED,                                  02630000
//            DISP=(NEW,CATLG,DELETE),                                  02640000
//            UNIT=(&UNIT.,10),                                         02650000
//            SPACE=(TRK,(1,1000),RLSE),                                02660000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02670000
//*                                                                     02680000
//SORT001  DD DUMMY                                                     02690000
//SORT002  DD DUMMY                                                     02700000
//SORT003  DD DUMMY                                                     02710000
//SORT004  DD DUMMY                                                     02720000
//SORT005  DD DUMMY                                                     02730000
//SORT006  DD DUMMY                                                     02740000
//SORT007  DD DUMMY                                                     02750000
//SORT008  DD DUMMY                                                     02760000
//SORT009  DD DUMMY                                                     02770000
//SORT010  DD DUMMY                                                     02780000
//SORT011  DD DUMMY                                                     02790000
//SORT012  DD DUMMY                                                     02800000
//*                                                                     02810000
//SORT001  DD DUMMY                                                     02820000
//*                                                                     02830000
//MR95RPT  DD SYSOUT=*                                                  02840000
//MR95TRAC DD SYSOUT=*                                                  02850000
//SNAPDATA DD SYSOUT=*                                                  02860000
//SYSOUT   DD SYSOUT=*                                                  02870000
//*                                                                     02880000
//SYSMDUMP DD SYSOUT=*                                                  02890000
//MR95BILL DD DUMMY                                                     02895000
//*                                                                     02900000
//********************************************************************* 02910000
//* IF THIS STEP ABENDS:                                                02920000
//* FOLLOW RESTART GIVEN IN STEP PSTEP340                               02930000
//*                                                                     02940000
//********************************************************************* 02950000
//*                                                                     02960000
//PSTEP341 EXEC PGM=GVBUT99,                                            02970000
//            COND=(1,GE,PSTEP340),                                     02980000
//            PARM='1099'                                               02990000
//*                                                                     03000000
//SYSMDUMP DD SYSOUT=*                                                  03010000
//*                                                                     03020000
//********************************************************************* 03030000
//* PSTEP360 - EXTRACT REF FILE CREATION CONTROL REPORT                 03040000
//*                                                                     03050000
//* NORMAL RETURN CODE = 0                                              03060000
//*                                                                     03070000
//* IF THIS STEP ABENDS:                                                03080000
//* 1) FIX APPLICATION IF POSSIBLE                                      03090000
//* 2) RESTART THE JOB IN THIS STEP                                     03100000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03110000
//*                                                                     03120000
//********************************************************************* 03130000
//*                                                                     03140000
//PSTEP360 EXEC PGM=GVBMR71,                                            03150000
//             PARM='REH'                                               03160000
//*                                                                     03170000
//*            INPUT FILES                                              03180001
//*                                                                     03190000
//MR71RH   DD DSN=&HIUPN..REH,                                          03200000
//            DISP=SHR                                                  03210000
//*                                                                     03220000
//MR71VDP  DD DSN=&HIUPN..MR77.VDP,                                     03230000
//            DISP=SHR                                                  03240000
//*                                                                     03250000
//*            OUTPUT FILES                                             03260001
//*                                                                     03270000
//MR71RPT  DD SYSOUT=*                                                  03280000
//SYSOUT   DD SYSOUT=*                                                  03290000
//CEEDUMP  DD SYSOUT=*                                                  03300000
//SYSMDUMP DD SYSOUT=*                                                  03310000
//*                                                                     03320000
//********************************************************************* 03330000
//* IF THIS STEP ABENDS:                                                03340000
//* FOLLOW RESTART GIVEN IN STEP PSTEP360                               03350000
//*                                                                     03360000
//********************************************************************* 03370000
//*                                                                     03380000
//PSTEP361 EXEC PGM=GVBUT99,                                            03390000
//            COND=(0,EQ,PSTEP360),                                     03400000
//            PARM='1099'                                               03410000
//*                                                                     03420000
//SYSMDUMP DD SYSOUT=*                                                  03430000
//*                                                                     03440000
//********************************************************************* 03450000
//* PSTEP380 - SORT TITLES REF FILE CREATION CONTROL REPORT             03460000
//*                                                                     03470000
//* NORMAL RETURN CODE = 0                                              03480000
//*                                                                     03490000
//* IF THIS STEP ABENDS:                                                03500000
//* 1) FIX APPLICATION IF POSSIBLE                                      03510000
//* 2) RESTART THE JOB IN THIS STEP                                     03520000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03530000
//*                                                                     03540000
//********************************************************************* 03550000
//*                                                                     03560000
//PSTEP380 EXEC PGM=GVBMR71,                                            03570000
//             PARM='RTH'                                               03580000
//*                                                                     03590000
//*            INPUT FILES                                              03600001
//*                                                                     03610000
//MR71RH   DD DSN=&HIUPN..RTH,                                          03620000
//            DISP=SHR                                                  03630000
//*                                                                     03640000
//MR71VDP  DD DSN=&HIUPN..MR77.VDP,                                     03650000
//            DISP=SHR                                                  03660000
//*                                                                     03670000
//*            OUTPUT FILES                                             03680001
//*                                                                     03690000
//MR71RPT  DD SYSOUT=*                                                  03700000
//SYSOUT   DD SYSOUT=*                                                  03710000
//CEEDUMP  DD SYSOUT=*                                                  03720000
//SYSMDUMP DD SYSOUT=*                                                  03730000
//*                                                                     03740000
//********************************************************************* 03750000
//* IF THIS STEP ABENDS:                                                03760000
//* FOLLOW RESTART GIVEN IN STEP PSTEP380                               03770000
//*                                                                     03780000
//********************************************************************* 03790000
//*                                                                     03800000
//PSTEP381 EXEC PGM=GVBUT99,                                            03810000
//            COND=(0,EQ,PSTEP380),                                     03820000
//            PARM='1099'                                               03830000
//*                                                                     03840000
//SYSMDUMP DD SYSOUT=*                                                  03850000
//*                                                                     03860000
//*******************************************************************   03870000
//* JSTEPN10 - SUBMIT NEXT JOB                                          03880000
//*******************************************************************   03890000
//*                                                                     03900000
//*JSTEPN10 EXEC PGM=IEBGENER                                           03910000
//*                                                                     03920000
//*SYSIN    DD DUMMY                                                    03930000
//*                                                                     03940000
//*SYSUT1   DD DSN=&JOBLIB.(V9999EE),                                   03950000
//*            DISP=SHR                                                 03960000
//*                                                                     03970000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        03980000
//*                                                                     03990000
//*SYSPRINT DD SYSOUT=*                                                 04000000
//*                                                                     04010000
//********************************************************************* 04020000
//* IF THIS STEP ABENDS:                                                04030000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN10                               04040000
//*                                                                     04050000
//********************************************************************* 04060000
//*                                                                     04070000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           04080000
//*            COND=(0,EQ,JSTEPN10),                                    04090000
//*            PARM='1099'                                              04100000
//*                                                                     04110000
//*SYSMDUMP DD SYSOUT=*                                                 04120000
//*                                                                     04130000
//*                                                                     04140000
//*                                                                     04150000
```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR95**". A link to that topic is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

