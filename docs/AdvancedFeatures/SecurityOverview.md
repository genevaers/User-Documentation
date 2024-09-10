{: .no_toc}
# Workbench Security Overview

TABLE OF CONTENTS 
1. TOC
{:toc}  

## Introduction

Workbench security allows the definition of access and edit rights to GenevaERS metadata components, such as views, physical files, logical files and logical records, in the workbench based on environments, users, groups, group membership and group permissions.

On installation of the workbench, the userid **ADMIN** is created for Db2 connections. For PostgresSQL connections the administrator userid is configurable during installation; userid and password **postgres** is suggested. This userid has system administration rights, which means it has the authority to create and edit users, groups and environments, as well as rights to create and edit all the GenevaERS metatdata components associated with views.

The GenevaERS Workbench has three levels of security.  

1. A Workbench User must have permission to access a Workbench metadata database. Database access is defined by the database administrator. The database connection parameters are defined using a Workbench Connection. See [connect to the Workbench](./WorkbenchConnection.md) for a description of how to set up a database connection, and how to login to the Workbench.

2. A Workbench User must be defined in the Workbench database. The user must either be defined as a system administrator, or a general user and belong to a Group. All permissions for general users are defined per Group/Environment combination. A Group and Environment is a many-to-many relationship. A Group can access multiple environments and environment can be accessed by multiple groups.

3. The third security level, for general users, is based on a role that is assigned for a Group/Environment combination. The Workbench has the following roles; Environment Administrator, Developer and Guest.

## Environments

Workbench security is based around access to environments. An environment is a logical collection of metadata components.

Groups contain permission definitions to environments, and users can be members of groups.

See [Workbench Environments Overview](./EnvironmentOverview.md) for a detailed description of environments.

## Users, Groups and Permissions

There are two types of User; System Administrators and General Users. 

System administrators:
- can define Users, Groups and Security permissions.
- do not need to be in a group. 
  
General users:
- must belong to a group.
- can be a member of many groups.
- can have different roles assigned for different environments.

### Groups 

General Users must be a member of at least one Group. The association can be defined either by adding users to a group, or by defining the groups a user is a member of.

See **Membership by Group** and **Membership by User** under [Create Users, Groups and Permissions](./MetaData/CreateUsersGroupsPerm.md)

### Group Permissions

Each group has a set of permissions associated with it. Group permissions are defined for each environment you wish this group to have access to. A **role** of either **guest**, **developer** or **administrator** is assigned for each environment, each of which have a set of default Edit Rights and Permissions. 

The default permissions:  

- A **Guest** can browse metadata only.
- A **Developer** can create, delete, modify, and browse metadata.
- An (environment) **Administrator** can create, delete, modify, and browse metadata, and also migrate data into the environment.

Note: These roles can be tailored to your own specifications for each environment in each group.

See **Group Security** under [Create Users, Groups and Permissions](./MetaData/CreateUsersGroupsPerm.md)

### Permissions by Environment

You can view the permissions and edit rights defined for each environment. 

## How to define security

- Create Environments
- Create a group
- Create users
- Modify group membership
- Modify group permissions for environments

## Edit rights

In a particular environment, the phrase **edit rights** means the rights to access an item of the following types:

-   View,
-   View folder,
-   Physical file,
-   Logical file,
-   Logical record,
-   Lookup Path,
-   User-exit routine.

The edit rights possible are:

-   **No rights at all**.
-   **Read** allows both display and usage of an item. For example, a user needs the read right to a logical record in order to refer to that logical record in a view.
-   **Modify** allows editing of an item. It implies read as well.
-   **Full** allows delete of an item as well as modify and read rights.

Edit rights can be seen in column **Rights** in the **Metadata List** for each metadata type. 

## Create and migrate permissions

In a particular environment, the phrase **create permission** means the permission to create a new item of the following types:

-   User-exit routine,
-   Physical file,
-   Logical file,
-   Logical record,
-   Lookup Path,
-   View,
-   View folder.

For example, the create permission for physical files means a general user can create a new physical file at any time.

The **Migrate** utility copies selected metadata from a source environment to a target environment in the same GenevaERS Database. For more information, see **Migrate metadata overview** (tbd).

Selecting the **Migrate in** permission for an environment, allows the user to migrate metadata into this environment (the target environment). The source environment must be a different environment the user has permission to access.

Create and migrate permissions are setup by administrators. See **Group Security** under [Create Users, Groups and Permissions](./MetaData/CreateUsersGroupsPerm.md)
