# Batch activate views {#WETABaActivView .task}

System and environment administrators can always perform this task. There are two ways a general user can perform this task:

-   The **group selected during login** has the **Migrate In** run permission in the environment for the relevant views. In this case the general user can run this utility for any view in the environment.
-   The **group selected during login** has at least **modify rights to one or more view folders** in the environment. In this case the general user can run this utility for those views where the user has modify rights to the view folder.

See your system administrator if you require more rights.

Ensure you are aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

This topic activates a number of views at the same time. The word batch means the group of views selected.

1.  Ensure you are logged into the relevant environment with **appropriate rights**. For details of rights, see heading "Before you begin" above.

2.  Administrators click **Administration -\> Batch Activate -\> Views**. General users click **Components -\> Batch Activate -\> Views**.

    General users can always launch the Batch Activate Views screen. The rights to run this utility and get results are described in "Before you begin" above.

3.  When you first enter this screen, the list displays **all views in the current environment where you have rights to activate those views**.

    For more on rights, see "Before you begin" above.

4.  Refine the list by a choosing a button at bottom right for **Active, Inactive or Both**.

5.  Sort this list.

    The options for sorting are:

    -   Click "**Name**" in the heading to sort the views into reverse name order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**Id**" in the heading to sort the views into ID number order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**VF Id**" in the heading to sort the views into view folder ID number order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**View Folder Name**" in the heading to sort the views into reverse View Folder Name order. Click repeatedly to switch between ascending and descending sort order.
    -   The same behavior works for columns "**Select**", "**Result**" and "**Status**" if required.
6.  If the list is long, you can search the list. This is done by clicking in the View list and pressing F3. For more about this searching, read task "**Searching lists of metadata**".

7.  Select one or more views with a tick in the Select column. Untick by clicking on the tick again. Click **Select All** and **Deselect All** to save time selecting or deselecting many views.

8.  At any time during these steps, click the **Refresh** button to reload the data shown in the**Views** section.

    The data can change during your time on this screen, and the **Refresh** button ensures the data displayed is current once more. The Refresh button will remove any ticks present and also remove any results and error messages.

9.  When the appropriate views are ticked, click **Activate** to start the batch activation.

    For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select topic "**Batch Activate Views screen help**". To close the help, click X inside the "**Help**" tab.

10. The column **Result** displays **Pass** or **Fail** or **Load Error**. This indicates if success of the batch activation.

    -   "**Pass**" means the view is now status **active** and ready for use.
    -   "**Fail**" means the view has an error. Click on "Fail" for that row and the **View Activation Errors** section displays the errors in that view.
    -   "**Load error**" means a logical record or lookup path used in the view is inactive. Click on "Load error" for that row and the **Errors** section displays which items are inactive in that view.
    For errors or messages on this screen, see topics "**Batch Activate Views errors**" or "**View Activation Errors message help**". For links, see under **Related reference** below.

11. Fix any problems with logical records, lookup paths or views.

    The tasks to use are:

    -   "**Modify logical records**"
    -   "**Modify lookup paths**"
    -   "**Modify views**"
    Links to these task topics are under **Related tasks** below.

    If you use screens in the workbench to fix errors any items that affect views, return to the Batch Activate Views screen to retry the activate again.

12. At any time, you may return to step 3 to try again with the same or different views.


Any views activated are immediately available for submitting to the Performance Engine software to produce actual results.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

