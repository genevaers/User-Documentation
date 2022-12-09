# Reference phase overview {#SACReference .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Diagram](SACReference.md#10)
-   [20 Inputs and outputs](SACReference.md#20)
-   [30 Why is it called "reference"?](SACReference.md#30)
-   [100 Need more on this page?](SACReference.md#100)

## 10 Diagram {#10 .section}

![](images/PM_4Ref_Progs_01.gif)

## 20 Inputs and outputs {#20 .section}

The reference phase is the fourth phase of PE, and consists of these programs.

-   **UT90** .
-   **MR95** .
-   **MR71** .

The reference phase prepares reference files for processing in the extract phase of PE. **Input** to the reference phase is:

-   VDP file
-   JLT file
-   Reference data files for the views in the VDP.

The reference phase does the following:

1.  Creates a report of the JLT file which is useful in debugging problems.
2.  Prepares reference file data for processing in the next phase in MR95. This creates the RED, REH and RTH files.
3.  Creates a Reference File Creation Control Report \(Extract\) using the REH file.
4.  Creates a Reference File Creation Control Report \(Sort Title\) using the RTH file.

MR95 works as follows

-   Inputs:
    -   VDP file
    -   **JLT file** \(effectively, this file "drives" the reference phase\)
    -   Reference data files
-   Outputs:
    -   RED files
    -   REH file
    -   RTH file

## 30 Why is it called "reference"? {#30 .section}

The word "**reference**" in the phase "**reference phase**" refers to the input reference files and the output RED, REH and RTH files. The RED, REH and RTH files are input to the extract phase and allow the extract phase to achieve many of the performance advantages of SAFR.

For more, see these overviews:

-   "**JLT file overview**"
-   "**Logic tables and codes overview**"
-   "**MR71 Reference Report overview**"
-   "**MR95 Reference and Extract overview**"
-   "**RED file overview**"
-   "**REH file overview**"
-   "**RTH file overview**"
-   "**SAFR phases overview**"
-   "**UT90 Logic Table Report overview**"
-   "**VDP file overview**"

Links to the above overviews are under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

