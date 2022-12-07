# Migration Utility screen help {#WERScMigration .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScMigration.md#02)
-   [05 Errors](WERScMigration.md#05)
-   [10 Action on this screen](WERScMigration.md#10)
-   [20 Searching in "Components"](WERScMigration.md#20)
-   [50 Fields](WERScMigration.md#50)
-   [99 Keyboard Shortcuts](WERScMigration.md#99)

## 02 Screen function and rights {#02 .section}

![](images/MigrationUtil_01.gif)

It is essential that you read topic "**Migrate metadata overview**" before you perform a migration. A link to that overview is under **Related concepts** below.

Use this screen to copy metadata items from a source environment to a target environment in the same SAFR Database.

You need appropriate security authority in both environments to use this screen.

-   In the source environment you need:
    -   EITHER read rights to all the metadata to be copied. This is necessary for general users.
    -   OR administrator rights to that environment.
-   In the target environment you need:
    -   EITHER the "Migrate In" run permission. The is provided by the group selected during login for general users.
    -   OR administrator rights to that environment.

See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For more details about messages on this screen, see topic "**Migration Utility messages**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

It is recommended to backup in the target environment the red item\(s\) on the "Confirm Migration" screen. On that screen you need to note the item types, names and ID numbers of the red items, click Cancel and perform the backups. When the backups are complete, repeat the migration and click OK on the same Confirm Migration screen.

One way to backup is using topic "**Exporting metadata**". A link to that topic is under **Related tasks** below.

Do the following:

1.  Select a **Source Environment** from the drop down box. System administrators can choose from all environments. Environment administrators and general users choose from the environments where the login group has access.

    Optionally, **right** click any value already in this field and select "**Open Editor**". This opens the "**Edit Environment**" screen.

2.  Select a **Target Environment** from the drop down box. System administrators can choose from all environments. Environment administrators choose from the environments where the login group has administrator access. General users choose from the environments where the login group has the "Run Migrate In" utility permission. If the drop down box is grey, ensure a source environment is selected. If so, press the Tab key.

    Optionally, **right** click any value already in this field and select "**Open Editor**". This opens the "**Edit Environment**" screen.

3.  Select a **Component Type** from the drop down box. If the drop down box is grey, ensure the fields above are selected. If so, press the Tab key.
4.  You may **sort** the list of "**Component**" by clicking on any of the column headings. **Reverse the sort order** by clicking again on that heading.
5.  Wait a moment. The table for **Component** is populated. System and environment administrators can see all the components of the selected type in that environment. For general users, the only components listed are where the group has read or modify or delete rights.

    You must select one component to migrate to the target environment. You may optionally select**more than one** component if the field Migrate Related is blank and the **Component Type** is one of Control Record, Global Field, User-Exit Routine, Physical File, Logical File or Logical Record.

    If the above conditions are met, you may optionally click **Select All** or **Deselect All** as required to tick or untick all components listed.

    To select a large number of components in sequence, select the first component and then**hold the Shift key down and select the last component**. All other components will be deselected when this occurs, so this should be the first action for a complex group of selections.

    Optionally, **right** click any row of data in the "Component" table and select "**Open Editor**". This opens the editor screen for that component if that component is in the environment for your current session. The text "Open Editor" is grey if the component in the "Component" table is not in the environment for your current session.

6.  If the component selected is a view, you must select a view folder in the drop down box for **Target View Folder**. If the component selected is a view folder, you canoptionally select a view folder in the drop down box for **Target View Folder**.

    Optionally, **right** click any value already in this field and select "**Open Editor**". This opens the "**Edit View Folder**" screen if the view folder is in the same environment for your current session. The text "Open Editor" is grey if the view folder is not in the environment for your current session.

7.  At any time, you can click the **Refresh** button to repopulate the **Component** table with current data. This ensures that if data in the source environment changes, this screen also changes as appropriate.
8.  Tick or untick the box for **Migrate Related**. If the box is grey, then that Component Type does not permit use of the Migrate Related field. If the box **Migrate Related** is ticked then the migration includes both the selected component \(the "main" item\) and the "related" items. This type of migration can be called a maximum migration. If the box **Migrate Related** is not ticked, then the migration is only for the selected component \(the "main" item\). This type of migration can be called a minimum migration.

    For more details, see topic "**Migrate metadata overview**". A link to that overview is under **Related concepts** below.

9.  Click **Migrate**. If this button is grey, ensure at least one component above is ticked.
10. Many times during the execution of the migration, you will see a window with "**Operation in progress...**". This is normal. There are two displays that indicate progress of the migration.

    Firstly, a progress bar appears at the bottom of the screen to the left of Database name. An example is:

    ![](images/Import_Utility_04_Progress_Bar_01.gif)

    Secondly, text displays to the far left of the progress bar:

    ![](images/Migration_Prog_Msgs_01.gif)

11. The following messages may appear:

    | |Message|Notes|
    |--|-------|-----|
    | |**Confirm Migration.** The following component\(s\) will be migrated. Red items marked with \* exist in the target environment and will be overwritten.|It is recommended to backup in the target environment the red item\(s\) on this screen before proceeding with the migration. You need to note the items, cancel this migration, take the backup and then return to this migration.

|
    | |**Migration Complete.** See the result column.|The result column will indicate either Pass, Cancel or Fail.|

    For more details about messages on this screen, see topic "**Migration Utility messages**". For a link, see under **Related reference** below.

12. A value of "**Pass**" in the **Result** column means the migration of that component is complete.

    A value of "**Cancel**" in the Result column means you clicked Cancel for a message window displayed during the migration.

    A value of "**Fail**" in the Result column means an error prevented the migration of that component.

    **Highlight the row for that component** to see any messages in the **Errors section** on the right. These messages give extra information about the Cancel or Fail result.

    For information on the messages in the Errors section, see topic "**Migration Utility messages**". For a link, see under **Related reference** below.

13. The WE log file contains data about migrations performed in this session.

    For an example see topic "**Migrate metadata overview**". A link to that overview is under **Related concepts** below.


## 20 Searching in "Components" {#20 .section}

If there is a long list of components, then the list can be searched as follows:

1.  Click inside the list for "**Components**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the component name.
5.  Click OK to start the search.

If the component is found, then you are returned to the list with that component highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|Source Environment|Drop down box of environments available to the user.|
|Target Environment|Drop down box of environments available to the user.|
|Component Type|List of components types that this utility can migrate.|
|Target View Folder|This field is only active if a view or view folder is selected in field "Component" above. This field is a drop down box of view folders in the target environments available to the user.|
|Component|Table of components available for migration.|
|Select|Tick to select this component for migration. Tick again to remove the tick. Ensure you have made a choice for the "Migrate Related" field below. Migration starts for ticked components when the "Migration" button is clicked.|
|Result|A value of "**Pass**" in the **Result** column means the migration of that component is complete. A value of "**Cancel**" means you clicked Cancel for a message window displayed during the migration.

A value of "**Fail**" means an error prevented the migration of that component.

**Highlight the row for that component** to see any messages in the **Errors section** on the right. These messages give extra information about the Cancel or Fail result.

For information on the messages in the Errors section, see topic "**Migration Utility messages**"

|
|ID|This is the position of that particular component in the list of components of that type for the environment. \(Display only.\)|
|Name|The name of that particular component. \(Display only.\)|
|Migrate Related|Tick or untick the box for **Migrate Related**. If the box is grey, then that Component Type does not permit use of the Migrate Related field. If the box **Migrate Related** is ticked then the migration includes both the selected component \(the "main" item\) and the "related" items. This type of migration can be called a maximum migration. If the box **Migrate Related** is not ticked, then the migration is only for the selected component \(the "main" item\). This type of migration can be called a minimum migration.For more details, see topic "**Migrate metadata overview**".

|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

