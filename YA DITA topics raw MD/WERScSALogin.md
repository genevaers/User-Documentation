# SAFR Login screen help {#WERScSALogin .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScSALogin.md#02)
-   [05 Errors](WERScSALogin.md#05)
-   [10 Action on this screen](WERScSALogin.md#10)
-   [50 Fields: Connection Name](WERScSALogin.md#50)
-   [60 Fields: User Id & Password](WERScSALogin.md#60)
-   [70 Fields: Environment & Group](WERScSALogin.md#70)
-   [99 Keyboard Shortcuts](WERScSALogin.md#99)

## 02 Screen function and rights {#02 .section}

![](images/SAFR_Login_05_UseOldC.gif)

![](images/SAFR_Login_06_UseOldC.gif)

A database connection name provides the access to a SAFR Database where the SAFR workbench stores data. There are two types of database connection name: **global** and **local:**

-   A global connection is provided by your system administrator and already exists when you login to the workbench. Only a system administrator can create or delete a global connection. These connections are called "global" because these connections can apply to many or all workbench users.

    If required, you can modify a global connection. If you modify a global connection, the workbench allows you to click the "Default" button that removes your modifications and returns that global connection to the original data.

-   A local connection is a database connection name that you create and modify and is available only to you. Any user can create. delete and modify their own local connections. Local connections are only necessary if you require some special access to a SAFR Database.

This screen allows login to the SAFR workbench using a database connection name.

This screen is available to all users of the workbench.

System administrators must read the topic "**Workbench overview**" and read the section on "Virtualization for the workbench". For a link, see under **Related concepts** below.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**SAFR Login errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

1.  Select from the field **Connection Name**. If there are no selection or you cannot find the selection you require, then click**Connections...** and use the SAFR Connection Manager screen to create the connection name you require. If the **Connections...** button is grey, click **Cancel** and restart the SAFR Workbench - the **Connections...** button is now available.

    For help to create a connection name see topic "**SAFR Connection Manager screen help**". For a link, see under **Related reference** below.

2.  Type your SAFR Workbench **User Id** \(if required\), or change the value given.
3.  Type your SAFR Workbench **password**.
4.  Either tick or untick the box for "**Use Old Compiler**". Alternatively, this can be done later in step 8.

    The workbench always starts by displaying your choice from your last session, which you can change.

    See your system administrator or your IBM representative if you require more information on the SAFR compilers installed in your company.

5.  Click **Login**.
6.  Select an **environment** \(if there is a choice\).

    Once an environment is selected, click ****Set as Default**** to ensure this environment displays first for your next login.

    If there is a list of environments, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header.

7.  Select a **group** \(if there is a choice\).

    Once a group is selected and the environment above already has a tick for 'Set as Default", then for this group you can click ****Set as Default**** to ensure this group displays first for your next login.

    If there is a list of groups, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header.

    If you are a system administrator, the groups field is grey and no action is necessary.

8.  Either tick or untick the box for "**Use Old Compiler**". This may have been done earlier in step 4.
9.  Click **OK**. Alternatively, click **Reset** to restart the login process in step 1.

If you selected "**Use Old Compiler**" during login, this is displayed at right:

![](images/Workbench_Status_Bar_07_OldCompiler.gif)

The version of the compiler for your workbench session is displayed in the WE log file - see topic "**WE log file overview**". A link to this topic is under **Related concepts** below.

## 50 Fields: Connection Name {#50 .section}

|Field|Definition|
|-----|----------|
|Connection Name|Select this value from the drop down box. The values in the drop down box are setup by the SAFR Connection Manager screen. To maintain these values, click **Connections...** and see topic "**SAFR Connection Manager screen help**". For a link, see under **Related reference** below.

|

## 60 Fields: User Id & Password {#60 .section}

|Field|Definition|
|-----|----------|
|User ID|Your SAFR Workbench User ID. The screen provides the value from your last workbench session, which you can change if necessary. See your system administrator to obtain this value. The maximum length of a User Id is 8 characters.Note: The User ID for the SAFR Workbench is likely to be different from your User ID for the SAFR Database.

|
|Password|Any characters, up to a maximum of is 20 and case sensitive. This field is optional. If you type an invalid password, you see "Password not valid", and you can retry any number of times.|

## 70 Fields: Environment & Group {#70 .section}

|Field|Definition|
|-----|----------|
|Environment|Select from the drop down list. The environment selected applies to this session. Once an environment is selected, click ****Set as Default**** to ensure this environment displays first for your next login. If you cannot see the environment you require, see your system administrator. If there is a list of environments, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header.

|
|Group|General users select a group from the drop down list. The group selected applies to this session. Once a group is selected and the environment above already has a tick for 'Set as Default", then for this group you can click ****Set as Default**** to ensure this group displays first for your next login. If there is a list of groups, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header. If you are a system administrator, the groups field is grey.

|

## 80 Fields: Use Old Compiler {#80 .section}

|Field|Definition|
|-----|----------|
|Use Old Compiler|Tick this box if you require this session to use the old compiler, otherwise the current compiler is used. The workbench always starts by displaying your choice from your last session, which you can change.

See your system administrator or your IBM representative if you require more information on the SAFR compilers installed in your company.

|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

