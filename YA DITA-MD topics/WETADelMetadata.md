# Deleting metadata {#WETADelMetadata .task}

For an introduction to metadata, see "**Metadata Overview**". A link to this topic is under **Related concepts** below.

Before delete of a metadata item, it is recommended taking a backup of that item - see task "**Exporting metadata**". A link to this topic is under **Related tasks** below.

Before delete of a metadata item, check the dependencies for that metadata item - see task "**Checking metadata dependencies**". A link to this topic is under **Related tasks** below. That task gives information about any possible adverse effects from delete of that metadata item.

-   System administrators can delete any type of metadata item. Only a system administrator can delete a **user**, a **group** or an **environment**. Note that to delete an environment record itself, the environment must have no metadata and a system administrator must be logged into a different environment.
-   Environment administrators can delete all types of metadata except user, group and environment.
-   General users can delete metadata only where the **group selected during login** has **delete rights** to that item of metadata. The delete rights only cover logical files, logical records, physical files, user-exit routines and view folders. General users can potentially delete these metadata types.

    General users can also delete any **view** where the general user has delete access to the view folder.


Note that when any user deletes a view, the view is moved to the "**Deleted Views**" folder.

The "Deleted Views" folder acts like the "Recycle bin" in Windows - deleted views can be retrieved while still in the "Deleted Views" folder. Views stay in the "**Deleted Views**" folder until they are deleted a second time from there, or the "**Empty "Deleted Views" folder**" task is performed. Only a system or environment administrator can delete views from the "Deleted Views" folder. A link to the topic "**Empty "Deleted Views" folder**" is under **Related tasks** below.

To delete an entire environment, all metadata must be cleared first - see task "**Clear environment**". Only a system or environment administrator can perform this task. A link to this topic is under **Related tasks** below.

Before delete of a metadata item, check if this metadata item \(ID number\) exists in other environments in the same SAFR database - see task "**Finding all environments for a particular a metadata item**". This information is useful because delete may be necessary for the same item \(ID number\) in other environments in that SAFR database. A link to this topic is under **Related tasks** below.

This task describes how to delete metadata from the SAFR Workbench.

To perform this task you need the appropriate rights. The rights are detailed under heading "Before you begin" above.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

**After requesting a delete, a window asks you to confirm the delete first.** After you confirm, each metadata item to be deleted is checked as follows:

-   **Control records** cannot be deleted if used in a view.

    If you attempt to delete a control record that is used in a view, a window appears named "**Control Record dependencies**". This window lists the views using that control record.

    For each view listed, edit the view, go to the "**View Properties, General**" tab, choose a different control record, and save. Once there are no more views referring to this control record, repeat the delete of this control record.

-   **Groups** cannot be deleted if the group contains any associated users or associated environments. Only a system administrator can delete a group.

    If you attempt to delete a group that has associated users or environments, a window appears named "**Group dependencies**". This window lists any associated users and associated environments.

    If there are associated users, click **Administration -\> Group Security -\> Membership** , select the group, tick all associated users, click **Remove** and save. If there are associated environments, click **Administration -\> Group Security -\> Permissions -\> By Group...** , select the group, tick all associated environments, click **Remove** and save. Once there are no more associated users and associated environments, repeat the delete of this group.

-   **Environments** can only be deleted if all metadata in that environment has been cleared.

    See task "**Clear environment**". A link to this topic is under **Related tasks** below.

    Only a system administrator can delete an environment, with two conditions. Firstly, the environment must contain no metadata, and secondly the system administrator cannot be currently logged into that environment.

-   **Global fields** can be used in a logical record. A window named "**Global Field dependencies**" shows the logical records that use that global field.

    Click **OK** to delete that global field and remove that field from those logical records. Click **Cancel** to avoid any change.

-   **Logical files** cannot be deleted if that logical file is:

    -   The last associated with a logical record. This can be called a "one file" logical record.
    -   Used in a lookup path.
    -   Used as an output file or view source of any view.
    -   Used in logic text \(Extract Column Assignment\) of an active view.
    If you attempt to delete a logical file that meets any of these conditions, a window appears named "**Logical File dependencies**". This window lists the "one file" logical records, lookup paths and views using that logical file.

    For each "one file" logical record, either associate that logical record with other logical files, or delete the logical record. For each lookup path or view listed, edit that item and remove references to that logical file and save. Once there are no more lookup paths, views or "one file" logical records using that logical file, repeat the delete of this logical file.

-   **Logical records** cannot be deleted if that logical record is:

    -   Used in a lookup path.
    -   Used in view source or column source of any view.
    -   Used in logic text \(Extract Record Filter or Extract Column Assignment\) of an active view.
    -   Used in a sort key title of any view.
    If you attempt to delete a logical record that meets any of these conditions, a window appears named "**Logical Record dependencies**". This window lists the lookup paths and views that use that logical record.

    For each lookup path or view listed, edit the lookup path or view, change the logical record and save. Once there are no more lookup paths and views that use that logical record, repeat the delete of this logical record.

