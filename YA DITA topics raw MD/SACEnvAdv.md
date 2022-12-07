# Environments - advanced overview {#SACEnvAdv .concept}

This topic assumes you are familiar with the topic "**Environments overview**". A link to that overview is under **Related concepts** below.

## 01 Summary of this topic {#01 .section}

This topic covers the following:

-   [10 Group permissions to create types of items](SACEnvAdv.md#10)
-   [20 Group permissions to run a utility](SACEnvAdv.md#20)
-   [30 Groups and edit rights to specific items](SACEnvAdv.md#30)
-   [40 Groups and administrator access](SACEnvAdv.md#40)
-   [50 How do I create or modify an environment?](SACEnvAdv.md#50)
-   [60 Copying or deleting metadata](SACEnvAdv.md#60)
-   [65 Environment Checker Report](SACEnvAdv.md#65)
-   [70 Minimum items for an environment](SACEnvAdv.md#70)
-   [80 Environment Security Report](SACEnvAdv.md#80)
-   [90 How to delete an environment](SACEnvAdv.md#90)
-   [95 The best way to use environments](SACEnvAdv.md#95)
-   [100 Need more on this page?](SACEnvAdv.md#100)

## 10 Group permissions to create types of items {#10 .section}

Group members receive create permissions for types of items.

The group create permissions possible are as follows:

-   Create Logical Files,
-   Create Logical Records,
-   Create Physical Files,
-   Create User-Exit Routines,
-   Create View Folders.

The above permissions can be applied to a general user. Administrators in an environment always have these permissions.

Notice there is no "create" right for control records and global fields - these are only created by administrators. General users can make use of existing control records and global fields, but cannot create, modify or delete them.

Different groups have different authority, and this can give a choice to a general user. For example:

-   **Group G1** is for regular reporting, so this group cannot create any new items. This applies to general users who login to this environment using group G1.
-   **Group G2** is for update of data, so this group can create any new items required. This applies to general users who login to this environment using group G2.

![](images/Env_Adv_Group_Perm_Create_03.gif)

In the above example, the general user can **change rights to create items** in the environment by the **choice of group** during login to that environment.

## 20 Group permissions to run a utility {#20 .section}

Group members can receive a permission to run utilities.

The utilities available in the SAFR Workbench are:

-   **Batch Activate Lookup Paths.** This utility checks lookup paths are ready to use in an environment, and if possible sets the status to "active". For more, see topic "**Lookup Paths overview**". A link to that overview is under **Related concepts** below.
-   **Batch Activate Views.** This utility checks views are ready to run in the SAFR Performance Engine, and if possible sets the status to "active". For more, see topic "**Views overview**". A link to that overview is under **Related concepts** below.
-   **Migration Utility.** This utility copies selected metadata from a source environment to target environment in the same SAFR Database. For more, see topic "**Migrate metadata overview**". A link to that overview is under **Related concepts** below.

There is one group run permission:

-   **Migrate In**. This provides access to all three utilities:
    -   **Migration Utility** where the target environment is this environment ,
    -   **Batch Activate Lookup Paths** and **Batch Activate Views** in this environment.

The above run permission can be applied to a general user in one or more environments. Administrators in an environment always have this run permission.

Different groups have different authority, and this can give a choice to a general user. For example:

-   **Group G1** is for users who run established views and cannot migrate any metadata. Users in this group cannot run any utilities.
-   **Group G2** is for users who can migrate metadata from other environments. Users in this group can run all three utilities.

![](images/Env_Adv_Group_Perm_Utils_02.gif)

In the above example, the general user can **change rights to run utilities** in the environment by the **choice of group** during login to that environment.

## 30 Groups and edit rights to specific items {#30 .section}

Group members receive edit rights to specific items of metadata.

The specific items must be of the following types:

-   Logical File,
-   Logical Record,
-   Physical File,
-   User-Exit Routine,
-   View Folder.

The edit rights possible are:

-   **No rights at all**.
-   **Read** right which allows both display and usage of an item. For example, a user needs the read right to a logical record in order to refer to that logical record in a view.
-   **Modify** right which implies Read as well.
-   **Delete** right which implies the Modify and Read rights as well. This right is also called "**Full**" rights.

The above edit rights for a specific item can be applied to a general user. Administrators always have full rights to all items.

Edit rights can be seen in column "**Rights**" in the **Metadata List**. For example, if you click on "**View Folders**" in the **Navigator**, the Metadata List may appear as follows:

![](images/ER_WB_Mlist_03.GIF)

A group can have different edit rights to each individual item.

Different groups have different authority, and this can give a choice to a general user. For example:

For example:

-   **Group G1** is for reporting, so this group has the read right to a specific logical file.
-   **Group G2** is for update of data, so this group has the delete right \(which is all rights\) to a specific logical file.

![](images/Env_Adv_Group_EditR_01.gif)

In the above example, the general user can **change their own access to specific items** in the environment by the **choice of group** during login to that environment.

## 40 Groups and administrator access {#40 .section}

A group can provide a user with **administrator access to an environment**. This means all members of that group become **environment administrators** in that environment.

![](images/Env_Adv_Group_Auth_Admin_05.gif)

Environment and system administrators have all the create permissions, run permission and edit rights that are possible.

An environment administrator and has almost the same rights as a system administrator. The difference is that an **environment** administrator:

-   Cannot create, read, modify or delete users.
-   Can only modify group permissions and rights. Cannot give administrator access. Cannot change group membership. Cannot create or delete groups.
-   Can only modify the environment record itself for the relevant environment. Cannot create or delete environments. Cannot modify environment records where there is no environment administrator access.

## 50 How do I create or modify an environment? {#50 .section}

This section covers the environment record itself, which names the environment.

![](images/Env_Create_Modify_02.gif)

**System administrators** can **create, read, modify and delete** environment records.

**Environment administrators** can **modify** the environment record.

For help with create or modify of environment records, read these topics:

-   "**Creating environments**",
-   "**Modifying environments**".

Links to these topics are under **Related tasks** below.

For information about creating and modifying different items in an environment \(like logical records\), see the overview for that type of item.

## 60 Copying or deleting metadata {#60 .section}

Before performing the above tasks, you must be aware of any metadata item that exists in multiple environments - see the next section.

To copy or delete metadata inside one environment, or to delete the environment itself, see these topics:

-   "**Copying metadata**",
-   "**Deleting metadata**",
-   "**Clear environment**".

Links to these topics are under **Related tasks** below.

## 65 Environment Checker Report {#65 .section}

This report shows all environments for a particular metadata item in a SAFR database. That metadata item has a unique ID number in that SAFR database. The information in the Environment Checker Report is useful when planning to update or delete a metadata item, because the same action may be necessary for the same metadata item \(ID number\) in other environments in the same SAFR database.

All users can generate this report, using one of these topics:

-   FAQ topic "**How do I generate an Environment Checker Report?**"
-   Task "**Finding all environments for a particular a metadata item**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

## 70 Minimum items for an environment {#70 .section}

Every environment requires these minimum items:

-   **One control record**. Control records are created and modified only by administrators. Users of an environment always have read access to all control records for that environment.
-   **One view folder**.
-   **One group that has access to the environment**.

The SAFR Workbench ensures that these minimum items exist for every environment at all times. For example, during create of a new environment, administrators must nominate names for each of these three minimum items.

## 80 Environment Security Report {#80 .section}

All users can access this report. To see a report that lists the groups in one or more environments, use one of these topics:

-   FAQ topic "**How do I generate an Environment Security Report?**"
-   Task "**Generating reports on metadata**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

For a complete discussion of security, see topic "**WE Security overview**". A link is under **Related concepts** below.

## 90 How to delete an environment {#90 .section}

**Environments** can only be deleted if all metadata in that environment has been cleared.

See task "**Clear environment**". A link to this topic is under **Related tasks** below.

Only a system administrator can delete an environment, with two conditions. Firstly, the environment must contain no metadata, and secondly the system administrator cannot be currently logged into that environment.

## 95 The best way to use environments {#95 .section}

Environments aim to achieve the following goals:

-   **Accuracy:** provide only the appropriate data for users for their work. Too much data risks confusion and unintended update of data. Too little data stops general users from doing their work.
-   **Flexibility:** allow some extra environments for unusual work situations that require unusual data access for a short period of time.
-   **Simplicity:** fewer environments means less environments for administrators to maintain.

These goals are often in competition: for example to achieve goal of accuracy perfectly may require a separate environment for each user which contradicts the goal of simplicity. Your company must find the appropriate choice of environments that balances the above goals.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

