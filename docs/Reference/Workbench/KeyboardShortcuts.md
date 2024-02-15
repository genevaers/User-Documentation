# Workbench keyboard shortcuts 

## All screens

{% include_relative includes/KeyboardShortcutsAllWBScreens.md %}  

## Navigator

|Shortcut|Notes|
|--------|-----|
|F4|**Refresh Navigator.** This key works only after clicking "**View Folders**" in the Navigator. If any other node is highlighted in the Navigator, F4 has no effect.|

## New/Edit Logical Record screen \(LR Fields tab\) 

Remember to also see heading [Shortcuts - All workbench screens](#all-screens)
When you first display the LR Fields tab for a logical record, you must enable the grid of cells before you can start to work on this screen. Enable the grid as follows:

- EITHER **click in any cell** in the grid,
- OR **press Arrow down, Arrow left or Arrow right**.

The rows with red text are sort keys.

Once the grid is enabled, the cells are always in one of two modes:

- EITHER in **Display mode** - the cell value is read only,
- OR in **Edit mode** - the cell value can be changed.

To **start Edit mode** in a cell, do one of the following:

- EITHER **left click** on the cell,
- OR press **Tab** enough times to reach the cell,
- OR **arrow** to the cell and press **Spacebar**.

To **end Edit mode** and return to Display mode in a cell, do one of the following:

- EITHER press **Enter** to accept all changes,
- OR press **Tab** to exit the cell and also accept all changes,
- OR press **Escape** to cancel all changes made to the cell.

The table of shortcuts for this screen is below:

|Shortcut|Notes|
|--------|-----|
|Alt + Down|Move field down.|
| | |
|Alt + Insert|Add a blank row at the bottom.|
| | |
|Alt + Up|Move field up.|
| | |
|Arrow down|The behavior of Arrow down is as follows:<br> - For a cell in Display mode, Arrow down jumps to the next cell below. In the lowest cell in the column, Arrow down has no effect.<br> - For a cell with a list of values in Edit mode, Arrow down **highlights the next lower value**. If the lowest value in the list is highlighted, then Arrow down has no effect.<br> - For a cell of any other type in Edit mode, Arrow down has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Arrow left|The behavior of Arrow left is as follows:<br> - For a cell in Display mode, Arrow left jumps to the cell in the column immediately to the left. For a cell in the Field Id column, Arrow left has no effect.<br> - For a cell with a list of values in Edit mode, Arrow left **highlights the next higher value**. If the highest value in the list is highlighted, then Arrow left has no effect.<br> - For a cell of any other type in Edit mode, Arrow left has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Arrow right|The behavior of Arrow right is as follows:<br> - For a cell in Display mode, Arrow right jumps to the cell in the same row immediately to the right. For a cell in the Comments column, Arrow right has no effect.<br> - For a cell with a list of values in Edit mode, Arrow right **highlights the next lower value**. If the lowest value in the list is highlighted, then Arrow right has no effect.<br> -  For a cell of any other type in Edit mode, Arrow right has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Arrow up|The behavior of Arrow up is as follows:<br> -  For a cell in Display mode, Arrow up jumps to the next cell above. For a cell in the first row, then Arrow up has no effect.<br> -  For a cell with a list of values in Edit mode, Arrow up **highlights the next higher value**. If the highest value in the list is highlighted, then Arrow up has no effect.<br> -  For a cell of any other type in Edit mode, Arrow up has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Ctrl + C|**Copy the selected field.** This copies the current field, in preparation for a paste \(see Paste Above or Paste Below see lower in this table\).|
| | |
|Ctrl + F|**Find Field...** Displays a window **Find Field**. Type a field name and press OK. If found, the field is highlighted. If not found, a message appears.|
| | |
|Ctrl + V|**Paste Above**. Pastes a field above the currently highlighted row. You must have copied a column first \(using Ctrl+C\).|
| | |
|Ctrl + Shift + V|**Paste Below**. Pastes a field below the currently highlighted row. You must have copied a column first \(using Ctrl+C\).|
| | |
|Delete|**Delete** the currently highlighted field. This performs the same function as clicking ![](../../images/LR_Delete_field_03.GIF)|
| | |
|End|Go to the rightmost cell in the current row.|
| | |
|Enter|The behavior of Enter is as follows:<br> - For a cell in Display mode, Enter has no effect.<br> - For a cell in Edit mode, Enter **accepts the current value in that cell** and places that cell in **Display** mode.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Escape|For a cell in Display mode, Escape has no effect.<br>For a cell in Edit mode, Escape **cancels all changes** made to that cell and places that cell in **Display** mode.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Home|Go to the leftmost cell in the current row.|
| | |
|Insert|Insert a new row above the current row. This performs the same function as clicking ![](../../images/LR_Insert_field_04.GIF) \(insert field\).|
| | |
|Page-down|Go to the bottom cell in this column.|
| | |
|Page-up|Go to the top cell in this column.|
| | |
|Shift + Tab|Jumps in the reverse direction given for "Tab" lower in this table.|
| | |
|Spacebar|For a cell in Display mode, Spacebar places the cell in **Edit** mode.<br>For a cell in Edit mode, the behaviour of Spacebar is as follows:<br> -  In a text field, Spacebar results in a **space character \( \)**.<br> -  In a checkbox field, Spacebar **toggles between a tick and no tick**. Note that some cells have a checkbox that cannot be edited, such as the Signed field for a row that is type Alphanumeric.<br> -  In other fields such as numeric fields or a list of values, Spacebar has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Tab|Once the grid is enabled, the behavior of the Tab key is as follows:<br> -  In a cell in Edit mode, the Tab key **accepts the current value of that cell, places that cell in Display mode and jumps to the next cell to the right in that row and places that cell in Edit mode**. In the Comments column, the Tab key jumps to the first cell in the row underneath. In the Comments column for the last row, the Tab key creates a new row underneath.<br> -  In a cell in Display mode, the Tab key **jumps to the next cell to the right in that row and places that cell in Edit mode**. In the Comments column, the Tab key jumps to the first cell in the row underneath. In the Comments column for the last row, the Tab key creates a new row underneath.<br>For a discussion of enabling the grid, Display mode and Edit mode, see the text above this table.|

## New/Edit View screen \(View Editor tab\) 
 
Remember to also see heading [Shortcuts - All workbench screens](#all-screens)

When you first display the View Editor tab for a view, you must enable the grid of cells before you can start to work on this screen. Enable the grid as follows:
 - EITHER**click in any cell** in the grid,
 - OR **press Arrow down, Arrow left or Arrow right**.
Once the grid is enabled, you can work on cells in the grid.
The grey cells are non-editable.
The yellow cells are a sort key described on the Sort Key Properties screen. To work on these cells, arrow to the yellow cell and press Spacebar.
The green cells are described in the Column Source Properties screen. To work on these cells, arrow to the green cell and press Spacebar.
The **white** cells are always in one of two modes:
 - EITHER in **Display mode** the cell value is read only,
 - OR in **Edit mode** the cell value can be changed.
 To **start Edit mode** in a white cell, do one of the following:
  - EITHER **left click** on the cell,\
  - OR press **Tab** enough times to reach the cell,
  - OR **arrow** to the cell and press **Spacebar**.
 To **end Edit mode** and return to Display mode in a white cell, do one of the following:
  - EITHER press **Enter** to accept all changes,
  - OR press **Tab** to exit the cell and also accept all changes,
  - OR press **Escape** to cancel all changes made to the cell.
 The table of shortcuts for this screen is below:


|Shortcut|Notes|
|--------|-----|
|Alt + Left arrow|Move column left.|
| | |
|Alt + Right arrow|Move column right.|
| | |
|Arrow down|The behavior of Arrow down is as follows:<br> -  For a cell in Display mode, Arrow down jumps to the next cell below. This happens even if the next cell is grey, yellow, green or white. In the lowest cell in the column, Arrow down has no effect.<br> -  For a cell with a list of values in Edit mode, Arrow down **highlights the next lower value**. If the lowest value in the list is highlighted, then Arrow down has no effect.<br> -  For a cell of any other type in Edit mode, Arrow down has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Arrow left|The behavior of Arrow left is as follows:<br> -  For a cell in Display mode, Arrow left jumps to the cell in the column immediately to the left. This happens even if the target cell is grey, yellow, green or white. For a cell in Column 1, Arrow left has no effect.<br> -  For a cell with a list of values in Edit mode, Arrow left **highlights the next higher value**. If the highest value in the list is highlighted, then Arrow left has no effect.<br> - For a cell of any other type in Edit mode, Arrow left has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Arrow right|The behavior of Arrow right is as follows:<br> -  For a cell in Display mode, Arrow right jumps to the cell in the column immediately to the right. This happens even if the target cell is grey, yellow, green or white. For a cell in the rightmost column, Arrow right has no effect.<br> -  For a cell with a list of values in Edit mode, Arrow right **highlights the next lower value**. If the lowest value in the list is highlighted, then Arrow right has no effect.<br> -  For a cell of any other type in Edit mode, Arrow right has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Arrow up|The behavior of Arrow up is as follows:<br> - For a cell in Display mode, Arrow up jumps to the next cell above. This happens even if the target cell is grey, yellow, green or white. If the cell above has "Column 1" or a similar title, then Arrow up has no effect.<br> -  For a cell with a list of values in Edit mode, Arrow up **highlights the next higher value**. If the highest value in the list is highlighted, then Arrow up has no effect.<br> -  For a cell of any other type in Edit mode, Arrow up has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Ctrl + C|**Copy the highlighted column.** Highlighting just one cell in a column is enough to identify the column for this copy.|
| | |
|Ctrl + K|**Make sort key** or **Make non sort key**. Highlighting just one cell in a column is enough to identify the column for this action. Will make the highlighted column part of the sort key, or remove that column from the sort key.|
| | |
|Ctrl + V|**Paste a column left**of the highlighted column. Highlighting just one cell in a column is enough to identify the column for this action. You must have copied a column first \(using Ctrl-C\).|
| | |
|Ctrl + Shift + V|**Paste a column right**of the highlighted column. Highlighting just one cell in a column is enough to identify the column for this action. You must have copied a column first \(using Ctrl-C\).|
| | |
|Delete|If a **grey cell** is highlighted then delete the **entire column**. If any other cell is highlighted then delete the **contents of that cell**.|
| | |
|End|Go to the cell to the right as far as possible in this grid.|
| | |
|Enter|The behavior of Enter is as follows:<br> -  For a cell in Display mode, Enter has no effect.<br> -  For a cell in Edit mode, Enter **accepts the current value in that cell** and places that cell in **Display** mode.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Escape|For a white cell in Display mode, Escape has no effect.<br>For a white cell in Edit mode, Escape **cancels all changes** made to that cell and places that cell in **Display** mode.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|F5|**Activate / Deactivate** the view. If the view heading has **\[Inactive\]** this attempts to activate the view. If the view heading has **\[Active\]** this makes the view inactive.|
| | |
|F9|**Show Grid / Properties.** This switches between the two large tabs for a view: the "View Editor" tab and the "View Properties" tab. The "View Editor" tab contains the view columns and can be called the "grid".|
| | |
|Home|Go to the cell to the left as far as possible in this grid.|
| | |
|Insert|Insert a new column to the left of the currently selected column. Highlighting just one cell in a column is enough to identify the column for this action.|
| | |
|Page-down|Go to the bottom cell in this column.|
| | |
|Page-up|Go to the top cell in this column.|
| | |
|Shift + Tab|Jumps in the reverse direction given for "Tab" lower in this table.|
| | |
|Spacebar|For a white cell in Display mode, Spacebar places the cell in **Edit** mode.<br>For a white cell in Edit mode, the behaviour of Spacebar is as follows:<br> -  In a text field, Spacebar results in a **space character \( \)**.<br> -  In a checkbox field, Spacebar **toggles between a tick and no tick**.<br> -  In other fields such as numeric fields or a list of values, Spacebar has no effect.<br>For a discussion of Display mode and Edit mode, see the text above this table.|
| | |
|Tab|Once the grid is enabled, the behavior of the Tab key is as follows:<br> -  In a cell in Edit mode, the Tab key **accepts the current value of that cell, places that cell in Display mode and jumps to the next editable cell downwards in that column**. If there are no more editable cells in that column the Tab Key jumps to the first editable cell in the next column to the right. If there are no more columns then the cursor does not change position.<br> -  In a cell in Display mode or in a grey \(non-editable\) cell, the Tab key **jumps to the next editable cell downwards in that column**. If there are no more editable cells in that column the Tab Key jumps to the first editable cell in the next column to the right. If there are no more columns then the cursor does not change position.<br>For a discussion of enabling the grid, Display mode and Edit mode, see the text above this table.|

## New/Edit View screen \(View Properties tab\)

Remember to also see heading [Shortcuts - All workbench screens](#all-screens)

The "**View Properties**" tab has sub-tabs:

-  **General sub-tab**
-  **Extract Phase sub-tab**
-  **Format Phase sub-tab**
-  **Header/ Footer sub-tab**

The shortcuts in this section apply to all sub-tabs of the View Properties tab.

|Shortcut|Notes|
|--------|-----|
|Ctrl + C|**Copy the highlighted text.** This prepares for a paste \(see the next shortcut below\).|
| | |
|Ctrl + V|**Paste text left** of the cursor position. You must have copied text first \(using Ctrl-C\).|
| | |
|F5|**Activate / Deactivate** the view. If the view heading has **\[Inactive\]** this attempts to activate the view. If the view heading has **\[Active\]** this makes the view inactive.|
| | |
|F9|**Show Grid / Properties.** This switches between the two large tabs for a view: the "View Editor" tab and the "View Properties" tab. The "View Editor" tab contains the view columns and can be called the "grid".|

## Logic Text screens 

Remember to also see heading [Shortcuts - All workbench screens](#all-screens)

This applies to screens such as:

-  Create New Extract Record Filter
-  Create New Extract Column Assignment
-  Create New Format-Phase Column Calculation
-  Create New Format-Phase Record Filter
-  Edit Extract Record Filter
-  Edit Extract Column Assignment
-  Edit Format-Phase Column Calculation
-  Edit Format-Phase Record Filter

|Shortcut|Notes|
|--------|-----|
|Ctrl + A|**Select all logic text.** This highlights all the logic text.|
| | |
|Ctrl + Shift + A|**Deselect all logic text.** No logic text is highlighted.|
| | |
|Ctrl + C|**Copy the selected logic text.** This copies any currently highlighted logic text, in preparation for a paste \(see Ctrl + V below\).|
| | |
|Ctrl + V|**Paste the copied logic text**. Overwrites any currently highlighted logic text, or pastes to the current cursor location. You must have copied some logic text first \(using Ctrl+C\).|
| | |
|Ctrl + Y|**Retype** the last character deleted by Ctrl-Z. Can be used for up to 25 characters.|
| | |
|Ctrl + Z|**Delete the last character typed.** Can be used for up to 25 characters.|
| | |
|F7|**Check Logic Text.** The same action as clicking the icon ![](../../images/Icon_ValidLT_02.gif).|

## Edit User screen 

Remember to also see heading [Shortcuts - All workbench screens](#all-screens)

|Shortcut|Notes|
|--------|-----|
|Alt+F6|**Refresh defaults.** Restores the defaults that apply to a new user and removes any configured defaults. The same action as clicking the icon ![](../../images/Icon_Refresh_03.GIF).|
