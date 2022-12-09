# MR76 LT to EBCDIC overview {#SACMR76 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Program name](SACMR76.md#10)
-   [20 What MR76 does](SACMR76.md#20)
-   [30 MR76 and phases of the Performance Engine](SACMR76.md#30)
-   [50 How to run MR76](SACMR76.md#50)
-   [100 Need this page completed?](SACMR76.md#100)

## 10 Program name {#10 .section}

The full name of the program is **GVBMR76** and the short name is **MR76**.

This program is part of the SAFR Performance Engine.

## 20 What MR76 does {#20 .section}

LT means Logic Table. A logic table is a file that contains instructions that drive processing of SAFR program MR95.

There are two logic table files:

-   JLT - the Join Logic Table. This file drives MR95 running in the reference phase.
-   XLT - the Extract Logic Table. This file drives MR95 running in the extract phase.

The JLT and XLT files are created by MR90 in **ASCII** format. MR76 reads the JLT or XLT and converts that file to **EBCDIC** format for later processing in PE.

For more information about XLT, see help topic "**XLT overview**". A link to that overview is under **Related concepts** below.

For more information about JLT, see help topic "**JLT overview**". A link to that overview is under **Related concepts** below.

To be completed.

## 30 MR76 and phases of the Performance Engine {#30 .section}

![](images/MR76_Phases_01.gif)

MR76 runs in the **Logic phase** of the Performance Engine.

For more, see help topic "**Logic phase overview**". A link to that overview is under **Related concepts** below.

## 50 How to run MR76 {#50 .section}

See help topic "**Program Runbook: MR76 LT to EBCDIC**". A link to that topic is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

