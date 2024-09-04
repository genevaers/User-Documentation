## Example 1: Workbench administrator tasks 

The GenevaERS Workbench is supplied with the user ID of ADMIN for Db2 connections. This userid has system administration rights, which means it has the authority to create and edit users, groups and environments, as well as rights to create and edit all the GenevaERS metatdata components associated with views.

Note: PostgresQL connections can be administered in the same way, but using the admin userid and password set up during PostgresQL installation.  

In this example you will login with user ID **ADMIN** and update the password.

1. Start the GenevaERS Workbench.
2. If this is your first login to the GenevaERS Workbench, the **GenevaERS Connection Manager** Screen will appear. 
3. In the **Connection Name** field type **GenDev-Db2**
4. From the **Database Type** list, select **Db2** 
5. In the **Database Name** field type the name of the Db2 database.
5. In the **Server** field type the IP address or domain name of the database host system.
6. In the **Port** field type the port number identifying the database.
7. In the **Schema Name** field type the name of the database schema.
8. In the **User ID** field type the User Id required to access the database. On mainframe systems, this is normally a RACF User Id.
9. In the **Password** field type the password for the User Id above.
10. Click **Save**

The GenevaERS login screen will appear

1. In **Database Connection** > **Name** the name **GenDev-Db2** will be displayed.
2. In **Workbench Login** > **User ID** type **ADMIN**. 
3. Leave **Workbench Login** > **Password** as blank. (Initally there is no password for ADMIN.)
4. Click **Login**  
Now you have logged on to the database you can select the GenevaERS environment.
5. From **Environment Selection** > **Environment** select **Development[1]**. This is the default environment created at Workbench installation. 
Note: There is no option to select a Group at this point, because ADMIN is a system administrator user ID.
6. Click **OK**.

You are now logged on to the GenevaERS Workbench.
To update the password for **ADMIN**:
1. In the Navigator pane, click **Administration** > **Users**  
A list of Users will appear in the Metadata List area. 
2. Double-click on User **ADMIN**  
The User definition will open in the Editor Area.
3. Update the **password** field.
4. Save the User definition **File** > **Save**



In this example you will login as ADMIN and create a new general User ID.

In this example you will login as ADMIN, create a new Group and assign a User to that Group.

In this example you will login as ADMIN and create a environment.

In this example you will login as ADMIN and assign an environment to a group with a role. (or is it assign a group to an env??)



For more information on Workbench security see [Workbench Security Overview](../SecurityOverview.md) 

