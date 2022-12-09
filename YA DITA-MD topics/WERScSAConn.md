# SAFR Connection Manager screen help {#WERScSAConn .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScSAConn.md#02)
-   [05 Errors](WERScSAConn.md#05)
-   [10 Is a connection global or local?](WERScSAConn.md#10)
-   [20 Action on this screen](WERScSAConn.md#20)
-   [50 Fields](WERScSAConn.md#50)
-   [99 Keyboard Shortcuts](WERScSAConn.md#99)

## 02 Screen function and rights {#02 .section}

![](images/SAFR_Conn_Mgr_03_Global.gif)

![](images/SAFR_Conn_Mgr_04_Local.gif)

Use this screen to manage database connection names. At least one database connection name must exist to allow login to the SAFR workbench.

A database connection name provides the access to a SAFR Database where the SAFR workbench stores data. There are two types of database connection name: **global** and **local:**

-   A global connection is provided by your system administrator and already exists when you login to the workbench. Only a system administrator can create or delete a global connection. These connections are called "global" because these connections can apply to many or all workbench users.

    If required, you can modify a global connection. If you modify a global connection, the workbench allows you to click the "Default" button that removes your modifications and returns that global connection to the original data.

-   A local connection is a database connection name that you create and modify and is available only to you. Any user can create. delete and modify their own local connections. Local connections are only necessary if you require some special access to a SAFR Database.

As you can see above, a global connection has a "**Default**" button, whereas a local connection has a "**Delete**" button. This shows an important difference between a global and a local connection.

This screen is available for all users of the workbench.

System administrators must read the topic "**Workbench overview**" and read the section on "Virtualization for the workbench". For a link, see under **Related concepts** below.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**SAFR Connection Manager errors**". For a link, see under **Related reference** below.

## 10 Is a connection global or local? {#10 .section}

Select that connection name from the drop down box for "**Connection Name**". If the screen has a "**Default**" button, then this is a **global** connection \(even if the button is grey\). If the screen has a "**Delete**" button, then this is a **local** connection.

It is recommended to include the word "local" in the name of any local connections created. This makes the local connections easy to identify.

## 20 Action on this screen {#20 .section}

|If you want to ...|then ...|
|------------------|--------|
|**Add** a new local connection|Do you want to save any changes to the connection currently displayed? If yes, click **Save** and then select any connection.

Click **New**.

The SAFR Connection Manager screen displays with empty fields.

**Enter values** for all fields on the screen. Note that the User ID and password are for the SAFR Database.

It is recommended to include the word "local" in the name of any local connections created. This makes the local connections easy to identify.

When complete, click **Save**. The SAFR Login screen displays.

|
|**Cancel** all changes on this screen|Click **Cancel**. The SAFR Login screen displays.

|
|**Default** a global connection|This action removes any changes you have previously made to a global connection, and returns the values to the original data.

If required, select the global connection from the drop down box for **Connection Name**.

Click **Default** and then click **Save**. The SAFR Login screen displays and the global connection now has are returned to default values.

If **Delete** is present instead of **Default**, then this is a local connection and you must make any changes to the values yourself - see the row for **Modify** in this table.

|
|**Delete** a local connection|If required, select the local connection from the drop down box for **Connection Name**.

Click **Delete** and then click **Cancel**. The SAFR Login screen displays and the local connection is no longer listed in the drop down box for Connection Name.

If **Default** is present instead of **Delete**, then this is a global connection and you cannot delete this connection name.

|
|**Exit** this screen|Click **Cancel**. The SAFR Login screen displays.

|
|**Modify** a global or local connection|If required, select the connection from the drop down box for **Connection Name**.

If you are trying to remove modifications to a global connection, see the row for **Default** in this table.

**Enter values** for all fields on the screen. You can modify global and local connections.

If you change the name of a global connection, you have created a new local connection that has that new name and the values of the global connection \(which you may change\). You can modify this new local connection. You can also delete this new local connection. Any actions on this new local connection do not affect the original global connection.

Click **Save** to save the changes. The SAFR Login screen displays.

|
|**New** local connection|Do you want to save any changes to the connection currently displayed? If yes, click **Save** and then select any connection.

Click **New**.

The SAFR Connection Manager screen displays with empty fields.

**Enter values** for all fields on the screen. Note that the User ID and password are for the SAFR Database.

It is recommended to include the word "local" in the name of any local connections created. This makes the local connections easy to identify.

When complete, click **Save**. The SAFR Login screen displays.

|
|**Return** to the SAFR Login screen|Click **Cancel**. The SAFR Login screen displays.

|
|**Save** changes to a global or local connection|Click **Save**. The SAFR Login screen displays.

|

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|Connection Name|A string of characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). When creating a Connection name, pressing the spacebar automatically creates an underscore in this field. Must be unique among connection names for this user.It is recommended to include the word "local" in the name of any local connections created. This makes the local connections easy to identify.

Examples of permitted names:

-   Company\_Inventory\_Local
-   Local\_Accounts\_SAFR\_Database

|
|Database Type|The only supported value is DB2 \(currently\).|
|Database Name|Any number of characters.|
|Server|The DNS name or IP address of the database server.|
|Port|The IP port number on the server used to access the database. Numbers only.|
|Schema Name|This is used in SQL statements to qualify table names. Any number of characters.|
|Connection URL|As you type data in the first four fields above, this field progressively displays the JDBC connection URL derived from those values. \(Display only.\)|
|User Id|This is the User Id required to access the SAFR Database. On mainframe systems, this is normally a RACF User Id. A string of any number of characters.|
|Password|The password to the User Id above. A string of any number of characters|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

