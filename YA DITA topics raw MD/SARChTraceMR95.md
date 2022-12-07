# Checklist: Trace and debug MR95 {#SARChTraceMR95 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Quick summary of tracing and debugging](SARChTraceMR95.md#02)
-   [03 High level strategy](SARChTraceMR95.md#03)
-   [04 Sample trace output](SARChTraceMR95.md#04)
-   [05 Fields in the trace output](SARChTraceMR95.md#05)
-   [06 Parameters - debug, trace, tune](SARChTraceMR95.md#06)
-   [07 Examples of trace and debut parameters](SARChTraceMR95.md#07)

## 02 Quick summary of tracing and debugging {#02 .section}

Ensure you read section [03 High level strategy](SARChTraceMR95.md#03).

To trace MR95, ensure at least the parameter "**TRACE=Y**" is in DDNAME **MR95PARM**.

The MR95 trace is generated in DDNAME **MR95TRAC**.

To debug MR95, place relevant parameters in DDNAME **MR95PARM**.

## 03 High level strategy {#03 .section}

An useful order to trace MR95 is as follows:

1.  Check the output record has values populated in the columns with a single output record.
2.  Check the output columns have the correct values in the columns.
3.  Check the extract and format record filters are working correctly.
4.  Add extra columns to a view toidentify the specific source records used to populate the output record.
5.  Limit the number of source records by using a small source file or using topic "**Checklist: Limit Records Read or Written**".
6.  Limit the number of output records by using topic "**Checklist: Limit Records Read or Written**".
7.  Limit MR95 to a single thread using **DISKTHRDS=1**.

## 04 Sample trace output {#04 .section}

![](images/MR95_Trace_01.gif)

The example above was created with the parameters "**TRACE=Y, VIEW=8475**"

The output above is only a small part of the full trace output file.

For details of the fields, see the next section.

## 05 Fields in the trace output {#05 .section}

|Field|Notes|
|-----|-----|
|EVENT DDNAME|DDNAME of the event file for this run.|
|EVENT RECORD|Record number in the source event file.|
|VIEW NUMBER|ID number of the view being processed.|
|LOGIC ROW|Row number in the logic table file being processed. To the right is the function code for that row.|
|SEQ NUM|Sequence number.|
|FILE ID|ID number of a logical file.|
|RECORD ID|ID of the logical record used for FILE ID.|
|FIELD ID|ID number of the field in the logical record given by RECORD ID.|
|Source POS|Position of the field in the source logical record.|
|Source LEN|Length of the field in the source logical record.|
|Source FM|Format of the field in the source logical record.|
|Source CN|Column Number of the field in the source logical record.|
|Source D|Number of decimal places of the field in the source logical record.|
|Target POS|Position of the field in the target logical record.|
|Target LEN|Length of the field in the target logical record.|
|Target FM|Format of the field in the target logical record.|
|Target CN|Column Number of the field in the target logical record.|
|Target D|Number of decimal places of the field in the target logical record.|
|VALUE1| |
|VALUE2| |

## 06 Parameters - debug, trace, tune {#06 .section}

The DDNAME **MR95PARM** contains configuration parameters for the run of MR95 for both the reference phase and extract phase. This file contains both trace and debug parameters.

All trace parameters are in the form "**PP=VV**" where PP is the parameter and VV is the value.

"**TRACE=Y**" is necessary to generate a trace.

Groups of parameters can be placed on the same line, separated by a comma, for example: "**P1=V1,P2=V2**". Effectively, there is **AND** between each parameter.

Each group of parameters on a single line is a "set" of parameters. The rules for sets are:

-   If no trace sets contain "**VIEW**" then only the first set is processed.
-   If at least one set contains "**VIEW**" then all sets without "VIEW" are ignored
-   TRACEINPUT, LTABEND, MSGABEND are exceptions - they act globally and can appear on a line by themselves.

Examples of parameters are in the next section.

|Parameter|Notes|
|---------|-----|
|1STTHREAD|"**1STTHREAD=Y**" means execute only the first thread and only the first partition. This is useful to lessen the complexity of data shown in an MR95 trace. The limit on partitions does not apply to the parameter DISKTHRDS.|
|DDNAME|"**DDNAME=XXX**" traces only reading from or writing to this file.|
|DISKTHRDS|"**DISKTHRDS=1**" limits processing to one thread. This will still process a logical file that has many partitions - the partitions will process one at a time. This parameter can be higher. For example, if a logical file has ten partitions and the parameter is "**DISKTHRDS=5**" then five partitions process at once. As one partition finishes, another partition starts in that thread until all partitions are processed. In this way, DISKTHRDS is a method to tune the performance of PE, in order to limit the number of resources that PE uses.|
|EXTDUMMY|"**EXTDUMMY=Y**" means treat missing extract files as DD DUMMY.|
|FROMLTROW|"**FROMLTROW=88**" starts the trace at row 88 in the logic table.|
|FROMREC|"**FROMREC=55**" starts tracing on reading source record 55.|
|LTABEND|"**LTABEND=99**" means abend when executing logic table row 99.|
|LTFUNC|"**LTFUNC=CCC**' traces only executions of logic table code CCC.|
|MSGABEND|"**MSGABEND=123**" means abend when message number 123 occurs.|
|RLIMIT|"**RLIMIT=99**" means assume End of File after 99 source records.|
|SNAP|"**SNAP=Y**" means generate a snapshot dump of logic table and code|
|THRULTROW|"**THRULTROW=99**" ends the trace at row 99 in the logic table.|
|THRUREC|"**THRUREC=66**" ends the trace on reading source record 66.|
|TRACE|"**TRACE=Y**" generates a trace in DDNAME **MR95TRAC**.|
|TRACEINPUT|**TRACEINPUT=\{ddname\}**" dumps a source record from that ddname at read time.|
|VALUE|"**VALUE=VVV**" traces only when VVV exists at VPOS and VLEN in the view.|
|VIEW|"**VIEW=9999**" traces only view 9999.|
|VLEN|"**VLEN=LLL**" traces when VALUE exists at VPOS and length LLL in the view.|
|VPOS|"**VPOS=PPP**" traces when VALUE exists at position PPP and length VLEN in the view.|

## 07 Examples of trace and debut parameters {#07 .section}

The following parameters trace e**ach input record in SALES, and the DTE instructions in View 1234.**

|```
TRACE=Y
TRACEINPUT=SALES
LTFUNC=DTE,VIEW=1234
```

|

The following parameters trace **logic table rows 3 to 6 for records 100 and 101 in View 5678.**

|```
TRACE=Y
FROMLTROW=3,THRULTROW=6,FROMREC=100,THRUREC=101,VIEW=5678
```

|

**Parent topic:**[Checklist: Trace and debug PE](../html/SARChTracePM.md)

