# Metadata - advanced overview {#SACMetadataAdv .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Knowledge you need first](SACMetadataAdv.md#10)
-   [20 Metadata, environments and databases](SACMetadataAdv.md#20)
-   [30 Copy metadata to another environment](SACMetadataAdv.md#30)
-   [40 Copy using export and import](SACMetadataAdv.md#40)
-   [50 Copy using Migration](SACMetadataAdv.md#50)
-   [60 Methods to backup and restore metadata](SACMetadataAdv.md#60)
-   [70 Backup and restore: "selected metadata"](SACMetadataAdv.md#70)
-   [80 Backup and restore: "whole environment"](SACMetadataAdv.md#80)
-   [90 Partial restore from a "whole database" backup](SACMetadataAdv.md#90)
-   [95 Environment Checker Report](SACMetadataAdv.md#95)
-   [100 Need more on this page?](SACMetadataAdv.md#100)

## 10 Knowledge you need first {#10 .section}

This topic assumes you are familiar with the topic "**Metadata overview**". A link to that overview is under **Related concepts** below.

## 20 Metadata, environments and databases {#20 .section}

![](images/Metadata_Env_DB_01.gif)

All work in the SAFR Workbench is saved in a SAFR **database**.

A SAFR **database** can contain many **environments**. The current database and environment are always shown at the bottom of the screen in the SAFR Workbench. Each individual metadata item is stored in a particular environment in a particular database.

## 30 Copy metadata to another environment {#30 .section}

The following are the available methods to copy metadata to another environment:

-   **Copy using a combination of export and import**.

    This copy uses the two steps: \(1\) create the export XML file\(s\) from the source environment, and \(2\) import the XML file\(s\) into the target environment. The XML files are a "backup" of what was copied and can be reused

    ADVANTAGES: This is designed for the situation where the source environment and target environment are the same SAFR database. Export and import steps are separate and can be done by different people at different times and at different locations. A general user can perform the export\(s\). Exported data can be imported to multiple target environments in the same SAFR database. The XML file is effectively a "backup" of the data that is copied across.

    DISADVANTAGES: The most important disadvantage is that this is NOT recommended if the source and target environments are in different SAFR databases. This situation will almost certainly corrupt the target database. IBM does not support copying metadata from one database to another, If the source and target environments are in the same SAFR database then the only disadvantage is that an administrator is required for the import\(s\).

    HOW TO PERFORM: see section [40 Copy using export and import](SACMetadataAdv.md#40).

-   **Copy using Migration**.

    This copy happens in one utility - the Migration Utility. The target environment must be in the same SAFR database as the source environment.

    ADVANTAGES: faster because the copy happens on one screen. A general user can perform this entire task. Another advantage is that control records and user-exit routines can be the "main" item for migration, whereas these cannot be the "main" item for a combination of export and import. Note that export and import can still copy a control record or user-exit routine, but these are copied as part of a main item that is a different type.

    DISADVANTAGES: This method requires special security authority for a general user. There is no "backup" of the data that was copied \(unlike export and import which provides the XML file as a backup\).

    HOW TO PERFORM: see section [50 Copy using Migration](SACMetadataAdv.md#50).


## 40 Copy using export and import {#40 .section}

![](images/Metadata_Copy_01.gif)

The copy is performed in two steps:

1.  Create backups using **Export** of metadata components from the source environment \(see Environment A in SAFR database X above\).

    See "**Export metadata overview**". A link is under **Related concepts** below.

2.  Copy metadata using **Import** into the target environment \(see Environment B in SAFR database X above\). It is not recommended to import to an environment in a different SAFR database, as this may corrupt the target database.

    See "**Import metadata overview**". A link is under **Related concepts** below.

    **IMPORTANT:** You need to read help topic "**Import metadata overview**" because:

    -   An import can be blocked by data problems in certain situations.
    -   An import can generate error messages that require a choice of action.
    -   An import can delete or modify data that you still require. Sometimes this occurs without a warning message.
    Help topic "**Import metadata overview**" explains how to fix import problems and also to prevent import problems. It is recommended you do not attempt an import before you read that topic.


## 50 Copy using Migration {#50 .section}

This is only possible when the source and target environments are in the same SAFR Database.

An administrator in both environments can always run this utility. A general user needs the "Migrate In" run permission in the target environment, and must have read rights to the metadata to be copied in the source environment.

![](images/Metadata_Copy_02_Migration.gif)

For details, see "**Migrate metadata overview**". A link is under **Related concepts** below.

## 60 Methods to backup and restore metadata {#60 .section}

The following are the available methods to backup and restore metadata:

![](images/Metadata_Backups_01.gif)

-   "**Whole database**" backup.

    This backup uses the given utilities for that database tool. That tool may be, for example, DB2. Such a backup contains **all metadata in all environments** in that Workbench database.

    ADVANTAGES: all data in the database can be restored to a certain point in time. Every type of metadata is included, unlike the "whole environment" and "selected metadata" backups below which cover only five metadata types.

    DISADVANTAGES: the same - a restore affects all data in the database. You may require to restore only part of the database and retain all other existing data, which is not possible with a "whole database" backup.

    HOW TO PERFORM: use the given utilities for that database tool \(see the database support team in your company\). If you require to use a "whole database" backup to restore only part of the data in the database, see section [90 Partial restore from a "whole database" backup](SACMetadataAdv.md#90).

-   Backup a **whole environment** of metadata into XML files.

    This backup reads a **particular environment** and creates backups in XML files of five types of metadata.

    ADVANTAGES: all metadata of five types in an environment can be restored to a certain point in time without affecting any other environments in that database.

    DISADVANTAGES: restore requires import of many XML files. This is a lengthy process.

    HOW TO PERFORM: see section [80 Backup and restore: "whole environment"](SACMetadataAdv.md#80).

-   Backup **selected items** of metadata in XML files.

    This backup creates backups in XML files of selected metadata items only of five types.

    ADVANTAGES: selected metadata can be restored to a certain point in time without affecting the other metadata in your database.

    DISADVANTAGES: the same - a restore affects only selected data in the environment. You may require to restore a whole environment or a whole database.

    HOW TO PERFORM: see the next section below.


## 70 Backup and restore: "selected metadata" {#70 .section}

This applies to only these metadata types:

-   Logical file,
-   Logical record,
-   Lookup path,
-   Physical file,
-   View.

![](images/Metadata_Import_01_Restore.gif)

Do the following:

1.  Create backups using **Export**.

    See "**Export metadata overview**". A link is under **Related concepts** below.

2.  Restore from backups using **Import**.

    See "**Import metadata overview**". A link is under **Related concepts** below.

    **IMPORTANT:** You need to read help topic "**Import metadata overview**" because:

    -   An import can be blocked by data problems in certain situations.
    -   An import can generate error messages that require a choice of action.
    -   An import can delete or modify data that you still require. Sometimes this occurs without a warning message.
    Help topic "**Import metadata overview**" explains how to fix import problems and also to prevent import problems. It is recommended you do not attempt an import before you read that topic.


## 80 Backup and restore: "whole environment" {#80 .section}

This includes only these metadata types in an environment:

-   Logical file,
-   Logical record,
-   Lookup path,
-   Physical file,
-   View.

![](images/Metadata_Import_04_RestoreEnv.gif)

Do the following:

1.  Create backups using **Export**.

    See help topic "**Export metadata overview**" for a section "**Backup an entire environment**". A link to that help topic is under **Related concepts** below.

2.  Restore from backups using **Import**.

    For more details, see "**Import metadata overview**". A link is under **Related concepts** below.

    **IMPORTANT:** You need to read help topic "**Import metadata overview**" because:

    -   An import can be blocked by data problems in certain situations.
    -   An import can generate error messages that require a choice of action.
    -   An import can delete or modify data that you still require. Sometimes this occurs without a warning message.
    Help topic "**Import metadata overview**" explains how to fix import problems and also to prevent import problems. It is recommended you do not attempt an import before you read that topic.


## 90 Partial restore from a "whole database" backup {#90 .section}

If you require a restore of only part of the metadata in a "whole database" backup, then this is not possible in a fully automated way. You may choose to restore the "whole database" backup to a new \(empty\) second database, and then manually read the data required and manually recreate the same data in the original database. This is potentially a lengthy process.

## 95 Environment Checker Report {#95 .section}

This report shows all environments for a particular metadata item in a SAFR database. That metadata item has a unique ID number in that SAFR database. The information in the Environment Checker Report is useful when planning to update or delete a metadata item, because the same action may be necessary for the same metadata item \(ID number\) in other environments in the same SAFR database.

All users can generate this report, using one of these topics:

-   FAQ topic "**How do I generate an Environment Checker Report?**"
-   Task "**Finding all environments for a particular a metadata item**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

