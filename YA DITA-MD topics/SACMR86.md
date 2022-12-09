# MR86 VDP Builder overview {#SACMR86 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Program name](SACMR86.md#10)
-   [20 What MR86 does](SACMR86.md#20)
-   [30 MR86 and phases of the Performance Engine](SACMR86.md#30)
-   [50 How to run MR86](SACMR86.md#50)
-   [100 Need more on this page?](SACMR86.md#100)

## 10 Program name {#10 .section}

The full name of the program is **GVBMR86** and the short name is **MR86**.

This program is part of the SAFR Performance Engine.

## 20 What MR86 does {#20 .section}

MR86 is the first step in the Performance Engine \(PE\) producing results for your company.

VDP = View Definition Parameters. XML = Extensible Markup Language. An XML file is a text data file

MR86 creates a VDP XML file for one or more selected view\(s\). At a later time, program MR84 transforms the VDP XML file into a VDP file. The VDP file guides the rest of PE to produce the SAFR output for the selected view\(s\).

MR86 can produce a VDP file directly, although this is not recommended. This is because MR86 creates files from input parameters and from data in the SAFR Database used by the SAFR Workbench. MR86 relies on groups of logic table instructions created for logic text stored in the SAFR Database, and the compiler version for those instructions is unknown. MR84 recompiles all logic table instructions for logic text to ensure the a consistent compiler is used for all logic text in the selected view\(s\). Hence it is recommended for MR86 to create a VDP XML file and for MR84 to ensure all logic text is freshly recompiled.

For information on MR84, see help topic "**MR84 XML Converter overview**". A link to that overview is under **Related concepts** below.

There are differences in the data between a view and a VDP- see help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

There are also differences in the data between a VDP and a VDP XML - see help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 30 MR86 and phases of the Performance Engine {#30 .section}

![](images/MR86_Phases_01.gif)

MR86 runs in the **Select phase** of the Performance Engine.

## 50 How to run MR86 {#50 .section}

See help topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

