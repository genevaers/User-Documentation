# Stage 6: Develop metadata using the workbench {#SATImp06DevMetadata .task}

You need the results of stages 1 to 5.

See tasks named "**Stage 1**" to "**Stage 5**". Links are under **Related tasks** below.

The previous stage \(Stage 5: Design SAFR batch flows\) lists the following metadata requirements for this stage:

-   **Environments** to contain all the items above in logical collections, such as **Sales** or **Accounts\_Receivable**.
-   **Global fields** to describe common fields of data in the mainframe systems in your company. For example, a customer identification number might be a global field.
-   **Physical files** to describe actual datasets on the mainframe systems in your company.
-   **User-exit routines** to performs some unique and necessary computing task specifically for your company.
-   **Logical records** to describe record layouts for logical files.
-   **Logical files** to describe collections of input and output data.
-   **View folders** to contain collections of views.
-   **Control records** to control how a view processes data.
-   **Lookup paths** to describe how one or more source files can lookup a target file by using fields of data.
-   **Views** to describe the results that SAFR must produce.

To create the metadata specified in Stage 5, use the SAFR Workbench.

There are three types of users:

-   **General Users**. These users create and modify views and lookup paths which is the main focus of work in the workbench.
-   **Environment Administrators** that can do all the General Users tasks and some extra administrative tasks in a particular environment.
-   **System Administrators** that can do all tasks and who support all other users get work done in the workbench.

The Administrators need the Workbench Administrators Guide.

1.  **General Users** need the "**Workbench General User Guide**".

    A link is under **Related reference** below.

2.  **Environment Administrators** need the "**Workbench General User Guide**" and the "**Workbench Administrators Guide**".

    Links are under **Related reference** below.

3.  **System Administrators** need the "**Workbench General User Guide**" and the "**Workbench Administrators Guide**".

    Links are under **Related reference** below.

4.  Document the metadata created so that these details are available for the next stage.


See task "**Stage 7: Run PE to get results**". A link to that overview is under **Related tasks** below.

**Parent topic:**[How to implement SAFR](../html/AAR420ImplementSAFR.md)

