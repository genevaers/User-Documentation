# MR71 Reference Report overview {#SACMR71 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Program name](SACMR71.md#10)
-   [20 What MR71 does](SACMR71.md#20)
-   [30 Sample Output](SACMR71.md#30)
-   [40 MR71 and phases of the Performance Engine](SACMR71.md#40)
-   [50 How to run MR71](SACMR71.md#50)
-   [100 Need more on this page?](SACMR71.md#100)

## 10 Program name {#10 .section}

The full name of the program is **GVBMR71** and the short name is **MR71**.

This program is part of the SAFR Performance Engine.

## 20 What MR71 does {#20 .section}

MR71 produces a report, based on input files. The table below shows the possible combinations:

|MR71 Input files|MR71 Output Report|Notes|
|----------------|------------------|-----|
|**REH** file and VDP file|Lookup File Report Process - Extract|Gives RED file numbers for lookups used in the extract phase \(MR95\).|
|**RTH** file and VDP file|Lookup File Report Process - Format|Gives RED file numbers for lookups used in the format phase \(Sort Key Titles in MR88\).|

For sample output of these reports, see next section below.

The reports are useful for these reasons:

-   The column "**EXTR FILE\#**" gives the **relevant RED file number** for a step in a lookup path for the extract phase \(REH file\) or format phase \(RTH file\).
-   The number of rows gives the **total number of RED files** required for the extract phase \(REH file\) or format phase \(RTH file\).
-   The report can be used to **assess memory usage**, because the relevant RED files are stored in memory during the extract or format phase.

For more details of the input files, see these overviews:

-   "**REH file overview**"
-   "**RTH file overview**"
-   "**VDP file overview**"

Links to the above overviews are under **Related concepts** below.

## 30 Sample Output {#30 .section}

The reports for an REH file and RTH file are identical in format, except the **REH** file has "**Extract**" in the heading and the **RTH** file as "**Format**" in the heading.

An example of an MR71 Report for an **REH** file is below:

![](images/MR71RPT_REH_02.GIF)

## 40 MR71 and phases of the Performance Engine {#40 .section}

![](images/MR71_Phases_01.gif)

MR71 runs in the **reference phase** of the Performance Engine.

For more, see help topic "**Reference phase overview**". A link to that overview is under **Related concepts** below.

## 50 How to run MR71 {#50 .section}

See help topic "**Program Runbook: MR71 Reference Report**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

