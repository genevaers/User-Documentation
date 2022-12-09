# Finding and replacing logic text {#WETAFindRepLT .task}

Ensure you know the following:

-   The **component to find** in existing logic text. That component may be an existing metadata item, such as a lookup path, logical file, logical record, physical file or user-exit routine. That component may be a string of text such as a specific value of a product code. You must find all the views that have logic text with that existing component.

    If the component is the name of a metadata item, a simple method to find all the affected views is to use the **Dependency Checker Report**. For details, see topic "**How do I generate a Dependency Checker Report?**" A link to that topic is under **Related reference** below.

-   The **replacement component** for the logic text. The replacement may be a metadata item such as a lookup path, logical file, logical record, physical file or user-exit routine. The replacement may be a string of text such as a new value of a product code.
-   The appropriate **environment** and **views** to search for the logic text to be changed. The views may be selected as one of:

    -   All views for that **environment**
    -   **Specific views chosen** from a list of all views in that environment
    -   All views in one or more **view folders**
    The above selection of views can be **further filtered by date of creation or modification.** For example, select views created before a certain date.


Use this task to find certain logic text in views, and choose where to apply replacement logic text. Only system or environment administrators can perform this task.

For example, the logical record name for a particular logical file may change, so all references in logic text to the old logical record must change to the new logical record. This is a situation to use this task.

Another example is duplicating views for a different time period. Consider a set of views processing data using logic text that contains "**\{Current\_Quarter\} = 01**". These views can be saved with new names \(which copies the view\), and the new views can have updated logic text "**\{Current\_Quarter\} = 02**". This replacement logic text is only applied to the new \(copied\) views, and not to the old views. This example shows that replacement of logic text can apply to selected views, rather than to all views.

1.  Ensure you have all the information listed in **Before You Begin** above.

2.  Do the following:

    -   **EITHER** click **Administration -\> Find/Replace Logic Text** \(for system and environment administrators\),
    -   **OR** click **Components -\> Find/Replace Logic Text** \(for general users\).
3.  This screen has two parts: \(A\) search some group of views for an item of metadata or for some given logic text, and \(B\) update selected views with a replacement metadata item or replacement logic text. For detailed instructions see screen help topic "**Find/Replace Logic Text screen help**". For screen help press F1. Above **Related Topics** click ![](images/Icon_Maximize_01.GIF) to maximize the help and select the topic. To close the help, click X inside the "**Help**" tab.


Any views that receive replacement logic text are updated to status "**Inactive**". To activate a view, see topic "**Modifying views**". Another method to activate views is topic "**Batch activate views**". Links to these topics are under **Related tasks** below.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

