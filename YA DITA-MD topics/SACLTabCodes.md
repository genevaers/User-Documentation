# Logic tables and codes overview {#SACLTabCodes .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a logic table?](SACLTabCodes.md#10)
-   [20 Reports on a logic table](SACLTabCodes.md#20)
-   [22 Example: MR90 Report for an XLT file](SACLTabCodes.md#22)
-   [24 Example: UT90 Report for an XLT file](SACLTabCodes.md#24)
-   [30 Logic table codes](SACLTabCodes.md#30)
-   [35 Fields in a logic table](SACLTabCodes.md#35)
-   [40 Abbreviations "XXX=" in a logic table report](SACLTabCodes.md#40)
-   [50 How are logic tables created and used?](SACLTabCodes.md#50)
-   [60 Purpose of logic tables](SACLTabCodes.md#60)
-   [70 High level processing in a logic table](SACLTabCodes.md#70)
-   [80 More details](SACLTabCodes.md#80)
-   [100 Need this page completed?](SACLTabCodes.md#100)

## 10 What is a logic table? {#10 .section}

A logic table is a set of instructions that control either the reference phase or the extract phase of PE.

The instructions in a logic table are always processed by MR95, because that program runs in both the reference and extract phases.

The instructions in a logic table are effectively a programming language to ensure that PE produces the output specified in a view. It is useful to understand logic tables so that you can debug any problems when running a view in PE.

There are two logic table files used in PE:

-   **JLT = Join Logic Table**.

    This table contains instructions that execute lookup paths for a view. If there are no lookup paths for the view, then the JLT file is empty. If user-exit routines perform all lookups for the view, then the JLT file is empty.

    The JLT is sometimes called "Reference logic table" because it is processed in the reference phase.

-   **XLT = eXtract Logic Table**.

    This table contains instructions that execute the extract phase for your view. There is always an XLT file because there is always an extract phase for a view.


All logic tables are mainframe files, hence the expressions "JLT file" and "XLT file".

## 20 Reports on a logic table {#20 .section}

Two programs produce reports on a logic table:

-   **MR90** LT Generator

    See section [22 Example: MR90 Report for an XLT file](SACLTabCodes.md#22).

-   **UT90** LT Report

    See section [24 Example: UT90 Report for an XLT file](SACLTabCodes.md#24)


The UT90 report more closely matches TRACE output from MR95.

The program UT90 prints a report of a logic table in DDNAME UT90RPT. To help support, it is recommended to send this report to output such as:

-   EJES \(a systems management tool\), or
-   SAVRS \(System Accumulation Viewing and Retrieval System\)

To run UT90 to report on one of your logic tables, see "**Utility Runbook: UT90 Logic Table Report**". A link to that runbook is under **Related reference** below.

## 22 Example: MR90 Report for an XLT file {#22 .section}

The first part of the report is as follows:

![](images/MR90RPT_01_Start.gif)

After many INFO messages the JLT displays, followed by the XLT as follows:

![](images/MR90RPT_02_XLT.gif)

## 24 Example: UT90 Report for an XLT file {#24 .section}

**IMPORTANT**: in the example below, some rows are not shown, due to page breaks in the report. The rows not shown are:

-   Row 1: "**HD**" code = Header that starts all logic tables
-   Row 2: "**RENX**" code = REad NeXt source file record.
-   Row 13 " **ES**" code = End Source file record.
-   Row 14 "**EN**" code = End of logic table.

The example of an XLT report is below:

![](images/UT90RPT_01_XLT.gif)

## 30 Logic table codes {#30 .section}

A logic table code is a **function code** that describes **one instruction in a logic table**.

The table below shows all the codes possible.

|Code|Notes|
|----|-----|
|CFEC|Compare event field to constant.|
|CSE|Compare event field to spaces.|
|DIMN|Dimension of a variable.This declares a variable.

|
|DTA|Data Transformation field from accumulator.|
|DTC|Data Transformation field from constant.The data transformation field in the output buffer is set to a constant.

|
|DTE|Data Transformation field from Event file.The event file is the source logical file. The DTE function moves data from the source logical record to the output buffer. This happens for every column in a view that is assigned to a source field.

This is similar to a MOVE statement in COBOL.

|
|EN|End of logic table.Every logic table starts with an HD code and ends with and EN code.

|
|ES|End Source record.Processing of each record in a source file begins with a RENX and ends with an ES code.

|
|HD|Start of logic table \(header\).Every logic table starts with an HD code and ends with and EN code.

|
|JOIN|Lookup a reference file \(optimized\)|
|LKDC|Build effective date from a constant|
|LKE|Build lookup key from an event field|
|LKL|Build lookup key from a lookup field|
|LKLR|Clear lookup key and load LRID \(logical record ID number\)|
|LUSM|Lookup to reference table|
|MULC|Multiply by a constant.|
|NV|New View.A view processes a source record starting with an NV code and ending with one of the WRXX codes. See "VIEW ID:" in the heading to identify the view.

|
|RENX|REad NeXt record from source file.Processing of each record in a source file begins with a RENX and ends with an ES code.

|
|SETE|Set accumulator from event data.|
|WRDT|WRite Data Transformation record. This code writes the data transformation record to the output logical file. This ends to processing of the current view.

This is similar to a WRITE statement in COBOL.

|
|WRIN|WRite INput source record.This code writes the source file record to the output logical file. This ends to processing of the current view.

This is similar to a WRITE statement in COBOL.

|

To be completed

## 35 Fields in a logic table {#35 .section}

|Field|Notes|
|-----|-----|
|Logic Row|Row number in the logic table, which is effectively an instruction number.|
|Goto Row1| |
|Goto Row2| |
|Func Code|The logic table function code - see section [30 Logic table codes](SACLTabCodes.md#30).|
|Seq Num|Column number in the view.|
|LR ID|Logical Record ID number.|
|Field ID|The ID number of the field in the logical record given in the previous field.|
|Source POS|Position of the field in the source logical record.|
|Source LEN|Length of the field in the source logical record.|
|Source FM|Format of the field in the source logical record.|
|Source CN|Column Number of the field in the source logical record.|
|Source D|Number of decimal places of the field in the source logical record.|
|Target LEN|Length of the field in the target logical record.|
|Target FM|Format of the field in the target logical record.|
|Target CN|Column Number of the field in the target logical record.|
|Target D|Number of decimal places of the field in the target logical record.|
|CMP| |
|LEN1| |
|VALUE1|Source field value|
|FILE1| |
|LEN2| |
|VALUE2| |
|FILE2| |
|LR2| |
|FLD2| |

## 40 Abbreviations "XXX=" in a logic table report {#40 .section}

The UT90 Report contains some abbreviations, as follows

|Field|Notes|
|-----|-----|
|CT\#|To be completed|
|DT LEN|To be completed|
|EXIT ID|To be completed|
|RECORD COUNT|To be completed|
|SK LEN|To be completed|
|SRT TITLE LEN|To be completed|
|TYPE|To be completed|

## 50 How are logic tables created and used? {#50 .section}

Your views contains details of columns of data and logic text and other details. When a view is activated, a lot of this information is converted into small groups of logic table instructions that are stored in the view.

In the logic phase, program **MR90** does the following:

1.  Reads the logic table instructions in all views selected for that run of PE.
2.  Optimizes these instructions.
3.  Creates the logic tables: JLT and XLT.

Once created, a JLT file or XLT file is translated into EBCDIC in the logic phase by program **MR76 LT to EBCDIC**.

For more, see topic "**MR76 LT to EBCDIC overview**". A link to that overview is under "**Related concepts**" below.

A JLT file or XLT file can be seen in a report produced in the reference phase by utility **UT90 LT Report**.

For more, see topic "**UT90 Logic Table Report overview**". A link to that overview is under "**Related concepts**" below.

A JLT is used to process lookup paths in the reference phase by program **MR95 Reference Data**.

For more, see topic "**MR95 Reference and Extract overview**". A link to that overview is under "**Related concepts**" below.

An XLT is used in the extract phase by program **MR95 Extract Data**.

For more, see topic "**MR95 Reference and Extract overview**". A link to that overview is under "**Related concepts**" below.

## 60 Purpose of logic tables {#60 .section}

The program MR95 uses logic tables in the reference phase and the extract phase.

In the reference phase, the JLT file ensures MR95 processes lookup paths very quickly.

In the extract phase, the XLT ensures MR95 processes the source files and produces the output very quickly.

MR95 uses the logic table instructions to generate machine code. Effectively, MR95 is "interpreting" logic tables. This is the reason that the reference phase and the extract phase both use MR95 - in both phases a logic table is processed - the JLT for the reference phase and the XLT for the extract phase.

See also the section below.

## 70 High level processing in a logic table {#70 .section}

The processing of a logic table in MR95 resembles the following flow:

|```
DO WHILE (there are more source files)
   DO WHILE (there are more source records)
      DO WHILE (there are more views)
         IF (record passes view filter) THEN
            Build columns.
            For an XLT involving a format phase, also build sort keys.
            Write record
         END-IF
         Next view
      Loop
      Next record
   Loop
   Next file
Loop
```

|

## 80 More details {#80 .section}

For more, see these overviews:

-   "**MR76 LT to EBCDIC overview**"
-   "**MR90 Logic Table Generator overview**"
-   "**UT90 Logic Table Report overview**"

Links to the above overviews are under **Related concepts** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

