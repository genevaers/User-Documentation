# UT90 Logic Table Report overview {#SACUT90 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Utility name](SACUT90.md#10)
-   [20 What UT90 does](SACUT90.md#20)
-   [30 UT90 and phases of the Performance Engine](SACUT90.md#30)
-   [40 UT90 Report](SACUT90.md#40)
-   [50 Example of UT90 Report for an XLT](SACUT90.md#50)
-   [60 How to run UT90](SACUT90.md#60)
-   [100 Need more on this page?](SACUT90.md#100)

## 10 Utility name {#10 .section}

The full name of the program is **GVBUT90** and the short name is **UT90**.

This program is part of the SAFR Performance Engine.

## 20 What UT90 does {#20 .section}

LT means Logic Table, and there are two examples:

-   JLT - the Join Logic Table. This file drives the Reference phase.
-   XLT - the Extract Logic Table. This file drives the Extract phase.

UT90 prints a report of one of these files, so the instructions in the logic tables can be easily read. The UT90 report is an essential resource for troubleshooting problems in the Performance Engine especially for problems in the extract phase.

For more information about JLT, see help topic "**JLT overview**". A link to that overview is under **Related concepts** below.

For more information about XLT, see help topic "**XLT overview**". A link to that overview is under **Related concepts** below.

## 30 UT90 and phases of the Performance Engine {#30 .section}

UT90 runs in the **reference and extract phases** of the Performance Engine.

For more, see help topics "**Reference phase overview**" and "**Extract phase overview**". Links to these overviews are under **Related concepts** below.

## 40 UT90 Report {#40 .section}

This is DDNAME **UT90RPT** in the job step for UT90.

To help support, it is recommended to send this report to output such as:

-   EJES \(a systems management tool\), or
-   SAVRS \(System Accumulation Viewing and Retrieval System\)

An example of this report is below.

## 50 Example of UT90 Report for an XLT {#50 .section}

**IMPORTANT**: in the example below, some rows are not shown, due to page breaks in the report. The rows not shown are:

-   Row 1: "**HD**" code = Header that starts all logic tables
-   Row 2: "**RENX**" code = REad NeXt source file record.
-   Row 13 " **ES**" code = End Source file record.
-   Row 14 "**EN**" code = End of logic table.

![](images/UT90RPT_01_XLT.gif)

For examples of full reports on JLT and XLT files, see these topics:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to these overviews are under **Related concepts** below.

## 60 How to run UT90 {#60 .section}

See help topic "**Utility Runbook: UT90 Logic Table Report**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

