# WE Security overview {#SACWESecurity .concept}

This topic helps all users \(a general user, environment administrator and system administrator\) to learn how security works in the workbench. Note that general users can perform extra tasks if the login group has appropriate security. Note that an environment administrator requires the login group to have administrator access.

This topic assumes you are familiar with all the metadata in the SAFR Workbench - see topic "**Metadata overview**". A link to that overview is under **Related concepts** below.

## 01 Summary of this topic {#01 .section}

This topic describes security from various points of view:

-   **Introductions**
    -   [10 Security phase "edit rights"](SACWESecurity.md#10)
    -   [12 Security phrase "create permission"](SACWESecurity.md#12)
    -   [14 Security phrase "run permission for utilities"](SACWESecurity.md#14)
-   **Users and groups**
    -   [20 General users and all users - what you can always do](SACWESecurity.md#20)
    -   [22 General users - what you can possibly do](SACWESecurity.md#22)
    -   [24 General users - what you can never do](SACWESecurity.md#24)
    -   [30 Security for an environment administrator](SACWESecurity.md#30)
    -   [35 Security for groups](SACWESecurity.md#35)
    -   [40 Security for a system administrator](SACWESecurity.md#40)
-   **Types of metadata**
    -   [50 Security for control records](SACWESecurity.md#50)
    -   [52 Security for environments](SACWESecurity.md#52)
    -   [54 Security for global fields](SACWESecurity.md#54)
    -   [56 Security for logical files](SACWESecurity.md#56)
    -   [58 Security for logical records](SACWESecurity.md#58)
    -   [60 Security for lookup paths](SACWESecurity.md#60)
    -   [62 Security for physical files](SACWESecurity.md#62)
    -   [64 Security for user-exit routines](SACWESecurity.md#64)
    -   [66 Security for views](SACWESecurity.md#66)
    -   [68 Security for view folders](SACWESecurity.md#68)
-   **Reports** - see [90 Security for reports](SACWESecurity.md#90)
-   **Utilities** - see [91 Security for utilities](SACWESecurity.md#91)
-   **Copy data between environments**
    -   See [92 Security for export and import](SACWESecurity.md#92)
    -   See the **Migration Utility** in [91 Security for utilities](SACWESecurity.md#91)
    -   See [93 Security for XML files used in export and import](SACWESecurity.md#93)
-   The last section is: [100 Need more on this page?](SACWESecurity.md#100)

## 10 Security phase "edit rights" {#10 .section}

In a particular environment, the phrase "**edit rights**" means the rights to an item of the following types:

-   Logical file,
-   Logical record,
-   Physical file,
-   User-exit routine,
-   View folder.

The edit rights possible are:

-   **No rights at all**.
-   **Read** right which allows both display and usage of an item. For example, a user needs the read right to a logical record in order to refer to that logical record in a view.
-   **Modify** right which implies read as well.
-   **Delete** right which implies the modify and read rights as well. This right is also called "**full**" rights.

Edit rights can be seen in column "**Rights**" in the **Metadata List**. For example, if you click on "**View Folders**" in the **Navigator**, the Metadata List may appear as follows:

![](images/ER_WB_Mlist_03.GIF)

Edit rights are setup by administrators - see these tasks:

-   "**Modifying group permissions by environment**"
-   "**Modifying group permissions by group**"

Links to these tasks are under **Related tasks** below.

## 12 Security phrase "create permission" {#12 .section}

In a particular environment, the phrase "**create permission**" means the permission to create a new item of the following types:

-   Logical file,
-   Logical record,
-   Physical file,
-   User-exit routine,
-   View folder.

For example, the create permission for physical files means a general user can create a new physical file at any time.

Create permissions are setup by administrators - see these tasks:

-   "**Modifying group permissions by environment**"
-   "**Modifying group permissions by group**"

Links to these tasks are under **Related tasks** below.

## 14 Security phrase "run permission for utilities" {#14 .section}

In a particular environment, the above phrase means permission to run the following utilities in WE:

-   **Batch Activate Lookup Paths.** This utility checks lookup paths are ready to use in an environment, and if possible sets the status to "active". For more, see topic "**Lookup Paths overview**". A link to that overview is under **Related concepts** below.
-   **Batch Activate Views.** This utility checks views are ready to run in the SAFR Performance Engine, and if possible sets the status to "active". For more, see topic "**Views overview**". A link to that overview is under **Related concepts** below.
-   **Migration Utility.** This utility copies selected metadata from a source environment to target environment in the same SAFR Database. For more, see topic "**Migrate metadata overview**". A link to that overview is under **Related concepts** below.

There is one group run permission:

-   **Migrate In**. This provides access to all three utilities:
    -   **Migration Utility** where the target environment is this environment ,
    -   **Batch Activate Lookup Paths** and **Batch Activate Views** in this environment.

The above run permission can be applied to a general user in one more environments. Administrators in an environment always have this run permission.

The run permission for utilities is setup by administrators - see these tasks:

-   "**Modifying group permissions by environment**"
-   "**Modifying group permissions by group**"

Links to these tasks are under **Related tasks** below.

## 20 General users and all users - what you can always do {#20 .section}

For the login environment, every user **can always:**

-   Modify their own user record.
-   Read any control record, global field and lookup path.
-   Delete any lookup path.
-   Read the environment record.
-   Generate an Environment Security Report. This report lists all the groups in that environment.
-   Generate an Environment Checker Report. This report shows all environments for a particular metadata item \(ID number\) in a SAFR database.

All the above only applies to those environments where the login group has access, except for the Environment Checker Report which can be run by any user and always covers all environments.

General users should also be aware of the topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

## 22 General users - what you can possibly do {#22 .section}

General users get most access from the **group** selected during login.

Normally, the login group provides general user access which is indicated when the "**Components**" menu displays in the SAFR Workbench.

The login group provides environment administrator user access when the "**Administration**" menu displays in the SAFR Workbench. If this applies, see [30 Security for an environment administrator](SACWESecurity.md#30).

When the login group provides general user access, the most important part of that access is edit rights. Edit rights are important in deciding what a general user can possibly do. For a definition of edit rights, see section [10 Security phase "edit rights"](SACWESecurity.md#10).

Edit rights can be seen in column "**Rights**" in the **Metadata List**. For example, if you click on "**View Folders**" in the **Navigator**, the Metadata List may appear as follows:

![](images/ER_WB_Mlist_03.GIF)

Let's take a detailed look at how edit rights \(and some other rights\) affect a general user.

For the login environment, and for any environment where the login group has access, a general user **can possibly**:

-   Read a view, only if the login group has at least the read right to the view folder that contains the view.

    If the user has only the read right to the view folder, this allows the user to click the activate button in a view without allowing the user to save the results. This allows a user in this situation to check if a view can be activated.

-   Copy a view only if the login group has:
    -   The read right to the view folder that contains the view to be copied,
    -   The modify right to the view folder to store the copied view.
-   Create, modify or delete a view only if the login group has at least the modify right to the view folder that contains the view.
-   Create a logical file, logical record, physical file, user-exit routine or view folder only if the login group has the create permission for these item types.
-   Read, modify, or delete a particular logical file, logical record, physical file, user-exit routine, view folder only if the login group has the read. modify. or delete edit right for those particular items.
-   Create and modify any lookup path, but a general user may only select logical records and logical files on which they have edit rights. If a general user does not have edit rights on the logical records or logical files which are already selected in an existing lookup path, they can still modify the lookup path to use different logical records or logical files where that general user does have the edit rights. In this situation, once the lookup path is modified, the general users cannot change the lookup path back to the original selections for logical records or logical files, because that general user does not have edit rights for this.
-   Refer to a lookup path in a view only if the login group has:
    -   At least the modify right to the view folder that contains the view.
    -   At least the read right to the relevant logical records and logical files used in that lookup path.
-   Run the utilities called Batch Activate Lookup Paths and Batch Activate Views only if the login group has the Migrate In run permission for the relevant environment.
-   Migrate \(copy\) metadata from another environment only if the login group has:

    -   At least the read right to the relevant metadata in the source environment.
    -   At least the Migrate In run permission in the target environment.
    Once a successful copy of metadata using the Migration Utility is complete, the general user automatically has at least the read right in the target environment to the metadata that was copied in. If the general user had more rights than the read right before the migration, then the extra rights are retained.


If you require more security authority in your login group, see your administrator.

## 24 General users - what you can never do {#24 .section}

It is **not possible** for a general user to:

-   Display a list of all user or group names in the Navigator shown on the left of the WE screen. This is only possible for a system administrator.
-   Create, read, modify or delete any user, group, or environment. with one exception: a general user can read and modify their own user record. All other create, read, modify, and delete actions for users, groups and environments are performed only by administrators.
-   Create, modify or delete any control record or global field. This is only performed by administrators

## 30 Security for an environment administrator {#30 .section}

An environment administrator gets most access in WE from the **group** selected during login.

When the login group has administrator access for an environment, then users who login with that combination of group and environment are automatically an environment administrator. If those users login with a different combination of group and environment, then those users be general users in that session. Each login session depends on the credentials provided during login.

In the login environment and any environment where the login group provides administrator access, **an environment administrator can:**

-   Create, read, modify or delete any logical file, logical record, lookup path, physical file, user-exit routine, view folder, view, control record, or global field.
-   Run any utility.
-   Modify their own user record.
-   Modify a group in that environment. An environment administrator can only change edit rights, create permissions and the run permission in that group. Effectively, the environment administrator can control most of the general user access to that environment by modifying groups.
-   Read and modify the relevant environment records.

It is **not possible** for an environment administrator to perform these system administrator tasks:

-   Display a list of all user or group names in the Navigator shown on the left of the WE screen.
-   Create, read, modify or delete any user with one exception: an environment administrator can read and modify their own user record.
-   Create or delete any group.
-   Create or delete an environment.

## 35 Security for groups {#35 .section}

In any environment, a **system administrator** can create, read, modify or delete groups. For any group, a system administrator controls:

-   Which users are members of the group.
-   Which environments the group can access.
-   Edit rights for particular metadata items in an environment.
-   Create permissions in each environment.
-   Run permission for utilities in each environment.
-   Administrator access which makes each member of the group an environment administrator.

In summary, a system administrator can do all actions for any group in any environment.

In the login environment or in an environment where the login group provides administrator access, an **environment administrator** can modify an existing group, as follows:

-   Change create permissions for types of metadata,
-   Change run permission for utilities,
-   Change edit rights to particular items of metadata.

An environment administrator can control some of the general user access to that environment.

## 40 Security for a system administrator {#40 .section}

It is only possible for one system administrator to create another system administrator.

A system administrator has complete access to all parts of WE.

In any environment, a system administrator can:

-   Create, read, modify or delete any metadata item, including all users, groups and environments.
-   Run any utility.

In particular, only a system administrator controls which users are an environment administrator.

## 50 Security for control records {#50 .section}

In any environment, a **system administrator** can always create, read, modify and delete control records and refer to control records in views.

In the login environment, an **environment administrator** can always create, read, modify and delete control records and refer to control records in views.

In the login environment, **general users** can:

-   Always read control records.
-   Modify a view to refer to a control record only if the login group has at least the modify right to the view folder that contains the view.

## 52 Security for environments {#52 .section}

In any environment, a **system administrator** can always create, read, modify and delete environment records.

In the login environment or in an environment where the login group provides administrator access, an **environment administrator** can always read and modify the environment record.

In the login environment or in an environment where the login group has access, a **general user** can always read the environment record.

## 54 Security for global fields {#54 .section}

In any environment, a **system administrator** can always create, read, modify and delete global fields and refer to global fields in views.

In the login environment, an **environment administrator** can always create, read, modify and delete global fields and refer to global fields in views.

In the login environment, **general users** can:

-   Always read global fields.
-   Modify a view to refer to a global field only if the login group has at least the modify right to the view folder that contains the view.
-   Modify a logical record to refer to a global field only if the login group has at least the modify right to the relevant logical record.

## 56 Security for logical files {#56 .section}

In any environment, a **system administrator** can always create, read, modify and delete logical files and refer to logical files in views.

In the login environment, an **environment administrator** can always create, read, modify and delete logical files and refer to logical files in views.

In the login environment, **general users** can:

-   Create a particular logical file only if the login group has at least the create permission for logical files.
-   Read, modify or delete a particular logical file only if the login group has at least the read, modify or delete right to that particular logical file.
-   Refer to a logical file in a view only if the login group has:
    -   At least the modify right to the view folder that contains the view.
    -   At least the read right to the logical file.

## 58 Security for logical records {#58 .section}

In any environment, a **system administrator** can always create, read, modify and delete logical records and refer to logical records in views.

In the login environment, an **environment administrator** can always create, read, modify and delete logical records and refer to logical records in views.

In the login environment, **general users** can:

-   Create a particular logical record only if the login group has at least the create permission for logical records.
-   Read, modify or delete a particular logical record only if the login group has at least the read, modify or delete right to that particular logical record.
-   Refer to a logical record in a view only if the login group has:
    -   At least the modify right to the view folder that contains the view.
    -   At least the read right to the logical record.

## 60 Security for lookup paths {#60 .section}

In any environment, a **system administrator** can always create, read, modify and delete lookup paths and refer to lookup paths in views.

In the login environment, an **environment administrator** can always create, read, modify and delete lookup paths and refer to lookup paths in views.

In the login environment, **general users** can:

-   Always read and delete lookup paths.
-   Create and modify any lookup path, but a general user may only select logical records and logical files on which they have edit rights. If a general user does not have edit rights on the logical records or logical files which are already selected in an existing lookup path, they can still modify the lookup path to use different logical records or logical files where that general user does have the edit rights. In this situation, once the lookup path is modified, the general users cannot change the lookup path back to the original selections for logical records or logical files, because that general user does not have edit rights for this.
-   Refer to a lookup path in a view only if the login group has:
    -   At least the modify right to the view folder that contains the view.
    -   At least the read right to the logical records and logical files used in that lookup path.
-   Run Batch Activate Lookup Paths only if the login group has:
    -   **EITHER** system or environment administrator access to the environment for the lookup path\(s\).
    -   **OR** the "Migrate In" run permission to the environment for the lookup path\(s\).

Notice that security for lookup paths and views can sometimes create unusual situations. For example, consider this example:

1.  User\_1 has edit access to these logical files and logical records \(all ending in "1"\):

    -   LogFile\_Source1,
    -   LogRec\_Source1,
    -   LogiFile\_Target1,
    -   LogiRec\_Target1.
    User\_1 has NO read access to other logical files and logical records.

2.  User\_2 has edit access to these logical files and logical records \(all ending in "2"\):

    -   LogFile\_Source2,
    -   LogRec\_Source2,
    -   LogiFile\_Target2,
    -   LogiRec\_Target2.
    User\_2 has NO read access to other logical files and logical records.

3.  User\_1 **creates Lookup\_Special** and selects the logical file and logical record names ending in "1".
4.  User\_2 **modifies Lookup\_Special** to use the logical file and logical record names ending in "2".
5.  Problem: User\_1 can no longer refer to Lookup\_Special in a view. User\_1 can modify Lookup\_Special back to the names ending in "1", but cannot modify Lookup-Special retaining the names ending in "2".

The problem for User\_1 can be solved in one of the following ways:

-   **EITHER** ask User\_1 and User\_2 to create separate lookup paths with different names. The two users can now work independently.
-   **OR** ask an administrator to give User\_1 and User\_2 edit access to **all** the logical file and logical records mentioned above. When complete, the two users have equal rights to update Lookup\_Special.

## 62 Security for physical files {#62 .section}

In any environment, a **system administrator** can always create, read, modify and delete physical files and refer to physical files in views.

In the login environment, an **environment administrator** can always create, read, modify and delete physical files and refer to physical files in views.

In the login environment, **general users** can:

-   Create a particular logical file only if the login group has at least the create permission for logical files.
-   Read, modify or delete a particular physical file only if the login group has at least the read, modify or delete right to that particular physical file.
-   Refer to a physical file in a view only if the login group has:
    -   At least the modify right to the view folder that contains the view.
    -   At least the read right to the physical file.

## 64 Security for user-exit routines {#64 .section}

In any environment, a **system administrator** can always create, read, modify and delete user-exit routines and refer to user-exit routines in views.

In the login environment, an **environment administrator** can always create, read, modify and delete user-exit routines and refer to user-exit routines in views.

In the login environment, **general users** can:

-   Create a particular user-exit routine only if the login group has at least the create permission for user-exit routines.
-   Read, modify or delete a particular user-exit routine only if the login group has at least the read, modify or delete right to that particular user-exit routine.
-   Refer to a user-exit routine in a view only if the login group has:
    -   At least the modify right to the view folder that contains the view.
    -   At least the read right to the user-exit routine.

## 66 Security for views {#66 .section}

In any environment, a **system administrator** can always create, read, modify and delete views.

In the login environment, an **environment administrator** can always create, read, modify and delete views.

In the login environment, **general users** can:

-   Read a particular view only if the login group has at least the read right to that view folder that stores the view.
-   Create, modify or delete a particular view only if the login group has at least the modify right to that particular view folder that stores the view.
-   Run Batch Activate Views only if the login group has:
    -   **EITHER** at least the modify right to the view folder that contains the views to be activated,
    -   **OR** the "Migrate In" run permission to the environment for the view\(s\).

## 68 Security for view folders {#68 .section}

In any environment, a **system administrator** can always create, read, modify and delete view folders and create, read, modify and delete views in those view folders.

In the login environment, an **environment administrator** can always create, read, modify and delete view folders and create, read, modify and delete views in those view folders.

In the login environment, a **general user** can:

-   Create a particular view folder record only if the login group has at least the create permission for view folders.
-   Read, modify or delete a particular view folder record only if the login group has at least the read, modify or delete right to that particular view folder.
-   Read a view in a view folder only if the login group has at least the read right to the view folder that contains the view.
-   Create, modify, delete a view in a view folder only if the login group has at least the modify right to the view folder that contains the view.

## 90 Security for reports {#90 .section}

In any environment, a **system administrator** can always run any report.

In the login environment or in an environment where the login group provides administrator access, an **environment administrator** can always run any report.

In the login environment, **general users** can:

-   Run a Logical Record Report only if the login group has at least the read right to the logical records selected.
-   Run a Logical File Report only if the login group has at least the read right to the logical files selected.
-   Run a View Properties Report only if the login group has at least read right to the view folder\(s\) for the views selected.
-   Run a View Columns Report only if the login group has tat least read right to the view folder\(s\) for the views selected.
-   Run a View Column PIC Report only if the login group has at least read right to the view folder\(s\) for the views selected.
-   Run an Environment Security Report for any environment that the login group has access to. This report shows the groups in that environment.

In any environment, **all users** can:

-   Generate an Environment Checker Report. This report shows all environments for a particular a metadata item name.

## 91 Security for utilities {#91 .section}

As background, see the above section [14 Security phrase "run permission for utilities"](SACWESecurity.md#14).

In any environment, a **system administrator** can always run a utility.

An **environment administrator**is an administrator only in the login environment or in an environment where the login group provides administrator access. An **environment administrator** can always run:

-   Batch Activate Lookup Paths,
-   Batch Activate Views.

An **environment administrator** can run the Migration Utility only if the login group has at least both of these requirements:

-   Read rights to the metadata to be copied for the source environment. This is provided if the login group provides environment administrator access to the source environment. Alternatively, this is provided if the login group provides enough read rights to a general user in the source environment.
-   Migrate In run permission for a general user in the target environment. Alternatively, this is provided if the login group provides environment administrator access to the target environment.

Notice how an environment administrator does not need administrator access in both the source and target environments.

In the login environment, or in an environment where the login group has access, a **general user** can:

-   Run Batch Activate Views only if the login group has:
    -   **EITHER** at least the modify right to the view folder that contains the views,
    -   **OR** the user has the "Migrate In" run permission in that environment.
-   Run Batch Activate Lookup Paths only if the login group has the "Migrate In" run permission in that environment.
-   Run the Migration Utility only if the login group has:
    -   Read rights to the metadata to be copied for the source environment,
    -   **AND** the Migrate In run permission for the target environment.

Once a successful copy of metadata using the Migration Utility is complete, the general user automatically has at least the read right in the target environment to the metadata that was copied in. If the general user had more rights than the read right before the migration, then the extra rights are retained.

## 92 Security for export and import {#92 .section}

A **system administrator** can always export and import metadata into and out of any environment. See next section below for security for XML files.

An **environment administrator** can always export and import metadata into and out of the login environment. This also applies to any environment where the login group provides administrator access. See next section below for security for XML files.

A **general user** can export metadata into an XML file only if the login group has at least the read rights to the items selected for export. See next section below for security for XML files.

General users cannot import metadata - only an administrator can. A general user can possibly run the Migration Utility - see previous section above.

## 93 Security for XML files used in export and import {#93 .section}

The tasks "export metadata" and "import metadata" use XML files. XML files themselves only have the security provided by the operating system that is running the workbench. Normally, all users of the workbench can create, read, modify and delete XML files. Any restrictions on access to XML files provides a further layer of security.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

