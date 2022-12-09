# EXT file overview {#SACEXT .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What is an EXT file?](SACEXT.md#02)
-   [10 Numbers for EXT files](SACEXT.md#10)
-   [20 Limit to the number of EXT files created](SACEXT.md#20)
-   [30 Phases for EXT files](SACEXT.md#30)
-   [100 Need more on this page?](SACEXT.md#100)

## 02 What is an EXT file? {#02 .section}

An EXT is an EXTract work file.

An extract work file is created in the extract phase and passed to the format phase.

![](images/EXT_Action_01.gif)

EXT files are created by MR95 in the extract phase. EXT files are passed to MR88 which creates view output files. There may be different numbers of EXT files and view output files.

The format of EXT files is optimized for passing to MR88 and so the format of EXT files is different to the format for view output files. If you are debugging EXT files, see your IBM representative for assistance in the format of EXT files.

For more background information, see these topics:

-   "**Extract phase overview**"
-   "**Format phase overview**"
-   "**View output file overview**"

Links to these overviews are under **Related concepts** below.

## 10 Numbers for EXT files {#10 .section}

All EXT files have a DDNAME in the form "**EXTRZZZ**" where ZZZ is a number between 001 and 999 inclusive.

A view can specify the specific EXT file that will contain the view data from the extract phase. The view specifies the EXT file by setting a value for "**Extract Work File Number**" in the E**xtract Phase tab** of a view. The value of "Extract Work File Number" is a number, for example 001.

To set "Extract Work File Number" in a view, see these topics:

-   "**Creating views**".

    A link to that topic is under **Related tasks** below.

-   "**Modifying views**".

    A link to that topic is under **Related tasks** below.

-   "**Edit View \(View Properties, Extract Phase tab\) screen help**".

    A link to that topic is under **Related reference** below.

-   "**New View \(View Properties, Extract Phase tab\) screen help**".

    A link to that topic is under **Related reference** below.


## 20 Limit to the number of EXT files created {#20 .section}

The maximum number of EXT files can be set in MR86 by a parameter in the input configuration file. The highest limit possible is 999 and the lowest is 000.

In the configuration file, look under the **\[EXTRACT\]** section for parameter **MAXIMUMFILENUM** which limits the number of EXT files for the VDP created. The limit can be changed using the same view data by running MR86 to create a new VDP.

That configuration file is detailed in topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

## 30 Phases for EXT files {#30 .section}

![](images/EXT_Phases_01.gif)

Processing of EXT files is as follows:

1.  Program **MR95** creates one or more **EXT files** in the **extract** phase. 

    For more, see these topics:

    -   "**Extract phase overview**"
    -   "**MR95 Reference and Extract overview**"
    Links to these overviews are under **Related concepts** below.

2.  Program **MR88** may run multiple times to use the **EXT files** to create one or more view ouput files in the **format** phase. 

    For more, see these topics:

    -   "**Format phase overview**"
    -   "**MR88 Format Data overview**"
    -   "**View output file overview**"
    Links to these overviews are under **Related concepts** below.


## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

