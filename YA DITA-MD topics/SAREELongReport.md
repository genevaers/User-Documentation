# Example: Reports take too long {#SAREELongReport .reference}

## Analysis of problem { .section}

To be completed.

## Potential SAFR solutions { .section}

|Technique|Notes|
|---------|-----|
|Common Key Buffers|This is useful when multiple files have keys that have parts in common. See topic "**Checklist: Common Key Buffers**".A link to that topic is under "**Related reference**" below.

|
|DB2 sequential read using VSAM files.|This is useful when sequentially reading a DB2 database. For faster access, read DB2 using VSAM files. See topic "**Checklist: DB2 via VSAM**".A link to that topic is under "**Related reference**" below.

|
|Multiple reports in one run|This is useful when multiple reports use the same source data. See topic "**Checklist: Reports - multiple reports in one run**".A link to that topic is under "**Related reference**" below.

|
|Partition a physical file|This is useful when processing of records is independent or other records in a file, and so a large file can be split into smaller partitions and processed at the same time. See topic "**Checklist: Partition a physical file**". A link to that topic is under "**Related reference**" below.

|
|Pipes|This is useful when one view can pass data to another view, which avoids repeating some processing in the second view. See topic "**Checklist: Pipes**".A link to that topic is under "**Related reference**" below.

|
|Tokens|This is useful when one view can pass data to another view, thus avoiding repeating processing in a view See topic "**Checklist: Tokens**".A link to that topic is under "**Related reference**" below.

|
|zIIP|This is only possible when your company has zIIP technology installed and the processing is relevant to zIIP processing. See topic "**Checklist: Use zIIP**".A link to that topic is under "**Related reference**" below.

|

**Parent topic:**[SAFR examples: End to End](../html/AAR440EndtoEnd.md)

