# Checking metadata dependencies {#WETACheckMDepend .task}

Ensure you know the following:

-   The specific metadata item and the relevant environment.
-   You have read rights to the relevant environment. System administrators always have read rights. Environment administrators and general users have read rights to environments depending on the group selected during login. See your system administrator if you require read rights to more environments.
-   If you require a PDF report, ensure your computer has **Adobe Acrobat Reader** installed, version 9 or higher. This is free software available from **www.adobe.com**.
-   If you require a PDF report, ensure you have **configured** Adobe Acrobat Reader as follows:
    1.  Open Adobe Acrobat Reader
    2.  Click **Edit, Preferences**
    3.  Under "**Categories**", select "**Page Display**".
    4.  For Zoom, select a value that makes a PDF easy to read. A recommended value is "**Fit Width**"
    5.  Click **OK**
    6.  Close Adobe Acrobat Reader

This task shows the dependencies for a metadata item inside one environment, which is useful when considering the delete of that metadata item.

The idea of "dependency" works in both directions - what depends on an item and what an item depends on.

For example, a Logical Record \(LR\) **field** always depends on a logical record that the field belongs to. A view depends on an LR field when the view refers to an LR field in a logical record for a source logical file. The LR field can be thought of as depending on the logical record, and the view can be thought of as depending on the LR field.

Both these cases of dependency are included in the results of this task.

For more on deleting an item of metadata, see task "**Deleting metadata**". A link to that topic is under **Related tasks** below.

1.  Click "**Reports -\> Dependency Checker...**".

2.  Select an **environment** from the drop down list. System administrators can select any environment. Environment administrators and general users can choose only from the environments associated with the group selected during login. A general user may be required to login into a different group and/or environment - see task "**Return to login**".

3.  Select a **component type** from the drop down list.

4.  If the component type is **LR Field**, the screen displays radio buttons for "**Show All LR Fields**" and "**Show LR Fields only from the following LR**". There is also a drop down list below the second radio button.

    -   The radio button "**Show All LR Fields**" changes the drop down list "**Component**" to show every LR \(Logical Record\) field in the environment selected above.
    -   The radio button "**Show LR Fields only from the following LR**" allows choosing one logical record from the drop down list immediately below. This changes the drop down list "**Component**" to show only the LR fields from the selected logical record.
5.  Select a particular metadata item from the drop down list "**Component**".

6.  Click **Check** to view the Dependency Checker Report for this metadata item under **Dependency Tree** at right. Navigate the tree as follows:

    -   Click ![](images/Icon_Plus_01.gif) to expand parts of the dependency tree.
    -   Click ![](images/Icon_Minus_01.gif) to close the structure underneath.
    -   **Specific metadata items** are shown in format: **name\[id\]** for example Customers\[652\]. **Double click on a metadata item in the dependency tree to create a new sub-tree under that item.** A new sub-tree does not occur of a metadata item is already displayed higher in the dependency tree. Expand a sub-tree by clicking ![](images/Icon_Plus_01.gif). Any metadata items in the sub-tree are also opportunities to double click.
7.  Optionally, click **Export as Report** and click the **Export** button to create a PDF file containing the Dependency Tree as displayed. This means that if you expand or close various parts of the tree, the PDF file created is different. The report displays in Adobe Acrobat Reader. The Acrobat Reader allows printing, saving and other choices. Click X to close the report. Note that once the PDF file is saved to a location on disk, you can view and print the PDF file outside the workbench.

8.  Optionally, click **Export as CSV file** and **modify the location text field** underneath. The location specifies the path where the CSV file is stored. Optionally click **Browse...** to navigate to the location instead of typing the location. Once the location is appropriate, click the **Export** button to create a CSV file in the given location containing the Dependency Tree as displayed. This means that if you expand or close various parts of the tree, the CSV file created is different.


For more on generating this report, see "**How do I generate a Dependency Checker Report?**" A link to this topic is under **Related reference** below.

If you exported either a PDF file or a CSV file to a folder, then those files are available in that folder when you exit the SAFR Workbench.

**Parent topic:**[Workbench Administrators Guide](../html/AAR582WEAdmin.md)

