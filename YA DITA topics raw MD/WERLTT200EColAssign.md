# Logic text 2: Extract Column Assignment {#WERLTT200EColAssign .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Introduction](WERLTT200EColAssign.md#10)
-   [20 How do I create logic text for Extract Column Assignment?](WERLTT200EColAssign.md#20)
-   [30 What do I use this for?](WERLTT200EColAssign.md#30)
-   [40 Statements to define column values](WERLTT200EColAssign.md#40)
-   [50 Statements for writing records](WERLTT200EColAssign.md#50)
-   [90 Examples](WERLTT200EColAssign.md#90)

## 10 Introduction {#10 .section}

See topic "**Logic text 2: Extract Column Assignment overview**". A link is under **Related concepts** below.

## 20 How do I create logic text for Extract Column Assignment? {#20 .section}

This logic text is part of a view and is associated with a column and a view source file. To create this logic text in an existing view, do the following:

1.  Ensure you are on the "**Edit View**" screen for the relevant view. For help with displaying this screen, see topic "**Modifying Views**" in the General User Guide.
2.  The view must already have at least one view source defined. If there is no view source defined, see topic "**Edit View \(View Editor tab\) screen help**". A link to this topic is under **Related reference** below.
3.  Ensure you are on the "**View Editor**" tab. If the "**View Properties**" tab is displayed, click the **Show Grid / Properties** button. ![](images/Icon_Show_Grid_Props_01.gif) or press F9 or select **Edit -\> Show Grid/Properties**.
4.  In the column immediately below "View Editor", if there is a plus + sign to the left of '**View Source**", double click the plus sign to expand the list of view sources.
5.  Click on a cell in the relevant column that is also in the row for the relevant view source file.
6.  The "**Column Source Properties**" window appears. Double click "**Column Source Type**" and select "**Formula**" from the drop down box.
7.  Double click "**Column Source Value**" and click ![](images/Icon_Three_Dots_01.gif).
8.  Type your logic text in the window "**Create New Extract Column Assignment**" or "**Edit Extract Column Assignment**".
9.  Click ![](images/Icon_ValidLT_02.gif) to check if the logic text is valid.
10. Fix any errors shown in the "**Logic Text Validation Errors**" window.
11. When the new logic text is complete and valid,
    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
12. You may wish to close some of the open windows, such as "**Logic Text Helper**" and "**Create New Extract Column Assignment**" or "**Edit Extract Column Assignment**".

## 30 What do I use this for? {#30 .section}

Extract Column Assignment logic text can be placed in each column in a view. The logic text for each column is executed in order of the column, so column 1 logic text is executed first, and so on. The Extract Column Assignment logic text can be used for the following purposes:

-   **Define column values.** Define the value of the current column in the view, or any other column. All the fields in the selected input records are available for access. A column can be defined by any input field, on lookups of values in other logical files or by arithmetic and logic. The logic text for Extract Column Assignment has the most functions and the most flexibility of all the logic text, so most of the processing should be done here. More details are below.
-   **Write records to other logical files.** You may write the entire input record, or all columns up to a given column. You can write to view output files. You can write records to extract work files \(EXT files\) that are passed to the format phase for more processing. More details are below.

## 40 Statements to define column values {#40 .section}

The overall idea is that your logic text describes how to select or skip, but not both.

|Choice for logic text|Notes|
|---------------------|-----|
|COLUMN =|Define the value of the current column.|
|COL.nnn =|Set the value of any other column in the view other than the current one. The "nnn" is the number of the particular column, for example COL.3 for column 3.|
|IF statements|There can be any number of IF statements, and one IF can have other IF statements nested inside. COLUMN and COL.nnn statements can be inside any of these IF statements.|

There are a large number of functions and string comparison operators and other syntax that can be used - see the examples below and the syntax topics listed under **Related reference** below.

## 50 Statements for writing records {#50 .section}

For syntax of WRITE statements, see topic "**Syntax: WRITE statements in Extract Column Assignment**". A link is under **Related reference** below.

## 90 Examples {#90 .section}

See the topics below.

-   **[Examples: COLUMN and COL.nnn statements](../html/WERLTT201ColumnCol.md)**  

-   **[Examples: IF with COLUMN and COL.nnn statements](../html/WERLTT202IFColumnCol.md)**  

-   **[Examples: WRITE statements](../html/WERLTT203WRITE.md)**  

-   **[Rules for all logic text](../html/WERLTT999Rules.md)**  


**Parent topic:**[Logic text types](../html/WERLTT000Types.md)

