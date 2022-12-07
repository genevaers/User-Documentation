# How do I generate a View Properties Report? {#WERFaq7GenRptVProps .reference}

![](images/Report_ViewPropsA_03_GenlOut.gif)

![](images/Report_ViewPropsB_02_FormAdvCnts.gif)

![](images/Report_ViewPropsC_03_ColMapping.gif)

![](images/Report_ViewPropsD_03_Cols.gif)

![](images/Report_ViewPropsE_03_FPC.gif)

![](images/Report_ViewPropsF_03_SortKeys.gif)

![](images/Report_ViewPropsG_03_SortKTitles.gif)

This metadata report can cover selected views. The above example covers only one view.

System and environment administrators can always generate this report. General users can generate this report if the **group selected during login** has **read** rights to the specific view items.

## Procedure - generate the View Properties Report {#ProcGenVPRpt .section}

Do the following:

1.  Ensure you know the **view folder name and view name or view id** of the relevant view\(s\).
2.  **Ensure you have rights to read the relevant view folder**. System and environment administrators always have read rights. General users have read rights depending on the group selected during login. See your system or environment administrator if you require more read rights.
3.  Ensure you are logged into the relevant environment.
4.  In the Navigator, click any plus to the left of "**View Folders**" so that a list of view folders is shown. If the Navigator is not visible, click **Window -\> Show -\> Navigator**.
5.  In the Navigator, select the relevant view folder. Then in the Metadata List select a relevant view. If the report is for more than one view, hold down the **Ctrl key** to select the extra view\(s\).

    If the list is long, you can search the list by pressing F3. For more about this searching, read task "**Searching lists of metadata**".

6.  Once the view\(s\) is selected,
    -   **EITHER** **right** click and select the **View Properties Report**,
    -   **OR** click the **down arrow** to the right of ![](images/Icon_Report_01.gif) in the Metadata List and select the **View Properties Report**,
    -   **OR** select the "**Reports**" menu and select **View Properties Report**.
7.  If any of the selected views have a logical record or lookup path that is inactive, the report will not load. Instead, you will see a message "**Error loading below components for the report. The report won't be generated for these components. See log file for details.**" The message lists the inactive items that must be reactivated. If you see this message, click OK and this procedure ends.
8.  A new report is generated from the latest data, even if this report is already open in the editor area.
9.  The report displays in Adobe Acrobat Reader. The Acrobat Reader allows printing, saving and other choices.
10. Click X to close the report.

## Fields - View Properties Report - General {#FieldsGeneral .section}

|Field|Definition|
|-----|----------|
|View|The name of the View, followed by the id number in square brackets.|
|Status|The status of the View: either Active or Inactive.|
|View Folder|The View Folder that this View belongs to.|
|Output Format|The output format of this View: either Flat File or Hardcopy Report.|
|Type|The output format type of this View, which may be one of the following - Fixed-Length Fields, Delimited Fields, Source-Record Structure, Version 1 or Version 2. If the previous field Output Format is Hardcopy Report, then this field is "N/A".|
|Format Phase|Indicates whether the View uses a format phase, or alternative is extract-only. This field has value “On” if the format phase applies, and "Off" otherwise.|

## Fields - View Properties Report - Output {#FieldsOutput .section}

|Field|Definition|
|-----|----------|
|Output Logical File|The Logical File that has been selected in the Extract Phase or the Format Phase of this View. Displays "None" if no Logical File is selected.|
|Output Physical File|The Physical File selected in the Extract Phase or the Format Phase of this View. Displays “None” if no Physical File is selected.|
|Extract Output Record Limit|The number of records written, after which format phase processing for this View stops. Displays "None" if the option "Write all eligible records" is selected in the "Extract-Phase Output Limit" section of the "Extract Phase" tab under the "View Properties" tab of this View.|
|Format Output Record Limit|The number of records written, after which format phase processing for this View stops. Displays “None” if the option "Write all eligible records" has been selected in the 'Format-Phase Output Limit' section of the "Format Phase" tab under the "View Properties" tab of this View. Displays “N/A” if the View is extract-only.|

## Fields - View Properties Report - Format {#FieldsFormat .section}

|Field|Definition|
|-----|----------|
|Lines Per Page|The number of lines per page required when a hardcopy report is generated. Only for Views that are Hardcopy Reports with a format phase. Displays "N/A" if the View is something different to this.|
|Report Width|The width in characters of the hardcopy report in characters. Only for Views that are Hardcopy Reports with a format phase. Displays "N/A" if the View is something different to this.|
|Fill Error|The fill character to display when an error has occurred. Only for Views with a format phase. Displays "N/A" if the View is extract-only.|
|Fill Truncation|The fill character to display when a truncation has occurred. Only for Views with a format phase. Displays "N/A" if the View is extract-only.|

## Fields - View Properties Report - Advanced {#FieldsAdv .section}

