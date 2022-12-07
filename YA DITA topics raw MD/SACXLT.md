# XLT file overview {#SACXLT .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is an XLT file?](SACXLT.md#10)
-   [20 Sample UT90 Report for an XLT file](SACXLT.md#20)
-   [30 How is an XLT file created?](SACXLT.md#30)
-   [50 Processing for XLT files](SACXLT.md#50)
-   [100 Need more on this page?](SACXLT.md#100)

## 10 What is an XLT file? {#10 .section}

XLT = **eXtract Logic Table**.

All logic tables are mainframe files, hence the expression "XLT file".

An XLT file is used to drive the extract phase of PE. This means that the instructions in the XLT file effectively describe the extract phase processing. The views selected in the select phase are the views mentioned in the XLT file. The instructions in the XLT file achieve the extract phase output necessary for those views.

The XLT file is read by program MR95 in the extract phase. The XLT file must always contain instructions - there is no option for the XLT file to be empty.

For more on logic tables, see topic "**Logic tables and codes overview**". A link to that overview is under "**Related concepts**" below.

For more on the extract phase, see topic "**Extract phase overview**". A link to that overview is under "**Related concepts**" below.

## 20 Sample UT90 Report for an XLT file {#20 .section}

![](images/UT90RPT_XLT_01.gif)

![](images/UT90RPT_XLT_02.gif)

![](images/UT90RPT_XLT_03.gif)

![](images/UT90RPT_XLT_04.gif)

![](images/UT90RPT_XLT_05.gif)

For a full discussion of the above example, see help topic "**Logic tables and codes overview**". A link to that overviews is under **Related concepts** below.

## 30 How is an XLT file created? {#30 .section}

An XLT file is created in program **MR90** in the **logic** phase.

For more, see these topics:

-   "**Logic phase overview**"
-   "**MR90 Logic Table Generator overview**"

Links to these overviews are under **Related concepts** below.

## 50 Processing for XLT files {#50 .section}

![](images/XLT_Phases_01.gif)

Processing of XLT files is as follows:

1.  The **XLT** is created in program **MR90** in the **logic** phase.

    For more, see these topics:

    -   "**Logic phase overview**"
    -   "**MR90 Logic Table Generator overview**"
    Links to these overviews are under **Related concepts** below.

2.  The **XLT** is converted into EBCDIC format in program **MR76** in the **logic** phase.

    For more, see these topics:

    -   "**Logic phase overview**"
    -   "**MR76 LT to EBCDIC overview**"
    Links to these overviews are under **Related concepts** below.

3.  A report on the **XLT** is created by program **UT90** in the **extract** phase.

    For more, see these topics:

    -   "**Extract phase overview**"
    -   "**UT90 Logic Table Report overview**"
    Links to these overviews are under **Related concepts** below.

4.  Program **MR95** uses the **XLT** file to create the **extract work files \(EXT files\)** and **Sort eXTract \(SXT\)** files in the **extract** phase.

    For more, see these topics:

    -   "**Extract phase overview**"
    -   "**EXT file overview**"
    -   "**MR95 Reference and Extract overview**"
    -   "**SXT file overview**"
    Links to these overviews are under **Related concepts** below.


Links to the runbooks for the programs mentioned above are under "**Related Reference**" below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

