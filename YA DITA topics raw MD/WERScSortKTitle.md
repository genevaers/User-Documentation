# Sort Key Titles screen help {#WERScSortKTitle .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScSortKTitle.md#02)
-   [05 Errors](WERScSortKTitle.md#05)
-   [10 Action on this screen](WERScSortKTitle.md#10)
-   [50 Fields](WERScSortKTitle.md#50)
-   [99 Keyboard Shortcuts](WERScSortKTitle.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_View_6_SortKeyTitles_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to create or update the sort key title for a view.

This screen does not appear if the output format for a view is **Flat File**. This screen also does not appear if the output format is either **Hardcopy** and the display mode of the sort key is **As Data**.

This screen is available for all users of the workbench.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Sort Key Titles errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values in cells where the background is white \(not grey\). When complete,

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

Alternatively, click ![](images/LR_Delete_field_03.GIF) to effectively clear the sort key title fields. This button does not work for a new sort key field.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|View Source|Click in this field to display a drop down list of logical record and logical file pairs available. Ensure one choice is selected.|
|Title Field|Click in this field to display a drop down list of available combinations of logical record, lookup path and logical record field name. Ensure one choice is selected.|
|Effective Date Type|Select a value to determine the type of effective date for the lookup path.|
|Effective Date Value|If the value in the previous field is Run Date, then no value is required for this field. If the previous field is CCYYMMDD then type a date in that format. If the previous field is Source File Field, then select a logical record field from the list given.|
|Title Length|The length of the title field. A positive integer greater than zero and up to a maximum of four digits. Must not be greater than the actual length of the logical record field selected in Title Field.|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

