# Batch Activate Lookup Paths screen help {#WERScBatchActivLPath .reference}

## 01 Summary of this topic {#01 .section}

The sections below are as follows:

-   [02 Screen function and rights](WERScBatchActivLPath.md#02)
-   [05 Errors](WERScBatchActivLPath.md#05)
-   [10 Action on this screen](WERScBatchActivLPath.md#10)
-   [20 Searching in Lookup Paths](WERScBatchActivLPath.md#20)
-   [50 Fields - Environments section](WERScBatchActivLPath.md#50)
-   [60 Fields - Lookup Paths section](WERScBatchActivLPath.md#60)
-   [70 Fields - Errors section](WERScBatchActivLPath.md#70)
-   [99 Keyboard Shortcuts](WERScBatchActivLPath.md#99)

## 02 Screen function and rights {#02 .section}

![](images/BatchActiv_LooP_02.gif)

Use the Batch Activate Lookup Paths screen to activate a group of lookup paths or to find out why individual lookup paths are not active.

System and environment administrators can always use this screen. General users can use this screen if the **group selected during login** has the **Migrate In** run permission in the environment for the relevant lookup paths. See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Batch Activate Lookup Paths errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

1.  **Select an environment** from the drop down box. System administrators see a list of all environments. Environment administrators see a list of environments where the group selected during login provides administrator access to those environments. General users can see a list of environments where the **group selected during login** has the **Migrate In** run permission for that environment. After a wait, data appears in the **Lookup Paths** section.
2.  Refine the list by a choosing a button at bottom right for **Active, Inactive or Both**.
3.  Sort this list by any of the following options:
    -   Click "**Name**" in the heading to sort the lookup paths into reverse name order. Click repeatedly to switch between ascending and descending sort order.
    -   Click "**Id**" in the heading to sort the lookup paths into ID number order. Click repeatedly to switch between ascending and descending sort order.
    -   The same behavior works for columns "**Select**", "**Result**" and "**Status**" if required.
4.  If the list is long, you can search the list - see section "**Searching in Lookup Paths**" below.
5.  Optionally, **right** click any value already in the field "**Environment**" and select "**Open Editor**". This opens the "**Edit Environment**" screen.

    Optionally, **right** click any value already in the column "**Name**" under "**Lookup Paths**" and select "**Open Editor**". This opens the "**Edit Lookup Path**" screen.

6.  **Select lookup paths to activate** by any of the following methods:
    -   **Tick \(or untick\)** individual lookup paths in the Select column.

        To select a large number of lookup paths in sequence, select the first lookup path and then**hold the Shift key down and select the last lookup path**. All other lookup paths will be deselected when this occurs, so this should be the first action for a complex group of selections.

    -   Click **Select All** or **Deselect All**as required.
7.  At any time during these steps, click the **Refresh** button to reload the data shown in the**Lookup Paths** section. The data can change during your time on this screen, and the **Refresh** button ensures the data displayed is current once more. The Refresh button will remove any ticks present and also remove any results and error messages.
8.  When the appropriate lookup paths are ticked, click **Activate** to start the batch activation.
9.  The column **Result** displays **Pass** or **Fail** or **Load Error**.

    -   **Pass** - means the lookup path is **active** and ready for use.
    -   **Fail** - means the lookup path is inactive. Click on the word **Fail** to highlight that row. The Errors section displays the problems with that lookup path.
    -   **Load Error** - means one or more logical records are inactive. These logical records must be status active for the lookup path to be active. Click on the word **Load Error** to highlight that row. The Errors section displays the inactive logical records causing the problem.
    For errors or messages on this screen, see topic "**Batch Activate Lookup Paths errors**". For a link, see under **Related reference** below.

10. Fix any problems with the relevant lookup paths or logical records by using tasks:

    -   "**Modify lookup paths**"
    -   "**Modify logical records**"
    Links to these task topics are under **Related tasks** below.

    If you use screens in the workbench to fix errors any items that affect lookup paths, return to the Batch Activate Lookup Paths screen to retry the activate again.

11. At any time, you may return to step 1 to try again with the same or different lookup paths.

## 20 Searching in Lookup Paths {#20 .section}

If there is a long list of Lookup Paths, then the list can be searched as follows:

1.  Click inside the list under "**Lookup Paths**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the Lookup Path name.
5.  Click OK to start the search.

If the Lookup Path is found, then you are returned to the list with that Lookup Path highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 50 Fields - Environments section {#50 .section}

|Field|Definition|
|-----|----------|
|Name|The name of the environment selected. \(Display only.\) Sort the drop down list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.|

## 60 Fields - Lookup Paths section {#60 .section}

|Field|Definition|
|-----|----------|
|Select|Tick this box to select this Lookup Path.|
|Result|The result of clicking **Activate**. Values are "**Pass**", "**Fail**", or "**Load Error**". \(Display only.\)|
|Status|The status of that Lookup Path. \(Display only.\)|
|ID|The ID of the Lookup Path. Click on the column heading "**ID**" to sort the list by ID. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|
|Name|The name of the Lookup Path. Click on the column heading "**Name**" to sort the list by Name. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|

## 70 Fields - Errors section {#70 .section}

|Field|Definition|
|-----|----------|
|Errors|Any errors associated with the **Lookup Path highlighted** in the Lookup Path section. Errors depend on the **result** for the highlighted Lookup Path:-   For **Fail result** this field displays the **reasons** this Lookup Path is inactive.
-   For **Load Error result** this field displays the **logical records that are inactive**, where these logical records are necessary for the Lookup Path.

\(Display only.\)For errors or messages on this screen, see topic "**Batch Activate Lookup Paths errors**". For a link, see under **Related reference** below.

|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

