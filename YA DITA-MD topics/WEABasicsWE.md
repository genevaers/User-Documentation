# Basics of using the SAFR Workbench {#WEABasicsWE .reference}

## 01 Summary of this topic {#01 .section}

This topic covers the following:

-   [02 What does the SAFR Workbench do?](WEABasicsWE.md#02)
-   [03 Structure of the screens in the Workbench](WEABasicsWE.md#03)
-   [04 How to do most work in the Workbench](WEABasicsWE.md#04)
-   [05 Toolbars](WEABasicsWE.md#05)
-   [06 Navigator](WEABasicsWE.md#06)
-   [07 Metadata List](WEABasicsWE.md#07)
-   [08 Editor Area](WEABasicsWE.md#08)
-   [09 Other screens](WEABasicsWE.md#09)
-   [10 Keyboard Shortcuts - complete list](WEABasicsWE.md#10)
-   [11 How do I find help inside the workbench?](WEABasicsWE.md#11)
-   [12 Menus](WEABasicsWE.md#12)
-   [13 Status Bar](WEABasicsWE.md#13)
-   [14 Resize screen borders](WEABasicsWE.md#14)
-   [15 Drag and drop options](WEABasicsWE.md#15)
-   [16 Minimizing and maximizing any screen](WEABasicsWE.md#16)
-   [17 Double click on a screen heading](WEABasicsWE.md#17)
-   [18 Right click on screen headings](WEABasicsWE.md#18)
-   [19 Exit the Workbench](WEABasicsWE.md#19)

## 02 What does the SAFR Workbench do? {#02 .section}

This is covered in topic "**Workbench overview**". A link is under **Related concepts** below.

## 03 Structure of the screens in the Workbench {#03 .section}

![](images/Workbench_Structure_01.GIF)

## 04 How to do most work in the Workbench {#04 .section}

See headings **Menus** and **Toolbars** below for a complete list of the tasks that can be performed in the workbench.

Most work is modifying some existing metadata item, as follows:

1.  Click on a **node in the Navigator.** The Metadata List displays a table of items.
2.  Double click on an **item in the Metadata List**. An edit screen opens in the Editor Area.
3.  Add or modify information in the **screen in the Editor Area**. In most cases work in the edit screen ends by clicking ![](images/Icon_Save_03.GIF) \(the save icon\). Other ways to save are to select **File -\> Save** or click Ctrl+S. There may be other ways work in the edit screen ends. When the work in the edit screen is complete, close that screen by clicking on X in the tab similar to:

    ![](images/Icon_Close_Env_02.gif)

4.  **If you do not save** before closing a screen \(or before closing the workbench\) a screen displays called **Save Changes?** Choose from **Yes** \(save\), **No** \(no save\) and **Cancel** \(do not close\).

**WARNING**: it is possible to launch two screens in the Editor Area that are changing the same metadata item. This is not recommended and may result in loss of changes from one of the screens.

## 05 Toolbars {#05 .section}

![](images/Workbench_Toolbar_03.GIF)

Both system administrators and environment administrators see "Toolbar \(Administrators\)" above.

|Button|Notes|
|------|-----|
|New \(Ctrl + N\)|If you clicked this item in the **Administration** or **Components** menu, a further sub-menu appears with all the metadata item types. A grey item means you do not have rights to create that type of item. Click a non-grey item type to launch a create of a new item. If you clicked **Ctrl + N**, then you are attempting to create an item where the type is the currently highlighted node in the Navigator. If the Navigator has a view folder highlighted, then Ctrl + N creates a new view. If the Navigator is not visible, then this combination of keys has no effect.

|
|Save \(Ctrl + S\)|Saves the active edit screen. Saves all tabs of that screen.|
|Save As \(Ctrl + Shift + S\)|Copies a metadata item in the active editor screen and saves with a new name. For more details, see task "**Copying metadata**". A link to that topic is under **Related tasks** below.|
|Show all or Show with edit rights|Changes the display of lists of metadata for general users. Click this button again to switch choices between "**Show all**" and "**Show with edit rights**". For more details of this, see topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.|
|Search \(F3\)|This menu item allows searching of a list of metadata items. You must have first clicked in a list of metadata that can be searched. The Metadata List can be searched, as can many lists of metadata in Editor screens. For more details, see task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.|
|Help|Opens the workbench help system as a full screen.|

## 06 Navigator {#06 .section}

If the Navigator is not visible, click **Window -\> Show -\> Navigator**.

The Navigator lists the types of metadata as nodes in a tree structure. The **Administration** node is only displayed for a system administrator. The nodes "**View Folder**" and "**Administration**" have a plus + sign. Click on the plus + sign to expand the node and show items underneath. Click on any node or an expanded item to display the Metadata List for that node or item.

![](images/Workbench_Navig_Icons_01.GIF)

|Button|Notes|
|------|-----|
|Refresh Navigator \(F4\)|The Refresh Navigator icon ![](images/Icon_NavigV_Refresh_Active_01.gif) is used to ensure the View Folder list in the Navigator contains current data. If this icon is grey, dick on the "**View Folders**" node in the Navigator to activate this icon. When active, click on this icon or press F4 to refresh the Navigator with current view folder data. Alternatively, double click on "**View Folders**" to refresh the Navigator in one action.

|
|Minimize|The Navigator is replaced by a restore icon ![](images/Icon_Restore_01.gif) that is relocated to the right, bottom or left border of the workbench. Click on the restore icon to make the Navigator visible as before.|
|Maximize|Make the Navigator as large as possible. Click on the restore icon ![](images/Icon_Restore_01.gif) to make the Navigator visible as before.|

## 07 Metadata List {#07 .section}

If the Metadata List is not visible, click on an item in the Navigator. Alternatively, click **Window -\> Show -\> Metadata List**.

The Metadata List displays a list of all examples of the node or item that was clicked in the Navigator. Double click on any line in the list to display an edit screen in the Editor Area.

![](images/Workbench_MList_Icons_01.GIF)

|Button|Notes|
|------|-----|
|Refresh \(F6\)|Refresh the Metadata List with current data.|
|Delete \(Delete key\)|Delete the currently selected item in the Metadata List. For more details, see task "**Deleting metadata**". A link to that topic is under **Related tasks** below.|
|Reports|An item must be selected in the Metadata List first. Click the down arrow to see a list of the possible reports for the item. If there is no selected item, or that item has no possible reports, then this icon has no effect. For more details, see task "**Generating reports on metadata**". A link to that topic is under **Related tasks** below.|
|Minimize|The Metadata List is replaced by a restore icon ![](images/Icon_Restore_01.gif) that is relocated to the right, bottom or left border of the workbench. Click on the restore icon to make the Metadata List visible as before.|
|Maximize|Make the Metadata List as large as possible. Click on the restore icon ![](images/Icon_Restore_01.gif) to make the Metadata List visible as before.|

One of the most important parts of the Metadata List is the column "**Rights**". These refer to edit rights to a particular item of metadata. For example, if you click on "**View Folders**" in the **Navigator**, the Metadata List may appear as follows:

![](images/ER_WB_Mlist_03.GIF)

For more on edit rights and security, see topic "**WE Security overview**". A link is under **Related concepts** below.

## 08 Editor Area {#08 .section}

To modify an existing item, double click on an item in the Metadata List to display an edit screen.

To create a new item, click the **arrow beside**![](images/Icon_New_08.GIF) \(the new icon on the Toolbar\).

Alternatively, to create a new item a system administrator or environment administrator can click **Administration -\> New** and select an item. System administrators can create all item types. Environment administrators \(in the appropriate environment\) can create all types of metadata except environments, users and groups.

Alternatively, to create a new item a general user can click **Components -\> New** and select an item. General users have limited rights in creating items, based on the group selected during login.

## 09 Other screens {#09 .section}

There are many more screens than mentioned above. Open some of these screens by clicking **Window -\> Show** and choosing a screen type. Some screens can only be reached by clicking on specific buttons on specific screens in the appropriate situations.

## 10 Keyboard Shortcuts - complete list {#10 .section}

See topic "**What are the keyboard shortcuts?**" A link to this topic is under **Related reference** below.

## 11 How do I find help inside the workbench? {#11 .section}

See topic "**Finding screen help**". A link to this topic is under **Related tasks** below.

## 12 Menus {#12 .section}

Below is a table of menus available in the SAFR Workbench.

The **Administration** and **Components** menus are the same menu. System administrators and environment administrators see menu "**Administration**". General users see menu "**Components**".

**System administrators** always have rights to all Administration menu items.

**Environment administrators** are missing some rights, so some items are grey on the Administration menu.

**General users** only have rights to the **Components** menu as given by the group selected during login. If a menu item is grey then the login group does not provide rights to that item.

Items on the **Reports** menu are **grey** until an appropriate metadata example is highlighted in the Metadata List or a particular metadata item has an active edit screen. All users of the workbench can potentially access all items on the Reports menu, unless a general user does not have read edit rights to a particular metadata item.

|Menu|Option|Notes|
|----|------|-----|
|File|Return to login... \(Ctrl-L\)|Return to the SAFR Login screen to login a different way than currently. For more details, see task "**Return to login**". A link to that topic is under **Related tasks** below.|
| |Search \(F3\)|This menu item allows searching of a list of metadata items. You must have first clicked in a list of metadata that can be searched. The Metadata List can be searched, as can many lists of metadata in Editor screens. For more details, see task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.|
| |Open View \(Ctrl+O\)|The **Open View** screen appears. Type a view id number and press OK to open that view.|
| |Save \(Ctrl+S\)|Saves the active edit screen. Saves all tabs of that screen.|
| |Save As \(Ctrl + Shift + S\)|Copies a metadata item in the active editor screen and saves with a new name. For more details, see task "**Copying metadata**". A link to that topic is under **Related tasks** below.|
| |Recent Views|Displays a list of the last five recently opened views. Click on an item to open that view.|
| |Open Log File|Select a log file from a list. The selected file displays in Notepad. For more details, see topic "**WE log file overview**". A link to that topic is under **Related concepts** below.|
| |Change Log Path|The **Browse For Folder** screen appears. For more details, see topic "**Change Log path screen help**". A link to that topic is under **Related reference** below.|
| |Update User Profile.|Opens a screen to allow the user to edit their own user record. For more details, see task "**Modifying own user account**". A link to that topic is under **Related tasks** below.|
| |Exit|Exits the entire workbench.|
|Edit| |This menu appears on some screens. See the relevant screen help topic for details.|
|Action| |This menu appears on some screens. See the relevant screen help topic for details.|
|Reports|Environment Security Report|A further sub-menu appears that allows a choice of "**by Id**" and "**by Name**". This selects the order of the groups listed in this report.|
| |Logical Record Report|Creates a Logical Record Report. For more details, see topic "**How do I generate a Logical Record Report?**" A link to that topic is under **Related reference** below.|
| |Lookup Path Report|Creates a Lookup Path Report. For more details, see topic "**How do I generate a Lookup Path Report?**" A link to that topic is under **Related reference** below.|
| |View Properties Report|Creates a View Properties Report. For more details, see topic "**How do I generate a View Properties Report?**" A link to that topic is under **Related reference** below.|
| |View Column Report|Creates a View Column Report. For more details, see topic "**How do I generate a View Column Report?**" A link to that topic is under **Related reference** below.|
| |View Column PIC Report|Creates a View Column PIC Report. For more details, see topic "**How do I generate a View Column PIC Report?**" A link to that topic is under **Related reference** below.|
| |Dependency Checker|Opens the Dependency Checker screen that allows checking all dependencies for a particular metadata item. For more details, see topic "**How do I generate a Dependency Checker Report?**" A link to that topic is under **Related reference** below.|
|Administration or Components|New \(Ctrl + N\)|If you clicked this item in the **Administration** or **Components** menu, a further sub-menu appears with all the metadata item types. A grey item means you do not have rights to create the type of item. Click a non-grey item type to launch a create of a new item. If you clicked **Ctrl + N**, then you are attempting to create an item where the type is the currently highlighted node in the Navigator. If the Navigator has a view folder highlighted, then Ctrl + N creates a new view. If you clicked Ctrl + N and the Navigator is not visible, then this combination of keys has no effect.

|
| |Group Security|A further sub-menu appears:-   **Membership...**- to update group members.

For more details, see task "**Modifying group membership**". A link to that topic is under **Related tasks** below.

-   **Permissions** - a further sub-menu appears:
    -   **Permissions, By Group...** - to update group access rights by selecting a group first.

For more details, see task "**Modifying group permissions by group**". A link to that topic is under **Related tasks** below.

    -   **Permissions, By Environment...** - to update group access rights by selecting an environment first.

For more details, see task "**Modifying group permissions by environment**". A link to that topic is under **Related tasks** below.


System administrators can perform all the tasks above. Environment administrators can perform only **Permissions, By Environment...**

|
| |Batch Activate|A further sub-menu appears:-   **Lookup Paths** - to activate multiple lookup paths.

For more details, see task "**Batch activate lookup paths**". A link to that topic is under **Related tasks** below.

-   **Views** - to activate multiple views.

For more details, see task "**Batch activate views**". A link to that topic is under **Related tasks** below.


|
| |Migrate...|Opens a screen to migrate a metadata item from one environment to another in the same SAFR Database. For more details, see topic "**Migrate metadata overview**". A link to that topic is under **Related concepts** below.|
| |Export|Opens a screen to export a metadata item to an XML file. For more details, see topic "**Export Metadata overview**". A link to that topic is under **Related concepts** below.|
| |Import...|Opens a screen to import a metadata item from an XML file into the workbench. For more details, see topic "**Import Metadata overview**". A link to that topic is under **Related concepts** below.|
| |Find/Replace Text in View Logic|Opens a screen to perform find and replace changes on logic text stored in one or more views. For more details, see task "**Finding and replacing logic text**". A link is under **Related tasks** below.|
| |Empty Deleted Views Folder|Delete all views stored in View Folder "**Deleted Views**". For more details, see task "**Empty "Deleted Views" folder**". A link to that topic is under **Related tasks** below.|
| |Clear Environment|Delete all metadata in an environment.. For more details, see task "**Clear environment**". A link to that topic is under **Related tasks** below.|
|Window|Show|A list of screens appears that can be opened:-   Navigator,
-   Metadata List,
-   Column Source Properties,
-   Sort Key Properties,
-   View Source Properties,
-   Sort Key Titles,
-   View Activation Errors,
-   Logic Text Helper.

|
|Help|Help Content|Opens the workbench help system as a full screen.|
| |About SAFR Workbench...|Displays the version and other details of the workbench software.|

## 13 Status Bar {#13 .section}

Normally, the status bar appears with data similar to:

![](images/Workbench_Status_Bar_05_Admin.gif)

Inside **logic text** this gives extra information at left regarding the position of the cursor in the logic text screen:

![](images/Workbench_Status_Bar_06_LT_Pos.gif)

If you selected "**Use Old Compiler**" during login, this is displayed at right:

![](images/Workbench_Status_Bar_07_OldCompiler.gif)

## 14 Resize screen borders {#14 .section}

![](images/Workbench_Resize_Borders_01.GIF)

## 15 Drag and drop options {#15 .section}

Drag the heading of a screen around and a black rectangle shows the new position for the screen. When you release the left button, the screen moves to the new position.

![](images/Workbench_Drag_01.GIF)

When you exit the workbench these positions are saved for your next session.

## 16 Minimizing and maximizing any screen {#16 .section}

To minimize any screen in the workbench click ![](images/Icon_Minimise_02.GIF). The screen is replaced by a restore icon ![](images/Icon_Restore_01.gif) that is relocated to the right, bottom or left border of the workbench. Click on the restore icon to make the screen visible as before.

Click on ![](images/Icon_Maximize_01.GIF) to make the screen as large as possible. Click on the restore icon ![](images/Icon_Restore_01.gif) to make the screen visible as before.

## 17 Double click on a screen heading {#17 .section}

This **maximizes** that screen. Another double click restores the screen to the original position.

## 18 Right click on screen headings {#18 .section}

Right click on a screen heading to see these options \(some may be disabled in certain situations\):

-   **Detached** - allows a screen to float above the other screens. After clicking this item, drag the screen to the required position. Later, right clicking the screen heading shows a tick beside Detached. Click on the tick to remove the detached state. You may need to drag the screen to return to the original position.
-   **Restore** - to reverse a minimization or maximization
-   **Move** - to move either the View, Editor or a group of tabs in a similar way to that shown under heading **Drag and Drop options** above.
-   **Size** - to resize borders of that screen. Left, right, top and bottom borders are listed, although some may be grey \(disabled\) in certain situations.
-   **Minimize** - to reduce the screen to a restore icon ![](images/Icon_Restore_01.gif) that is relocated to the right, bottom or left border of the workbench.
-   **Maximize** - to make the screen as large as possible.
-   **Close** - to close this screen.
-   **Close Others** - to close the other tabs that are grouped with the current screen.
-   **Close All**- to close this screen and all screens that have tabs grouped with this screen.

## 19 Exit the Workbench {#19 .section}

Click **File -\> Exit** or click ![](images/Icon_Close_Workbench_01.gif) in the top right hand corner.

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

