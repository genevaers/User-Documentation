# Format phase overview {#SACFormat .concept}

## 01 Summary of this topic {#01 .section}

**Processing** for the format phase:

-   [02 Read this and MR88 overview](SACFormat.md#02)
-   [10 Basics of the format phase and MR88](SACFormat.md#10)

**High level examples** of the format phase:

-   [20 Example: simple report](SACFormat.md#20)
-   [25 Example: simple update](SACFormat.md#25)

**Critical issues** for the format phase:

-   [40 Critical issues for the format phase](SACFormat.md#40)

**Details** of format phase:

-   [50 Calculation of columns in the format phase](SACFormat.md#50)
-   [55 Selecting output records in the format phase](SACFormat.md#55)
-   [60 Multiple view output files from a single EXT file](SACFormat.md#60)
-   [65 Aggregation in the format phase](SACFormat.md#65)
-   [70 Zero value record suppression](SACFormat.md#70)
-   [75 Multiple format phases](SACFormat.md#75)

**Setup** for an format phase:

-   [90 How to setup a format phase and run MR88](SACFormat.md#90)

The last section is:

-   [100 Need this page completed?](SACFormat.md#100)

## 02 Read this and MR88 overview {#02 .section}

Since the format phase consists of one program \(MR88\), this overview needs to be read in conjunction with topic "**MR88 Format Data overview**".

This topic \(format phase\) gives a high level overview of the format phase compared to other phases. The other topic \(MR88\) gives a low level overview of the program.

A link to the "MR88 Format Data overview" is under "**Related concepts**" below.

## 10 Basics of the format phase and MR88 {#10 .section}

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

## 20 Example: simple report {#20 .section}

Below is a typical reporting program:

![](images/PMExtFmt_Report_01.gif)

Below are the processing steps for this report example. The diagram shows the extract phase and format phase for this example.

![](images/PMExtFmt_Report_02.gif)

Below is a summary of the SAFR terms involved:

![](images/PMExtFmt_Report_04.gif)

For more, see these overviews:

-   "**EXT file overview**"
-   "**RED file overview**"
-   "**RTH file overview**"
-   "**SXT file overview**"
-   "**View output file overview**"

Links to the above overviews are under **Related concepts** below.

## 25 Example: simple update {#25 .section}

Below is a typical update program, that changes currency amounts into US dollars.

![](images/PMExtFmt_Update_01.gif)

Below are the processing steps for this update example. The diagram shows the extract phase and format phase for this example.

![](images/PMExtFmt_Update_02.gif)

The SAFR terms for a simple update are mainly for the extract phase, because a format phase is often not required.

![](images/PMExtFmt_Update_03.gif)

## 40 Critical issues for the format phase {#40 .section}

Critical issues are:

-   **Sorting of records** in the EXT file. A sort key is optional for an extract phase but at least one sort key is mandatory for a format phase. Sorting of EXT files is specified in the SXT file that has the same file number as the EXT file.

    For more details, see "**SXT file overview**". A link to that overview is under **Related concepts** below.

-   **Lookup paths** which can be used for Sort Key Titles in the format phase. In the format phase lookup paths are not coded in logic text. Instead, lookup paths are coded in the column definition for a sort key in the Sort Key Title field.

    For more details, see "**Lookup paths overview**". A link to that overview is under **Related concepts** below.

-   **Calculating columns** - based on data already in the output file. See section [50 Calculation of columns in the format phase](SACFormat.md#50)
-   **Selecting records to output** \(if required\). See section [55 Selecting output records in the format phase](SACFormat.md#55).
-   **Creating multiple view output files from a single EXT file**. This means multiple views have written to the same EXT file. See section [60 Multiple view output files from a single EXT file](SACFormat.md#60).
-   **Aggregating** numeric column values. Using aggregation, all records with the same key can have numeric column values totalled, so only one record appears in the output file. See section [65 Aggregation in the format phase](SACFormat.md#65).
-   **Zero value record suppression**. Using this feature, the output file does not include any records with zero in all the numeric fields. See section [70 Zero value record suppression](SACFormat.md#70).
-   **Multiple format phases** are possible, one for each EXT file produced in the extract phase. See section [75 Multiple format phases](SACFormat.md#75)

## 50 Calculation of columns in the format phase {#50 .section}

Columns of data can be calculated \(or recalculated\) in the format phase using logic text called **Format Column Calculations**. This logic text can also be called "**Format-Phase Calculations**". This logic text allows using a formula to calculate a value for a column in the output file based on data already in the output file.

For more details, see "**Logic text 3: Format Column Calculations overview**". A link to that overview is under **Related concepts** below.

## 55 Selecting output records in the format phase {#55 .section}

The format phase can select the records to output by using logic text called **Format Record Filter**.

For more details, see "**Logic text 4: Format Filter overview**". A link to that overview is under **Related concepts** below.

## 60 Multiple view output files from a single EXT file {#60 .section}

A single EXT file may contain data that MR88 writes to multiple view output files.

This is possible because more than one view wrote data to that EXT file. For each view that writes data to the same EXT file, there is a separate view output file.

For this issue, the critical information in a view is the field **Extract Work File Number** on the **Extract Phase tab** of the view.

There are two methods that different views can write to the same EXT file:

-   Many views specify a value of zero for the field **Extract Work File Number** on the **Extract Phase tab** of the view.

    This means that a "**Round Robin**" pattern is used to assign EXT files to views. Let n be the number of EXT files, and all views have zero in the Extract Work File number. The first view is written to EXT 001. The second view is written to EXT 002, and so on. The nth view is written to EXT N. The next view after that is written to EXT 001 again, and so on.

-   Many views specify a particular value for he field **Extract Work File Number** on the **Extract Phase tab** of the view.

    Those views are written to same EXT file.


Either of the above methods is available to ensure MR88 creates multiple view output files from a single EXT file. The reason for using either method is often load balancing for the run of PE. There are many views to run in PE, and those views can be spread across the available EXT files.

## 65 Aggregation in the format phase {#65 .section}

\(To be completed\)

## 70 Zero value record suppression {#70 .section}

In the **Format Phase tab** of a view, a tick in the field "**Zero-Value Record Suppression**" has the following effect:

-   A record is NOT output when:
    1.  All numeric calculations in that record have value zero, AND
    2.  The input fields for those calculations have value zero.
-   otherwise, the record is output, subject to any **Format Record Filter logic text** that may be present.

If there is no tick in the field "**Zero-Value Record Suppression**" then all records are output, subject to any **Format Record Filter logic text** that may be present.

## 75 Multiple format phases {#75 .section}

One format phase processes one EXT file. Hence multiple EXT files require multiple format phases \(one for each EXT file\). The format phases can be run in parallel to each other.

This is useful, because one large format phase file may take a long time to process. The single output can be split into a number of smaller output files that can run in parallel in multiple format phases.

The number of EXT files is always the same as the number of SXT files, and this determines the number of format phase files. For example, three EXT files and three SXT files means three format phase runs.

The number of EXT and SXT files is controlled by the following:

-   The **Extract phase tab** for a view has the field **Extract Work File Number**. The largest value of this for a view in a run of PE determines the highest EXT file number used.
-   The input configuration file for **MR86** has an **\[EXTRACT\] section** that has a field **MAXIMUMFILENUM**. The value of this parameter is the maximum number of EXT and SXT files.

Setup each format phase job with a unique matching pair of EXT and SXT file and the other appropriate input files. Run these jobs in parallel for improved elapsed time to get the results.

## 90 How to setup a format phase and run MR88 {#90 .section}

A format phase is optional for a view. You must configure the view to ensure a format phase exists.

To **configure the view for a format phase** in the workbench, see these tasks:

-   "**Creating views**",
-   "**Modifying views**".

Links to these topics are under **Related tasks** below.

To **run MR88** for an format phase, see topic: "**Runbook: MR88 Format Data**". A link to that topic is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

