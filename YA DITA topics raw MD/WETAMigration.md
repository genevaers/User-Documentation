# Migrating metadata {#WETAMigration .task}

It is essential that you read topics "**Migrate metadata overview**" and "**Metadata - advanced overview**" before you perform this task. Links to those overviews are under **Related concepts** below.

The Migration Utility provides a method to copy some metadata from a source environment to a target environment. Both environments must be in the same SAFR Database.

You select a "main" item to be migrated. There are some "related items" for that main item.

The name and ID number stay the same for the main and related items migrated to the target environment. There can be an exception when the main item is a view folder.

Note that if an ID number for a certain type of item already exists in the target environment, then that existing item can be overwritten in some cases.

Only certain types of metadata can be the main item for the Migration Utility. A main item must be one of these types:

-   Control record,
-   Global field,
-   Logical File,
-   Logical Record,
-   Lookup Path,
-   Physical File,
-   User-exit routine,
-   View,
-   View Folder.

Ensure you know the following:

-   The **source environment** containing metadata that you want to migrate.
-   The**target environment** to receive the migrated metadata.
-   The **main** item in the source environment to be migrated.
-   The **related** items for that main item.
-   Whether the ID numbers of the main and related items **already exist** in the target environment.

It is recommended to backup in the target environment the red item\(s\) on the "Confirm Migration" screen when it first appears. On that screen you need to note the item types, names and ID numbers of the red items, click Cancel and perform the backups. When the backups are complete, repeat the migration and click OK on the same screen.

One way to backup is using topic "**Exporting metadata**". A link to that topic is under **Related tasks** below.

You need the appropriate security authority in both the source and target environments to perform migration. See topic "**Metadata - advanced overview**" and look in the section "Copy using Migration". A link to that overview is under **Related concepts** below.

1.  Ensure you are logged in with **appropriate rights**. For details of rights, see heading '**About this task**" above.

2.  Under **Administration** or **Components**, click **Migrate...**

3.  Select a **Source Environment** from the drop down box. System administrators can choose from all environments. Environment administrators can only choose an environment where the group chosen during login provides environment administrator access. General users can choose from the environments that the login group has access to.

4.  Select a **Target Environment** from the drop down box. System administrators can choose from all environments. Environment administrators choose from the environments where the login group has administrator access. General users choose from the environments where the **login group has the "Migrate In" run permission**. If the drop down box is grey, ensure a source environment is selected. If so, press the Tab key.

5.  Select a **Component Type** from the drop down box. If the drop down box is grey, ensure the fields above are selected. If so, press the Tab key.

6.  Wait for the table of **Component\(s\)** to be populated. System and environment administrators can see all the components of the selected type in that environment. For general users, the only components listed are those components where the group has at least read rights.

    You must select one component to migrate to the target environment.

    **Sort** the list of "**Component\(s\)**" by clicking on any of the column headings. **Reverse the sort order** by clicking again on that heading.

    If you require more help on this screen, see the screen help topic. For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Migration Utility screen help**" . To close the help, click X inside the "**Help**" tab.

7.  If the component selected is a view or view folder, select a view folder in the drop down box for **Target View Folder**. This view folder stores the selected view\(s\) in the target environment after migration completes.

8.  To perform a minimum migrate, **remove the tick** in the box "**Migrate Related**". To perform a maximum migrate, **ensure a tick** in the box "**Migrate Related**".

9.  Click **Migrate**. If this button is grey, ensure at least one component above is selected or press the Tab key.

    To show the progress of the migration, text displays below the Navigator:

    ![](images/Migration_Prog_Msgs_01.gif)

    If you require more help on this screen, see the screen help topic. For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Migration Utility screen help**" . To close the help, click X inside the "**Help**" tab.

10. There is at least one message box.

    The following messages may appear:

    | |Message|Notes|
    |--|-------|-----|
    | |**Migration Complete.** See the Result column|Click OK to clear the message box. The word "Pass" appears in the Result column for this migration.|
    | |**Confirm Migration.** The following component\(s\) will be migrated. Red items marked with '\*' exist in the target environment and will be overwritten.|It is recommended to backup in the target environment the red item\(s\) on this screen before proceeding with the migration. You need to note the items, cancel this migration, take the backup and then return to this migration.

|

    See the messages topic for more details on messages on this screen. For the messages topic press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Migration Utility messages**" . To close the help, click X inside the "**Help**" tab.

11. The WE log file contains data about migrations performed in this session.

    For an example see topic "**Migrate metadata overview**". A link to that overview is under **Related concepts** below.


The migrated \(copied\) metadata items are ready for immediate use in the target environment.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

