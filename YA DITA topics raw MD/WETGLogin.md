# Logging into the SAFR Workbench {#WETGLogin .task}

Ensure you know the following:

-   **Database connection details** provided by your system administrator. These details are:
    -   **EITHER**

        an existing **database connection name**,

    -   **OR**

        the following list of details provided by your system administrator:

        -   **Database name**
        -   **Server** DNS name or IP address
        -   **Port**
        -   **Schema name**
        -   Your **SAFR Database User ID and password** provided by your company. This is known as a RACF User ID \(named after the mainframe software that controls user access\).
-   A **SAFR Workbench User ID and password** provided by your system administrator.
-   The **environment** for this session using the workbench.
-   A **group name** if you are a general user or environment administrator.

    For more on the types of users for the workbench, see topic "**Users overview**". A link to that overview is under **Related concepts** below.

-   Whether the session requires the **current SAFR compiler** or the **old compiler**. See your system administrator or your IBM representative if you require more information on the SAFR compilers installed in your company.

This task describes login to the SAFR Workbench, including the SAFR Connection Manager.

If you are already logged in the SAFR Workbench, you may require one or more of the following:

-   Login to a different environment and possibly a different database
-   Login using a different SAFR Workbench user name
-   Login using a different group name

The above can be achieved with task "**Return to login**".

A link to that task is under **Related tasks** below.

To login to the SAFR workbench, you must have at least one database connection name.

A database connection name provides the access to a SAFR Database where the SAFR workbench stores data. There are two types of database connection name: **global** and **local:**

-   A global connection is provided by your system administrator and already exists when you login to the workbench. Only a system administrator can create or delete a global connection. These connections are called "global" because these connections can apply to many or all workbench users.

    If required, you can modify a global connection. If you modify a global connection, the workbench allows you to click the "Default" button that removes your modifications and returns that global connection to the original data.

-   A local connection is a database connection name that you create and modify and is available only to you. Any user can create. delete and modify their own local connections. Local connections are only necessary if you require some special access to a SAFR Database.

System administrators must read the topic "**Workbench overview**" and read the section on "Virtualization for the workbench". For a link, see under **Related concepts** below.

1.  **Start** the SAFR Workbench.

2.  If there are no database connection names, the **SAFR Connection Manager screen** appears.

    See topic "**SAFR Connection Manager screen help**". A link to this topic is under **Related reference** below.

3.  The **SAFR Login screen** appears. **Select from the drop down list for Connection Name.**

    The list for Connection Name contains potentially both global and local connections names. If you cannot see a connection you require, click button "**Connections...**" and see topic "**SAFR Connection Manager screen help**". A link to this topic is under **Related reference** below. If the **Connections...** button is grey, click **Cancel** and restart the SAFR Workbench - the **Connections...** button is now available.

4.  **Type a SAFR Workbench User ID** \(if required\). The screen provides the value from your last workbench session, which you can change if necessary.

    Note: The User ID for the SAFR Workbench is likely to be different from your User ID for the SAFR Database.

5.  **Enter the appropriate SAFR password** for your SAFR Workbench User ID.

6.  Either tick or untick the box for "**Use Old Compiler**". Alternatively, this can be done later in step 10.

    The workbench always starts by displaying your choice from your last session, which you can change.

    See your system administrator or your IBM representative if you require more information on the SAFR compilers installed in your company.

7.  Click **Login**.

8.  **Select an environment** \(if there is a choice\). Once an environment is selected, click ****Set as Default**** to ensure this environment displays first for your next login. If there is a list of environments, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header.

9.  **Select a group** \(if there is a choice\). Once a group is selected and the environment above already has a tick for 'Set as Default", then for this group you can click ****Set as Default**** to ensure this group displays first for your next login. If there is a list of groups, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header. If you are a system administrator, the groups field is grey and no action is required in this field.

10. Either tick or untick the box for "**Use Old Compiler**". This may have been done earlier in step 6.

11. Click **OK**. Alternatively, click **Reset** to login as a different Workbench user name and return to step 3.

12. If there are errors, see topics **SAFR Connection Manager errors** and **SAFR Login errors**.

    Links to these topics are under **Related reference** below.


If you selected "Use Old Compiler", the bottom right of the workbench screen displays "**\*\*\* Old Compiler \*\*\***".

The version of the compiler for your workbench session is displayed in the WE log file - see topic "**WE log file overview**". A link to this topic is under **Related concepts** below.

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

