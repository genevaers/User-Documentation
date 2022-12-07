# Copying metadata {#WETACopyMetadata .task}

Ensure you are logged into the relevant environment for the metadata item to be copied. Ensure you have the appropriate rights as described under section "**About this task**" below.

Use this topic to copy an item of metadata. This topic is often called "**Save As**".

You must have the appropriate rights to perform this task. System administrators have the appropriate rights except for copying:

-   **Environments** \(no copy allowed\)
-   **View Folders** \(no copy allowed\)

Environment administrators have the appropriate rights except for copying:

-   **Environments** \(no copy allowed\)
-   **Groups** \(only a system administrator can copy groups\)
-   **Users** \(only a system administrator can copy users\)
-   **View Folders** \(no copy allowed\)

General users can copy metadata if the login group has:

-   Create rights where the type of metadata to be copied is one of:
    -   Logical file,
    -   Logical record,
    -   Physical file,
    -   User-exit routine.
-   Modify rights to the view folder that stores a copied view.
-   Read rights to the metadata item\(s\) to be copied.

See your system administrator if you require more rights.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

**Note that each type of metadata has specific limitations for copying**, as shown in the table below:

|To copy a ....|note the following ...|
|--------------|----------------------|
|Control Record|Only a system administrator or environment administrator can copy a control record.|
|Environment|No copy function is provided. Instead, a system administrator can create a new environment - see task "**Creating environments**". Metadata in an existing environment can be migrated to the new environment by a system administrator- see task "**Migrating metadata between environments**".For a link to this task, see **Related tasks** below.

|
|Global Field|Only a system administrator or environment administrator can copy a global field.|
|Group|Only a system administrator can copy a group. When you copy, the associations to users, environments, and component permissions are also copied.|
|Logical File|When you copy, the associations to physical files are also copied.|
|Logical Record|When you copy, the associations to logical files are also copied.|
|Lookup Path|When you copy, all parts of the lookup path are copied.|
|Physical File|The physical file is copied without any associations to logical files.|
|User|Only a system administrator can copy a user. A window asks about copying the group memberships. Click "**Yes**" to copy the group memberships and "**No**" to copy the user without any group membership.|
|User Exit-Routine|When you copy, you must provide new names for the following:-   user-exit routine
-   executable

|
|View Folder

|No copy function is provided. Instead, create a new view folder - see task "**Creating view folders**". For a link to that task, see **Related tasks** below. To copy views from one view folder to another, see the "View" row below.

|
|View|After you copy the view, update the new view to change the view folder \(if required\).|

1.  Note: the metadata item to be copied is the "**base**" metadata item. The copy creates the "**copied**" metadata item. The first step is to **open the "base" metadata item.**

2.  If required, change the "base" metadata item before the copy. The changes do not affect the "base" metadata item unless you save the "base" item.

3.  To start the copy

    -   **EITHER** click ![](images/Icon_SaveAs_01.gif) \(the Save As button\).

        If this button is grey, then see section "**About this task**" above - either the copy function does not exist for that metadata item or you do not have appropriate rights.

    -   **OR** press **Ctrl+Shift+S**.

        If nothing happens, see section "**About this task**" above - either the copy function does not exist for that metadata item or you do not have appropriate rights.

    -   **OR** click **File, Save As**.

        If this menu item is grey, then see section "**About this task**" above - either the copy function does not exist for that metadata item or you do not have appropriate rights.

4.  The "**Save As**" window appears. Specify a new name for the metadata item. For a **user exit-routine**, you must also specify a new name for the **executable**.

5.  For copy of a user, a "**Copy Group Membership**" window appears, asking if the "copied" user belongs to the same groups as the "base" user. Click Yes or No.

6.  Wait for the copy to complete. The "copied" item has a new tab. The "base" item has a separate tab \(because it is a separate metadata item now\). You can change or save or close the "base" metadata item. You can change or save or close the "copied" metadata item.


After the above is complete, the "copied" metadata item is ready for immediate use. The section "**About this task**" above describes the limitations of the copy function. For example, a copied physical file does not initially have any associations to logical files. The limitations described in "About this task" indicate where the "copied" metadata items need modification.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

