# Logical files overview {#SACLogF .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a logical file?](SACLogF.md#10)
-   [20 How do I use a logical file?](SACLogF.md#20)
-   [30 How do I know which Logical Files to use?](SACLogF.md#30)
-   [50 How do I create or modify a Logical File?](SACLogF.md#50)
-   [90 How do I delete a logical file?](SACLogF.md#90)
-   [100 Need more on this page?](SACLogF.md#100)

## 10 What is a logical file? {#10 .section}

A logical file is a collection of **physical files with the same record layout**.

For example, your company may have **sales files for all 50 states of the USA**. Each sales file is a physical file, and all share the **same record layout in a logical record**. Together all these sales files form one logical file which contains the entire USA sales data for your company.

![](images/LF_Example_02.gif)

Logical files process much faster in SAFR because all the physical files can process in parallel. This is one of the speed advantages of SAFR.

The mandatory requirement is that all physical files in the logical file share the same record layout. The record layout is called a logical record. **Every logical file has at least one logical record.**

![](images/LF_Concept_02.gif)

For an introduction to physical files, see topic "**Physical Files overview**". For an introduction to logical records, see topic "**Logical Records overview**". Links to these overviews are under **Related concepts** below.

## 20 How do I use a logical file? {#20 .section}

All users in that environment can **use logical files in a view**. For more see these topics:

-   "**Views overview**",
-   "**Views - advanced overview**",
-   "**Creating views**",
-   "**Modifying views**".

Links to the two overviews are under **Related concepts** below. Links to the other topics are under **Related tasks** below.

## 30 How do I know which Logical Files to use? {#30 .section}

Check if you can read logical file records as follows: in the **Navigator**, click on "**Logical Files**", and in the **Metadata List** double click on any logical file. If the name is grey then you do not have read access to that logical file.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

**See your system or environment administrator** if you need more access to logical files in your environment, or if you need more logical files created and you do not have the authority to do this yourself.

## 50 How do I create or modify a Logical File? {#50 .section}

![](images/LF_Create_Modify_02.gif)

System administrators and environment administrators can always **create or modify logical files**.

General users can **create or modify logical files** if the group for login has the following authorities:

-   **Create Logical File** permission in the relevant environment,
-   **Create Logical Record** permission in the relevant environment \(if required\),
-   **Create Physical File** permission in the relevant environment \(if required\),
-   **Modify or Delete rights to a particular logical file\(s\)** in that environment. \(This allows modify of the logical file itself and the links to physical files\),
-   **Modify or Delete rights to a relevant logical record\(s\)** in that environment \(if required\),
-   **Modify or Delete rights to a relevant physical file\(s\)** in that environment \(if required\).

For more on these authorities, see topics "**Groups overview**" , "**Groups - advanced overview**" and "**WE Security overview**". Links to these overviews are under **Related concepts** below.

Once the group has above authorities, users in that group can **create or modify logical files** by using the tasks below, which are **administrator tasks:**

-   "**Creating logical files**",
-   "**Creating logical records**",
-   "**Creating physical files**",
-   "**Modifying logical files**" \(to modify the logical file itself and the links to physical files\),
-   "**Modifying logical records**" \(to modify the links between logical files and logical records\),
-   "**Modifying physical files**".

Links to these topics are under **Related tasks** below.

## 90 How do I delete a logical file? {#90 .section}

See topic "**Deleting metadata**". A link is under **Related tasks** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

