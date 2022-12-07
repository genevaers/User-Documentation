# Select phase overview {#SACSelect .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Diagram](SACSelect.md#10)
-   [20 Programs and processing](SACSelect.md#20)
-   [100 Need more on this page?](SACSelect.md#100)

## 10 Diagram {#10 .section}

![](images/PM_1Sel_Progs_01.gif)

## 20 Programs and processing {#20 .section}



The select phase is the first phase of PE, and consists of program **MR86** alone.

Input to the select phase is one or more selected views for this run of PE. MR86 reads these views and all related metadata from the SAFR Database and creates a VDP XML file.

VDP = View Definition Parameters. The VDP file drives the rest of the SAFR phases to produce the results for the views selected.

In addition to selecting views, MR86 can configure some of the parameters for how those selected views are processed in PE. The available parameters for this in MR86 are:

-   **RUNDATE** - the views run as though the given rundate is the actual processing date.
-   **MAXIMUMFILENUM** - this limits the number of EXT files used in the extract phase.
-   **DECIMALDIGITS** - this defines the number of digits to the left of the decimal point. This applies to all numeric fields in the selected views.
-   **DECIMALPLACES** - this defines the number of digits to the right of the decimal point. This applies to all numeric fields in the selected views.

For more, see these overviews:

-   "**EXT file overview**"
-   "**Metadata overview**"
-   "**MR86 VDP Builder overview**".
-   "**SAFR phases overview**"
-   "**VDP file overview**"
-   "**Views overview**"
-   "**XML structure for VDP overview**"

Links to the above overviews are under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

