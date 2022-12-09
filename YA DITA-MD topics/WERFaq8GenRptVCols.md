# How do I generate a View Column Report? {#WERFaq8GenRptVCols .reference}

![](images/Report_ViewCols_03.gif)

This metadata report can cover selected views. The above example covers only one view.

System and environment administrators can always generate this report. General users can generate this report if the **group selected during login** has **read** rights to the specific view items.

## Procedure - generate the View Column Report {#ProcGenVCRpt .section}

Do the following:

1.  Ensure you know the **view folder name and view name or view id** of the relevant view\(s\).
2.  **Ensure you have rights to read the relevant view folder**. System and environment administrators always have read rights. General users have read rights depending on the group selected during login. See your system or environment administrator if you require more read rights.
3.  Ensure you are logged into the relevant environment.
4.  In the Navigator, click any plus to the left of "**View Folders**" so that a list of view folders is shown. If the Navigator is not visible, click **Window -\> Show -\> Navigator**.
5.  In the Navigator, select the relevant view folder. Then in the Metadata List select a relevant view. If the report is for more than one view, hold down the **Ctrl key** to select the extra view\(s\).

    If the list is long, you can search the list by pressing F3. For more about this searching, read task "**Searching lists of metadata**".

6.  Once the view\(s\) is selected,
    -   **EITHER** **right** click and select the **View Column Report**,
    -   **OR** click the **down arrow** to the right of ![](images/Icon_Report_01.gif) in the Metadata List and select the **View Column Report**,
    -   **OR** select the "**Reports**" menu and select **View Column Report**.
7.  A new report is generated from the latest data, even if this report is already open in the editor area.
8.  The report displays in Adobe Acrobat Reader. The Acrobat Reader allows printing, saving and other choices.
9.  Click X to close the report.

## Fields - View Column Report {#FieldVCRpt .section}

If no view columns are defined, you see "**No View Columns available**".

|Field|Definition|
|-----|----------|
|Column No.|The serial number of the View Column.|
|Data Type|The data type of the View Column.|
|Description|Consists of the concatenated string representing the fields Heading 1, Heading 2 and Heading 3 of the View Column.|
|Visible|'Y' \(yes\) or 'N' \(no\) depending on the visibility of the View Column.|
|Format Column Calc.|'Y' \(yes\) or 'N' \(no\) depending on whether the View Column has Format-Phase Calculation defined.|
|Start Position|The starting position of the View Column.|
|Length|The length of the View Column.|
|Field|1. For 'Source File Field' and 'Lookup Field', this column contains the Source LR Field and the Lookup Field respectively of the column source of that View Column. 2. For 'Constant' and 'Formula', this column displays the value \[0\].

|
|Logical Record|1. For 'Source File Field' and 'Lookup Field', this column contains the Logical Record of the column source of that View Column. 2. For 'Constant', this column displays the value \[0\].

3. For 'Formula', this column displays the Logical Record of the View Source corresponding to that View Column.

|
|Lookup Path|1. For 'Lookup Field', this column contains the Lookup Path of the column source of that View Column. 2. For 'Source File Field', 'Constant' and 'Formula', this column displays the value \[0\].

|

**Parent topic:**[FAQ for WE](../html/SARFaqWE.md)

