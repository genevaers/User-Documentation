# How do I generate a Logical Record Report? {#WERFaq5GenRptLogR .reference}

![](images/Report_LogicalRecord_03.gif)

This metadata report can cover selected logical records. The above example covers only one logical record.

System and environment administrators can always generate this report. General users can generate this report if the **group selected during login** has **read** rights to the specific logical record items.

## Procedure - generate the Logical Record Report {#OverviewAction .section}

Do the following:

1.  Ensure you know the **name or id** of the relevant logical record\(s\).
2.  **Ensure you have rights to read the relevant logical record\(s\)**. System and environment administrators always have read rights. General users have read rights depending on the group selected during login. See your system or environment administrator if you require more read rights.
3.  Ensure you are logged into the relevant environment.
4.  In the Navigator, click "**Logical Records**". If the Navigator is not visible, click **Window -\> Show -\> Navigator**.
5.  In the Metadata List, select a required logical record. If the report is for more than one logical record, hold down the **Ctrl key** to select the extra logical record\(s\).

    If the list is long, you can search the list by pressing F3. For more about this searching, read task "**Searching lists of metadata**".

6.  Once the logical record\(s\) is selected,
    -   **EITHER** **right** click and select the **Logical Record Report**,
    -   **OR** click the **down arrow** to the right of ![](images/Icon_Report_01.gif) in the Metadata List and select the **Logical Record Report**,
    -   **OR** select the "**Reports**" menu and select **Logical Record Report**.
7.  A new report is generated from the latest data, even if this report is already open in the editor area.
8.  The report displays in Adobe Acrobat Reader. The Acrobat Reader allows printing, saving and other choices.
9.  Click X to close the report.

## Fields - Logical Record Report {#FieldsSearchCrit .section}

|Field|Definition|
|-----|----------|
|ID|Identification number for this logical record field.|
|Field Name|Name of this logical record field.|
|Start Pos|Start position of this logical record field.|
|Redef \(R\)|"R" indicates the logical record field redefines the previous field.|
|PK \(P\)|"P" indicates the logical record field is a primary key.|
|Data Type|The data type of the logical record field.|
|Length|The length of the logical record field.|
|Decimal|The number of decimal places in this logical record field.|
|Content|The date/time format of this logical record field.|

**Parent topic:**[FAQ for WE](../html/SARFaqWE.md)

