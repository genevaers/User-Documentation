# MR88 Format Data overview {#SACMR88 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Read this with Format phase overview](SACMR88.md#02)
-   [10 Program name](SACMR88.md#10)
-   [20 Basics of the format phase and MR88](SACMR88.md#20)
-   [30 What MR88 does](SACMR88.md#30)
-   [40 View Format Process Report](SACMR88.md#40)
-   [50 VDP Report](SACMR88.md#50)
-   [60 How to setup a format phase and run MR88](SACMR88.md#60)
-   [100 Need more on this page?](SACMR88.md#100)

## 02 Read this with Format phase overview {#02 .section}

Since the program MR88 is the entire format phase, this overview needs to be read in conjunction with topic "**Format phase overview**".

This topic \(MR88\) gives a low level overview of the program. The other topic \(format phase\) gives a high level overview of the format phase compared to other phases.

A link to the "Format phase overview" is under "**Related concepts**" below.

## 10 Program name {#10 .section}

The full name of the program is **GVBMR88** and the short name is **MR88**.

This program is part of the SAFR Performance Engine.

## 20 Basics of the format phase and MR88 {#20 .section}

![](images/PM_6Frmt_Progs_01.gif)

The format phase is the sixth phase of PE, and consists of only one program: **MR88**.

The format phase inputs one EXT file from the extract phase and sorts, summarizes and formats the data to create one or more view output files.

This phase is optional. There can be multiple format phases - one phase per EXT. file. For example, three format phases can be the sixth, seventh and eight phases of PE. It is possible that a run of PE has no format phase at all.

The processing of MR88 is as follows

-   Inputs:
    -   **EXT file** \(one specific file\)
    -   **SXT file** \(with the same file number as the EXT file\)
    -   **VDP file**
    -   **Configuration file** \(DD SORTCNTL\)
    -   **RTH file** \(if required for Sort Key Titles\)
    -   **RED files** \(if an RTH file is required\)
-   Outputs:
    -   **View output file\(s\)**
    -   **View Format Processing report \(DD MR88RPT\)**
    -   **VDP Report \(DD MR88PARM\)**

For more, see these overviews:

-   "**EXT file overview**"
-   "**RED file overview**"
-   "**RTH file overview**"
-   "**SAFR phases overview**"
-   "**SXT file overview**"
-   "**VDP file overview**"
-   "**View output file overview**"

Links to the above overviews are under **Related concepts** below.

## 30 What MR88 does {#30 .section}

MR88 performs the format phase processing without using the logic tables \(in the JLT or XLT files that drive the reference and extract phases. Instead, MR88 processing is driven by the VDP file and records in the EXT file.

The **EXT file** contains view header records and view details records. The view header records describe the view and view output file for the associated view details records. This is how MR88 knows the appropriate view output files to create and the data for each file.

The **VDP file** contains details such as the following:

-   **Format Column Calculations** logic text, which describes how to calculate column values.
-   **Format Record Filter** logic text, which describes any selection of output records.
-   **Aggregation** of numeric fields in records, if required.
-   **Zero value record suppression**, if required.

The other input files provide supporting roles, as follows:

-   The **SXT file** describes how to sort the EXT file before MR88 processing starts
-   If there are lookup paths in **Sort Key Titles for a hardcopy report**, there is an **RTH file** and associated **RED files**.
-   The **DD SORTCNTL** contains some **configuration** data that optimizes the running of MR88.

The main output files are the **view output files**, which are the results of the views. The DDNAMEs of the view output files have two possibilities:

-   The DDNAME is given by the **output DDNAME** for the **Physical File** specified in the **Output File section** for the **Format Phase tab** of the view.
-   The DDNAME is default, which is **F<ViewNbr\>** where the view number is 7 digits \(padded with zeroes\).

Two other output files are:

-   **View Format Process Report** - see section [40 View Format Process Report](SACMR88.md#40).
-   **VDP Report** - see section [50 VDP Report](SACMR88.md#50).

## 40 View Format Process Report {#40 .section}

DDNAME MR88RPT is for a View Format Process Report output from MR88. This report gives useful statistics on the overall processing for MR88.

**Sample report:**

![](images/MR88_View_Fmt_Proc_Rpt_01.gif)

## 50 VDP Report {#50 .section}

DDNAME MR88PARM is the VDP Report from MR88. This report gives details of the views included in this run of MR88 including the columns of data. This report is useful in debugging problems in MR88 view output files.

**Sample Report:**

![](images/MR88_VDP_Rpt_01.gif)

![](images/MR88_VDP_Rpt_02.gif)

![](images/MR88_VDP_Rpt_03.gif)

## 60 How to setup a format phase and run MR88 {#60 .section}

A format phase is optional for a view. You must configure the view to ensure a format phase exists.

To **configure the view for a format phase** in the workbench, see these tasks:

-   "**Creating views**",
-   "**Modifying views**".

Links to these topics are under **Related tasks** below.

To **run MR88** for an format phase, see topic: "**Runbook: MR88 Format Data**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

