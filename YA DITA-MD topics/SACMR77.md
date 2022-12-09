# MR77 VDP VSAM Update overview {#SACMR77 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Program name](SACMR77.md#10)
-   [20 What MR77 does](SACMR77.md#20)
-   [30 MR77 and phases of the Performance Engine](SACMR77.md#30)
-   [50 How to run MR77](SACMR77.md#50)
-   [100 Need more on this page?](SACMR77.md#100)

## 10 Program name {#10 .section}

The full name of the program is **GVBMR77** and the short name is **MR77**.

This program is part of the SAFR Performance Engine.

## 20 What MR77 does {#20 .section}

DB2 databases are supported by underlying VSAM files. PE programs access the underlying VSAM files directly, rather than using the usual DB2 software methods.

MR77 provides the details of the relevant VSAM files. MR77 reads the VDP output from MR75 and checks the selected views for any DB2 databases accessed. MR77 finds the relevant VSAM files and updates the VDP with those extra details.

For more information about VDP, see help topic "**VDP overview**". A link to that overview is under **Related concepts** below.

## 30 MR77 and phases of the Performance Engine {#30 .section}

![](images/MR77_Phases_01.gif)

MR77 runs in the **Logic phase** of the Performance Engine.

For more, see help topic "**Logic phase overview**". A link to that overview is under **Related concepts** below.

## 50 How to run MR77 {#50 .section}

See help topic "**Program Runbook: MR77 VDP VSAM Update**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

