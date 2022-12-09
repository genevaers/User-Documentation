# Physical files overview {#SACPhysFile .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a physical file?](SACPhysFile.md#10)
-   [20 How do I use a physical file?](SACPhysFile.md#20)
-   [30 How do I know which physical file to use?](SACPhysFile.md#30)
-   [50 How do I create or modify a physical file?](SACPhysFile.md#50)
-   [90 How do I delete a physical file?](SACPhysFile.md#90)
-   [100 Need more on this page?](SACPhysFile.md#100)

## 10 What is a physical file? {#10 .section}

A physical file is something on your mainframe system. A physical file can be any of the following:

-   A **disk file** \(this includes DB2 tables\),
-   A **pipe** - see topic "**Pipes overview**",
-   A **token** - see topic "**Tokens overview**",
-   A **tape file**.

Links to the two overview topics are under **Related concepts** below.

A physical file is not used directly in a view. Instead, a physical file is associated with at least one logical file. One physical file can be associated with many logical files, and one logical file can be associated with many physical files. The record format of the logical file \(and any associated physical files\) is given by one or more logical records. A view can use a logical file directly, but not a physical file.

![](images/PF_Concept_02.gif)

If the physical file is a pipe or token, then the physical file can only be associated with one logical file, as indicated above.

Also shown above, a physical file can be associated with one read user-exit routine.

For more on all of the above, see these topics:

-   "**Logical files overview**",
-   "**Logical records overview**",
-   "**Pipes overview**"
-   "**Tokens overview**"
-   "**User-Exit Routines overview**"
-   "**Views overview**",
-   "**Views - advanced overview**".

Links to these overviews are under **Related concepts** below.

## 20 How do I use a physical file? {#20 .section}

A physical file is used when the associated logical file is used in a view or a lookup path. To ensure a physical file is used, ensure the physical file is associated with at least one logical file.

The association between the physical file and one or more logical files is controlled by the logical file. See these topics:

-   "**Creating logical files**",
-   "**Modifying logical files**".

Links to these topics are under **Related tasks** below.

For access rights to logical files, see the heading "**How do I create or modify a physical file?**" below.

A physical file is indirectly used in a view, when the view includes the logical file associated with the physical file. All users in that environment can use **logical files in a view**. For more see these topics:

-   "**Creating views**",
-   "**Modifying views**".

Links to these topics are under **Related tasks** below.

## 30 How do I know which physical file to use? {#30 .section}

**See your system or environment administrator** for advice on physical files in your environment.

## 50 How do I create or modify a physical file? {#50 .section}

![](images/PF_Create_Modify_02.gif)

System administrators and environment administrators can always **create or modify physical files** and the other items above.

General users can **create or modify physical files** if the group for login has the following authorities:

-   **Create Logical File** permission in the relevant environment \(if required\).
-   **Create Logical Record** permission in the relevant environment \(if required\).
-   **Create Physical File** permission in the relevant environment.
-   **Modify or Delete rights to this particular logical file** in that environment \(if required - this allows modify of the logical file itself and links to physical files.\)
-   **Modify or Delete rights to the relevant logical records** in that environment \(if required\).
-   **Modify or Delete rights to the relevant physical files** in that environment.

For more on these authorities, see topics "**Groups overview**" , "**Groups - advanced overview**" and "**WE Security overview**". Links to these overviews are under **Related concepts** below.

Once the group has the above authorities, general users in that group can **create or modify physical files** by using the tasks below, which are **administrator tasks:**

-   "**Creating logical files**",
-   "**Creating logical records**",
-   "**Creating physical files**",
-   "**Modifying logical files**" \(if required to modify the logical file itself and the links to physical files\),
-   "**Modifying logical records**" \(if required to modify the links between logical files and logical records\),
-   "**Modifying physical files**".

Links to these topics are under **Related tasks** below.

## 90 How do I delete a physical file? {#90 .section}

See topic "**Deleting metadata**". A link is under **Related tasks** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

