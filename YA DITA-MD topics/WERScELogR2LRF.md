# Edit Logical Record \(LR Fields tab\) screen help {#WERScELogR2LRF .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScELogR2LRF.md#02)
-   [05 Errors](WERScELogR2LRF.md#05)
-   [10 Action on this screen](WERScELogR2LRF.md#10)
-   [50 Fields - LR Fields tab](WERScELogR2LRF.md#50)
-   [99 Keyboard Shortcuts](WERScELogR2LRF.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_Logical_Record_2_LRFields_02.gif)

The above screen image has been split and compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to edit the field data for a logical record.

The **Edit** menu only appears when the "**LR Fields**" tab is displayed.

System and environment administrators can always use this screen. General users can use this screen if the **group selected during login** has **Modify or Delete** rights to the particular logical record in that environment. See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For messages on this screen, see topic "**Edit Logical Record errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Each row on the screen describes one field in the logical record. Each row that represents a primary key field is displayed in red.

When everything is finished,

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

The table below contains the actions for this screen.

|If you want to ...|then ...|
|------------------|--------|
|Assign a **global field** to an existing row|1.  Click or navigate to the **Global Field** cell in that row,
2.  Select from the drop down list. For keyboard instructions, see "**Edit** a cell" below in this table.

|
|**Add a blank row** at the bottom|-   **EITHER** click ![](images/LR_Add_field_03.GIF) \(Add field\)
-   **OR right** click in any cell in any row and select **Add field**
-   **OR** select **Edit, Add Field**
-   **OR** click **Alt+Insert**
-   **OR**
    1.  Navigate to the last row,
    2.  Ensure the row has a value for **Field Name**,
    3.  Press the **Arrow Down** key.
-   **OR**
    1.  Navigate to the last row,
    2.  Navigate to the rightmost cell by pressing the **End** key
    3.  Press the **Arrow Right** key.

|
|**Auto-Calculate**|To turn this feature on

-   **EITHER right** click in any cell in any row and select **Set Auto-Calculate ON**.

If you see a choice of "**Set Auto-Calculate OFF**" then this feature is already on.

-   **OR** select **Edit** menu and item **Set Auto-Calculate ON**.

If the Edit menu has an item "**Set Auto-Calculate OFF**" then this feature is already on.


When this feature is on, the values for **Fixed Position** adjust automatically after these actions \(described in this table\):

-   "**Add a blank row** at the bottom"
-   "**Delete** a row"
-   "**Edit** a cell" \(either Length or Fixed Position\)
-   "**Insert a row** above an existing row"
-   "Move a row **up**"
-   "Move a row **down**"

If this feature is off, you can still manually recalculate the values of Length and Fixed Position - see "**Recalculate**" in this table.

|
|**Copy** a row|1.  **Highlight** the relevant row or **navigate** to the **Field Id cell** in that row,
2.  Choose from the following:
    -   **EITHER** select **Edit, Copy**
    -   **OR right** click and select **Copy**
    -   **OR** press **Ctrl+C**

|
|**Delete** a row|1.  Perform "**Highlight one or more rows**" below in this table
2.  Do the following:
    -   **EITHER** click ![](images/LR_Delete_field_03.GIF) \(delete field\)
    -   **OR right** click and select **Delete**
    -   **OR** select **Edit, Delete**
    -   **OR** press the **Delete** key.
3.  You are prompted to confirm the delete\(s\).
4.  The workbench checks for any views or lookup paths that depend on this row. If these dependencies exist, the workbench displays these and refuses the delete.
5.  If relevant, see "**Ensure accurate values for all rows**" in this table for possible further action.

|
|**Edit** a cell|1.  For **editing mode**
    -   **EITHER** click in the cell for **editing mode**
    -   **OR** navigate to the cell and press **Spacebar**
2.  While in editing mode, **type** new characters or press **Delete** to remove characters.

For a **drop down list**

    -   **EITHER** click to select a value,
    -   **OR** press **Arrow Up** or **Arrow Down** to select a value.
3.  To **undo a change** while still in that cell
    -   **EITHER** press **Escape**,
    -   **OR right** click and select **Undo**.
4.  To **commit** the changes in that cell
    -   **EITHER** click in a different cell,
    -   **OR** press **Enter**.
5.  If relevant, see "**Ensure accurate values for all rows**" in this table for possible further action.

|
|**Ensure accurate values** for all rows|The values for **Fixed Position** must adjust after these actions:-   "**Add a blank row** at the bottom"
-   "**Delete** a row"
-   "**Edit** a cell" \(either Length or Fixed Position\)
-   "**Insert a row** above an existing row"
-   "Move a row **up**"
-   "Move a row **down**"

If the **Auto-Calculate** feature is turned on, then these values automatically adjust. For more on this, see "**Auto-Calculate**" in this table.

If the Auto-Calculate feature is off, you can still keep these values accurate - see "**Recalculate**" in this table.

|
|**Find** a field|1.  Do the following:
    -   **EITHER** click **Edit, Find Field**
    -   **OR** press **Ctrl+F**
    -   **OR right** click and select **Find Field**
2.  Enter the **first few letters of the name** of the field, and press OK. This finds the first occurrence of that name in the logical record.

|
|**Highlight** one or more rows|-   To highlight **one row**
    -   **EITHER** click on the **row number** in the first \(grey\) column,
    -   **OR** navigate to the **Field Id cell** in that row.
-   To highlight **adjacent rows**
    -   **EITHER**
        1.  Click on the **row number** for Row X in the first \(grey\) column,
        2.  Hold the **Control key**,
        3.  Click on the **row number** for Row X+1 or Row X-1 in the first \(grey\) column,
        4.  **UNDO** by repeating steps 2 and 3.
    -   **OR**
        1.  Navigate to the **Field Id cell** in Row X.
        2.  Hold the **Shift key**,
        3.  Press **Arrow Up** or **Arrow Down**.
        4.  **UNDO** by repeating steps 2 and 3.
-   To highlight **rows that are not adjacent**

    1.  Click on the **row number** for Row X in the first \(grey\) column,
    2.  Hold the **Control key**,
    3.  Click on the **row number** for Row Y in the first \(grey\) column
    4.  **UNDO** by repeating steps 2 and 3.
No keyboard method is available for rows that are not adjacent.


|
|**Insert a row** above an existing row|1.  Highlight one row using "**Highlight one or more rows**" above in this table
2.  Do the following:
    -   **EITHER** click ![](images/LR_Insert_field_04.GIF) \(Insert field\).

If the button is grey, ensure only one row is selected.

    -   **OR** click the **Insert** key.
    -   **OR** select **Edit, Insert field**
    -   **OR right** click and select **Insert field**.
3.  If relevant, see "**Ensure accurate values for all rows**" in this table for possible further action.

|
|**Keyboard** navigation|Editing mode is discussed under **Spacebar** in the dot points below, and in "**Edit** a cell" above in this table.

Use the following keys:

-   **Arrow Down** has several uses. In **editing mode** in a cell, this key selects a new value form a drop down list. When **not in editing mode**, this key moves the cursor to the row below. In the last row, if that row has a Field Name value then this key creates a new row underneath.
-   **Arrow Left** has several uses. In **editing mode** in a cell, this key moves the cursor one character left in the value. When **not in editing mode**, this key moves the cursor to the cell to the left. In the leftmost cell of a row, this key moves to the rightmost cell in the row above. In the leftmost cell in the first row, this key has no effect.
-   **Arrow Right** has several uses. In **editing mode** in a cell, this key moves the cursor one character right in the value. When **not in editing mode**, this key move the cursor to the cell to the right. In the rightmost cell of a row, this key moves to the leftmost cell in the row below. In the rightmost cell in the last row, if that row has a Field Name value then this key creates a new row underneath.
-   **Arrow Up** has several uses. In **editing mode** in a cell, this key selects a new value form a drop down list. When **not in editing mode**, this key moves the cursor to the row above. In the first row, this key has no effect.
-   **Delete** removes the highlighted row\(s\). You are prompted to confirm the delete\(s\). The workbench then checks for any views or lookup paths that depend on this row. If these dependencies exist, the workbench displays these and refuses the delete.
-   **End** moves the cursor to the rightmost cell in the current row.
-   **Enter** commits any changes made to the current cell, and exits editing mode. To resume editing mode, press Spacebar.
-   **Escape** restores the original value in a cell before the current editing mode started. The current cell must be in editing mode for this key to have any effect.
-   **Home** moves the cursor to the leftmost cell in the current row.
-   **Insert** creates a new row above the current row.
-   **Spacebar** places the current cell in editing mode. Make changes to the value in the cell. Press Enter to commit the changes and exit editing mode. Press Escape while still in editing more to undo all changes to that cell.

|
|Move a row **up**|1.  Perform "**Highlight one or more rows**" above in this table
2.  Do the following:
    -   **EITHER** click ![](images/LP_Move_Field_Up_03.GIF) \(Move field up\).
    -   **OR** press **Alt+Up**
    -   **OR** select **Edit, Move field up**
    -   **OR right** click and select **Move field up**
3.  If relevant, see "**Ensure accurate values for all rows**" in this table for possible further action.

|
|Move a row **down**|1.  Perform "**Highlight one or more rows**" above in this table
2.  Do the following:
    -   **EITHER** click ![](images/LP_Move_Field_Down_03.GIF) \(Move field down\).
    -   **OR** press **Alt+Down**
    -   **OR** select **Edit, Move field down**
    -   **OR right** click and select **Move field down**
3.  If relevant, see "**Ensure accurate values for all rows**" in this table for possible further action.

|
|**Paste above** a row|1.  Perform '**Copy a row**" above in this table.
2.  Locate the relevant row for the "paste above" action. Highlight this row using "**Highlight one or more rows**" above in this table.
3.  Do the following:
    -   **EITHER** click **Edit, Paste Above**
    -   **OR** press **Ctrl+V**
    -   **OR right** click and select **Paste Above**
4.  If relevant, see "**Ensure accurate values for all rows**" in this table for possible further action.

|
|**Paste below** a row|1.  Perform '**Copy a row**" above in this table.
2.  Locate the relevant row for the "paste below" action. Highlight this row using "**Highlight one or more rows**" above in this table.
3.  Do the following:
    -   **EITHER** click **Edit, Paste Below**
    -   **OR** press **Ctrl+Shift+V**
    -   **OR right** click and select **Paste Below**
4.  If relevant, see "**Ensure accurate values for all rows**" in this table for possible further action.

|
|**Recalculate**|The values for **Fixed Position** need recalculation after these actions described in this help table:-   "**Add a blank row** at the bottom"
-   "**Delete** a row"
-   "**Edit** a cell" \(either Length or Fixed Position\)
-   "**Insert a row** above an existing row"
-   "Move a row **up**"
-   "Move a row **down**"

If the Auto-Calculate feature is on, then the recalculation is done automatically - see "**Auto-Calculate**" in this table.

If the Auto-Calculate feature is off, you can recalculate manually as follows:

1.  Do the following:
    -   **EITHER** click **Edit, Recalculate**,
    -   **OR right** click on any row and select **Recalculate**.
2.  Choose one of **All Rows**, **From Highlighted Row** and **Only Highlighted Row**.

The selection **From Highlighted Row** means the recalculate starts from the highlighted row and continues for all rows below that.


|
|**Save** all changes|-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\)
-   **OR** select **File, Save**,
-   **OR** click **Ctrl+S**.

|
|**Undo** a change|You must be in editing mode in a cell. Do the following:-   **EITHER** press **Escape**
-   **OR right** click and select **Undo**.

This \(right click\) cannot undo change to a drop down list.


|

## 50 Fields - LR Fields tab {#50 .section}

|Field|Definition|
|-----|----------|
|Total Length|The total length of all the fields in the logical record. \(Display only.\)|
|Total Key Length|The total length of all the primary key fields in the logical record. \(Display only.\)|
|Field Count|The total number of fields \(rows\) in the logical record. \(Display only.\)|
|Field ID|The position in the list of all global fields. \(Display only.\)|
|Field Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique \(among field names in this logical record\).Examples of permitted names:

-   Adjustment\_Parameter\_2009
-   Company\_Number

These names are not permitted:

-   2009\_Report\_Code \(doesn't start with a letter\)
-   Growth factor \(must not include spaces\)
-   USA/Canada.Region.Code \(must not include "/" or fullstop\)

|
|Data Type|Choose one of Alphanumeric, Binary, Binary Coded Decimal, Binary Sortable, Edited Numeric, Masked Numeric, Packed, Packed Sortable or Zoned Decimal. If the choice is Masked Numeric, then a value is mandatory in the Numeric Mask field below.|
|Fixed Position|The starting position of this field. Automatically generated by the system, but you can modify the value. Maximum length 9 digits. If you enter zero in this field and attempt to save the logical record, an error message displays and the logical record is saved as inactive.|
|Length|The length of this field. A number up to five digits. -   Values 1-256 for data types **alphanumeric, edited numeric and masked numeric.**
-   Values 1-16 for data types **packed, packed sortable, and zoned decimal.**
-   Values 1, 2, 4, or 8 for data types **binary and binary sortable.**
-   Values 1-10 for data type **binary coded decimal**.

|
|Date/Time Format|Choose one of the formats from the drop down list. If the data type is Edited Numeric this field is automatically set to blank and is display only. \(Optional.\)|
|Signed|Check this box if your data values could be both positive and negative. This field is disabled if the Data Type field is Alphanumeric. This field is also disabled if the field Data Type is Binary and you have selected a value in the field Date/Time Format. \(Optional.\)|
|Decimal Places|The number of decimal places for this field, up to value nine. If the data type is Alphanumeric this field is automatically set to zero and is display only. \(Optional.\)|
|Scaling|This field is used for rounding off the values. A number between -9 to +9. If the data type is Alphanumeric this field is automatically set to zero and is display only. \(Optional.\)|
|Numeric Mask|This field specifies the mask to be used on column output. Choose one of the options from the drop down list. Mandatory for a data type of "Masked Numeric", otherwise optional.|
|Primary Key|The sequence number of this field in the primary key. Choose from the drop down list of sequence numbers. If a sequence number is selected, then the entire field \(row\) is displayed in red. For each field, you can set Primary Key or Effective Date but not both. To remove this field from the primary key, select blank from the drop down list. \(Optional.\)|
|Effective Date|The type of date in this field. Choose either Start Date or End Date from the drop down list. The entire logical record can have only one field where you select Start Date in this field, and only one row where you select End Date in this field. For any field, you can set Primary Key or Effective Date but not both. If you want to create a key based on a date then create a Primary Key \(and do not use this field\). \(Optional.\)|
|Redefines|Indicates this field redefines another field occupying the same position in the logical record. If this checkbox is selected, the fixed position of this field is set to that of the previous field. \(Optional.\)|
|Align Heading|Aligns the View column heading. \(Optional.\)|
|Heading 1|The text for the first line of the column heading for Hardcopy view output. Up to 254 characters. \(Optional.\)|
|Heading 2|The text for the second line of the column heading for Hardcopy view output. Up to 254 characters. \(Optional.\)|
|Heading 3|The text for the third line of the column heading for Hardcopy view output. Up to 254 characters. \(Optional.\)|
|Sort Key Label|Specifies the label for this field when used as a sort key in a view. Up to 48 characters. \(Optional.\)|
|Sort Key Footer Label|Up to 48 characters. \(Optional.\)|
|Global Field|The global field associated with this row. Choose from a drop down list of all global fields in this environment. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. \(Optional.\)|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|

## 99 Keyboard Shortcuts {#99 .section}

Go to topic "**What are the keyboard shortcuts?**" and read these sections:

-   "**10 Shortcuts: All workbench screens**" and
-   "**20 Shortcuts: New/Edit Logical Record screen \(LR Fields tab\)**".

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

