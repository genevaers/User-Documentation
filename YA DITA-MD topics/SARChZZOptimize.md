# Troubleshooting: Optimize PE {#SARChZZOptimize .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Analyze PE performance](#02)
-   [03 Choose optimization techniques](#03)

## 02 Analyze PE performance {#02 .section}

To be completed.

## 03 Choose optimization techniques {#03 .section}

|Technique|Notes|
|---------|-----|
|Common Key Buffers|This is useful when multiple files have keys that have parts in common. See topic "**Checklist: Common Key Buffers**". A link to that topic is under "**Related reference**" below.

|
|DB2 sequential read using VSAM files.|This is useful when sequentially reading a DB2 database. For faster access, read DB2 using the underlying VSAM files instead.See topic "**Checklist: DB2 via VSAM**". A link to that topic is under "**Related reference**" below.

|
|Multiple reports in one run|This is useful when multiple reports use the same source data.See topic "**Checklist: Reports - multiple reports in one run**". A link to that topic is under "**Related reference**" below.

|
|Partition a physical file|This is useful when processing of records is independent or the other records in a file, and so a large file can be split into partitions for processing in parallel.See topic "**Checklist: Partition a physical file**". A link to that topic is under "**Related reference**" below.

|
|Pipes|This allows one view to pass output to another view, which avoids repeating some processing already done.See topic "**Checklist: Pipes**". A link to that topic is under "**Related reference**" below.

|
|Tokens|This allows one view to pass output to another view, which avoids repeating some processing already done. This is more flexible then the pipes described above.See topic "**Checklist: Tokens**". A link to that topic is under "**Related reference**" below.

|
|Tune number of threads|You can control the number of threads used by PE. More threads means faster performance of PE. Less threads means PE allows other processing to continue.Tune the number of threads using the DISKTHRDS parameter in MR95. See topic "**Checklist: Trace and debug MR95**" for the section on Parameters. A link to that topic is under "**Related reference**" below.

|
|zIIP|This is only possible when your company has zIIP technology installed and the required task is relevant to zIIP processing.See topic "**Checklist: Use zIIP**". A link to that topic is under "**Related reference**" below.

|

**Parent topic:**[PE Checklist Troubleshooting](../html/AAR905PMChecklistTr.md)

