# Logic text 3: Format Column Calculations {#WERLTT300FColCalcs .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Introduction](WERLTT300FColCalcs.md#10)
-   [20 How do I create logic text for Format Column Calculations?](WERLTT300FColCalcs.md#20)
-   [30 What do I use this for?](WERLTT300FColCalcs.md#30)
-   [40 Statements](WERLTT300FColCalcs.md#40)
-   [90 Examples](WERLTT300FColCalcs.md#90)

## 10 Introduction {#10 .section}

The logic text "Format Column Calculations" can also be called "**Format-Phase Calculations**".

See topic "**Logic text 3: Format Column Calculations overview**". A link is under **Related concepts** below.

## 20 How do I create logic text for Format Column Calculations? {#20 .section}

This logic text is part of a view and is associated with a column during the format phase. To create this logic text in an existing view, do the following:

1.  Ensure you are on the "**Edit View**" screen for the relevant view. For help with displaying this screen, see topic "**Modifying Views**" in the General User Guide.
2.  The view must have a format phase. If there is no format phase or you are not sure, see topic "**Edit View \(View Properties, General tab\) screen help**". A link to this topic is under **Related reference** below.
3.  Ensure you are on the "**View Editor**" tab. If the "**View Properties**" tab is displayed, click the **Show Grid / Properties** button. ![](images/Icon_Show_Grid_Props_01.gif) or press F9 or select **Edit -\> Show Grid/Properties**.
4.  Select a **numeric column** that is not part of the sort key. \(A numeric column is any Data Type that is not Alphanumeric.\) In that column **double click** on the cell for row "**Format-Phase Calculation**". That cell may be grey, which means this logic text cannot be applied. This may be because the column is part of the sort key, or is not numeric. This may also be because there is no format phase.
5.  Click ![](images/Icon_Three_Dots_01.gif).
6.  Type your logic text in the window "**Create New Format-Phase Calculation**" or "**Edit Format-Phase Calculation**".
7.  Click ![](images/Icon_ValidLT_02.gif) to check if the logic text is valid.
8.  Fix any errors shown in the "**Logic Text Validation Errors**" window.
9.  When the new logic text is complete and valid,
    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
10. You may wish to close some of the open windows, such as "**Logic Text Helper**" and "**Create New Format-Phase Calculation**" or "**Edit Format-Phase Calculation**".

## 30 What do I use this for? {#30 .section}

Format Column Calculations logic text can be placed in some columns in a view, if a format phase exists for that view. The column with this logic text must be numeric and must not be part of the sort key.

The logic text for columns is executed in order of the columns, so column 1 logic text is executed first, and so on. The Format Column Calculations logic text is used for updating values of columns during the format phase.

You can only update the value of the current column \(that contains that logic text\). The logic text can read only the columns to the left of the column that contains the logic text. This means, for example, that in column 1 the values of all other columns are not available to the logic text.

Less functions and other syntax is available, as compared to the Extract Column Assignment logic text. Format Column Calculations is mainly intended for creating subtotals and totals of numeric fields.

## 40 Statements {#40 .section}

The overall idea is that your logic text describes how to select or skip, but not both.

|Choice for logic text|Notes|
|---------------------|-----|
|COLUMN =|Define the value of the current column.|
|IF statements|There can be any number of IF statements, and one IF can have other IF statements nested inside. COLUMN statements can be inside any of these IF statements.|

See below for examples of these. For syntax details, see the topics listed under **Related reference** below.

## 90 Examples {#90 .section}

See the topics below.

-   **[Examples: COLUMN statements](../html/WERLTT301Column.md)**  

-   **[Examples: IF with COLUMN statements](../html/WERLTT302IFColumn.md)**  

-   **[Rules for all logic text](../html/WERLTT999Rules.md)**  


**Parent topic:**[Logic text types](../html/WERLTT000Types.md)

