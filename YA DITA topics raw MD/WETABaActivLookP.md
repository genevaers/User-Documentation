# Batch activate lookup paths {#WETABaActivLookP .task}

Ensure you know the following:

-   The **environment** for the lookup paths.

This topic activates a number of lookup paths at the same time. The word batch means the collection of lookup paths selected.

System and environment administrators can always perform this task. General users can perform this task if the **group selected during login** has the **Migrate In** run permission in the environment for the relevant lookup paths. See your system administrator if you require more rights.

Ensure you are aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

1.  Ensure you are logged into the relevant environment with **appropriate rights**. For details of rights, see heading "**About this task**" above.

2.  Administrators click **Administration -\> Batch Activate -\> Lookup Paths**. General users click **Components -\> Batch Activate -\>Lookup Paths**.

    General users can always launch the Batch Activate Lookup Paths screen. The rights to run this utility and get results are described in "Before you begin" above.

3.  In the **Batch Activate Lookup Paths** window, **select an environment** from the drop down box. System administrators see a list of all environments. Environment administrators see a list of environments where the group selected during login provides administrator access to those environments. General users can see a list of environments where the **group selected during login** has the **Migrate In** run permission for that environment. After a wait, data appears in the **Lookup Paths** section.

4.  Refine the list by a choosing a button at bottom right for **Active, Inactive or Both**.

5.  Sort this list.

    The options for sorting are:

    -   Click "**Name**" in the heading to sort the lookup paths into reverse name order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**Id**" in the heading to sort the lookup paths into ID number order. Click repeatedly to switch between ascending and descending sort order.
    -   The same behavior works for columns "**Select**", "**Result**" and "**Status**" if required.
6.  If the list is long, you can search the list. This is done by clicking in the Lookup Path list and pressing F3. For more about this searching, read task "**Searching lists of metadata**".

7.  Select one or more lookup paths with a tick in the Select column. Untick by clicking on the tick again. Click **Select All** and **Deselect All** to save time selecting or deselecting many lookup paths.

8.  At any time during these steps, click the **Refresh** button to reload the data shown in the**Lookup Paths** section.

    The data can change during your time on this screen, and the **Refresh** button ensures the data displayed is current once more. The Refresh button will remove any ticks present and also remove any results and error messages.

9.  When the appropriate lookup paths are ticked, click **Activate** to start the batch activation.

    For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Batch Activate Lookup Paths screen help**". To close the help, click X inside the "**Help**" tab.

10. The column **Result** displays **Pass** or **Fail** or **Load Error**. This indicates the success of the batch activation.

    -   **Pass** - means the lookup path is active and ready for use.
    -   **Fail** - means the lookup path is inactive. Click on the word **Fail** to highlight that row. The Errors section displays the problems with that lookup path.
    -   **Load Error** - means one or more logical records are inactive. These logical records are necessary for the lookup path. Click on the word **Load Error** to highlight that row. The Errors section displays the inactive logical records causing the problem.
    For errors or messages on this screen, see topic "**Batch Activate Lookup Paths errors**". For a link, see under **Related reference** below.

11. Fix any problems with the relevant lookup paths or logical records.

    The tasks to use are:

    -   "**Modify lookup paths**"
    -   "**Modify logical records**"
    Links to these task topics are under **Related tasks** below.

    If you use screens in the workbench to fix errors any items that affect lookup paths, return to the Batch Activate Lookup Paths screen to retry the activate again.

12. At any time, you may return to step 3 to try again with the same or different lookup paths.


Any lookup paths activated are immediately available for use in a view.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

