# Sort Key Properties screen help {#WERScSortKP .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScSortKP.md#02)
-   [05 Errors](WERScSortKP.md#05)
-   [10 Action on this screen](WERScSortKP.md#10)
-   [50 Fields](WERScSortKP.md#50)
-   [99 Keyboard Shortcuts](WERScSortKP.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_View_5_SortKeyProps_01.gif)

Use this screen to view and update sort key data for a column in a view.

This screen is available for all users of the workbench.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Sort Key Properties errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values in cells where the background is white \(not grey\). When that is complete,

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

Switch to other screens to complete other areas of this view.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|Column|The column number in the view. \(Display only.\)|
|Start Position|The start position of the sort key. \(Display only.\)|
|Sort Key Number|The position of this sort key in the entire sort sequence. Click in this field to display a drop down box, and select a different position.|
|Sort Sequence|Click in this field to display a drop down box to select "Ascending" or "Descending".|
|Data Type|Click in this field to display a drop down box to select a data type.|
|Date/Time Format|Click in this field to display a drop down box to select a format. \(Optional.\) This field is disabled if the data type is "Edited Numeric" or "Masked Numeric".|
|Length|The length of this field. Type a positive integer up to a maximum of 5 digits.|
|Decimal Places|The number of physical bytes for decimal values in this field. Type a positive integer of 1 digit up to a maximum value of 9. \(Optional.\) If the data type is "Alphanumeric" then this field is disabled.|
|Signed|Check or uncheck this box to signal if the value has a sign or not. \(Optional.\) This field is disabled and cleared for data types "Alphanumeric" or "BCD". This field is disabled and checked for data type "Edited Numeric".|
|Display Mode|Select "As Data" or "Categorized". \(Optional.\) This field is disabled if the output format for the view is "Flat File".|
|Sort Key Label|The header of the column for this sort key. Defaults to Sort Key Label of the column source field. If that is empty, defaults to the column "Heading 1" value. For Display Mode of "Categorize" or blank, this field can be changed - type any character up to a maximum of 48 characters. \(Optional.\) This field is disabled if the output format of the view is "Flat File". This field is also disabled if the output format of the view is "Hardcopy" and the Display Mode field above is "As Data".|
|Sort Key Footer Label|The footer of the column for this sort key. Defaults to Sort Key Footer Label of the column source field. If that is empty, defaults to "Subtotal". For Display Mode of "Categorize" or blank, this field can be changed - type\` any character up to a maximum of 48 characters. \(Optional.\) This field is disabled if the output format of the view is "Flat File". This field is also disabled if the output format of the view is "Hardcopy" and the Display Mode field above is "As Data".|
|Sort Key Header Option|The option to print the header on a new page, print the header on the same page \(default\), or to suppress printing of the header. \(Optional.\) This field is disabled if the output format of the view is "Flat File". This field is also disabled if the output format of the view is "Hardcopy" and the Display Mode field above is "As Data".|
|Sort Key Footer Option|The option to print the footer \(default\), or to suppress printing of the footer. \(Optional.\) This field is disabled if the output format of the view is "Flat File". This field is also disabled if the output format of the view is "Hardcopy" and the Display Mode field above is "As Data".If the following are all true:

-   The output format of the view is "**Hardcopy**"
-   AND the display mode is "**Categorized**" or blank,
-   AND this is the **last sort key** \(i.e. the sort key with the highest number\)

then this field must be set to "**Print**".

|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