-   **Lookup paths** cannot be deleted if that lookup path is:

    -   Used in column source of any view.
    -   Used in logic text \(Extract Record Filter or Extract Column Assignment\) of an active view.
    -   Used in a sort key title of any view.
    If you attempt to delete a lookup path that meets any of these conditions, a window appears named "**Lookup Path dependencies**". This window lists the views using that lookup path.

    For each view listed, edit the view, remove the lookup path from all column source and any logic text and save. Alternatively, delete the views that refer to that lookup path. Once there are no more views using that lookup path, repeat the delete of this lookup path.

-   **Physical files** cannot be deleted if that physical file is:

    -   Used as an output file for the extract phase or format phase in the "**View Properties**" of any view
    -   Used in logic text \(Extract Column Assignment\) of an active view.
    -   The last associated with a logical file. This can be called a "one file" logical file.
    If you attempt to delete a physical file that meets any of these conditions, a window appears named "**Physical File dependencies**". This window lists the views and "one file" logical files using that physical file.

    You must remove the association of that physical file to the views or "one file" logical files, or delete those views or "one file" logical files.

    To remove the association with a view, edit the view and remove the physical file from either the "**View Properties, Extract Phase**" tab or the "**View Properties, Format Phase**" tab or from logic text and save. To remove the association with a "one file" logical file, edit the logical file, change physical file listed in "**Associated Physical Files**" and save. Once there are no more views and "one file" logical files using that physical file, repeat the delete of this physical file.

-   **Users** are deleted once you have confirmed the delete. Only a system administrator can delete a user.
-   **User-exit routines** cannot be deleted if that user-exit routine is:

    -   Used in a physical file.
    -   Use in a logical record.
    -   Used in the "**View Properties**" of a view.
    -   Used in logic text \(Extract Column Assignment\) of an active view.
    If you attempt to delete a user-exit routine that meets any of these conditions, a window appears named "**User Exit Routine dependencies**". This window lists the items using that user-exit routine.

    For each item listed, edit the item, and remove the reference to the user-exit routine. In a view, the user-exit routine can be used in the "**View Properties, Extract Phase**" tab, "**View Properties, Format Phase**" tab or in logic text. Once there are no more items referring to this user-exit routine, repeat the delete of this user-exit routine.

-   **Views** are not deleted immediately.

    When you delete a view, then the view is placed in a folder "**Deleted Views**" and the status is made inactive.

    Later, the task "**Empty "Deleted Views" folder**" permanently deletes views in that folder. A link to that topic is under **Related tasks** below.

    An alternative method to achieve the permanent delete is to delete views from the "**Deleted Views**" folder. When you confirm a delete from "**Deleted Views**", the view is deleted permanently.

    This pattern is not affected by the fact that if a view is stored in the "**Deleted Views**" folder that view is also listed in the "**All Views**" folder. Deleting a view from the "**Deleted Views**" folder also deletes the view from the "**All Views**" Folder.

-   **View folders** cannot be deleted if they contain any views.

    If you attempt to delete a view folder that contains views, a window appears named "**Delete View Folder**". This window states that the delete cannot proceed because there are still views in that view folder.

    Delete all views in that view folder and repeat the delete of this view folder.

    If the view folder is empty and is the default view folder for any users, a window appears named "**View Folder dependencies**". This lists the users where this view folder is their default view folder. Click **OK** to proceed with the delete of the view folder, and click **Cancel** to avoid the delete.


1.  Ensure you are deleting your metadata items in the correct order, which is as follows:

    1.  Views, users
    2.  Control records, view folders, lookup paths, groups
    3.  Logical records
    4.  Logical files, global fields
    5.  Physical files
    6.  User-exit routines
    The above order avoids unnecessary error messages.

2.  Ensure you are logged into the relevant environment with **appropriate rights**. For details of rights, see heading "**About this task**" above.

3.  Click on an item in the Navigator to display the Metadata List. If the Navigator is not visible, click **Window -\> Show -\> Navigator**.

4.  **Select one or more metadata items** in the Metadata List. A single item is selected by a left click. Hold down the control key and left click to select another item. To select a sequence of items, select the first item in the sequence, then hold the shift key and click the last item in the sequence.

    If the list is long, you can search the list. This is done by clicking in the Metadata List and pressing F3. For more about this searching, read task "**Searching lists of metadata**", which is also in this Administration Guide.

5.  Click ![](images/Icon_Del_Metadata_01.gif) or press the **Delete** key.

6.  A window displays "This action will delete the selected XXX" \(where XXX is the type of metadata item you selected\). Click **OK** to proceed with the delete. Click **Cancel** to avoid any delete.

7.  You may see more message windows. These windows either ask for confirmation of a delete or display reasons why a metadata item cannot be deleted. Depending on the situation, you have a choice to confirm a delete, skip a delete or cancel all remaining deletes.

    All messages for this topic are listed in topic "**Deleting metadata messages**". A link to that topic is under **Related reference** below.

8.  To fix any problems, see the messages topic discussed in the previous step, and see also the text under "**About this task**" above. Once the problems are fixed, repeat the delete of the metadata item\(s\).


Once the delete completes, the metadata item\(s\) will only appear in any existing backups \(for example, XML files\) - see task "**Exporting metadata**". A link to this topic is under **Related tasks** below.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

