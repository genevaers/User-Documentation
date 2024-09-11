{: .no_toc}
# Environments

In the workbench an environment is a logical collection of metadata such as file, record and view definitions. Environments are often named for a particular function. Security can be applied to environments to prevent unauthorized access.  

## Create an environment

Only system administrators can perform this task. At Workbench installation the environment **Development** is defined. At initial login the default system administrator (**ADMIN** for Db2 connections) should login to this environment.

To create a new environment:

1. Select **Administration** > **New** > **Environment** from the menu.  
2. In the **Name** field type a descriptive name.  
3. If a Control Record is required then select **Generate a Control Record** and edit the **Control Record Name**.  
Usually you will require a control record, but if you are creating the environment to import an XML file into, then de-select **Generate a Control Record** as the XML file will already contain a control record.
4. Save the view folder **File** > **Save**  

Next you can either import an XML file into this environment, or login to the environment and create new views.

To login again into the newly created environment.

1. Click **File** > **Return to login...** 
2. The **GenevaERS Login** screen will appear where you can select your database connection, and login
3. Select the new environment from the list **Environment Selection** > **Environment** and click **OK**
