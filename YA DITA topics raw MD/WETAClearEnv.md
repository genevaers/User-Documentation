# Clear environment {#WETAClearEnv .task}

This task deletes all metadata in an environment, including any updates to metadata that you currently have in progress on any edit screens.

System and environment administrators have the rights to clear an environment. General users cannot perform this task.

If you are considering clearing an environment, consider performing these other tasks first:

-   **Exporting metadata** which creates a backup copy of a metadata item in an XML file.
-   **Migrating metadata between environments** which can copy or move a metadata item to a different environment.

Links to these topics are under **Related tasks** below.

This task clears all metadata from an environment. There must be no metadata in an environment in order to delete an environment.

1.  Ensure you are logged into the SAFR Workbench with **appropriate rights**. For notes on these rights, see "Before you begin" above.

2.  Click on "Environments" in the Navigator to display all environments in the Metadata List. If the Navigator is not visible, click **Window -\> Show -\> Navigator**.

3.  **Select the environment** in the Metadata List and click **Administration -\> Clear Environment**. Only one environment can be cleared at one time. If the list is long, you can search the list. This is done by clicking in the Metadata List table and pressing F3. For more about this searching, read task "**Searching lists of metadata**".

4.  A window appears named "**Clear Environment**" and displays "This action will remove all the components and View definitions from the selected Environment" . Click **OK** to proceed with the clear operation. Click **Cancel** to avoid any action.

5.  Another message window may appear. If you are editing any metadata for that environment at this time, a window appears named "**SAFR Workbench**" and displays "Clearing this environment will close all the currently opened editors and you will lose the modified data." Click **OK** to proceed with the clear operation. Click **Cancel** to avoid any action.

6.  Once the cursor changes from an hourglass to a normal cursor, the clear is complete. The environment now contains no metadata.

    All messages for this topic are listed in topic "**Clear environment messages**". For a link, sees under **Related reference** below.


Once the environment is cleared, these tasks are useful options:

-   **Deleting metadata** \(to delete the environment record itself\),
-   Any of the "**Creating**" tasks to create new metadata for this environment,
-   **Importing metadata** \(to create new metadata from XML files\),
-   **Migrating metadata between environments** \(to copy in or move metadata from another environment\).

Links to these topics are under **Related tasks** below.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

