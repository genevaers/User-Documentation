# Logic text 1: Extract Record Filter {#WERLTT100ERecFilter .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Introduction](WERLTT100ERecFilter.md#10)
-   [20 How do I create logic text for Extract Record Filter?](WERLTT100ERecFilter.md#20)
-   [30 What do I use this for?](WERLTT100ERecFilter.md#30)
-   [40 Statements for selecting input files](WERLTT100ERecFilter.md#40)
-   [50 Statements for writing input records](WERLTT100ERecFilter.md#50)
-   [90 Examples](WERLTT100ERecFilter.md#90)

## 10 Introduction {#10 .section}

See topic "**Logic text 1: Extract Record Filter overview**". A link is under **Related concepts** below.

## 20 How do I create logic text for Extract Record Filter? {#20 .section}

This logic text is part of a view and is associated with a view source file. To create this logic text in an existing view, do the following:

1.  Ensure you are on the "**Edit View**" screen for the relevant view. For help with displaying this screen, see topic "**Modifying Views**" in the General User Guide.
2.  The view must already have at least one view source defined. If there is no view source defined, see topic "**Edit View \(View Editor tab\) screen help**". A link to this topic is under **Related reference** below.
3.  Ensure you are on the "**View Editor**" tab. If the "**View Properties**" tab is displayed, click the **Show Grid / Properties** button. ![](images/Icon_Show_Grid_Props_01.gif) or press F9 or select **Edit -\> Show Grid/Properties**.
4.  In the column immediately below "View Editor", if there is a plus + sign to the left of '**View Source**", double click the plus sign to expand the list of view sources.
5.  Click in the cell with a relevant view source name under "**View Sources**".
6.  Double click on the cell to the right of "**Record Filter**" and click ![](images/Icon_Three_Dots_01.gif).
7.  Type your logic text in the window "**Create New Extract Record Filter**" or "**Edit Extract Record Filter**".
8.  Click ![](images/Icon_ValidLT_02.gif) to check if the logic text is valid.
9.  Fix any errors shown in the "**Logic Text Validation Errors**" window.
10. When the new logic text is complete and valid,
    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
11. You may wish to close some of the open windows, such as "**Logic Text Helper**" and "**Create New Extract Record Filter**" or "**Edit Extract Record Filter**".

## 30 What do I use this for? {#30 .section}

Extract Record Filter logic text is used for the following purposes:

-   **Select input files from an input logical file** for processing in the extract phase. For example, you may select input records in a certain date range. This is the primary purpose of this logic text. If this logic text is empty, then all input records are selected automatically. More details are below.
-   **Write input records to other logical files.** You may write all input records, or you may write only the selected input records. Such copies of input records may be useful as a trace for debugging purposes, or as an audit trail. This purpose is optional and less common than the previous purpose. More details are below.

## 40 Statements for selecting input files {#40 .section}

The overall idea is that your logic text describes how to select or skip, but not both.

|Choice for logic text|Notes|
|---------------------|-----|
|One SELECTIF statement|A SELECTIF statement gives a condition for selecting input records. Skip any records that do no meet the condition.|
|One SKIPIF statement|A SKIPIF statement gives a condition for skipping input records. Select any records that do not meet the condition.|
|One IF statement using only SELECT statements|One IF statement can contain a SELECT statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SELECT statements or IF statements, and the whole thing still counts as one IF statement. Skip any records that do not qualify for a SELECT somewhere in the IF statement. No actual SKIP statements are allowed.|
|One IF statement using only SKIP statements|One IF statement can contain a SKIP statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SKIP statements or IF statements, and the whole thing still counts as one IF statement. Select any records that do not qualify for a SKIP somewhere in the IF statement. No actual SELECT statements are allowed.|

See below for examples of these. For syntax details, see the topics listed under **Related reference** below.

## 50 Statements for writing input records {#50 .section}

The only valid statement is a WRITE statement. The **position** of the WRITE statement decides which record are written, as follows:

-   WRITE statements **before** any of the select or skip logic text result in write of **all** input records.
-   WRITE statements **after** any of the select or skip logic text result in write of only the **selected** input records.

For syntax of WRITE statements, see topic "**Syntax: WRITE statements in Extract Record Filter**". A link is under **Related reference** below.

## 90 Examples {#90 .section}

See the topics below.

-   **[Examples: SELECTIF statements](../html/WERLTT101SELECTIF.md)**  

-   **[Examples: SKIPIF statements](../html/WERLTT102SKIPIF.md)**  

-   **[Examples: IF with SELECT](../html/WERLTT103IFSELECT.md)**  

-   **[Examples: IF with SKIP](../html/WERLTT104IFSKIP.md)**  

-   **[Examples: WRITE statements](../html/WERLTT105WRITE.md)**  

-   **[Rules for all logic text](../html/WERLTT999Rules.md)**  


**Parent topic:**[Logic text types](../html/WERLTT000Types.md)

