# Export metadata overview {#SACExportMetadata .concept}

## 01 Summary of this topic { .section}

The sections in this topic are as follows:

-   [02 Knowledge you need first](SACExportMetadata.md#02)
-   [03 What is export of metadata?](SACExportMetadata.md#03)
-   [04 Why is export useful?](SACExportMetadata.md#04)
-   [10 Perform an export](SACExportMetadata.md#10)
-   [20 Location for storing XML files](SACExportMetadata.md#20)
-   [30 Move XML file to a permanent location](SACExportMetadata.md#30)
-   [40 Example of an XML file](SACExportMetadata.md#40)
-   [50 Structure of XML files](SACExportMetadata.md#50)
-   [60 Backup an entire environment](SACExportMetadata.md#60)
-   [70 Comparison: export and import for WW and WE](SACExportMetadata.md#70)
-   [100 Need more on this page?](SACExportMetadata.md#100)

## 02 Knowledge you need first {#02 .section}

This topic assumes you are familiar with these topics:

-   "**Metadata overview**",
-   "**Metadata - advanced overview**".
-   "**WE Security overview**".

Links to these overviews are under **Related concepts** below.

## 03 What is export of metadata? {#03 .section}

Export means copying a selected metadata item into an XML file.

The selected metadata item can be called the "**main**" item. Many "**main**" items can be exported at one time, and each "**main**" item is exported to a separate XML file. The exported XML file consists of the following:

-   Details of the "**main**" item.
-   Details of metadata related to the "main" item. These can be called "**related**" items. There could be zero, one or many of these.

![](images/XML_Concept_01.gif)

Only certain types of metadata can be a "**main**" item in an export:

-   Physical file,
-   Logical file,
-   Logical record,
-   Lookup path,
-   View.

The table below shows the possible "related" items:

|"Main" item|Possible "related" items|
|-----------|------------------------|
|Physical file|User-exit routine|
|Logical file|Physical file, user-exit routine|
|Logical record|Logical file, physical file, user-exit routine|
|Lookup path|Logical record, logical file, physical file, user-exit routine|
|View|Control record, lookup path, logical record, logical file, physical file, user-exit routine|

Notice that a control record cannot be a "main" item in an export, but a control record can be an "related" item for backup of a view. To copy a control record for one environment to another, you must copy a view that contains that control record.

![](images/Metadata_Export_03.gif)

## 04 Why is export useful? {#04 .section}

![](images/Metadata_Export_04.gif)

There are three reasons to export metadata into XML files:

-   Restore from a backup of a metadata item into the same environment.
-   Copy a metadata item into a target environment in the same SAFR database.
-   Copy a metadata item into a target environment in a different SAFR database. This is not recommended, as it could corrupt the target database.

All backup, restore and copy options are outlined in help topic "**Metadata - advanced overview**". A link to that overview is under **Related concepts** below.

## 10 Perform an export {#10 .section}

Do the following:

1.  Ensure you know the "main" item\(s\) to export in the relevant environment and database.
2.  Choose a location for the XML files - see section [20 Location for storing XML files](SACExportMetadata.md#20).
3.  Perform the export using topic "**Exporting metadata**" in the Administration Guide. A link to that task is under **Related tasks** below.
4.  Perform section [30 Move XML file to a permanent location](SACExportMetadata.md#30).

## 20 Location for storing XML files {#20 .section}

On the "Export Utility" screen, specify a value for the field **"Location"**, for example "**C:\\XML**".

If not already present, the Export Utility creates these sub-folders:

-   LogicalFiles
-   LogicalRecords
-   LookupPaths
-   PhysicalFiles
-   Views

If the "main" item for an XML file is a **logical file**, then the XML file is stored in the sub-folder **LogicalFiles**, and so on.

![](images/Metadata_Export_Backup_Folders_Concept_01.gif)

There are two ways to choose a location for XML files:

-   **EITHER** specify the permanent location for the XML files every time you export,
-   **OR** specify a "holding" folder for the XML files. After export is complete, move or copy the XML files to a permanent location.

Permanent locations for backups can be organized for later reference, for example:

-   **C:\\Backups\\Environments\\Env\_A\\YYMMDD\\Views**
-   **C:\\Backups\\Selected\_Items\\Env\_A\\Views\\YYMMDD**

where "**Env\_A**" is an environment name and "**YYMMDD**" is a date.

## 30 Move XML file to a permanent location {#30 .section}

This section is optional. Ensure you have read section [20 Location for storing XML files](SACExportMetadata.md#20).

When the export is complete, consider the folder where the XML file is stored. If this folder is an appropriate permanent location for the XML file, then no further action is necessary.

You may take action if that folder is a 'holding' folder, for example **C:\\XML**. Export creates an XML file in a sub-folder, for example **C:\\XML\\Views**.

**The possible action is to move or copy the XML file to a permanent backup folder**. Examples of a permanent backup folder are:

-   **C:\\Backups\\Environments\\Env\_A\\YYMMDD\\Views**
-   **C:\\Backups\\Selected\_Items\\Env\_A\\Views\\YYMMDD**

where "**Env\_A**" is an environment name and "**YYMMDD**" is a date .

![](images/Metadata_Export_Backup_Folders_01.gif)

## 40 Example of an XML file {#40 .section}

An example of part of an XML file is below. The example is for a logical file called "**Stock\_1**":

![](images/XML_01_LF_03.gif)

In the example above the "**main**" item is a logical file, and at least one physical file is a "**related**" item.

## 50 Structure of XML files {#50 .section}

See topic "**XML structure for metadata overview**". A link to that overview is under **Related concepts** below.

## 60 Backup an entire environment {#60 .section}

You must have the appropriate rights to backup an entire environment. System and environment administrators always have the appropriate rights to do this.

General users can backup an entire environment if the **group selected during login** has at least **Read** rights for the "main" and "related" items. Note that to export a view a general user must have read rights to the view folder. See your system administrator if you require more rights.

To backup an entire environment, do the following:

1.  Choose the location for the XML files - see section [20 Location for storing XML files](SACExportMetadata.md#20).
2.  In the workbench under **Administration** or **Components**, click **Export...**
3.  Select an **Environment** from the drop down box. System administrators can choose from all environments. Environment administrators can only choose the environment selected during login. General users can choose from the environments that the **group selected during login** has access to.
4.  Select a **Component Type** from the drop down box. This must be one of these types:
    -   Physical file,
    -   Logical file,
    -   Logical record,
    -   Lookup path,
    -   View.
5.  Wait a moment. The table of **Component\(s\)** is populated. System and environment administrators can see all the components of the selected type in that environment. For general users, the only components listed are where the group has read or modify or delete rights.
6.  For component types of **Logical Record, Lookup Path and View**, click the button for **Both**.
7.  Click **Select All**.
8.  If required, modify the **Location** field. If you type a new folder name that does not exist, this is created when you perform the next step. Alternatively, click **Browse** to select an existing folder. When you perform the next step, the folder you specify in **Location** is automatically given a sub-folder named for the Component Type. That sub-folder is where the XML file is stored.
9.  Click **Export**. If this button is grey, check you have completed the previous steps.
10. A value in the **Result** column of "**Pass**" indicates that the export is complete. This means that the folder for **Location** now has a sub-folder for the **Component Type** and an XML file exported for each item exported. Each XML file in that sub-folder is named **componentName\[id\[.xml**.

    The **Result column** shows if any errors affected the export of the XML file for each component. The errors may be caused by the general user not having read rights to a component. Errors may also be caused by a system input/output error. **Click on the row for a component** to see any error messages in the **Errors section** on the right.

    For errors or messages on this screen, see topic "**Export Utility errors**". For a link, see under **Related reference** below.

11. Return to step 4 and select another component type. Do not proceed to step 12 until export is complete for all the component types.
12. When all backups are complete, use Windows Explorer to go to the **folder given in the Location field.** This folder has sub-folders for each component type. Each XML file has name **componentName\[id\[.xml** in a sub-folder. If required, perform section [30 Move XML file to a permanent location](SACExportMetadata.md#30).

## 70 Comparison: export and import for WW and WE {#70 .section}

This online help is provided for the SAFR Workbench called **WE \(Workbench Eclipse\)**.

The export and import functions were provided in an older version of the SAFR Workbench called **WW\(Windows Workbench\).**

At a high level, the export and import in WW and WE are similar but not compatible. For example, an XML file created by an export in WW cannot be imported into WE.

A **comparison of the export functions of WW and WE** is as follows:

-   WE provides export for only these metadata types:
    -   Physical file,
    -   Logical file,
    -   Logical record,
    -   Lookup path,
    -   View.
-   XML files exported from WE have a different format for date/time stamp compared to XML files exported from WW. The formats are as follows:
    -   WW format in the USA is: **MM/DD/YYYY HH:MM:SS AMPM** \(at midnight the time part is omitted\)
    -   WW format in some other countries is: **DD/MM/YYYY HH:MM:SS AMPM** \(at midnight the time part is omitted\)
    -   WE format is: **YYYY-MM-DD HH:MM:SS** \(24 hour clock\)
-   WE does not request selecting a SAFR database at the start of the export function. WE export uses the database for your current session.
-   WE provides a choice of location for the XML file that is generated by the export.

A **comparison of the import functions of WW and WE** is as follows:

-   WE import performs more checks on the XML files and their relationship with existing metadata in the target environment.
-   WE import is more consistent and reliable.
-   WE import ensures that serious potential problems are blocked and the import cannot proceed.
-   WE import provides a warning for minor potential problems, and gives a choice to proceed or cancel the import.
-   Overall, the WE import function preserves the integrity of the metadata in the target environment after import is complete.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

