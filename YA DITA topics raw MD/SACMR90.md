# MR90 Logic Table Generator overview {#SACMR90 .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Program name](SACMR90.md#10)
-   [20 What MR90 does](SACMR90.md#20)
-   [30 MR90 and phases of the Performance Engine](SACMR90.md#30)
-   [50 How to run MR90](SACMR90.md#50)
-   [100 Need more on this page?](SACMR90.md#100)

## 10 Program name {#10 .section}

The full name of the program is **GVBMR90** and the short name is **MR90**.

This program is part of the SAFR Performance Engine.

## 20 What MR90 does {#20 .section}

When a view is activated, a lot of this information is converted into small groups of logic table instructions that are stored in the view. The MR90 input VDP already contains views with these logic table instructions.

In the logic phase, program **MR90** does the following:

1.  Collects all logic table instructions for each view.
2.  Groups together views that use the same data sources. This allows reading data once and processing for multiple views.
3.  Ensures logic table instructions have correct values for "GO TO" instructions. This ensures multiple views are possible in the same run.
4.  Ensures the appropriate RUNDATE is used \(either the actual day of processing or a given date\).
5.  Tracks fields for lookup paths in the extract phase and the format phase. Lookup paths in the format phase are used for sort key titles.

    For more details of this function, see help topic "**RED file overview**" and read the sections on "**What is a RED file?**" and "**How is a RED file created?**" A link to that overviews is under **Related concepts** below.

6.  Ensure correct links from a logical file to physical files.
7.  Ensures sort key permutations are implemented, if required.
8.  Ensures lookup paths are implemented in the extract and format phases using the processing in the reference phase.

    For more details of this function, see help topic "**RED file overview**" and read the sections on "**What is a RED file?**" and "**How is a RED file created?**" A link to that overviews is under **Related concepts** below.

9.  Eliminates unused fields in the VDP.
10. Creates the logic tables: JLT and XLT. These files drive the reference and extract phases.

For more, see these overviews:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

## 30 MR90 and phases of the Performance Engine {#30 .section}

![](images/MR90_Phases_01.gif)

MR86 runs in the **Logic phase** of the Performance Engine.

For more, see help topic "**Logic phase overview**". A link to that overviews is under **Related concepts** below.

## 50 How to run MR90 {#50 .section}

See help topic "**Program Runbook: MR90 Logic Table Generator**". A link to that overviews is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

