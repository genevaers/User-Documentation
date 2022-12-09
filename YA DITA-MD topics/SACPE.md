# Performance Engine \(PE\) overview {#SACPE .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is the SAFR Performance Engine?](SACPE.md#10)
-   [20 Phases in the Performance Engine](SACPE.md#20)
-   [30 Views and logic text](SACPE.md#30)
-   [40 Components of the Performance Engine](SACPE.md#40)
-   [50 How do I optimize the Performance Engine?](SACPE.md#50)
-   [100 Need more on this page?](SACPE.md#100)

## 10 What is the SAFR Performance Engine? {#10 .section}

The Performance Engine is the part of SAFR that runs on your company mainframe systems and produces the actual results of SAFR. The Performance Engine runs under the operating system **z/OS** as a batch job using JCL.

![](images/PM_concept_02.gif)

For more on SAFR overall and the parts of SAFR, see topic "**SAFR overview - START HERE**". A link to this overview is under **Related concepts** below.

The Performance Engine is a batch mainframe stream that produces results for the views you select.

## 20 Phases in the Performance Engine {#20 .section}

The processing of the Performance Engine can be divided into phases. These can be summarized as follows:

1.  **Select Phase** - where the Performance Engine reads the views you have selected and creates a VDP XML file.
2.  **Compile Phase** - where the VDP XML file is recompiled into a VDP file for z/OS.
3.  **Logic Phase** - where views in the VDP file are translated into Logic Tables for processing.
4.  **Reference Phase** - where the Logic Tables are consolidated.
5.  **Extract Phase** - where input logical files are read and all columns defined \(some columns may be new\). Optionally, this phase can select or skip input records. Optionally, records can be written to special output files.
6.  **Format Phase** - an optional phase. Optionally, this phase performs some arithmetic operations such as totals. Optionally, this phase can also select or skip records for output. There can be multiple format phases.

For more, see topic "**SAFR phases overview**". A link to this overview is under **Related concepts** below.

## 30 Views and logic text {#30 .section}

Control the processing of the Performance Engine by using views and logic text in the SAFR Workbench.

**Views** define the output of SAFR - the logical files and the columns of data and the form of the output \(such as disk files or reports\).

**Logic text** allows control over the extract and format phases of the Performance Engine. Logic text controls processing such as select or skip of records and defining column values.

For more, see topics "**Workbench overview**", "**Views overview**" and "**Logic text overview**". Links to these overviews are under **Related concepts** below.

## 40 Components of the Performance Engine {#40 .section}

The Performance Engine consists of the following components:

-   **Main Programs**. These are the main steps in the JCL for the Performance Engine.

    For more, see topic "**PE Programs overview**". A link to that overview is under **Related concepts** below.

-   **Utilities**. Some useful utility programs are provided by IBM in the Performance Engine.

    For more, see topic "**PE Utilities overview**". A link to that overview is under **Related concepts** below.

-   **Exits**. Exits are also called user-exit routines. Some exits are provided by IBM \(in addition to any exits written by your company\).

    For the IBM exits, see topic "**PE Exits overview**". A link to that overview is under **Related concepts** below.

-   **Sub-Programs**. These are shared program modules installed in the Performance Engine that are normally hidden behind the other components.

    For more, see topic "**PE Sub-Programs overview**". A link to that overview is under **Related concepts** below.


## 50 How do I optimize the Performance Engine? {#50 .section}

See topic "**SAFR optimization overview**" for details. This assumes you have read all other overviews and are familiar with SAFR overall.

A link to this topic is under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

