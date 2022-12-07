# Modifying group permissions by group {#WETAMoGroupPermByG .task}

You must be a system administrator.

Performing this task affects security - see topic "**WE Security overview**". For a link, see under **Related concepts** below.

Use this topic change the permissions for a combination of a group and an associated environment. The new permissions apply to all members of the group.

Ensure you know the following:

-   The name of the **group**.
-   The name of an **environment** associated with that group.
-   The **changes to the permissions** for that group.

See the screen help topics and the messages topic for more detailed instructions on this task. For example, the screen help topics provide more instructions on searching the lists of environments that are displayed in this task. The messages topic explains any error or information messages that are displayed. The screen help topics are named by a combination of the screen and the sections on the screen.

-   **Group Permissions \(Groups, Associated Environments sections\) screen help**
-   **Group Permissions \(Component Security section\) screen help**
-   **Group Permissions messages**

**To display any of the above topics you must have completed Step 2 below.** Once you are on the "Group Permissions" screen, press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select a topic. To close the help, click X inside the "**Help**" tab.

1.  Ensure you are logged into the SAFR Workbench as a system administrator.

2.  Click **Administration -\> Group Security -\> Permissions -\> By Group...**

3.  In the **Groups** section, **select a group** from the drop down box.

4.  The choices are:

    1.  The **Associated Environments section** lists the environments currently associated with the group. Click in the list of environments to refresh the display.

    2.  To add an environment to the list, click **Add** to display the window "Select components to be associated". Tick the environments to add, and click OK.

    3.  To remove an environment from the list, **highlight an environment**, and click **Remove**. If the Remove button is grey, ensure an environment is highlighted.

    4.  Decide which environments where the group has **administrator access** by ticking or un-ticking the box in the Admin column.

    5.  See the topic "**Group Permissions \(Groups, Associated Environments sections\) screen help**" for more help on Step 4. To find this topic see "**About this task**" above.

    6.  See the topic "**Group Permissions messages**" for help on messages that display. To find this topic see "**About this task**" above.

5.  Highlight an environment listed in the **Associated Environments section** of this screen. If more than environment is highlighted, then the **first** environment highlighted is the environment for the steps below and all the other highlighted environments are ignored.

6.  In the Component Security section "**Permissions**" tab, tick or untick the rights listed.

7.  The choices in the "**Edit Rights**" tab are:

    1.  In the Component Security section "**Edit Rights**" tab, select a **component type** from the drop down box and use the buttons like **Add** and **Remove** to list actual components under **Access Permitted**.

    2.  Use the **Read, Modify and Delete columns** or the check boxes above to give access or remove access to those actual components.

    3.  See the topic "**Group Permissions \(Component Security section\) screen help**" for more help on Steps 5, 6 and 7. To find this topic see "**About this task**" above.

    4.  See the topic "**Group Permissions messages**" for help on messages that display. To find this topic see "**About this task**" above.

8.  When all changes are complete for this combination of group and environment,

    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
9.  If required, return to Step 5 to select a new environment, or return to Step 3 to select a new group. If you have finished all work on group permissions, click X to close the "**Group Permissions**" screen.


After the permission changes are complete, the updated group\(s\) are ready for immediate use.

To see a **report on environment security** that contains all groups associated with an environment, see one these topics:

-   FAQ topic "**How do I generate an Environment Security Report?**"
-   Task "**Generating reports on metadata**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

