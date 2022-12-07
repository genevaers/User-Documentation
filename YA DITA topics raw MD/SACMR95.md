# MR95 Reference and Extract overview {#SACMR95 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Program name](SACMR95.md#10)
-   [20 What MR95 does](SACMR95.md#20)
-   [30 MR95 and phases of the Performance Engine](SACMR95.md#30)
-   [40 MR95 Report](SACMR95.md#40)
-   [50 How to run MR95 in Reference phase](SACMR95.md#50)
-   [60 How to run MR95 in Extract phase](SACMR95.md#60)
-   [100 Need this page completed?](SACMR95.md#100)

## 10 Program name {#10 .section}

The full name of the program is **GVBMR95** and the short name is **MR95**.

This program is part of the SAFR Performance Engine.

## 20 What MR95 does {#20 .section}

The program MR95 uses logic tables in the reference phase and the extract phase.

In the reference phase, the JLT file ensures MR95 does preparation to process lookup paths very quickly.

In the extract phase, the XLT ensures MR95 processes the source files, executes lookup paths and produces the output very quickly.

MR95 uses the logic table instructions to generate machine code. Effectively, MR95 is "interpreting" logic tables and does not "know" which phase the program is running in. This is the reason that the reference phase and the extract phase both use MR95 - in both phases a logic table is processed - the JLT for the reference phase and the XLT for the extract phase.

## 30 MR95 and phases of the Performance Engine {#30 .section}

![](images/MR95_Phases_01.gif)

MR95 runs in the **reference and extract phases** of the Performance Engine.

For more, see help topics "**Reference phase overview**" and "**Extract phase overview**". Links to these overviews are under **Related concepts** below.

## 40 MR95 Report {#40 .section}

This is DDNAME **MR95RPT** in the job step for MR95.

To be completed

## 50 How to run MR95 in Reference phase {#50 .section}

See topic "**Program Runbook: MR95 Reference Data**". A link to that topic is under **Related reference** below.

## 60 How to run MR95 in Extract phase {#60 .section}

See help topic "**Program Runbook: MR95 Extract Data**". A link to that topic is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

