# Logic text 4: Format Record Filter {#WERLTT400FRecFilter .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Introduction](WERLTT400FRecFilter.md#10)
-   [20 How do I create logic text for Format Record Filter?](WERLTT400FRecFilter.md#20)
-   [30 What do I use this for?](WERLTT400FRecFilter.md#30)
-   [40 Statements](WERLTT400FRecFilter.md#40)
-   [90 Examples](WERLTT400FRecFilter.md#90)

## 10 Introduction {#10 .section}

The logic text "Format Record Filter" can also be called "**Format-Phase Record Filter**".

See topic "**Logic text 4: Format Record Filter overview**". A link is under **Related concepts** below.

## 20 How do I create logic text for Format Record Filter? {#20 .section}

This logic text is part of a view and is associated with the format phase. To create this logic text in an existing view, do the following:

1.  Ensure you are on the "**Edit View**" screen for the relevant view. For help with displaying this screen, see topic "**Modifying Views**" in the General User Guide.
2.  The view must have a format phase. If there is no format phase or you are not sure, see topic "**Edit View \(View Properties, General tab\) screen help**". A link to this topic is under **Related reference** below.
3.  Ensure you are on the "**View Properties**" tab. If the "**View Editor**" tab is displayed, click the **Show Grid / Properties** button. ![](images/Icon_Show_Grid_Props_01.gif) or press F9 or select **Edit -\> Show Grid/Properties**.
4.  Go to the "**View Properties, Format Phase**" tab, and click on the "**Create**" or "**Edit**" button under heading" **Format-Phase Record Filter**".
5.  Type your logic text in the window "**Create New Format-Phase Record Filter**" or "**Edit Format-Phase Record Filter**".
6.  Click ![](images/Icon_ValidLT_02.gif) to check if the logic text is valid.
7.  Fix any errors shown in the "**Logic Text Validation Errors**" window.
8.  When the new logic text is complete and valid,
    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
9.  You may wish to close some of the open windows, such as "**Logic Text Helper**" and "**Create New Format-Phase Record Filter**" or "**Edit Format-Phase Record Filter**".

## 30 What do I use this for? {#30 .section}

Format Record Filter logic text is used for selecting records in the view for final output. More details are below.

## 40 Statements {#40 .section}

The overall idea is that your logic text describes how to select or skip, but not both.

|Choice for logic text|Notes|
|---------------------|-----|
|One SELECTIF statement|A SELECTIF statement gives a condition for selecting view records. Skip any records that do no meet the condition.|
|One SKIPIF statement|A SKIPIF statement gives a condition for skipping view records. Select any records that do not meet the condition.|
|One IF statement using only SELECT statements|One IF statement can contain a SELECT statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SELECT statements or IF statements, and the whole thing still counts as one IF statement. Skip any records that do not qualify for a SELECT somewhere in the IF statement. No actual SKIP statements are allowed.|
|One IF statement using only SKIP statements|One IF statement can contain a SKIP statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SKIP statements or IF statements, and the whole thing still counts as one IF statement. Select any records that do not qualify for a SKIP somewhere in the IF statement. No actual SELECT statements are allowed.|

For syntax details, see the topics listed under **Related reference** below.

## 90 Examples {#90 .section}

See the topics below.

-   **[Examples: SELECTIF statements](../html/WERLTT401SELECTIF.md)**  

-   **[Examples: SKIPIF statements](../html/WERLTT402SKIPIF.md)**  

-   **[Examples: IF with SELECT](../html/WERLTT403IFSELECT.md)**  

-   **[Examples: IF with SKIP](../html/WERLTT404IFSKIP.md)**  

-   **[Rules for all logic text](../html/WERLTT999Rules.md)**  


**Parent topic:**[Logic text types](../html/WERLTT000Types.md)