|Field|Definition|
|-----|----------|
|Control Record|The Control Record which can be seen in the hardcopy report. Displays "None" if no control record is defined for this View.|
|Write Exit Routine|The User-Exit Routine which has been selected in the Extract Phase. Displays "None" if no write user-exit routine is defined for this View.|
|Write Exit Parameter|The User-Exit Parameter which has been specified in the Extract Phase.|
|Format Exit Routine|The User-Exit Routine which has been selected in the Format Phase. Displays "None" if no format user-exit routine is defined for this View. Displays "N/A" if the View is extract-only.|
|Format Exit Parameter|The User-Exit Parameter which has been specified in the Format Phase. Displays "N/A" if the View is extract-only.|
|Extract Aggregation Buffer Size|The size of the buffer used for the records aggregated with identical sort keys. Displays "None" if the option "Do not aggregate records" is selected in section "Extract-Phase Record Aggregation" in the "Extract Phase" tab under the "View Properties" tab.|
|Format Suppress Zeros|It indicates whether or not Zero-Value Record Suppression is enabled in the Format Phase Record Filter. Displays "N/A" if the View is extract-only.|

## Fields - View Properties Report - Counts {#FieldsCounts .section}

|Field|Definition|
|-----|----------|
|Source Count|The number of View Sources present in the View.|
|Column Count|The number of View Columns present in the View.|
|Visible Columns Count|The number of visible View Columns present in the View.|
|Sort Key Count|The number of Sort Keys present in the View.|

## Fields - View Properties Report - Column Mapping {#FieldsColMap .section}

If there are no view sources, you see "**No View Sources available**"

If there is at least one view source but no columns, you see "**No View Columns available**"

|Field|Definition|
|-----|----------|
|Source|The source of the columns in the View, given by \[logical record name.logical file name\]|
|Record Filter|The extract record filter logic text for this source.|
|Column No.|The serial number of the View Column.|
|Type|The column source type of the View Column. Can be one of the following- Source File Field, Lookup Field, Constant or Formula.|
|Value|The column source value of the View Column.|

## Fields - View Properties Report - Columns {#FieldsCols .section}

If there are no columns, you see "**No View Columns available**"

|Field|Definition|
|-----|----------|
|Column No.|The serial number of the View Column.|
|Spaces Before Column|The number of spaces before the View Column in a hardcopy report.|
|Start Position|The starting position of the View Column.|
|Data Type|The data type of the View Column.|
|Date/Time Format|The date/time format of the View Column.|
|Length|The length of the View Column.|
|Data Alignment|The data alignment for the View Column. Can be one of the following- Left, Center or Right.|
|Decimal Places|The number of physical bytes to be occupied by decimal values in the field.|
|Scaling Factor|This field is used for rounding off the values.|
|Signed|'True' or 'False' depending on whether the numeric data in the View Column is signed or not.|
|Visible|'True' or 'False' depending on whether the View Column is visible or not.|
|Sort Key|'True' or 'False' depending on whether the View Column has a Sort Key defined on it or not.|

## Fields - View Properties Report - Format Phase Calculations {#FieldsFPC .section}

If there are no format phase calculations, you see "**No Format Phase Calculations available**"

|Field|Definition|
|-----|----------|
|Column No.|The serial number of the View Column.|
|Format Phase Calculation|The Format Phase Calculation logic text that has been defined for the View Column.|

## Fields - View Properties Report - Sort Keys {#FieldsSortKeys .section}

If there are no sort keys defined, you see "**No Sort Keys available**"

|Field|Definition|
|-----|----------|
|Sort Key No.|The position in which the Sort Key falls in the sort sequence.|
|Column No.|The serial number of the View Column on which this Sort Key has been defined.|
|Start Position|The start position of the Sort Key.|
|Sort Sequence|The sequence in which the fields are sorted.|
|Sort Break|This field has the value 0 if the Sort Key Footer Option has the value 'Suppress Print'. This field has the value 1 if the Sort Key Footer Option has the value 'Print'.|
|Sort Key Label|The header of the column to which the Sort Key corresponds.|
|Data Type|The data type of the Sort Key.|
|Date/Time Format|The date/time format of the Sort Key.|
|Length|The length of the Sort Key.|
|Decimal Places|The number of physical bytes to be occupied by decimal values in the Sort Key.|
|Signed|'True' or 'False' depending on whether the numeric data in the Sort Key is signed or not.|
|Title|'True' or 'False' depending on whether the Sort Key has a Sort Key Title defined.|

## Fields - View Properties Report - Sort Key Titles {#FieldsSortKeyTitles .section}

If there are no sort key titles defined, you see "**No Sort Keys Titles available**"

|Field|Definition|
|-----|----------|
|Source|The sequence number of the View Source.|
|Field|The title field string in the following format-< Logical Record name \>\[< Logical Record id \>\].< Lookup Path name \>\[< Lookup Path id \>\].< LR Field name \>\[< LR Field id \>\]|
|Effective Date Type|The Effective Date Type of the Sort Key Title. Can be one of the following- Constant \(in CCYYMMDD format\), Run Date or Source File Field.|
|Effective Date Value|The Effective Date Value of the Sort Key Title.|

**Parent topic:**[FAQ for WE](../html/SARFaqWE.md)

