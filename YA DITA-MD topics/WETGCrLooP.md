# Creating lookup paths {#WETGCrLooP .task}

This topic assumes you already know the **logical files** and **logical records** and the **particular fields** to use in the new lookup path, as well as the **constants** and **symbols** required to create the primary key for the target logical file.

If you need help with these things, see topic "**Lookup paths overview**". A link to this topic is under **Related concepts** below.

Use this topic to create new lookup paths. All administrators can perform this task. General users can perform this task if the group selected during login has at least read rights to any logical files and logical records used in the lookup path.

For more on rights, see help topic "**WE Security overview**". A link to that topic is under **Related concepts** below.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

1.  Ensure you are logged into the appropriate environment for the new lookup path.

2.  Do the following:

    -   **EITHER** click the **arrow beside**![](images/Icon_New_08.GIF) \(the new icon\) and select **Lookup Path**,
    -   **OR** click **Administration -\> New -\> Lookup Path** \(for system administrators and environment administrators\),
    -   **OR** click **Components -\> New -\> Lookup Path** \(for general users\).
3.  On the "**General**" tab, enter or modify values in the fields. For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**New Lookup Path \(Lookup Path Definition tab\) screen help**". This topic covers the "Lookup Path Definition" tab, which is the most important part of this task.

    In steps below, if you open a list and cannot see the required logical records or logical files or other items, see your system administrator.

4.  Define the steps on the **Lookup Path Definition tab**. The choices are:

    1.  At the bottom of the **Steps section** use the **Add** and **Remove** buttons for whole steps. Click on a step number to see the details in the **Source and Target sections**.

    2.  For step 1, select a source logical record and a target logical record and target logical file.

        For all additional steps, the source logical record and source logical file are automatically the target logical record and target logical file defined in the previous step. This means for steps 2 and higher you only need to select a target logical record and target logical file.

    3.  To populate a row in the table "**Selected Source Fields**", click ![](images/LP_Add_Source_Field_03.GIF) and the "**Source Field Properties**" screen appears. Click on the radio button for **LR Field** and from the drop down box select a field from the source logical record. Alternatively, click on the radio button for a **Constant Value** and provide the value. Alternatively, click on the radio button for a **Symbol Name** and complete the two fields.

    4.  For more details of action on this screen, see topic "**New Lookup Path \(Lookup Path Definition tab\) screen help**".

        A link to that topic is under **Related reference** below.

    5.  The ultimate goal for each step is to create under **Selected Source Fields** a key the same length as the primary key for the target logical record. You can use fields in the source logical file, along with constants and symbols.

5.  When all fields are complete,

    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
    Help with error messages is available in topic "**New Lookup Path errors**". A link to this topic is under **Related reference** below.


After the lookup path is complete, the lookup path has a status of either active or inactive. Only active lookup paths can be used in a view. When you save the lookup path, some error messages may appear. Modify the lookup path to remove the error messages in order to change the status of the lookup path to active.

System and environment administrators can also perform task "**Batch activate lookup paths**". This task attempts to make a group of lookup paths **active** and will show reasons for any that remain inactive.

General users can also perform task "**Batch activate lookup paths**" if the **group selected during login** has the **Batch Activate Lookup Paths** right in that environment. See your system administrator if you require more rights.

For more information, see topic "**Batch activate lookup paths**". A link to that topic is under **Related tasks** below.

To see a **report on selected lookup paths**, see one these topics:

-   FAQ topic "**How do I generate a Lookup Path Report?**"
-   Task "**Generating reports on metadata**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

To delete a lookup path, see topic "**Deleting metadata**". A link to this topic is under **Related tasks** below.

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

