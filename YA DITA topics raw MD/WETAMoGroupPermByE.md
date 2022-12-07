# Modifying group permissions by environment {#WETAMoGroupPermByE .task}

A system administrator can perform all of this task. An environment administrator can perform most parts of this task.

Performing this task affects security - see topic "**WE Security overview**". For a link, see under **Related concepts** below.

Use this topic change the permissions for a combination of an environment and an associated group. The new permissions apply to all members of the associated group.

Ensure you know the following:

-   The name of the **environment**.
-   The name of the **group** associated with that environment.
-   The **changes to the permissions** for that group.

See the screen help topics and the messages topic for more detailed instructions on this task. For example, the screen help topics provide more instructions on searching the lists of groups that are displayed in this task. The messages topic explains any error or information messages that are displayed. The screen help topics are named by a combination of the screen and the sections on the screen.

-   **Group Permissions By Environment \(Groups, Associated Environments sections\) screen help**
-   **Group Permissions By Environment \(Component Security section\) screen help**
-   **Group Permissions By Environment messages**

**To display any of the above topics you must have completed Step 2 below.** Once you are on the "Group Permissions By Environment" screen, press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select a topic. To close the help, click X inside the "**Help**" tab.

1.  Ensure you are logged into the SAFR Workbench as an environment administrator or a system administrator.

2.  Click **Administration -\> Group Security -\> Permissions -\> By Environment...**

3.  In the **Environments** section, **select an environment** from the drop down box. System administrators can choose from a list of all environments. Environment administrators can choose from a list of environments where they have administrator access provided by the group selected during login.

4.  The choices in the **Associated Groups section** are as follows:

    1.  The **Associated Groups section** lists the groups currently associated with the environment. Click in the list of groups to refresh the display. **Only system administrators can change the details of the groups** listed in this section. Environment administrators can only highlight a group in order to make changes in the Component Security section below.

    2.  To add a group to the list, system administrators click **Add** to display the window "Select components to be associated". Tick the groups to add, and click OK.

    3.  To remove a group from the list, system administrators **highlight a group**, and click **Remove**. If the Remove button is grey, ensure a group is highlighted.

    4.  System administrators decide which groups have **administrator access** to the environment by ticking or un-ticking the box in the Admin column.

    5.  See the topic "**Group Permissions By Environment \(Groups, Associated Environments sections\) screen help**" for more help on Step 4. To find this topic see "**About this task**" above.

    6.  See the topic "**Group Permissions By Environment messages**" for help on messages that display. To find this topic see "**About this task**" above.

5.  Highlight a group listed in the **Associated Groups section** of this screen in order to make changes in the Component Security section. If more than group is highlighted, then the **first** group highlighted is the group for the steps below and all the other highlighted groups are ignored.

6.  In the Component Security section "**Permissions**" tab, tick or untick the rights listed.

7.  The choices in the "**Edit Rights**" tab are:

    1.  In the Component Security section "**Edit Rights**" tab, select a **component type** from the drop down box and use the buttons like **Add** and **Remove** to list actual components under **Access Permitted**.

    2.  Use the **Read, Modify and Delete columns** or the check boxes above to give access or remove access to those actual components.

    3.  See the topic "**Group Permissions By Environment \(Component Security section\) screen help**" for more help on Steps 5, 6 and 7. To find this topic see "**About this task**" above.

    4.  See the topic "**Group Permissions By Environment messages**" for help on messages that display. To find this topic see "**About this task**" above.

8.  When all changes are complete for this combination of group and environment,

    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
9.  If required, return to Step 5 to select a new group, or return to Step 3 to select a new environment. If you have finished all work on group permissions, click X to close the "**Group Permissions By Environment**" screen.


After the permission changes are complete, the updated group\(s\) are ready for immediate use.

To see a **report on environment security** that contains all groups associated with an environment, see one these topics:

-   FAQ topic "**How do I generate an Environment Security Report?**"
-   Task "**Generating reports on metadata**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

