# Exporting metadata {#WETAExMetadata .task}

It is essential that you read topic "**Export metadata overview**". A link to that overview is under **Related concepts** below.

Only certain types of metadata can be exported. The types are:

-   Logical file,
-   Logical record,
-   Lookup path,
-   Physical file,
-   View.

Ensure you know the following:

-   The **environment** that owns the metadata to be exported.
-   The **item\(s\)** to be exported. This includes choices such as **active or inactive examples** of logical records, lookup paths and views.
-   A **folder** where the exported XML files are stored in sub-folders for each type.

Use this topic to export metadata components from WE into XML files. These XML files are potentially a backup that can be imported back into WE at another time. This screen outputs a separate XML file for each component exported.

System and environment administrators can always perform this task.

General users can perform this task if the **group selected during login** has at least **Read** rights for the components to be exported and for any related components in that environment. In particular, to export views a general user must have read rights to the view folders where any views are stored. See your system administrator if you require more rights.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

1.  Ensure you are logged into the relevant environment with **appropriate rights**. For details of rights, see heading '**About this task**" above.

2.  Under **Administration** or **Components**, click **Export...**

3.  Select an **Environment** from the drop down box. System administrators can choose from all environments. Environment administrators can only choose an environment where the group chosen during login provides environment administrator access. General users can choose from the environments that the **group selected during login** has access to.

4.  Select a **Component Type** from the drop down box.

5.  Wait for the table of **Component\(s\)** to be populated. System and environment administrators can see all the components of the selected type in that environment. For general users, the only components listed are those components where the group has read or modify or delete rights.

6.  For component types of **Logical Record, Lookup Path and View**, further refine the list of components by **any choice of buttons** at the left of the list for **Active, Inactive or Both**. The buttons for Active, Inactive and Both do not appear for other values of Component Type.

7.  **Sort** the list of "**Component\(s\)**" by clicking on any of the column headings. **Reverse the sort order** by clicking again on that heading. In particular, if the Component Type is "View" then the columns include "**View Folder Id**" and "**View Folder Name**". Sorting by these columns allows the views in a view folder to be listed together.

8.  Select components to export by any of the following methods:

    1.  **Tick \(or untick\)** individual components in the Select column.

    2.  **Search the list,** if the list is long. This is done by clicking in the components list and pressing F3. For more about this searching, see task "**Searching lists of metadata**". Once a component is found, **tick \(or untick\)** the component\(s\) in the Select column.

    3.  Click **Select All** or **Deselect All**as required.

9.  If required, modify the **Location** field. If you type a new folder name that does not exist, this is created when you perform the next step. Alternatively, click **Browse** to select an existing folder. When you perform the next step, the folder you specify in **Location** is automatically given a sub-folder named for the Component Type. That sub-folder is where the XML file is stored.

10. Click **Export**. If this button is grey, ensure at least one component above is selected.

    If you require more help on this screen, see the screen help topic. For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Export Utility screen help**" . To close the help, click X inside the "**Help**" tab.

11. A value in the **Result** column of "**Pass**" indicates that the folder for **Location** now has a sub-folder for the **Component Type** and an XML file exported for that item. Each XML file in that sub-folder is named **componentName\[id\[.xml**.

    The **Result column** shows if any errors affected the export of the XML file for each component. The errors may be caused by the general user not having read rights to a component. Errors may also be caused by a system input/output error. **Click on the row for a component** to see any error messages in the **Errors section** on the right.

    See the errors topic for more details on errors. For the errors topic press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Export Utility errors**" . To close the help, click X inside the "**Help**" tab.


After the above is complete, use Windows Explorer to go to the **folder given in the Location field.** This folder has sub-folders for each Component Type that has an XML file exported. The XML files can be viewed outside WE.

The XML files can be used as backups or to import metadata to a different environment in WE.

For more details, see these topics:

-   "**Import metadata overview**" for a detailed understanding of import. A link is under **Related concepts** below.
-   "**Importing metadata**" for instructions on how to perform an import. A link is under **Related tasks** below.
-   "**XML structure for metadata overview**" for details of the XML files produced by export. A link is under **Related concepts** below.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

