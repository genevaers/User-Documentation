# Environments overview {#SACEnv .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is an environment?](SACEnv.md#10)
-   [20 How do I use an environment?](SACEnv.md#20)
-   [30 How do I know which environment to use?](SACEnv.md#30)
-   [40 What are the metadata items in an environment?](SACEnv.md#40)
-   [50 Environments and groups](SACEnv.md#50)
-   [100 Need more on this page?](SACEnv.md#100)

## 10 What is an environment? {#10 .section}

An environment is a logical collection of metadata within the SAFR Workbench.

Metadata is a group of data items that describe the work that SAFR will do for your company. Metadata is how you "tell SAFR what to do", and describes part of the mainframe data in your company. A Metadata item can also be called a metadata component.

The environment \(which is a collection of metadata\) is stored in a SAFR database.

**System administrators define environments**. There may be separate environments for Accounts, Sales, Stock Inventory and so on.

![](images/Env_Concept_03.gif)

**All users of the SAFR Workbench login to one environment per session.**

A system administrator logs into one environment per session while still retaining some access to all environments at all times.

General users and environment administrators log into one environment per session, and can only access that environment during that session.

When already logged into the workbench, to change environment or change group for the same environment a user clicks **File -\> Return to login...**

Separate environments provide these benefits for your company:

-   **Provide access controls** for sensitive data in your company. The most sensitive data can be in an environment with the most restrictive access controls.
-   **Simplify the job of general users** in that environment. For example, general users in the Sales environment are not distracted by other mainframe data and can quickly find work done by other users in that environment.

## 20 How do I use an environment? {#20 .section}

All users choose an environment during **login** to the SAFR Workbench. During login, a general user must choose a group \(if a choice is available\). An environment administrator must choose the group that provides the administrator access rights.

![](images/Env_Usage_and_rights_02.gif)

**General Users** choose an environment during login in order to get work done. The general user must be a member of a group that has access to that environment.

**System administrators and environment administrators** choose an environment during login to prepare that environment for general users.

For more about login, read topic "**Logging into the SAFR Workbench**". A link to that topic is under **Related tasks** below.

For a complete discussion of security, see topic "**WE Security overview**". A link is under **Related concepts** below.

## 30 How do I know which environment to use? {#30 .section}

|If you are a ...|then ...|
|----------------|--------|
|General User|See your system administrator, who can specify an environment to use. It is possible the system administrator may also give a choice of **groups** to use with that environment.|
|System or environment administrator|Speak to other administrators. All administrators must agree on the environments and associated groups for your company.|

For more, see topics "**Environment - advanced overview**" and "**Groups overview**". Links to these overviews are under **Related concepts** below.

## 40 What are the metadata items in an environment? {#40 .section}

An environment can contain items of these types:

-   Control records,
-   Global fields,
-   Groups,
-   Logical files,
-   Logical records,
-   Lookup paths,
-   Physical files,
-   Users,
-   User-exit routines,
-   Views,
-   View folders.

For more on what these items are, see the **overview** for each item.

There is no limit to the number of examples of each type of item in an environment. For example, an environment may have at least ten examples of each of the above types.

Environments and their items are examples of metadata - see topic "**Metadata overview**". Links to all these overviews are under **Related concepts** below.

## 50 Environments and groups {#50 .section}

Every environment must be associated with at least one **group**. A general user or environment administrator gain **access to an environment** by becoming a **member of a group**.

**Groups have authorities** to access one or more environments. Group authorities for each environment can be any of the following:

-   **Administrator** access authorities. This allows members of that group to be environment administrators.
-   **General user** access authorities, as follows:
    -   Edit rights to specific items. Example: rights to read/modify/delete a specific logical file.
    -   Create permissions for types of items Example: create logical files permission.
    -   Run permission for utilities.

![](images/Env_Group_Auth_01.gif)

One group may have only **read access** to all items in an environment and no create rights. Another group may have **more rights** to individual items. User rights in an environment are controlled by the group selected during login to that environment.

For more, see topics "**Environments - advanced overview**" and "**Groups overview**". Links to these overviews are under **Related concepts** below.

For a complete discussion of security, see topic "**WE Security overview**". A link is under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

