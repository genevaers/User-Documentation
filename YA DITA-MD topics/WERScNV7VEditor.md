# New View \(View Editor tab\) screen help {#WERScNV7VEditor .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScNV7VEditor.md#02)
-   [03 Summary of how to prepare a view](WERScNV7VEditor.md#03)
-   [05 Errors](WERScNV7VEditor.md#05)
-   [10 Action on the "View Editor" tab](WERScNV7VEditor.md#10)
-   [50 Fields](WERScNV7VEditor.md#50)
-   [99 Keyboard Shortcuts](WERScNV7VEditor.md#99)

## 02 Screen function and rights {#02 .section}

![](images/New_View_2_ViewEditor_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to define the given fields in a view.

This screen is available to all users of the workbench. General users can save a view if the group selected during login has at least the modify right to the relevant view folder that contains the view. See your system administrator if you require more rights.

## 03 Summary of how to prepare a view {#03 .section}

The main focus of preparing a view is preparing the **columns**. Each column is a field in the logical record for the output file of the view.

A view is displayed in two large tabs:

-   The first large tab is the "**View Properties**" tab, which has sub-tabs:



    -   **General sub-tab**

        This sub-tab names the view, the view folder and the control record. This sub-tab also defines the type of output of the view as a whole and whether a format phase is required.

    -   **Extract Phase sub-tab**

        This sub-tab defines some parameters of the extract phase processing in the Performance Engine. An output logical file and physical file for the extract phase are only defined if this view has no format phase. Other parameters are available regardless of the existence or not of a format phase.

    -   **Format Phase sub-tab**

        This sub-tab only exists if the **General sub-tab** has a tick for format phase. This sub-tab defines some parameters of the format phase processing in the Performance Engine.

    -   **Header/ Footer sub-tab**

        This tab only exists if the **General sub-tab** has **Hardcopy Report** selected, which ensures a format phase. This sub-tab defines a Header and Footer for the report.

    The "**View Properties**" tab can also be called the "**Properties**" tab.

-   The second large tab is the "**View Editor**" tab.

    This tab describes the columns in the output logical file. Most of the action on this screen is about the columns each headed with "Column X".

    Normally the first action on the 'View Editor" tab is to define at least one **view source file**, which is an input logical record and logical file for the view.

    You can save the view without a view source. To activate a view there must be at least one view source.

    The "**View Editor**" tab can also be called the "**Grid**" tab because of the display of the columns.


Only one large tab is displayed at a time. To switch between the large tabs click the **Show Grid / Properties** button ![](images/Icon_Show_Grid_Props_01.gif) or press F9 or select **Edit -\> Show Grid / Properties**.

The objective of all the tabs is an **active** view, because only active views can produce results in the SAFR Performance Engine.

A high level overview of reaching the objective is as follows:

-   Enter or modify values you require in the tabs.
-   **Save the values** in the view. When you save, the workbench performs validation checks and any validation error prevents the save. For example, there must be a unique view name. Fix any validation errors and repeat the save until successful.
-   **Activate the view** to change the status to "Active".

    When the view is first created the screen heading says "**New View - \[Inactive\]**". After successful activation, the screen heading becomes "**New View - \[Active\]**" or "**Edit View - \[Active\]**".

    If you modify any value in an existing "Active" view, when you click or tab away from the modified field the screen heading changes to "**Edit View - \[Inactive\]**". This means it is necessary to activate the view again.

    When you attempt to activate a view, the workbench performs activation checks. Any activation errors keep the status as "Inactive". For example, a view must have at least one sort key and at least one view source, even though a view can be saved without these items. Fix any activation errors and repeat the attempt to activate until successful.


General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

When creating or editing a view, if you open a list and cannot see the required items such as logical records or logical files, see your system or environment administrator.

## 05 Errors {#05 .section}

For error messages on the 'View Activation Errors" screen, see topic "**View Activation Errors message help**". For a link, see under **Related reference** below.

For all other messages on this screen, see topic "**New View errors**". For a link, see under **Related reference** below.

## 10 Action on the "View Editor" tab {#10 .section}

The first action for a view is usually about the input files which are called **view source files**. To define these, see "Add a **view source**" in the table below.

Once defined, the view source files are listed as light blue rows under "**View Sources**" in the column immediately under "View Editor". If present, double click on the plus + sign to the left of "View Sources" to expand the list of view source files.

Note that in general, in any column **double click on any plus + sign** on the left to expand the rows, and **double click on any minus - sign** to collapse rows.

Most of the action on the "View Editor" tab focuses on the **columns** each with heading "Column X". Each column describes a field in the logical record of the output file. Each column has a "**Column Source Type**" to classify the processing for that column. The Column Source Type can be:

-   EITHER a **field** from a view source file,
-   OR a **constant**,
-   OR a **formula** which is logic text,
-   OR a **lookup field** which uses a lookup path.

To configure a particular column as one of these choices, see "**Define a Column Source Type**" in the table below. This is the most important action in the table below.

Remember that to switch between the "**View Editor**" tab and the "**View Properties**" tab click![](images/Icon_Show_Grid_Props_01.gif) \(the **Show Grid / Properties** button\) or press F9 or select **Edit, Show Grid / Properties**.

Remember to **right click** on any cell in the grid for a choice of actions, all described in the table below.

Overall, the actions on this screen are as follows:

|If you want to ...|then ...|
|------------------|--------|
|**Activate** the view|The current screen heading must contain the text **\[Inactive\]**. If the heading contains the text **\[Active\]** then the view is already activated and the view is ready to run in the SAFR Performance Engine.

 1.  To activate,
    -   **EITHER** click ![](images/Icon_VEditor_ActivInact_View_01.gif),
    -   **OR** press **F5**,
    -   **OR** click **Action, Activate / Inactivate View**.
2.  If activation is **unsuccessful** you see the screen **View Activation Errors**.

For help with that screen see topic "**View Activation Errors screen help**". A link to that topic is under **Related reference** below.

3.  After a **successful** activation, the heading displays **\[Active\]**.

 Once the view is "Active", repeating step 1 inactivates the view - see "**Inactivate** the view" below in this table.

|
|**Add a column** at left of existing column|See "**Insert a column** to left of existing column" below in this table.|
|**Add a column** at right hand end|To add a column at the right hand end \(or to create the first column\),-   **EITHER** click ![](images/Icon_VEditor_AddCol_01.gif) \(Add column\).
-   **OR right** click anywhere in the grid and select **Add column**,
-   **OR** click **Alt-Insert** ,
-   **OR** click **Edit, Add column**.

To modify cells in the new column see "**Define a Column Source Type**" and "**Edit** a cell" below in this table.

As a comparison, see "**Insert a column** to left of existing column" below in this table.

|
|**Add a view source**|To add a view source, do the following:

 1.  Launch the "Add View Source" window as follows:
    -   **EITHER** click ![](images/Icon_VEditor_Add_VSource_01.gif),
    -   **OR right** click anywhere in the grid and select **Add view source**,
    -   **OR** click **Shift-Insert**,
    -   **OR** click **Edit, Add view source**.
2.  The "**Add View Source**" screen appears. Select a logical record and logical file and click OK.
3.  Once you have clicked OK, a light blue cell appears under **View Sources**.

|
|**Copy** a column|1.  Click on any grey area in the relevant column so that the cell is highlighted.
2.  Do the following:
    -   **EITHER right** click and select **Copy**,
    -   **OR** press Ctrl+C,
    -   **OR** click **Edit, Copy**.

 This is usually in preparation for "**Paste left** of a column" or "**Paste right** of a column" below in this table.

|
|Create **Extract Record Filter** logic text|This logic text applies to a view source file.1.  Pass the cursor over the cell for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  The "**View Source Properties**" screen appears. Double click in the field to the right of "**Record Filter**".
3.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Create New Extract Record Filter** screen. Use that screen to create Extract Record Filter logic text.

|
|Create **Extract Column Assignment** logic text for a column|1.  Pass the cursor over the cell at the intersection of the relevant "Column X" and the row for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  The "**Column Source Properties**" screen appears. Double click in the field to the right of "**Column Source Type**". In the drop down box, select "**Formula**".
3.  Double click in the field to the right of "**Column Source Value**".
4.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Create New Extract Column Assignment** screen or the **Edit Extract Column Assignment** screen. Use either screen to create Extract Column Assignment logic text for this column.

|
|Create **Format-Phase Calculations** logic text for a column|This logic text can also be called **Format Column Calculation** logic text. The view must have a format phase. In the relevant column in the row marked **Format-Phase Calculation**, a grey cell means that column cannot have a Format-Phase Calculation logic text applied. In this row, only columns that are numeric and are not part of a sort key have a cell with a white or blue background which indicates this logic text is permitted.

1.  At the intersection of the relevant "Column X" and the row **Format-Phase Calculation**, check there is a cell with a white or blue background. If present, double click on this cell.
2.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Create New Format-Phase Calculation** screen or the **Edit Format-Phase Calculation** screen. Use that screen to create Format-Phase Calculation logic text for this column.

|
|Create **Format Record Filter** logic text|1.  Your view must have a format phase. If you need help configuring a format phase, see screen help for the "**View Properties, General**" tab on the "New View" or "Edit View" screen.
2.  When you have a format phase, go to the "**View Properties, Format Phase**" tab and see screen help for details on creating Format Record Filter logic text.

|
|**Deactivate** the view|See "**Inactivate** the view" below in this table.|
|**Define a Column Source Type**|The relevant column to define \(or redefine\) must already exist. If you need to create a new column, see these rows in this table:

 -   "**Add a column** at right hand end"
-   "**Insert a column** to left of existing column"

 To define \(or redefine\) the "Column Source Type" for a column, see one of the following rows in this table:

 -   "Define a **field** from a view source file"
-   "Define a **constant**"
-   "Define a **formula**"
-   "Define a **lookup field**"

 Once a "Column X" is defined, you can optionally perform "Make **sort** key" below in the table.

 For any defined "Column X", change cells in the column by using "**Edit** a cell" below in this table. Particularly important is the row for "**Data Type**" - see "Data Type" under section "**Fields**" below.

|
|Define a **constant**|You require a column to be a constant value. Do the following:1.  Pass the cursor over the cell at the intersection of the relevant "Column X" and the row for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  The "**Column Source Properties**" screen appears. Double click in the field to the right of "**Column Source Type**". In the drop down box, ensure you have selected "**Constant**".
3.  Double click in the field to the right of "**Column Source Value**".
4.  Type the value for this constant. When complete, press Enter.
5.  Change cells in the column by using "**Edit** a cell" below in this table. Particularly important is the row for "**Data Type**" - see "Data Type" under section "**Fields**" below.

|
|Define a **field** from a view source file|You require a column to be a field in a view source file. Do the following:1.  Pass the cursor over the cell at the intersection of the relevant "Column X" and the row for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  The "**Column Source Properties**" screen appears. Double click in the field to the right of "**Column Source Type**". In the drop down box, ensure you have selected "**Source File Field**".
3.  Double click in the field to the right of "**Column Source Value**". In the drop down box, select the source file field for this column.
4.  Optionally perform "Make **sort** key" below in the table.

|
|Define a **formula**|You require a column to be a calculated from a formula. All formulas for columns must use logic text. The two choices are as follows:

-   For **Format-Phase Calculations** logic text, see "Create **Format-Phase Calculations** logic text for a column" above in this table.
-   For **Extract Column Assignment** logic text, do the following
    1.  Pass the cursor over the cell at the intersection of the relevant "Column X" and the row for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
    2.  The "**Column Source Properties**" screen appears. Double click in the field to the right of "**Column Source Type**". In the drop down box, select "**Formula**".
    3.  Double click in the field to the right of "**Column Source Value**".
    4.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Create New Extract Column Assignment** screen or the **Edit Extract Column Assignment** screen. Use either screen to create Extract Column Assignment logic text for this column.

Once a "Column X" is defined, you can optionally perform "Make **sort** key" below in the table.

Change cells in the "Column X" by using "**Edit** a cell" below in this table. Particularly important is the row for "**Data Type**" - see "Data Type" under section "**Fields**" below.

|
|Define a **lookup field**|You require a column to be a lookup field. Do the following:1.  Pass the cursor over the cell at the intersection of the relevant "Column X" and the row for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  The "**Column Source Properties**" screen appears. Double click in the field to the right of "**Column Source Type**". In the drop down box, ensure you have selected "**Lookup Field**".
3.  Double click in the field to the right of "**Lookup LR**". In the drop down box, select a logical record that is the target of the lookup path you require. See your system administrator if you cannot see the lookup record you require.
4.  Double click in the field to the right of "**Lookup Path**". In the drop down box, select the lookup path you require. See your system administrator if you cannot see the lookup path you require.
5.  Double click in the field to the right of "**Lookup Field**". In the drop down box, select the lookup field you require. See your system administrator if you cannot see the lookup field you require.
6.  Press Enter.
7.  Optionally perform "Make **sort** key" below in the table.
8.  Change cells in the column by using "**Edit** a cell" below in this table. Particularly important is the row for "**Data Type**" - see "Data Type" under section "**Fields**" below.

|
|Define a **sort key**|See "Make **sort** key" below in this table.|
|Define a **source file field**|See "Define a **field** from a view source file" above in this table.|
|Define a **view source**|See "Add a **view source**" above in this table.|
|**Delete a column\(s\)**|1.  Click on any grey area in the relevant "Column X" so that the cell is highlighted.
2.  To highlight more than one column, hold down the Control key and click on any grey area in another column. This creates a group of highlighted columns. To remove a column from that group, keep the Control key pressed and click on that grey highlighted cell again. There are now one or more highlighted columns.
3.  To delete,
    -   **EITHER** click ![](images/LR_Delete_field_03.GIF) \(Delete\),
    -   **OR right** click and select **Delete**,
    -   **OR** click the **Delete** key,
    -   **OR** click **Edit, Delete**.
4.  A window named "**Delete Columns**" appears. If the window is named "**Delete View Source**" then press **Cancel** and return to step 1 to ensure you have highlighted the relevant column\(s\). If the window is named "**Delete Columns**", then press **OK** to delete or **Cancel** to retain the column\(s\).

|
|**Delete a sort key**|See "Make **non-sort** key" below in this table.|
|**Delete a view source**|1.  Ensure the relevant **view source cell** \(light blue in color\) under **View Sources** is highlighted \(becomes darker blue\).
2.  To delete,
    -   **EITHER** click ![](images/LR_Delete_field_03.GIF) \(Delete\),
    -   **OR right** click and select **Delete**,
    -   **OR** click the **Delete** key,
    -   **OR** click **Edit, Delete**.
3.  A window named "**Delete View Source**" appears. If the window is named "**Delete Columns**" then press **Cancel** and return to step 1 to ensure you have highlighted the relevant view source cell. If the window is named "**Delete View Source**", then press **OK** to delete or **Cancel** to retain the view source.

|
|**Edit** a cell|1.  To **change** the value in a cell,
    -   **EITHER** click in the cell,
    -   **OR** arrow to the cell and press **Enter**.
2.  Make your changes.
3.  To **undo a change** in that cell immediately after making the change, press **Escape**.
4.  To **commit** the changes in that cell, press **Enter**.

|
|**Inactivate** the view|The current screen heading must contain the text **\[Active\]**. If the heading contains the text **\[Inactive\]** then the view is already inactivated.

 1.  To inactivate the view
    -   **EITHER** click ![](images/Icon_VEditor_ActivInact_View_01.gif),
    -   **OR** press **F5**,
    -   **OR** click **Action, Activate/Inactivate View**.
2.  A message appears: **Are you sure you want to make the current view Inactive?**

If you click **Cancel**, then no action is taken.

If you click **OK**, the heading displays the text **\[Inactive\]**.


 Once the view is inactive, repeating step 1 attempts to activate the view - see "**Activate** the view" above in this table.

|
|**Insert a column** to left of existing column|1.  Click on any grey area in the relevant column so that the cell is highlighted.
2.  To insert a column to the left
    -   **EITHER** click ![](images/Icon_VEditor_Insert_Column_01.gif) \(Insert column\),
    -   **OR right** click and select **Insert column**,
    -   **OR** click the **Insert** key,
    -   **OR** click **Edit, Insert column**.

 As a comparison, see "**Add column** at right hand end" above in this table.

 To modify cells in the new "Column X" see "**Define a Column Source Type**" and "**Edit** a cell" below in this table.

|
|**Insert a column** at right hand end|See "**Add a column** to right hand end" above in this table.|
|Insert a **view source**|See "Add a **view source**" above in this table.|
|Logic text|See these rows in this table:-   "Create **Extract Record Filter** logic text"
-   "Create **Extract Column Assignment** logic text for a column"
-   "Create **Format-Phase Calculations** logic text for a column"
-   "Create **Format Record Filter** logic text"
-   "Modify or delete **Extract Record Filter** logic text"
-   "Modify or delete **Extract Column Assignment** logic text for a column"
-   "Modify or delete **Format-Phase Calculations** logic text for a column"
-   "Modify or delete **Format Record Filter** logic text"

|
|Make **non-sort** key|This applies to a column or a selected group of columns each headed "Column X".1.  In the relevant "Column X" or the highlighted group of columns
    -   **EITHER** **right** click and select **Make non-sort key**,
    -   **OR** click **Ctrl-K**,
    -   **OR** select **Edit, Make non-sort key**.
2.  The sort key icon for this column disappears.
3.  If you repeat step 1, "**Make non-sort key**" becomes '**Make sort key**". For one column, the action in step 1 toggles between the two alternatives

|
|Make **sort** key|This applies to a column or a selected group of columns each headed "Column X".1.  In the relevant "Column X" or the highlighted group of columns
    -   **EITHER** **right** click and select **Make sort key**,
    -   **OR** click **Ctrl-K**,
    -   **OR** select **Edit, Make sort key**.
2.  The cell in that column in this row changes to a symbol similar to ![](images/Icon_VEditor_Sort_Key_1_01.gif). Repeating this action removes the column from the sort key. The first column to join the sort key displays the icon above. The second column displays ![](images/Icon_VEditor_Sort_Key_2_01.gif) and so on.
3.  If you repeat step 1, "**Make sort key**" becomes '**Make non-sort key**". For one column, the action in step 1 toggles between the two alternatives.

See also "Modify a **sort key**" lower in this table.

The data type needs to be carefully selected for a sort key. For more, see field "**Data Type**" under section "**Fields**" below.

|
|Modify a **cell**|See "**Edit** a cell" above in this table.

|
|Modify a **column**|To modify cells in a "Column X" see "**Define a Column Source Type**" and "**Edit** a cell" above in this table.

|
|Modify a **sort key**|1.  Click on the cell in the grid with an icon similar to ![](images/Icon_VEditor_Sort_Key_2_01.gif).
2.  The **Sort Key Properties** screen appears, and sometimes the **Sort Key Titles** screen. Modify fields as appropriate. The "Sort Key Titles" screen is not displayed if the output format of the view is Flat File. This "Sort Key Titles" screen is also not displayed if the output format is Hardcopy and the Display Mode of the Sort Key is As Data.

 If you wish to remove this column from the sort key, see "Make **non-sort** key" above in this table.

|
|Modify a **view source logical record**|See "**Delete a view source**" and "Add a **view source**" in this table.|
|Modify a **view source logical file**|1.  Pass the cursor over the cell for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  Double click on the field to the right of "Logical File". Select a new value from the drop down box. If you cannot see the required logical file in the list, see your system administrator.

|
|Modify or delete **Extract Record Filter** logic text|This logic text applies to a view source file. 1.  Pass the cursor over the cell for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  The "**View Source Properties**" screen appears. Double click in the field to the right of "**Record Filter**".
3.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Edit Extract Record Filter** screen. Use that screen to modify or delete Extract Record Filter logic text. To delete, simply highlight logic text and press the delete key.

|
|Modify or delete **Extract Column Assignment** logic text for a column|1.  Pass the cursor over the cell at the intersection of the relevant "Column X" and the row for the relevant view source file. The cursor changes to a magnifying glass. Click in this cell.
2.  The "**Column Source Properties**" screen appears. Double click in the field to the right of "**Column Source Type**". In the drop down box, select "**Formula**".
3.  Double click in the field to the right of "**Column Source Value**".
4.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Edit Extract Column Assignment** screen. Use that screen to create Extract Column Assignment logic text for this column. To delete, highlight the logic text and press the delete key.

|
|Modify or delete **Format-Phase Calculations** logic text for a column|This logic text can also be called **Format Column Calculation** logic text. The view must have a format phase. In the relevant column in the row marked **Format-Phase Calculation**, a grey cell means that column cannot have a Format-Phase Calculation logic text applied. In this row, only columns that are numeric and are not part of a sort key have a cell with a white or blue background which indicates this logic text is permitted.

1.  At the intersection of the relevant "Column X" and the row **Format-Phase Calculation**, check there is a cell with a white or blue background. If present, double click on this cell.
2.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Edit Format-Phase Calculation** screen. Use that screen to modify or delete Format-Phase Calculation logic text. for this column To delete, simply highlight logic text and press the delete key.

|
|Modify or delete **Format Record Filter** logic text|Go to the "**View Properties, Format Phase**" tab and see screen help for details on modifying or deleting Format Record Filter logic text.|
|Move column **left**|1.  Click on any grey area in the relevant "Column X" so that the cell is highlighted.
2.  To move the column
    -   **EITHER** click ![](images/Icon_VEditor_MovCol_Left_01.gif) \(Move column left\) ,
    -   **OR right** click anywhere in the column and select **Move column left**,
    -   **OR** press **Alt-Left arrow**,
    -   **OR** select **Edit, Move column left**.

|
|Move column **right**|1.  Click on any grey area in the relevant "Column X" so that the cell is highlighted.
2.  To move the column
    -   **EITHER** click ![](images/Icon_VEditor_MoveCol_Right_01.gif) \(Move column right\),
    -   **OR right** click anywhere in the column and select **Move column right**,
    -   **OR** press **Alt+Right arrow**,
    -   **OR** select **Edit, Move column right**.

|
|**Paste left** of a column|1.  You must first have copied a column - see "**Copy** a column" above in this table.
2.  Click on any grey area in the relevant "Column Y" so that the cell is highlighted.
3.  To paste
    -   **EITHER right** click and select **Paste Left**,
    -   **OR** press **Ctrl+V**,
    -   **OR** click **Edit, Paste Left**.

|
|**Paste right** of a column|1.  You must first have copied a column - see "**Copy** a column" above in this table.
2.  Click on any grey area in the relevant "Column Y" so that the cell is highlighted.
3.  To paste
    -   **EITHER right** click and select **Paste Right**,
    -   **OR** press **Ctrl+Shift+V**,
    -   **OR** click **Edit, Paste Right**.

|
|Remove a column\(s\)|See "**Delete a column\(s\)**" above in this table.|
|Remove a **sort key**|See "Make **non-sort** key" above in this table.|
|Remove a view source|See "**Delete a view source**" above in this table.|
|**Save** changes to the view|-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

 If the options above are grey, you only have the read right to the view folder. See your administrator to obtain the modify right to the view folder, which allows saving of the view.

|



## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|Column Headers|A plus + sign indicates that "**Column Headers**" only displays the Heading 1 value and that rows for Heading 1, 2 and 3 are hidden \(collapsed\). A minus - sign appears when this is expanded to display rows for Heading 1, 2 and 3. If present, double click on the plus + sign to expand this row to show rows for Heading 1, 2 and 3.  Double click the minus - sign to collapse back to just the row for "**Column Headers**" field showing the Heading 1 value. The row "**Column Headers**" itself is a read-only field.|
|Heading 1|The text for the first line of the column heading for hardcopy output. Any characters up to 254 characters. \(Optional.\)|
|Heading 2|The text for the second line of the column heading for hardcopy output. Any characters up to 254 characters. \(Optional.\)|
|Heading 3|The text for the third line of the column heading for hardcopy output. Any characters up to 254 characters. \(Optional.\)|
|Sort Keys|**Pass the cursor over the symbol**![](images/Icon_VEditor_Sort_Key_1_01.gif) to change the cursor to a magnifying glass. Click on the magnifying glass to display the **Sort Key Properties** screen and possibly the **Sort Key Titles** screen.A plus sign to the left of "**Sort Keys**" indicates the sort key fields are **collapsed** into one row. A minus sign to the left of "**Sort Keys**" means the sort key fields are **expanded** into rows underneath. Double click the plus sign to expand the sort keys as rows. Double click the minus sign to collapse the sort key rows. The cell with the heading "Sort Keys" is a read-only field.

|
|Column Output|A plus + sign indicates that rows giving output properties of the columns are hidden \(collapsed\). Double click on the plus + sign to expand to show many other rows. Double click on the minus - sign to collapse all the rows into one row showing the Start Position only. The cells in row "Column Output" are always display only.|
|Start Position|The starting position of this field in the view logical record. \(Display only.\)|
|Data Type|The data type of this field. Click to select a value from the drop down list.The types "**Binary Sortable**" and "**Packed Sortable**" are provided only to allow for negative values in the sort data. If the data is always positive or zero, then other data types can be used, and this results in faster performance for sorting.

|
|Date/Time Format|The format of dates or times in this field. Click to select a value from the drop down list. \(Optional.\) This field is disabled if the data type is "Edited Numeric" or "Masked Numeric".|
|Length|The length of this field. A positive integer with a maximum of five digits. The lengths must satisfy the following constraints according to the data types specified for the fields:-   **Zoned Decimal** must have minimum length of 1 and maximum length of 16 \(inclusive\).
-   **Alphanumeric / Masked Numeric / Edited Numeric** must have length between 1 and 256 \(inclusive\).
-   **BCD** must have minimum length of 1 and maximum length of 10.
-   **Packed / Packed Sortable** must have length between 1 and 16.
-   **Binary / Binary Sortable** must have length 1, 2, 4 or 8 only.

|
|Data Alignment|The alignment of the data in this field. \(Optional.\) This field is disabled if the "View Properties, General" tab specifies Output Format as a Flat File with Delimited Fields.|
|Visible|This field controls if this column is displayed in the final output of this view. \(Optional.\) This field is disabled if there is no format phase for this view.|
|Spaces before column|The number of spaces before this output field in a Hardcopy report \(Optional.\) A positive number up to a maximum of 5 digits. This field is disabled if the "View Properties, General" tab specifies Output Format that is something other than a Hardcopy Report.|
|Header Alignment|The alignment of the heading for this field. \(Optional.\) This field is disabled if the "View Properties, General" tab specifies Output Format as Flat File.|
|Decimal Places|The number of physical bytes to be occupied by decimal values in this field. \(Optional.\) This field is disabled if the data type is "Alphanumeric".|
|Scaling Factor|This field is used for rounding values. \(Optional.\) An integer from -9 to +9. This field is disabled if the data type is "Alphanumeric".|
|Signed|This field indicates whether the numeric data in this field is signed or not. \(Optional.\) This field is disabled and unchecked if Data Type = Alphanumeric OR Data Type = BCD. This field is disabled and checked if Data Type selected is 'Edited Numeric'.|
|Numeric Mask|The mask to be used on column output. \(Optional.\) Select a value from the drop down list. This field is disabled if the data type is something other than 'Masked Numeric'.|
|Format Phase Calculation|Cells that have a white or blue background in this row can have a format-phase calculation logic text applied. Grey cells mean this column cannot have logic text. Cells for this row are grey if there is no format phase, or if the data type is "Alphanumeric", or if the column is a sort key. To create / modify / delete logic text, do the following:

1.  At the intersection of the relevant "Column X" and the row **Format-Phase Calculation**, check there is a cell with a white or blue background. If present, double click on this cell.
2.  Click ![](images/Icon_Three_Dots_01.gif) to display the **Create New Format-Phase Calculation** screen or the **Edit Format-Phase Calculation** screen. Use either of those screens \(and the screen help topics\) to create / modify / delete Format-Phase Calculation logic text. for this column. To delete, simply highlight logic text and press the delete key.

|
|Record Aggregation Function|Drop down list containing a list of record aggregation function codes. \(Optional.\) This field gets disabled if there is no format phase, or if the data type of column is "Alphanumeric" or if the column is a sort key or if the "View Properties, Format Phase" tab selects "Do not aggregate records".|
|Group Aggregation Function|Drop down list containing a list of group aggregation function codes. This field gets disabled if there is no format phase, or if the data type of column is "Alphanumeric" or if the column is a sort key or if the "View Properties, Format Phase" tab selects "Do not aggregate records". If the Record Aggregation Function selected above is something other than "SUM" then the Group Aggregation Function field is set to the same value and cannot be changed. Only when the Record Aggregation Function is "SUM" does this field offer a drop down list. The value "SUM" is selected by default and can be changed. \(Optional.\)|
|View Sources|To create a view source, see "Add a **view source**" in the table under section **Action on the "View Editor" tab** above.

To delete a view source, see "**Delete a view source**" in the table under section **Action on the "View Editor" tab** above.

A plus + sign to the left of "View Sources" indicates that the rows giving the view source files are collapsed. Double click on the plus + sign to expand this row to show a row for each view source. Double click on the minus - sign to collapse all the view source rows into one row. The cells in this row "View Sources" are always display only.

**Pass the cursor over a light blue cell with text under "View Sources"** to change the cursor to a magnifying glass. Click on the magnifying glass to display the screen **View Source Properties**.|

## 99 Keyboard Shortcuts {#99 .section}

Go to topic "**What are the keyboard shortcuts?**" and read these sections:

-   "**10 Shortcuts: All workbench screens**" and
-   "**30 Shortcuts: New/Edit View screen \(View Editor tab\)**".

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

