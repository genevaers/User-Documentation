# Modifying lookup paths {#WETGMoLooP .task}

This topic assumes you already know the **logical files** and **logical records** and the **particular fields** to use in the lookup path, as well as the **constants** and **symbols** required to create the primary key for the target logical file.

If you need help with these things, see topic "**Lookup paths overview**". A link to this topic is under **Related concepts** below.

To delete a lookup path, see task "**Deleting metadata**". A link to this topic is under **Related tasks** below.

Use this topic to modify lookup paths. All administrators can perform this task. General users can perform this task if the group selected during login has at least read rights to any logical files and logical records used in the lookup path.

For more on rights, see help topic "**WE Security overview**". A link to that topic is under **Related concepts** below.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

To modify a lookup path, any source logical file for a step in the lookup path must have status **active**. If any source logical file has status **inactive**, the lookup path cannot be modified and a messages displays \(see step 4 below\).

1.  Ensure you are logged into the environment that contains the lookup path.

2.  In the Navigator, click **Lookup Paths**.

    If the Navigator is not visible, click **Window -\> Show -\> Navigator**.

3.  In the Metadata List, double click on the lookup path that needs update. If the list is long, you can search the list. This is done by clicking in the Metadata List table and pressing F3. For more about this searching, read task "**Searching lists of metadata**".

4.  You may see the following message:

    "**The Lookup Path could not be loaded due to the following Logical Record\(s\) are inactive. Please activate the Logical Record\(s\) and try again.**"

    The message lists the logical record\(s\) causing the problem.

    You must do the following:

    1.  Modify the logical record\(s\) to have status **active**.

        If you do not have enough rights to modify the relevant logical record\(s\), ask a system or environment administrator for assistance. If you have enough rights to do this, see topic "**Modifying logical records**". A link to that topic is under **Related reference** below.

    2.  Return to Step 1 above.
5.  The "**Edit Lookup Path**" screen displays. On the "**Lookup Path Definition**" tab and the "**General**" tab, modify values in the fields as appropriate. For screen help on any tab press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select one of the screen help topics. To close the help, click X inside the "**Help**" tab.

6.  When your work is complete,

    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
    Help with error messages is available in topic "**Edit Lookup Path errors**". A link to that topic is under **Related reference** below.


After the lookup path is complete, the lookup path has a status of either active or inactive. Only active lookup paths can be used in a view. Modify the lookup path to remove the problems that prevent a status of active.

System and environment administrators can also perform task "**Batch activate lookup paths**". This task attempts to make a group of lookup paths **active** and will show reasons for any that remain inactive.

General users can also perform task "**Batch activate lookup paths**" if the **group selected during login** has the **Batch Activate Lookup Paths** right in that environment. See your system administrator if you require more rights.

For more information, see topic "**Batch activate lookup paths**". A link to that topic is under **Related tasks** below.

To see a **report on selected lookup paths**, use one of these topics:

-   FAQ topic "**How do I generate a Lookup Path Report?**"
-   Task "**Generating reports on metadata**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

