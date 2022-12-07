# How do I generate a Dependency Checker Report? {#WERFaqAGenDependCheck .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Introduction to a Dependency Checker Report](WERFaqAGenDependCheck.md#02)
-   [10 Initial setup: configure Adobe Acrobat Reader](WERFaqAGenDependCheck.md#10)
-   [15 Errors](WERFaqAGenDependCheck.md#15)
-   [20 Procedure - generate the Dependency Checker Report](WERFaqAGenDependCheck.md#20)
-   [30 The Dependency Tree](WERFaqAGenDependCheck.md#30)
-   [50 Fields - Dependency Checker screen](WERFaqAGenDependCheck.md#50)
-   [60 Fields - Dependency Checker Report - Header](WERFaqAGenDependCheck.md#60)
-   [70 Fields - Dependency Checker Report - Dependency Tree](WERFaqAGenDependCheck.md#70)
-   [80 Fields - Dependency Checker Report - Footer](WERFaqAGenDependCheck.md#80)
-   [90 Format of the CSV file](WERFaqAGenDependCheck.md#90)
-   [95 Example of CSV file](WERFaqAGenDependCheck.md#95)
-   [99 Keyboard Shortcuts](WERFaqAGenDependCheck.md#99)

## 02 Introduction to a Dependency Checker Report {#02 .section}

![](images/DepCheck_PDF_Devl_Field_City_03.gif)

This report shows the dependencies for one specific metadata item. The report can focus on a metadata item of the following types:

-   Logical Record \(LR\) Field,
-   Global Field,
-   Logical File,
-   Logical Record,
-   Lookup Path,
-   Physical File,
-   User-Exit Routine,
-   View.

System and environment administrators can always generate this report for a specific metadata item \(that is one of the above types\) in any environment. General users can generate this metadata report if the **group selected during login** has at least the **read** right to the environment of the metadata item. See your system administrator if you require more rights.

The Dependency Checker Report can be **viewed on the screen or stored as a PDF file** for viewing in Adobe Acrobat Reader. Viewing reports as a PDF file requires once only setup of the Adobe Acrobat Reader - see below.

## 10 Initial setup: configure Adobe Acrobat Reader {#10 .section}

## 15 Errors {#15 .section}

For errors or messages on this screen, see topic "**Dependency Checker errors**". For a link, see under **Related reference** below.

## 20 Procedure - generate the Dependency Checker Report {#20 .section}

![](images/DepCheck_Scrn_Devl_Field_City_02.gif)

Do the following:

1.  Ensure you know the specific metadata item. This means knowing the **metadata name or id** and the type of metadata item \(e.g. logical file\).
2.  **Ensure you have the read right to the environment of the metadata item**. System and environment administrators always have read rights. General users have read rights depending on the group selected during login. A general user may be required to login into a different group and environment - see task "**Return to login**". See your system administrator if you require read rights to more environments.
3.  Click "**Reports -\> Dependency Checker...**".
4.  Select an **environment** from the drop down list. System administrators can select any environment. General users and environment administrators can choose only from the environments associated with group selected during login.
5.  Select a **component type** from the drop down list.
6.  If the component type is **LR Field**, the screen displays radio buttons for "**Show All LR Fields**" and "**Show LR Fields only from the following LR**". There is also a drop down list below the second radio button.

    The radio button "**Show All LR Fields**" changes the drop down list "**Component**" to show every LR \(Logical Record\) field in the environment selected above.

    The radio button "**Show LR Fields only from the following LR**" allows choosing one logical record from the drop down list immediately below. This changes the drop down list "**Component**" to show only the LR fields from the selected logical record.

7.  Select a particular metadata item from the drop down list "**Component**".

    Optionally, **right** click any value already in the field "**Component**" and select "**Open Editor**". This opens the editor screen for that component.

8.  Click **Check** to view the Dependency Checker Report for this metadata item under **Dependency Tree** at right. For more on navigating this tree, see section "**The Dependency Tree**" below.
9.  Optionally, click **Export as Report** and click the **Export** button to create a PDF file containing the Dependency Tree as displayed. This means that if you expand or close various parts of the tree, the PDF file created is different. If a PDF file of this report is already open when you click **Export**, the old PDF file is closed and the newly generated PDF file is opened. The report displays in Adobe Acrobat Reader. The Acrobat Reader allows printing, saving and other choices. Click X to close the report. Note that once the PDF file is saved to a location on disk, you can view and print the PDF file outside the Workbench.
10. Optionally, click **Export as CSV file** and \(if required\) **modify the location text field** underneath. You must provide a valid location \(folder name\) which includes the drive letter. If the folder is a new name, then the folder will be created when you click the Export button. The location specifies the path where the CSV file is stored. Optionally click **Browse...** to navigate to an existing location. Once the location is appropriate, click the **Export** button to create a CSV file in the given location containing the Dependency Tree as displayed. This means that if you expand or close various parts of the tree, the CSV file created is different.

For errors or messages on this screen, see topic "**Dependency Checker errors**". For a link, see under **Related reference** below.

## 30 The Dependency Tree {#30 .section}

Click ![](images/Icon_Plus_01.gif) to expand parts of the dependency tree. Click ![](images/Icon_Minus_01.gif) to close the structure underneath.

The **nodes** in the Dependency Tree that can be expanded or close are one of these items:

-   Metadata types,
-   Dependency usage types,
-   Specific metadata items.

The **metadata types** are:

-   Logical Record \(LR\) Field,
-   Global Field,
-   Logical File,
-   Logical Record,
-   Lookup Path,
-   Physical File,
-   User-Exit Routine,
-   View.

The **dependency usage types** are:

-   **Source** \(used in a Lookup Path or View\),
-   **Target** \(used in a Lookup Path Target\),
-   **Output** \(used in a View\),
-   **Logic Text** \(used in a View\),
-   **Effective Date**,
-   **Sort Key Title** \(used in a View\),
-   **Properties** \(used in a View\).

**Specific metadata items** are shown in format: **name\[id\]** for example **Customers\[652\].**

**Right** click on any **specific metadata item** in the Dependency Tree and select "**Open Editor**". This opens the editor for that component.

**Double click on a metadata item in the dependency tree to create a new sub-tree under that item.** A new sub-tree does not occur of a metadata item is already displayed higher in the dependency tree. If you do see a sub-tree, you can expand the sub-tree by clicking ![](images/Icon_Plus_01.gif). Any metadata items in the sub-tree are also opportunities to double click.

## 50 Fields - Dependency Checker screen {#50 .section}

|Field|Definition|
|-----|----------|
|Environment|Select from the drop down list of environments. System administrators always see a list of all environments. General users and environment administrators see a list of environments associated with the group selected during login.|
|Component Type|Select from the drop down list. Values are LR Field, Global Field, Logical File, Logical Record, Lookup Path, Physical File, User-Exit Routine, View.|
|Show All LR Fields|This radio button appears only for Component Type of Logical Record \(LR\) Field. Select this button to populate Component below with every LR Field in the environment selected above.|
|Show LR Field only from the following LR|This radio button appears only for Component Type of Logical Record \(LR\) Field. Select this button to populate Component below with only the LR fields in the logical record selected. The drop down list contains all logical records in the environment selected.|
|Component|Select from the drop down list. Components are metadata item names and ids that satisfy the fields given above.|
|Export as Report|Click this radio button and click the **Export** button to create a PDF file containing the Dependency Tree as displayed. This means that if you expand or close various parts of the tree, the PDF file created is different. The report displays in Adobe Acrobat Reader. The Acrobat Reader allows printing, saving and other choices. Click X to close the report. Note that once the PDF file is saved to a location on disk, you can view and print the PDF file outside the Workbench.|
|Export as CSV file|Click this radio button and click the **Export** button to create a CSV file containing the Dependency Tree as displayed. This means that if you expand or close various parts of the tree, the CSV file created is different. The CSV file is stored at the location given in the next field below.|
|Location|Text field underneath the radio button "**Export as CSV file**". This Location field specifies a valid directory path where a CSV file can be stored. Optionally, type the value of the location. An alternative is to click **Browse...** which displays the "**Browse to Folder**" screen, where you can navigate to the path or click the **Make New Folder** button. There is a default value in the Location field that can be changed by either of these two methods.When the "**Export as CSV file**" radio button is selected, click the **Export** button to create a CSV file of the current Dependency Tree in the location given. If the location does not exist, then clicking **Export** creates that path.

|

## 60 Fields - Dependency Checker Report - Header {#60 .section}

|Field|Definition|
|-----|----------|
|Environment|Name and id number of the environment for the metadata item for this report.|
|Component Type|Type of metadata item for this report.|
|Component|Name and id number of the metadata item for this report.|

## 70 Fields - Dependency Checker Report - Dependency Tree {#70 .section}

|Field|Definition|
|-----|----------|
|Node in the tree|The **nodes** in the Dependency Tree that can be expanded or close are one of these items:

 -   Metadata types,
-   Dependency usage types,
-   Specific metadata items.

 The **metadata types** are:

 -   LR Field,
-   Global Field,
-   Logical File,
-   Logical Record,
-   Lookup Path,
-   Physical File,
-   User-Exit Routine,
-   View.

 The **dependency usage types** are:

 -   **Source** \(used in a Lookup Path or View\),
-   **Target** \(used in a Lookup Path Target\),
-   **Output** \(used in a View\),
-   **Logic Text** \(used in a View\),
-   **Effective Date**,
-   **Sort Key Title** \(used in a View\),
-   **Properties** \(used in a View\).

 **Specific metadata items** are shown in format: **name\[id\]** for example **Customers\[652\].**

 **Double click on a metadata item in the dependency tree to create a new sub-tree under that item.** A new sub-tree does not occur of a metadata item is already displayed higher in the dependency tree. If you do see a sub-tree, you can expand the sub-tree by clicking ![](images/Icon_Plus_01.gif). Any metadata items in the sub-tree are also opportunities to double click.

|

## 80 Fields - Dependency Checker Report - Footer {#80 .section}

|Field|Definition|
|-----|----------|
|Date and time|Date and time the report was generated.|
|Number / Number|Page number / Total number of pages|

## 90 Format of the CSV file {#90 .section}

The CSV file exported for the dependency tree is in below format:

|Sequence|Level|Component Type|Usage|ID|Name|
|--------|-----|--------------|-----|--|----|
|1 to N|0 to N|-   Global Field
-   User-Exit Routine
-   Physical File
-   Logical File
-   Logical Record
-   LR Field
-   Lookup Path
-   View

|-   Effective Date
-   Logic Text
-   Source
-   Output
-   Target
-   Sort Key Title
-   Properties

| | |

Each item listed in the CSV file refers to a **component node** in the Dependency Tree - see section "**Dependency Tree**" above.

**Sequence** is the sequence in which the component nodes appear in the GUI or PDF dependency tree.

**Level** is the level of the component node within the tree, starting with 0 as the root node. The Level number relates to the hierarchy of component nodes only \(it ignores Component Type nodes and Usage Type nodes which are not included in calculating the Level\).

**Component Type** gives the type of the component node in the Dependency Tree.

**Usage** describes the dependency usage type. In some cases this field is blank.

**ID** is the ID for the component node in the Dependency Tree.

**Name** is the name for the component node in the Dependency Tree.

## 95 Example of CSV file {#95 .section}

This help topic displays a Dependency Checker report for the LR Field "City". The CSV file for this report is displayed below:

![](images/DepCheck_CSV_Devl_Field_City_02.gif)

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[FAQ for WE](../html/SARFaqWE.md)

