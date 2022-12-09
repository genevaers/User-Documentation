# Column Source Properties screen help {#WERScColSrcP .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScColSrcP.md#02)
-   [05 Errors](WERScColSrcP.md#05)
-   [10 Action on this screen](WERScColSrcP.md#10)
-   [50 Fields](WERScColSrcP.md#50)
-   [99 Keyboard Shortcuts](WERScColSrcP.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_View_4_ColSrcProps_02.gif)

Use the Column Source Properties screen to specify the type of column and the source of the value.

This screen in available to all users of the workbench.

## 05 Errors {#05 .section}

For error messages on this screen, see topic "**Column Source Properties errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Most of the rows in this screen are display only. There are a small number of fields that you can change, depending on the **Column Source Type** field.

Change any values required, and save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

To change values on this screen start with a double click in the **Column Source Type** field and select a value from the drop down list. Further change is based on that choice, as given below:

|Column Source Type|Actions possible|
|------------------|----------------|
|Constant|Double click in the cell to the right of **Column Source Value** and type a value. The value can be any characters up to 255 characters.|
|Formula|Double click in the cell to the right of **Column Source Value**. Click on ![](images/Icon_Three_Dots_01.gif) to open either the **Create New Extract Column Assignment** screen or the**Edit Extract Column Assignment** screen. The Logic Text Helper screen also appears. These screens allow creation or modification of Extract Column Assignment logic text for this column.|
|Lookup Field|Select values by double clicking in these fields:-   **Lookup LR** - select the target logical record for the lookup path. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

Optionally, **right** click any value already in this field and select "**Open Editor**". This opens the "**Edit Logical Record**" screen.

-   **Lookup Path** - select the specific lookup path name. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

Optionally, **right** click any value already in this field and select "**Open Editor**". This opens the "**Edit Lookup Path**" screen.

-   **Lookup Field** - select the field in the target logical record. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

Optionally, **right** click any value already in this field and select "**Open Editor**". This opens the "**Edit Logical Record**" screen.

-   **Effective Date Type** - select a format for an effective date \(optional\).
-   **Effective Date Value** - type a date in the format specified in the previous field \(optional: required if the previous field has a value set\). If the Effective Date Type is "Source File Field", sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

When all selections are complete, click on a grey cell underneath and values appear for the lookup field specified.

|
|Source File Field|Click in the cell to the right of **Column Source Value**. From the drop down list, select a field. Once selected, click in a grey cell underneath and values appear for the field selected.|

Change any values required, and save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|Column Source Type|Select a value from the drop down box that describes where to source the value of his column. The other fields on this screen change depending on the choice.|
|Column Source Value|This field depends on the choice for Column Source Type:-   **Constant** - type a value for the constant that can be any characters up to 255 characters.
-   **Formula** - double click in the cell to the right of **Column Source Value**. Click on ![](images/Icon_Three_Dots_01.gif) to open either the **Create New Extract Column Assignment** screen or the**Edit Extract Column Assignment** screen. The Logic Text Helper screen also appears. These screens allow creation or modification of Extract Column Assignment logic text for this column.
-   **Lookup Field** - this cell is disabled.
-   **Source File Field** - from the drop down list, select a field. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. Once selected, click in a grey cell underneath and values appear for the field selected.

|
|Lookup LR|Only enabled if **Column Source Type** is **Lookup Field**. Select a target logical record for a lookup. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. Once selected, this cell displays the logical record name and Id number.|
|Lookup Path|Only enabled if **Column Source Type** is **Lookup Field**. Select a lookup path. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. Once selected, this cell displays the lookup path name and Id number.|
|Lookup Field|Only enabled if **Column Source Type** is **Lookup Field**. Select a field in the target logical record. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. Once selected, this cell displays the target field name and Id number.|
|Effective Date Type|Disabled if the screen View Properties General tab has a value for "Output Logical Record". Without that value, this field is enabled only if **Column Source Type** is **Lookup Field**. Select a value from the drop down list. \(Optional.\)|
|Effective Date Value|Disabled if the screen View Properties General tab has a value for "Output Logical Record". Without that value, this field is enabled only if **Column Source Type** is **Lookup Field** and a value is set in the previous field. Proceed depending on the value in the previous field:-   **CCYYMMDD** - type a value in this format.
-   **Run Date** - this field is disabled and set to the value of Runday\(\).
-   **Source File Field** - from the drop down list, select a field from the drop down list of view source logical record fields applicable. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

|
|Data Type|Displays the data type of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|
|Date/Time Format|Displays the data and time format of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|
|Length|Displays the length of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|
|Data Alignment|Displays the data alignment of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|
|Decimal Places|Displays the number of decimal places of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|
|Scaling Factor|Displays the scaling factor of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|
|Signed|Displays whether there is a sign for this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. The checkbox is cleared if the data type is "Alphanumeric" or "BCD". The checkbox is checked if data type of "Edited Numeric". \(Display only.\)|
|Numeric Mask|Displays the numeric mask of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|
|LR Start Position|Displays the logical record start position of this logical record field only if the Column Source Type is **Lookup Field** or **Source File Field**. Otherwise this field is disabled. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

