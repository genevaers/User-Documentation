# Logical records overview {#SACLogR .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a logical record?](SACLogR.md#10)
-   [20 How do I use a logical record?](SACLogR.md#20)
-   [30 How do I know which logical record to use?](SACLogR.md#30)
-   [40 Logical Record Report](SACLogR.md#40)
-   [50 How do I create or modify a logical record?](SACLogR.md#50)
-   [90 How do I delete a logical record?](SACLogR.md#90)
-   [100 Need more on this page?](SACLogR.md#100)

## 10 What is a logical record? {#10 .section}

A Logical Record can be one of two things:

-   A **record format** for one or more **logical files**
-   The **format of columns** in a report in one or more **views**

![Image](images/LR_Concept_02.gif)

A logical record consists of fields that **may be global fields**.

For further introductions, see:

-   **Logical Files overview**,
-   **Physical Files overview**,
-   **Views overview**,
-   **Global Fields overview**.

Links to these overviews are under **Related concepts** below.

## 20 How do I use a logical record? {#20 .section}

![Image](images/LR_Usage_Rights_02.gif)

All users in that environment can use **logical records in a view**, to describe column headings in a formatted report, as shown in these topics:

-   **Creating views**,
-   **Modifying views**.

Links to these topics are under **Related tasks** below.

Logical records are used in logical files as the record format. For this usage, see heading **How do I create or modify a logical record?** below.

## 30 How do I know which logical record to use? {#30 .section}

Check if you can read logical records as follows: in the **Navigator**, click on "**Logical Records**", and in the **Metadata List** double click on any logical record. If the name is grey then you do not have read access to that logical record.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

**See your system or environment administrator** if you need more access to logical records in your environment, or if you need more logical records created and you do not have the authority to do this yourself.

## 40 Logical Record Report {#40 .section}

To see a **report on selected logical records**, use one of these topics:

-   FAQ topic "**How do I generate a Logical Record Report?**"
-   Task "**Generating reports on metadata**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

## 50 How do I create or modify a logical record? {#50 .section}

![](images/LR_Create_Modify_02.gif)

System administrators and environment administrators can always **create or modify logical records**.

General users can **create or modify logical records** if the group for login has the following authorities:

-   **Create Logical File** permission in the relevant environment \(if required\).
-   **Create Logical Record** permission in the relevant environment.
-   **Create Physical File** permission in the relevant environment \(if required\).
-   **Modify or Delete rights to the relevant logical files** in that environment. \(This allows modify of the logical file itself and the links to physical files.\)
-   **Modify or Delete rights to the logical records** in that environment.
-   **Modify or Delete rights to the relevant physical files** in that environment \(if required\).

For more on these authorities, see topics "**Groups overview**" , "**Groups - advanced overview**" and "**WE Security overview**". Links to these overviews are under **Related concepts** below.

Once the group has the above authorities, users in that group can **create or modify logical records** by using the tasks below, which are **administrator tasks:**

-   **Creating logical files**,
-   **Creating logical records**,
-   **Creating physical files**,
-   **Modifying logical files** \(to modify the logical file itself and the links to physical files\),
-   **Modifying logical records** \(to modify the links between logical files and logical records\),
-   **Modifying physical files**.

Links to these topics are under **Related tasks** below.

## 90 How do I delete a logical record? {#90 .section}

See topic "**Deleting metadata**". A link is under **Related tasks** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

