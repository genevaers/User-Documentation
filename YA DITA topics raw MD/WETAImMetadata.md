# Importing metadata {#WETAImMetadata .task}

It is essential that you read topic "**Import metadata overview**". A link to that overview is under **Related concepts** below.

Only certain types of metadata can be imported. The types are:

-   Logical file,
-   Logical record,
-   Lookup path,
-   Physical file,
-   View.

Ensure you know the following:

-   The **target environment** to receive the metadata to be imported.
-   The **XML file\(s\)** to be imported.
-   The **folder\(s\)** containing the XML file\(s\).

Use this screen to import metadata components from XML files to the SAFR Workbench.

System and environment administrators can always perform this task. General users can open the screen "Import Utility" but cannot select a target environment, so the screen is not functional.

1.  Ensure you are logged into the **target environment** to receive the imported components. You must have the **appropriate rights**. For details of rights, see heading '**About this task**" above.

2.  Under **Administration**, click **Import...**

    General users look under **Components**, and click **Import...** and see the same screen. General users cannot select a target environment on that screen.

3.  Select a **Target Environment** from the drop down box. System administrators can choose any environment.  Environment administrators can choose from those environments where the **group selected during login** has administrator access.

4.  Select a **Component Type** from the drop down box.

5.  If the **Component Type** is "View" then you can optionally **select a View Folder** from the drop down list. This limits the views listed to those in the given View Folder.

6.  If required, modify the **Archive Folder** field. Alternatively, click **Browse** to select a folder. The objective is for the Archive Folder field to specify a folder that contains relevant XML files to be imported.

7.  Wait a moment. The table of **File\(s\)** is populated. This table lists XML files named by the component name and ID that can be imported using that file. If no files appear, check that you have selected the correct folder and that the folder does contain XML files for components of the correct Component Type.

8.  Select files to import by any of the following methods:

    1.  **Tick \(or untick\)** individual files in the Select column.

    2.  Click **Select All** or **Deselect All**as required.

9.  In most situations, the field "**Replace IDs**" is blank. Tick this field if you require that the ID numbers in the XML file are ignored and new ID numbers created for the items imported.

    For more about the field "**Replace IDs**" read the sections about "Ideal situations" in topic "**Import metadata overview**". A link to that overview is under **Related concepts** below.

10. Click **Import**. If this button is grey, ensure at least one file above is selected.

    If you require more help on this screen, see the screen help topic. For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Import Utility screen help**" . To close the help, click X inside the "**Help**" tab.

11. If you are attempting toimport a component that already exists in the target environment, a message appears giving you a choice of OK or Cancel. Click **OK** to proceed with the import and overwrite the existing component. Click **Cancel** to ensure no import occurs.

12. If you are attempting toimport a component with an ID number that is higher than anything in the target environment, a message appears giving you a choice of OK or Cancel. Click **OK** to proceed with the import and change the ID number as appropriate for the target environment. Click **Cancel** to ensure no import occurs.

13. A value of "**Pass**" in the **Result** column means the import is complete.

    The **Result column** shows if any errors affected the import of that XML file. A value of '**Fail**" in the Result column means the import did not occur. **Click on that row** to see any error messages in the **Errors section** at right.

    **WARNING:** this screen stops processing when the first error is found and displays only that error. If an import has multiple errors, then multiple attempts are necessary to find and fix all the errors.

    For a guide to how to handle errors in an import, see topic "**Import metadata overview**". A link to that overview is under **Related concepts** below.

    For the errors topic press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Import Utility errors**" . To close the help, click X inside the "**Help**" tab.

14. The WE log file contains data about imports performed in this session.

    For an example of the WE log file for an import, see topic "**Import metadata overview**". A link to that overview is under **Related concepts** below.


If an import completes, the imported metadata is ready for immediate use.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

