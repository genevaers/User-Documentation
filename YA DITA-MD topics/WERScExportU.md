# Export Utility screen help {#WERScExportU .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScExportU.md#02)
-   [05 Errors](WERScExportU.md#05)
-   [10 Action on this screen](WERScExportU.md#10)
-   [20 Searching in "Components"](WERScExportU.md#20)
-   [50 Fields - Components to Export section](WERScExportU.md#50)
-   [60 Fields - Errors section](WERScExportU.md#60)
-   [99 Keyboard Shortcuts](WERScExportU.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Export_Utility_01.gif)

It is essential that you read topic "**Export metadata overview**" before you perform an export. A link to that overview is under **Related concepts** below.

Use this screen to export metadata components from the SAFR Workbench into XML files. This screen outputs a separate XML file for each component exported. These XML files are potentially a backup that can be imported back into SAFR at another time.

System and environment administrators can always use this screen. General users can use this screen if the **group selected during login** has **Read** rights to the particular components in that environment that are exported. See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Export Utility errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Do the following:

1.  Select an **Environment** from the drop down box. System administrators can choose from all environments. Environment administrators can only choose the environment selected during login. General users can choose from the environments that the **group selected during login** has access to.
2.  Select a **Component Type** from the drop down box.
3.  Wait a moment. The table of **Component\(s\)** is populated. System and environment administrators can see all the components of the selected type in that environment. For general users, the only components listed are where the group has read or modify or delete rights.
4.  For component types of **Logical Record, Lookup Path and View**, further refine the list of components by **any choice of buttons** at the left of the list for **Active, Inactive or Both**.
5.  **Sort** the list of "**Component\(s\)**" by clicking on any of the column headings. **Reverse the sort order** by clicking again on that heading. In particular, if the Component Type is "View" then the columns include "**View Folder Id**" and "**View Folder Name**". Sorting by these columns allows the views in a view folder to be listed together.
6.  Select components to export using some combination of the following options:
    -   **Search the list** if the list is long - see section below.
    -   **Tick \(or untick\)** individual components in the Select column.

        To select a large number of components in sequence, select the first component and then**hold the Shift key down and select the last component**. All other components will be deselected when this occurs, so this should be the first action for a complex group of selections.

    -   Click **Select All** or **Deselect All**as required.
7.  At any time during these steps, click the **Refresh** button to reload the data shown in the**Component\(s\)** table. The data can change during your time on the Export Utility screen, and the **Refresh** button ensures the data displayed is current once more.
8.  If required, modify the **Location** field. If you type a new folder name that does not exist, this is created when you perform the next step. Alternatively, click **Browse** to select an existing folder. When you perform the next step, the folder you specify in **Location** is automatically given a sub-folder named for the Component Type. That sub-folder is where the XML file is stored.
9.  Click **Export**. If this button is grey, ensure at least one component above is selected.
10. A value in the **Result** column of "**Pass**" indicates that the folder for **Location** now has a sub-folder for the **Component Type** and an XML file exported for that item. Each XML file in that sub-folder is named **componentName\[id\[.xml**.

    The **Result column** shows if any errors affected the export of the XML file for each component. The errors may be caused by the general user not having read rights to a component. Errors may also be caused by a system input/output error. **Click on the row for a component** to see any error messages in the **Errors section** on the right.

    For errors or messages on this screen, see topic "**Export Utility errors**". For a link, see under **Related reference** below.

11. Use Windows Explorer to go to the **folder given in the Location field.** This folder has sub-folders for each component type. Each XML file has name **componentName\[id\[.xml** in that sub-folder.

## 20 Searching in "Components" {#20 .section}

If there is a long list of components, then the list can be searched as follows:

1.  Click inside the list for "**Components**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the component name.
5.  Click OK to start the search.

If the component is found, then you are returned to the list with that component highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 50 Fields - Components to Export section {#50 .section}

|Field|Definition|
|-----|----------|
|Environment|Drop down box of environments available to the user.|
|Component Type|List of components types that this utility can export.|
|Select|Tick so that an XML file is created for this component. Tick again to remove the tick so that no XML file is created.|
|Result|The result after you click Export. Result **Pass** means the export of that component to an XML file is complete. Result **Error** means a system input/output error or other error affected the export of this item. Result **Security Error** means that the user does not have read rights to the selected component. **Click on the component row** to see details of error in the **Errors section**.|
|Status|The active or inactive status of that component. This column on appears for component types Logical Record, Lookup Path and View. \(Display only.\)|
|ID|This is the position of that particular component in the list of components of that type for the environment. \(Display only.\)|
|Name|The name of that particular component. \(Display only.\)|
|VF Id|ID number of the View Folder containing the View. This field only displays when the Component Type selected is "View". \(Display only\).|
|View Folder Name|Name of the View Folder containing the View. This field only displays when the Component Type selected is "View". \(Display only\).|
|Location|The folder that is the starting point for storing the XML files exported. After export, **this folder has a sub-folder for each type of component exported**. The sub-folder contains all XML files of the component type exported. Overtype the default folder name, if required. If you type a folder name that does not exist, the folder is created when you click Export. Alternatively, click **Browse** to select an existing folder.|

## 60 Fields - Errors section {#60 .section}

|Field|Definition|
|-----|----------|
|Error messages|The reason this metadata item did not export. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

