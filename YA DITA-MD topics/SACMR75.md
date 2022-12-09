# MR75 VDP to EBCDIC overview {#SACMR75 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Program name](SACMR75.md#10)
-   [20 What MR75 does](SACMR75.md#20)
-   [30 MR75 and phases of the Performance Engine](SACMR75.md#30)
-   [50 How to run MR75](SACMR75.md#50)
-   [100 Need more on this page?](SACMR75.md#100)

## 10 Program name {#10 .section}

The full name of the program is **GVBMR75** and the short name is **MR75**.

This program is part of the SAFR Performance Engine.

## 20 What MR75 does {#20 .section}

MR75 reads an input VDP in ASCII format and converts this to an output file in EBCDIC format.

The input VDP is in ASCII format due to processing by MR86, MR84 and MR90 which are C++ programs. The output VDP file is for processing in the remainder of PE which uses Assembler programs.

As part of the conversion process, MR75 produces a report that provides information on the VDP file.

For a sample MR75 report, see help topic "**Program Runbook: MR75 VDP to EBCDIC**". A link to that topic is under **Related reference** below.

For more information about VDP, see help topic "**VDP overview**". A link to that overview is under **Related concepts** below.

## 30 MR75 and phases of the Performance Engine {#30 .section}

![](images/MR75_Phases_01.gif)

MR75 runs in the **Logic phase** of the Performance Engine.

For more, see help topic "**Logic phase overview**". A link to that overview is under **Related concepts** below.

## 50 How to run MR75 {#50 .section}

See help topic "**Program Runbook: MR75 VDP to EBCDIC**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

