# Generating reports on metadata {#WETGGenReports .task}

Ensure the following:

-   You know the specific metadata item\(s\) for the required report\(s\). This means knowing the name or id of the relevant environment and metadata item\(s\).
-   You have rights to read the metadata item\(s\) given above. System administrators have read rights to all metadata. Environment administrators have read rights to all metadata in the appropriate environment. General users have read rights to metadata depending on the group selected during login. See your system administrator if you require more read rights.

    For more on rights, see help topic "**WE Security overview**". A link to that topic is under **Related concepts** below.

-   Your computer has **Adobe Acrobat Reader** installed, version 9 or higher. This is free software available from **www.adobe.com**.
-   You have **configured** Adobe Acrobat Reader as follows:
    1.  Open Adobe Acrobat Reader
    2.  Click **Edit, Preferences**
    3.  Under "**Categories**", select "**Page Display**".
    4.  For Zoom, select a value that makes a PDF easy to read. A recommended value is "**Fit Width**"
    5.  Click **OK**
    6.  Close Adobe Acrobat Reader

This task does **NOT** generate a **Dependency Checker Report** - for that report see task "**Checking metadata dependencies**". A link to that task is under **Related tasks** below.

This task does **NOT** generate an **Environment Checker Report** - for that report see task "**Finding all environments for a particular a metadata item name**". A link to that task is under **Related tasks** below.

This task allows you to generate any of the following metadata reports:

-   **Environment Security Report** \(By ID or By Name\)
-   **Logical Record Report**
-   **Lookup Path Report**
-   **View Properties Report**
-   **View Column Report**
-   **View Column PIC Report** \(this gives the COBOL PIC clause appropriate for each column in the view\)

You may request more than one item in each report. For example, the Logical Record Report can include multiple logical records.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

1.  Ensure you are logged into the relevant environment with the appropriate rights. For details of rights, see heading "**Before you begin**" above.

2.  In the Navigator, click the type of metadata item \(for example, environment\).

    If the Navigator is not visible, click **Window -\> Show -\> Navigator**.

3.  In the Metadata List, select a required item. If the report is for more than one item of the same type, hold down the **Ctrl key** to select the extra items.

    If the list is long, you can search the list by pressing F3. For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

4.  Once the item\(s\) is selected, choose from the following:

    -   **EITHER** **right** click and select the report,
    -   **OR** click the **down arrow** to the right of ![](images/Icon_Report_01.gif) in the Metadata List and select the report,
    -   **OR** select the "**Reports**" menu and select the report.
5.  You may see an error message that covers the load of that selected item. Such an error ends this procedure. If there is no error message, a new report is generated from the latest data, even if this report is already open in the editor area.

6.  The report displays in Adobe Acrobat Reader. The Acrobat Reader allows printing, saving and other choices.

7.  Click X to close the report.


If you saved the generated report, the PDF file of that report is available when you exit the SAFR Workbench.

For more information on generating these reports, see these topics given in the table below.

|For metadata report ...|see topic ...|
|-----------------------|-------------|
|**Environment Security**|"How do I generate an **Environment Security** Report?"|
|**Logical Record**|"How do I generate a **Logical Record Report** Report?"|
|**Lookup Path**|"How do I generate a **Lookup Path** Report?"|
|**View Properties**|"How do I generate a **View Properties** Report?"|
|**View Column**|"How do I generate a **View Column** Report?"|
|**View Column PIC**|"How do I generate a **View Column PIC** Report?"|

Links to these topics are under **Related reference** below.

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

