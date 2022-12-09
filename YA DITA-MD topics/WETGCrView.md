# Creating views {#WETGCrView .task}

Ensure you know the following:

-   The appropriate **environment** and **view folder** for the view.
-   The **input data** required. For example, there may be input logical files for transactions and reference data.
-   The **output data** required. For example, the output may be a **report or updated logical file**. There are **columns \(fields\) of data** required in all these outputs. There may be **sort keys** and each key may have a **sort key title**.
-   Any requirements for:
    -   Lookup paths,
    -   User-exit routines,
    -   Global fields.

For an introduction to views, see topic "**Views overview**". A link to this topic is under **Related concepts** below.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

System and environment administrators can always perform this task. General users can save a view if the group selected during login has at least modify rights to the relevant view folder for the new view. See your system administrator if you require more rights.

For more on rights, see help topic "**WE Security overview**". A link to that topic is under **Related concepts** below.

The objective of this topic is an active view, because only active views can produce results in the SAFR Performance Engine.

An overview of creating a view is as follows:

-   A view is displayed in two large tabs. The first large tab is the "**View Properties**" tab which has sub-tabs of "**General**", "**Extract Phase**" and other possible sub-tabs. When the "**View Properties**" tab is displayed, click on a sub-tab to display the content of the sub-tab. The second large tab is the "**View Editor**" tab which has the columns for the view output. The "**View Editor**" tab can be also called the "grid" because of the display of the columns. Only one large tab is displayed at a time. To switch between the large tabs click button ![](images/Icon_Show_Grid_Props_01.gif) \(the **Show Grid / Properties** button\) or press F9 or select **Edit -\> Show Grid/Properties**.
-   **Save values** in the view that reflect the desired output. When you save, there are **validations** of the values, and any validation error prevents the save. For example, there must be a unique view name. Once any validation errors are fixed, clicking save is successful.
-   **Activate the view.** When the view is first created the heading of the screen says "**New View - \[Inactive\]**". If you modify any value in an existing saved active view, then when you click or tab away from the modified field the heading of the screen changes to "**Edit View - \[Inactive\]**". The view must be **activated** to change the status to **active**.

    The attempt to activate a view may produce activation errors that need to be fixed. For example, the view columns must have at least one sort key and there must be at least one view source, even though the view can be saved without them. Once all activation errors are fixed, the screen heading changes to say **\[Active\]**.


1.  Ensure you are logged into the relevant environment for the new view.

2.  Verify you have all the information you need. See the list under heading "**Before You Begin**" above.

3.  Do the following:

    -   **EITHER** click the **arrow beside**![](images/Icon_New_08.GIF) \(the new icon\) and select **View**,
    -   **OR** click **Administration -\> New -\> View** \(for system administrators and environment administrators\),
    -   **OR** click **Components -\> New -\> View** \(for general users\),
    -   **OR** ensure the relevant view folder is highlighted in the Navigator and click **Ctrl+N** \(for any user\).
    When creating or editing a view, if you open a list and cannot see the required items such as logical records or logical files, see your system administrator.

4.  Remember to switch between the large tabs "**View Editor**" \(which has a grid for the columns\) and "**View Properties**" by clicking![](images/Icon_Show_Grid_Props_01.gif) \(the **Show Grid / Properties** button\) or press F9 or select **Edit -\> Show Grid/Properties**.

5.  Most of the instructions to create a view are contained in screen help topics. For example, the View Editor tab is covered in topics "**New View \(View Editor tab\) screen help**" and "**Edit View \(View Editor tab\) screen help**". For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select a topic. To close the help, click X inside the "**Help**" tab.

6.  After entering or modifying values, **save the view** as follows:

    1.  Do the following:
        -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
        -   **OR** select **File, Save**,
        -   **OR** press **Ctrl+S**.
    2.  If there are no errors, then Step 6 is complete. If errors are displayed, then you must fix these errors.

        Help with error messages is available in topics "**New View errors**" and "**Edit View errors**". Links to these topics are under **Related reference** below.

    3.  Once all save errors are fixed, return to step **6a** above to complete the save.
7.  **Activate the view** as follows:

    1.  Do the following:
        -   **EITHER** click ![](images/Icon_VEditor_ActivInact_View_01.gif). If this button is **grey**, then this indicates that the view is not yet complete enough for activation to be possible. You must check a view source is defined, and view output is defined and columns are defined in the View Editor tab.
        -   **OR** press **F5**. If nothing happens, then this indicates that the view is not yet complete enough for activation to be possible. You must check a view source is defined, and view output is defined and columns are defined in the View Editor tab.
        -   **OR** click **Action -\> Activate/Inactivate View**. If this menu item is **grey**, then this indicates that the view is not yet complete enough for activation to be possible. You must check a view source is defined, and view output is defined and columns are defined in the View Editor tab.
    2.  If there are no errors, then the heading changes to **\[Active\]** and Step 7 is complete. You may see display of some view activation errors.

        Help with activation error messages is available in topic "**View Activation Errors message help**". A links to this topics is under **Related reference** below.

        To fix activation errors, see topics "**New View \(View Editor tab\) screen help**" and "**Edit View \(View Editor tab\) screen help**". Links to these topics are under **Related reference** below.

    3.  Once activation errors are fixed return to Step **7a** to attempt activation again.
8.  Once the view is "Active", repeating step 7 inactivates the view.


After the view is created, changes can be made to the view as required using topic "**Modifying views**". A link to this topic is under **Related tasks** below.

Ensure the view has status active before running the SAFR Performance Engine to produce results. Talk to your system administrator if you need help running the SAFR Performance Engine.

To see a **report on selected views**, use one of these topics:

-   FAQ topic "**How do I generate a View Properties Report?**"
-   FAQ topic "**How do I generate a View Column Report?**"
-   FAQ topic "**How do I generate a View Column PIC Report?**"
-   Task "**Generating reports on metadata**"

Links to the FAQ topics are under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

