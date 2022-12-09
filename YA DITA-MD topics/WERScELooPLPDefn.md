# Edit Lookup Path \(Lookup Path Definition tab\) screen help {#WERScELooPLPDefn .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are:

-   [02 Screen function and rights](WERScELooPLPDefn.md#02)
-   [05 Errors](WERScELooPLPDefn.md#05)
-   [10 Action - Lookup Path Definition tab](WERScELooPLPDefn.md#10)
-   [20 Action - Detail a step](WERScELooPLPDefn.md#20)
-   [30 Action - Two or more steps](WERScELooPLPDefn.md#30)
-   [50 Fields - Source section](WERScELooPLPDefn.md#50)
-   [60 Fields - Source Field Properties - Source section](WERScELooPLPDefn.md#60)
-   [70 Fields - Source Field Properties - Data Attributes section](WERScELooPLPDefn.md#70)
-   [80 Fields - Target section](WERScELooPLPDefn.md#80)
-   [99 Keyboard Shortcuts](WERScELooPLPDefn.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_Lookup_Path_2_LPDefn_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to modify the steps in a lookup path.

This screen is available to all users of the workbench.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Edit Lookup Path errors**". For a link, see under **Related reference** below.

## 10 Action - Lookup Path Definition tab {#10 .section}

A lookup path allows data from a source file to access a target file. The data from the source file is optionally combined with constants and symbols to create a key. That key consists of selected source fields and must match the primary key of the target file.

For an introduction to constants and symbols, see topic "**Lookup Path overview**". A link to that topic is under **Related concepts** below.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

A lookup path consists of one or more steps, where each step defines a key that accesses a target file. The color of the step number indicates that status of that step:

-   **Black** means an **active** step.
-   **Red** means an **inactive** step.
-   **Blue** means an **incomplete** step.

Use the recommended actions in the table below.

|Recommended actions|Notes|
|-------------------|-----|
|1. Under **Source**, select a **Logical Record**|Makes all fields in the source file available for inclusion in the Selected Source Fields.Optionally, **right** click the value set in this field and select "**Open Editor**". This opens the "**Edit Logical Record**" screen.

|
|2. Under **Target**, select a **Logical Record**|Once selected, the heading for the Target section changes to **Target - Total Width: ?** This defines the length of the primary key of the target file. Optionally, **right** click the value set in this field and select "**Open Editor**". This opens the "**Edit Logical Record**" screen.

|
|3. Under **Target**, select a **Logical File**|Optionally, **right** click the value set in this field and select "**Open Editor**". This opens the "**Edit Logical File**" screen.|
|4. Go to section **04 Action - detail a step** below.|This details one particular step.|
|5. For an extra step, see section **06 Action - two or more steps** below.|This creates \(or removes\) an extra step\(s\).|
|6. Save the lookup path.|**EITHER:**-   click ![](images/Icon_Save_03.GIF) \(the save icon\)
-   **OR** select **File -\> Save**
-   **OR** click **Ctrl+S**.

To save a copy of the lookup path with a different name:

1.  **EITHER:**
    -   select **File, Save As**,
    -   **OR** press **Ctrl+Shift+S**
2.  Type a new name
3.  Click **Save** or press **Enter**.

|

## 20 Action - Detail a step {#20 .section}

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

To complete a step in the lookup path, inside that step the **Source - Total Width** must be equal to **Target - Total Width**. The **Source - Total Width** is the total length of the list of **Selected Source Fields**. The **Target - Total Width** is the length of the primary key for the target logical record.

|If you want to ...|then ...|
|------------------|--------|
|**Add a field**|1.  **EITHER:**
    -   click ![](images/LP_Add_Source_Field_03.GIF) \(Add a source field\),
    -   **OR** select **Edit, Add a source field**,
    -   **OR right** click and select **Add Source Field**,
    -   **OR** click **Alt+Shift+Insert**.
2.  **Right** click the value set in this field and select "**Open Editor**". This opens the "**Edit Logical Record**" screen that contains the field.
3.  Go to the row in this help table for "Configure a **Source field**".

|
|**Change the order** of the field list|**EITHER:**-   click ![](images/LP_Move_Field_Up_03.GIF) \(Move source field up\) or ![](images/LP_Move_Field_Down_03.GIF) \(Move source field down\). See note below when one or both icons are grey.
-   **OR** select **Edit** and then **Move source field up** or **Move source field down**. See note below when one or both menu items are grey.
-   **OR right** click and select **Move source field up** or **Move source field down**. See note below when one or both menu items are grey.
-   **OR** click **Alt+Shift+Up** \(Move source field up\) or **Alt+Shift+Down** \(Move source field down\). See note below if nothing happens.

If any of the following are true:

-   The icon is grey,
-   **OR** the menu item is grey,
-   **OR** pressing the given keys does nothing

then this means the one of the following is true:

-   A row is not highlighted. You must ensure one row is highlighted.
-   **OR** the action is impossible,
-   **OR** you do not have enough rights to perform this action. You need modify rights to this lookup path to perform this action.

|
|Change the Source Logical Record|This is only permitted in Step 1. Under **Source** click on the drop down box for **Logical Record**. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. Ensure a logical record is selected.|
|Change the Source Logical File|This field does not display for Step 1. For all steps after that, to change this field you must change the target logical file in the previous step.|
|Change the Target Logical Record|Under **Target** click on the drop down box for **Logical Record**. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. Ensure a logical record is selected.|
|Change the Target Logical File|Under **Target** click on the drop down box for **Logical File**. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. Ensure a logical file is selected.|
|Configure a **Source field**|Under **Source Field Properties** and **Source**, do the following: 1.  Ensure the **radio button** for **LR Field** is selected.
2.  Select a field from the drop down list.
3.  Go to the row in this help table for **Set Data Attributes**.

|
|Configure a **Constant**|Under **Source Field Properties** and **Source**, do the following: 1.  Ensure the **radio button** for **Constant Value** is selected.
2.  Type data for **Value**.
3.  Go to the row in this help table for **Set Data Attributes**.

|
|Configure a **Symbol**|Under **Source Field Properties** and **Source**, do the following: 1.  Ensure the **radio button** for **Symbol Name** is selected.
2.  Type in the symbol name in the field to the right. In logic text, the syntax requires "**$**" \(a dollar sign\) before the symbol name, but the symbol name here starts with a letter.
3.  Type data for **Default Value**.
4.  Go to the row in this help table for **Set Data Attributes**.

|
|Create a **extra step**|See section **06 Action - two or more steps** below.|
|**Delete** a field|1.  Highlight the relevant row in **Selected Source Fields**.
2.  **EITHER:**
    -   click ![](images/LP_Delete_Source_Field_03.GIF) \(Delete source field\). See note below if icon is grey.
    -   **OR** select **Edit, Delete source field**. See note below if menu item is grey.
    -   **OR right** click and select **Delete**. See note below if menu item is grey.
    -   **OR** click **Delete**. See note below if nothing happens.

 If any of the following are true:

 -   The icon ![](images/LP_Delete_Source_Field_03.GIF)is grey,
-   **OR** the Delete menu item is grey,
-   **OR** pressing Delete does nothing

 then this means the one of the following is true:

 -   A row is not highlighted. You must ensure one row is highlighted.
-   **OR** you do not have enough rights to perform this action. You need modify rights to this lookup path to perform this action.

|
|**Delete a step**|See section **06 Action - two or more steps** below.|
|Edit or review the **source logical record**|**EITHER:**-   **Right** click the value in field "**Logical Record**" under "**Source**" and select "**Open Editor**". This opens the "**Edit Logical Record**" screen.
-   **OR**

**Right** click the value in field "**LR Field**" under "**Source Field Properties**" and select "**Open Editor**". This opens the "**Edit Logical Record**" screen.


|
|**Modify a field**|1.  Ensure the row is highlighted.
2.  Choose one of these rows in this help table:
    -   **Change the order**.
    -   Configure a **Source field**.
    -   Configure a **Constant**.
    -   Configure a **Symbol**.

|
|Reorder the field list|See row **Change the order** in this help table.|
|**Save** the lookup path|**EITHER:** -   click ![](images/Icon_Save_03.GIF) \(the save icon\)
-   **OR** select **File -\> Save**
-   **OR** click **Ctrl+S**.

To save a copy of the lookup path with a different name:

1.  **EITHER:**
    -   select **File, Save As**,
    -   **OR** press **Ctrl+Shift+S**
2.  Type a new name
3.  Click **Save** or press **Enter**.

|
|**Set Data Attributes** for a field|Ensure the field is highlighted. Select or type values as appropriate under **Data Attributes**. For more on each field, see heading **Fields - Source Field Properties - Data Attributes section** below. When the Data Attributes are correct, then this field in "Selected Source Fields" is finally complete.|

## 30 Action - Two or more steps {#30 .section}

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

|If you want to ...|then ...|
|------------------|--------|
|Modify an existing step|Do the following:

 1.  Click on the step number. After a short pause, the details of that step display.
2.  Go to section **04 Action - detail a step** above.

|
|Add a **new last step**|Do the following:

 1.  **Highlight the current last step**
2.  Ensure selections for **Source Logical Record, Target Logical Record** and **Target Logical File.**
3.  Underneath the list of steps, click **Add**.
4.  Under **Target**, select a **Logical Record**.
5.  Under **Target**, select a **Logical File**.
6.  Go to section **04 Action - detail a step** above.

|
|**Remove** a step and **all steps below that**|Do the following:

 1.  **Highlight the step** number and click **Remove**. An alternative to the Remove button is to hit the **Delete** key.
2.  A message appears that provides the option to cancel the action.

|
|**Save** the lookup path|**EITHER:** -   click ![](images/Icon_Save_03.GIF) \(the save icon\)
-   **OR** select **File -\> Save**
-   **OR** click **Ctrl+S**.

To save a copy of the lookup path with a different name:

1.  **EITHER:**
    -   select **File, Save As**,
    -   **OR** press **Ctrl+Shift+S**
2.  Type a new name
3.  Click **Save** or press **Enter**.

|

## 50 Fields - Source section {#50 .section}

|Field|Definition|
|-----|----------|
|Logical Record|The source logical record. Step 1 must have a logical record selected from this box. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. For all steps after that, this field is the target logical record of the previous step and is display only.|
|Logical File|One of the logical files associated with the logical record above. This field is not required for Step 1. For all steps after that, this field is the target logical file of the previous step. \(Display only.\)|
|Selected Source Fields|The names of the selected source fields. The fields may be a logical record field that was selected from the logical record above, or may be a constant or symbol defined for this lookup. Double click on a field to highlight the relevant entries in the Source Field Properties section.|
|Length|The length of the Selected Source Field in that row. \(Display only.\)|

## 60 Fields - Source Field Properties - Source section {#60 .section}

|Field|Definition|
|-----|----------|
|LR Field|A field in the source logical record for this step of the lookup. Click this radio button and select a logical record field from the drop down box. If the radio button is not selected, the drop down field is disabled.|
|Constant|Click this radio button to define a constant value. Use the Value field for the actual value itself.|
|Value|The value of a constant. The Constant radio button must be selected to enter a value in this field.|
|Symbol|Click this radio button to define a symbol. A symbol is a variable that is controlled by logic text in the view. In logic text, the syntax requires "**$**" \(a dollar sign\) before the symbol name, but the actual symbol name starts with a letter. The field Default Value below applies to this symbol.|
|Name|The name of this symbol \(required if the radio button for symbol is selected\). Up to 254 characters.|
|Default Value|The default value of this symbol \(required if the radio button for symbol is selected\). Up to 254 characters.|

## 70 Fields - Source Field Properties - Data Attributes section {#70 .section}

|Field|Definition|
|-----|----------|
|Data Type|Choose one of Alphanumeric, Binary, Binary Coded Decimal, Binary Sortable, Edited Numeric, Masked Numeric, Packed, Packed Sortable or Zoned Decimal.|
|Length|The length of this field. A number up to five digits. -   Values 1-256 for data types **alphanumeric, edited numeric and masked numeric.**
-   Values 1-16 for data types **packed, packed sortable, and zoned decimal.**
-   Values 1, 2, 4, or 8 for data types **binary and binary sortable.**
-   Values 1-10 for data type **binary coded decimal**.

For a **constant**, set the length based on the Value field of the **Source Field Properties Source** section

|
|Date/Time Format|Choose one of the formats from the drop down list. If the data type is Edited Numeric this field is automatically set to blank and is display only. \(Optional.\)|
|Scaling Factor|This field is used for rounding off the values. A number between -9 to +9. If the data type is Alphanumeric this field is automatically set to zero and is display only. \(Optional.\)|
|Decimal Places|The number of decimal places for this field, up to value nine. If the data type is Alphanumeric this field is automatically set to zero and is display only. \(Optional.\)|
|Signed|Check this box if your data values could be both positive and negative. This field is disabled if the Data Type field is Alphanumeric. This field is also disabled if the field Data Type is Binary and you have selected a value in the field Date/Time Format. \(Optional.\)|
|Numeric Mask|This field specifies the mask to be used on column output. Choose one of the options from the drop down list. \(Optional.\)|

## 80 Fields - Target section {#80 .section}

|Field|Definition|
|-----|----------|
|Logical Record|The target logical record, which must have a primary key defined, and must be in the current environment. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.|
|Logical File|The target logical file which must associated with the target logical record in the current environment. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.|
|Target Primary Keys|The names of the target logical record fields that are primary keys. \(Display only\).|
|Length|The length of the Target Primary Key in that row. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

