# Control records overview {#SACCtrlRec .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a control record?](SACCtrlRec.md#10)
-   [15 VDP can override fiscal values in a control record](SACCtrlRec.md#15)
-   [20 How do I use a control record?](SACCtrlRec.md#20)
-   [30 How do I know which control record to use?](SACCtrlRec.md#30)
-   [50 How do I create or modify a control record?](SACCtrlRec.md#50)
-   [90 How do I delete a control record?](SACCtrlRec.md#90)
-   [100 Need more on this page?](SACCtrlRec.md#100)

## 10 What is a control record? {#10 .section}

A control record contains data that affects financial reporting in a view.

![](images/CR_Concept_02.gif)

A control record can be used in multiple views. An environment must have at least one control record, and can have many control records \(one for each variation of financial reporting required\).

The **most important** fields in a control record are:

|Field|Definition|
|-----|----------|
|Maximum Extract File Number|The maximum number of extract files that can be created in the Extract Phase. Must be greater than zero and up to nine digits.|
|First Fiscal Month|The calendar month in which the fiscal year starts. A number in the range one to 12, representing the months January to December. \(Optional.\)|
|Beginning Period|A month numbered from zero to 11. This is an alternative to First Fiscal Month which is from one to 12. \(Optional.\)|
|Ending Period|A month numbered from zero to 11. Must be larger than Beginning Period, if set. \(Optional.\)|

## 15 VDP can override fiscal values in a control record {#15 .section}

A view specifies a control record, and so the values in the control record normally apply to that view.

The VDP for a view can override the fiscal values in a control record. In those cases the view ignores the fiscal values in the control record and uses the VDP fiscal values.

For more, see the \[FISCAL DATES\] section in the configuration file for MR90 in as given in topic "**Program Runbook: MR90 Logic Table Generator**". A link to that overview is under **Related reference** below.

## 20 How do I use a control record? {#20 .section}

![](images/CR_Usage_Rights_02.gif)

Select a control record in **views** you are working on. To learn more about views, read these topics:

-   **Views overview**
-   **Views - advanced overview**
-   **Creating views**
-   **Modifying views**

Links to the overviews are under **Related concepts** below. Links to the other topics are under **Related tasks** below.

## 30 How do I know which control record to use? {#30 .section}

All users can read control records, to see the values. In the **Navigator**, click on "**Control Records**", and in the **Metadata List** double click on any control record.

See your system or environment administrator also if the environment needs an extra control record.

## 50 How do I create or modify a control record? {#50 .section}

![](images/CR_Create_Modify_02.gif)

Only system and environment administrators can create or modify control records - see these topics:

-   **Creating control records**
-   **Modifying control records**

Links to these topics are under **Related tasks** below.

For a complete discussion of security, see topic "**WE Security overview**". A link is under **Related concepts** below.

## 90 How do I delete a control record? {#90 .section}

See topic "**Deleting metadata**". A link is under **Related tasks** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

