# Global fields overview {#SACGlobFld .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a global field?](SACGlobFld.md#10)
-   [20 How do I use a global field?](SACGlobFld.md#20)
-   [30 How do I know which global field to use?](SACGlobFld.md#30)
-   [50 How do I create or modify a global field?](SACGlobFld.md#50)
-   [90 How do I delete a global field?](SACGlobFld.md#90)
-   [100 Need more on this page?](SACGlobFld.md#100)

## 10 What is a global field? {#10 .section}

A global field is a **field used in logical records and views**. Global fields belong to the environment that contains them.

![](images/GF_Concept_02.gif)

A global field is defined once and used many times. This saves time and avoids consistency problems in logical records and views.

For more introduction see these overviews:

-   "**Logical records overview**",
-   "**Views overview**",
-   "**Views - advanced overview**".

Links to these overviews are under **Related concepts** below.

## 20 How do I use a global field? {#20 .section}

![](images/GF_Usage_Rights_03.gif)

Use a global field in logical records and views.

A general user can use a global field in a logical record if the general user has at least the modify right to the logical record.

A general user can use a global field in a view if the general users has at least the modify right to the relevant view folder that contains the view.

Administrators can always use Global Fields.

For more on how to use a global field, see these topics:

-   "**Creating logical records**",
-   "**Modifying logical records**",
-   "**Creating views**",
-   "**Modifying views**".

Links to these topics are under **Related tasks** below.

System administrators and environment administrators can always **use global fields to create or modify fields in a logical record**.

General users can **use global fields to create or modify fields in a logical record** if the group selected during login has the following authorities:

-   **Create Logical Record** permission in the relevant environment \(when creating a new logical record\).
-   **Modify or Delete rights to the relevant logical record** in that environment \(if modifying an existing logical record\).

For more on these authorities, see topics "**Groups overview**" , "**Groups - advanced overview**" and "**WE Security overview**". Links to these overviews are under **Related concepts** below.

Once the group has the above authorities, users in that group can **use global fields to create or modify fields in a logical record** by using the tasks below, which are **administrator tasks:**

-   "**Creating logical records**",
-   "**Modifying logical records**".

Links to these topics are under **Related tasks** below.

## 30 How do I know which global field to use? {#30 .section}

All users can read global fields, to see the values. In the **Navigator**, click on "**Global Fields**", and in the **Metadata List** double click on any global field.

See your system or environment administrator also if the environment needs an extra global field.

## 50 How do I create or modify a global field? {#50 .section}

![](images/GF_Create_Modify_02.gif)

Only system or environment administrators can create or modify global fields - see these topics:

-   "**Creating global fields**",
-   "**Modifying global fields**".

Links to these topics are under **Related tasks** below.

For a complete discussion of security, see topic "**WE Security overview**". A link is under **Related concepts** below.

## 90 How do I delete a global field? {#90 .section}

See topic "**Deleting metadata**". A link is under **Related tasks** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

