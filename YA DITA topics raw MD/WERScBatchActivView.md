# Batch Activate Views screen help {#WERScBatchActivView .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScBatchActivView.md#02)
-   [05 Errors](WERScBatchActivView.md#05)
-   [10 Action on this screen](WERScBatchActivView.md#10)
-   [20 Searching in Views](WERScBatchActivView.md#20)
-   [50 Fields - Views section](WERScBatchActivView.md#50)
-   [60 Fields - Errors section](WERScBatchActivView.md#60)
-   [99 Keyboard Shortcuts](WERScBatchActivView.md#99)

## 02 Screen function and rights {#02 .section}

![](images/BatchActiv_View_04.gif)

Use the Batch Activate Views screen to activate a group of views or to find out why individual views are not active.

System and environment administrators can always use this screen. There are two ways a general user can use this screen:

-   The **group selected during login** has the **Migrate In** run permission in the environment for the relevant views. In this case the general user can run this utility for any view in the environment.
-   The **group selected during login** has at least **modify rights to one or more view folders** in the environment. In this case the general user can run this utility for those views where the user has modify rights to the view folder.

See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topics "**Batch Activate Views errors**" and "**View Activation Errors message help**". For links, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

1.  When you first enter this screen, the list displays **all views in the current environment where you have rights to activate those views**.

    For more on rights, see above.

2.  Refine the list by a choosing a button at bottom right for **Active, Inactive or Both**.
3.  Sort this list by any of the following options:
    -   Click "**Name**" in the heading to sort the views into reverse name order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**Id**" in the heading to sort the views into ID number order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**VF Id**" in the heading to sort the views into view folder ID number order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**View Folder Name**" in the heading to sort the views into reverse View Folder Name order. Click repeatedly to switch between ascending and descending sort order.
    -   The same behavior works for columns "**Select**", "**Result**" and "**Status**" if required.
4.  If the list is long, you can search the list - see section "**Searching in Views**" below.
5.  Optionally, **right** click any value already in the column "**Name**" and select "**Open Editor**". This opens the "**Edit View**" screen.

    Optionally, **right** click any value already in the column "**View Folder Name**" and select "**Open Editor**". This opens the "**Edit View Folder**" screen.

6.  **Select views to activate** by any of the following methods:
    -   **Tick \(or untick\)** individual views in the Select column.

        To select a large number of views in sequence, select the first view and then**hold the Shift key down and select the last view**. All other views will be deselected when this occurs, so this should be the first action for a complex group of selections.

    -   Click **Select All** or **Deselect All**as required.
7.  At any time during these steps, click the **Refresh** button to reload the data shown in the**Views** section. The data can change during your time on this screen, and the **Refresh** button ensures the data displayed is current once more. The Refresh button will remove any ticks present and also remove any results and error messages.
8.  When the appropriate views are ticked, click **Activate** to start the batch activation.
9.  The column **Result** displays **Pass** or **Fail** or **Load Error**.

    -   "**Pass**" means the view is now status **active** and ready for use.
    -   "**Fail**" means the view has an error. Click on "Fail" for that row and the **View Activation Errors** section displays the errors in that view.
    -   "**Load error**" means a logical record or lookup path used in the view is inactive. All logical records and lookup paths used in a view must be status active for the view to be active. Click on "Load error" for that row and the **Errors** section displays which items are inactive in that view.
    For errors or messages on this screen, see topics "**Batch Activate Views errors**" or "**View Activation Errors message help**". For links, see under **Related reference** below.

10. Fix any problems with logical records, lookup paths or views by using tasks:

    -   "**Modify logical records**"
    -   "**Modify lookup paths**"
    -   "**Modify views**"
    Links to these task topics are under **Related tasks** below.

    If you use screens in the workbench to fix errors any items that affect views, return to the Batch Activate Views screen to retry the activate again.

11. At any time, you may press Refresh and return to step 2 to try again with the same or different views.

## 20 Searching in Views {#20 .section}

If there is a long list of views, then the list can be searched as follows:

1.  Click inside the list under "**Views**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the view name.
5.  Click OK to start the search.

If the view is found, then you are returned to the list with that view highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 50 Fields - Views section {#50 .section}

|Field|Definition|
|-----|----------|
|Select|Tick this box to select this view.|
|Result|The result of clicking **Activate**. Values are **Pass**, **Fail**, or **Load Error**. Click on the column heading **Result** to sort the list by Result. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|
|Status|The status of that view. Click on the column heading **Status** to sort the list by Status. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|
|Id|The ID of the view. Click on the column heading **ID** to sort the list by ID. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|
|Name|The name of the view. Click on the column heading **Name** to sort the list by Name. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|
|VF Id|The ID of the view folder that contains this view. Click on the column heading **VF ID** to sort the list by view folder ID. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|
|View Folder Name|The name of the view folder that contains this view. Click on the column heading **View Folder Name** to sort the list by view folder name. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|

## 60 Fields - Errors section {#60 .section}

|Field|Definition|
|-----|----------|
|Errors|Any errors associated with the **view highlighted**. Errors depend on the **result** for the highlighted view:-   For **Fail result** this field displays the **reasons** this view is inactive.
-   For **Load Error result** this field displays the **logical records that are inactive**, where these logical records are necessary for the view.

\(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

