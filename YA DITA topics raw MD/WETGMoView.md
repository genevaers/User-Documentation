# Modifying views {#WETGMoView .task}

To delete a view, see task "**Deleting metadata**". A link to this topic is under **Related tasks** below.

Ensure you have the following information:

-   The **environment** for the view.
-   The **name** of the view.
-   The **view folder** that contains that view.
-   Details of the changes required.

For an introduction to views, see topic "**Views overview**". A link to this topic is under **Related concepts** below.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

If many items of logic text need to be updated covering many views, see task "**Finding and replacing logic text**". A link to that topic is under **Related tasks** below.

System and environment administrators can always perform this task. General users can save a view if the group selected during login has at least the modify right to the relevant view folder that contains the view. See your system administrator if you require more rights.

For more on rights, see help topic "**WE Security overview**". A link to that topic is under **Related concepts** below.

The objective of this help topic is an modify a view to result in an active view, because only active views can produce results in the SAFR Performance Engine.

An overview of modifying a view is as follows:

-   A view is displayed in two large tabs. The first large tab is the "**View Properties**" tab which has sub-tabs of "**General**", "**Extract Phase**" and other possible sub-tabs. When the "**View Properties**" tab is displayed, click on a sub-tab to display the content of the sub-tab. The second large tab is the "**View Editor**" tab which has the columns for the view output. The "**View Editor**" tab can be also called the "grid" because of the display of the columns. Only one large tab is displayed at a time. To switch between the large tabs click button ![](images/Icon_Show_Grid_Props_01.gif) \(the **Show Grid / Properties** button\) or press F9 or select **Edit -\> Show Grid/Properties**.
-   **Modify and save values** in the view that reflect the desired output. When you save, there are **validations** of the values, and any validation error prevents the save. For example, there must be a unique view name. Once any validation errors are fixed, clicking save is successful.
-   **Activate the view.** When you modify any value in an existing saved active view, then when you click or tab away from the modified field the heading of the screen changes to "**Edit View - \[Inactive\]**". The view must be **activated** to change the status to **Active**.

    The attempt to activate a view may produce activation errors that need to be fixed. For example, the view columns must have at least one sort key and there must be at least one view source, even though the view can be saved without them. Once all activation errors are fixed, the screen heading changes to say **Active**.


1.  Ensure you are logged into the environment that contains the view.

2.  If you know a view id number to edit, do the following:

    1.  EITHER click **File -\> Open View** OR press **Ctrl+O** to display the **Open View** screen.
    2.  Type the view id number and press OK.
    3.  Go to step 5 below.
    If you do not know a view id number, go to the Navigator and open **View Folders** \(if it is not already open\).

    If the Navigator is not visible, click **Window -\> Show -\> Navigator**.

3.  In the Navigator, select a view folder.

4.  In the Metadata List, double click the view to edit. If the list is long, you can search the list. This is done by clicking in the Metadata List table and pressing F3. For more about this searching, see topic "**Searching lists of metadata**".

5.  Remember to switch between the large tabs "**View Editor**" \(which has a grid for the columns\) and "**View Properties**" by clicking![](images/Icon_Show_Grid_Props_01.gif) \(the **Show Grid / Properties** button\) or press F9 or select **Edit -\> Show Grid/Properties**.

6.  Most of the instructions to modify a view are contained in screen help topics. For example, the View Editor tab is covered in topic "**Edit View \(View Editor tab\) screen help**". For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select a topic. To close the help, click X inside the "**Help**" tab.

7.  After entering or modifying values, **save the view** as follows:

    1.  Do the following:

        -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
        -   **OR** select **File, Save**,
        -   **OR** press **Ctrl+S**.
        If the options above are grey, you only have the read right to the view folder. See your administrator to obtain the modify right to the view folder, which allows saving of the view.

    2.  If there are no errors, then Steps 6 and 7 are complete. If errors are displayed, then you must fix these errors.

        Help with error messages is available in topic "**Edit View errors**". A link to this topic is under **Related reference** below.

    3.  Once all save errors are fixed, return to step **7a** above to complete the save.
8.  **Activate the view** as follows:

    1.  Do the following:
        -   **EITHER** click ![](images/Icon_VEditor_ActivInact_View_01.gif). If this button is **grey**, then this indicates that the view is not yet complete enough for activation to be possible. You must check a view source is defined, and view output is defined and columns are defined in the View Editor tab.
        -   **OR** press **F5**. If nothing happens, then this indicates that the view is not yet complete enough for activation to be possible. You must check a view source is defined, and view output is defined and columns are defined in the View Editor tab.
        -   **OR** click **Action -\> Activate/Inactivate View**. If this menu item is **grey**, then this indicates that the view is not yet complete enough for activation to be possible. You must check a view source is defined, and view output is defined and columns are defined in the View Editor tab.
    2.  If there are no errors, then the heading changes to **\[Active\]** and Step 8 is complete. You may see display of some view activation errors.

        Help with activation error messages is available in topic "**View Activation Errors message help**". A links to this topics is under **Related reference** below.

        To fix activation errors, see topic "**Edit View \(View Editor tab\) screen help**". A link to this topic is under **Related reference** below.

    3.  Once activation errors are fixed return to Step **8a** to attempt activation again.
9.  Save the view as shown in step 7a, even if the status is **Inactive**.


This task can be repeated as many times as required. Ensure the view has status **Active** before running the SAFR Performance Engine to produce results.

To see a **report on selected views**, use one of these topics:

-   FAQ topic "**How do I generate a View Properties Report?**"
-   FAQ topic "**How do I generate a View Column Report?**"
-   FAQ topic "**How do I generate a View Column PIC Report?**"
-   Task "**Generating reports on metadata**"

Links to the FAQ topics are under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

