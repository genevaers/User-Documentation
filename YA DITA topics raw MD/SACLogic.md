# Logic phase overview {#SACLogic .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Basics of the compile phase](SACLogic.md#10)
-   [20 Views can change in the VDP](SACLogic.md#20)
-   [100 Need this page completed?](SACLogic.md#100)

## 10 Basics of the compile phase {#10 .section}

![](images/PM_3Log_Progs_01.gif)

The logic phase is the third phase of PE, and consists of these programs.

-   **MR90** .
-   **MR75** .
-   **MR76** .
-   **MR77** .

Input to the logic phase is the VDP file. The logic phase does the following:

1.  MR90 creates the JLT and XLT files for the selected views.
2.  MR75 translates the VDP file into EBCDIC format \(from ASCII\).
3.  MR76 translates the XLT file into EBCDIC format \(from ASCII\).
4.  MR76 translates the JLT file into EBCDIC format \(from ASCII\).
5.  MR77 updates the VDP file with VSAM details.

The word "**logic**" in the phrase "**logic phase**" refers to the JLT and XLT files. The JLT file drives the reference phase that is next. The XLT file drives the extract phase. Both the JLT and XLT files are input to MR95, which runs in both the reference and extract phases. Most of the advantages of SAFR are present in the extract phase which requires the XLT file, so the VDP and XLT files aer the two most important files for PE and SAFR as a whole.

For more, see these overviews:

-   "**JLT file overview**"
-   "**Logic tables and codes overview**"
-   "**MR75 VDP to EBCDIC overview**"
-   "**MR76 LT to EBCDIC overview**"
-   "**MR77 VDP VSAM Update overview**"
-   "**MR90 Logic Table Generator overview**"
-   "**MR95 Reference and Extract overview**"
-   "**SAFR phases overview**"
-   "**VDP file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

## 20 Views can change in the VDP {#20 .section}

In addition to creating the JLT and XLT files, MR90 can change how the selected views in the VDP are processed in PE. The available parameters for this in MR90 are:

-   **RUNDATE=CCYYMMDD** - the views run as though the given rundate is the actual processing date.
-   **TTT=CCYYMMDD** - where **TTT** is a valid control record ID number in the same environment for the selected views, and **CCYYMMDD** is a valid date. The CCYYMMDD date overrides the fiscal date given in the control record, and hence is the fiscal date used for the selected views during PE.
-   **VIEWID=999, 888** - where **999** and **888** are valid view ID numbers that were selected in MR86 when the VDP was created initially. The view list \(999,888\) can include one or many view ID numbers. There is no restriction on the number of digits in a view ID number. This option means that this run includes a subset of the views originally selected in MR86
-   **FOLDERID=11, 22** - where **11** and **22** are valid view folder ID numbers that were selected in MR86 when the VDP was created initially. The view folder list \(11,22\) can include one or many view folder ID numbers. There is no restriction on the number of digits in a view folder ID number. This option means that this run includes a subset of the views originally selected in MR86
-   Sort Key Permutations - to be completed

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

