# Import metadata overview {#SACImportMetadata .concept}

## 01 Summary of this topic {#01 .section}

You need to read this topic because:

-   An import can be blocked by data problems in certain situations.
-   An import can generate error messages that require a choice of action.
-   An import can delete or modify data that you still require such as related items of metadata. Sometimes this occurs without a warning message.

This topic explains how to fix and prevent import problems. It is recommended you do not attempt an import before you read this topic.

Below is a guide to the sections you need to read:

1.  An introduction is covered in sections:
    -   [02 Knowledge you need first](SACImportMetadata.md#02)
    -   [03 What is import of metadata?](SACImportMetadata.md#03)
    -   [04 Why is import useful?](SACImportMetadata.md#04)
2.  The basics of import are explained in sections:
    -   [10 Always import to same database as export](SACImportMetadata.md#10)
    -   [11 Critical issues for an import](SACImportMetadata.md#11)
3.  The basics of ID numbers are explained in sections:
    -   [20 Ranges of ID numbers and 'missing' ID numbers](SACImportMetadata.md#20)
    -   [21 Delete also creates 'missing' ID numbers](SACImportMetadata.md#21)
    -   [22 Import can increase a range by 1](SACImportMetadata.md#22)
    -   [23 How to find most 'missing' ID numbers](SACImportMetadata.md#23)
4.  Ideal and non-ideal situations offer a guide to how to plan and prepare for import. The situations for import are:
    -   [30 Ideal situation for import: 'All New'](SACImportMetadata.md#30)
    -   [32 Ideal situation for import: 'All Update'](SACImportMetadata.md#32)
    -   [35 Non-ideal situations for import](SACImportMetadata.md#35)
    -   [38 Message about replace of existing items](SACImportMetadata.md#38)
    -   [39 Message about name duplications](SACImportMetadata.md#39)
5.  Prepare for import to prevent possible problems. If none of the ideals are relevant, then prepare for a non-ideal situation. Choose from these sections:
    -   [40 Prepare for ideal situation 'All New'](SACImportMetadata.md#40)
    -   [42 Prepare for ideal situation 'All Update'](SACImportMetadata.md#42)
    -   [45 Prepare for a non-ideal situation](SACImportMetadata.md#45)
6.  The actual import happens in section:
    -   [50 Perform the import](SACImportMetadata.md#50)
7.  Problem descriptions allow you to plan to avoid problems or take action when the problems occur. See these sections:
    -   [60 Possible data problems during import](SACImportMetadata.md#60)
    -   [61 Possible problem A - import ID out of range](SACImportMetadata.md#61)
    -   [62 Fix problem A](SACImportMetadata.md#62)
    -   [63 Prevent problem A](SACImportMetadata.md#63)
    -   [64 Possible problem B - import ID and name in different items](SACImportMetadata.md#64)
    -   [65 Fix problem B](SACImportMetadata.md#65)
    -   [66 Prevent problem B](SACImportMetadata.md#66)
    -   [67 Possible problem C - import name exists and ID not found](SACImportMetadata.md#67)
    -   [68 Fix problem C](SACImportMetadata.md#68)
    -   [69 Prevent problem C](SACImportMetadata.md#69)
    -   [70 Possible problem D - delete of relationships](SACImportMetadata.md#70)
    -   [71 Fix problem D](SACImportMetadata.md#71)
    -   [72 Prevent problem D](SACImportMetadata.md#72)
8.  Background information is described in these sections:
    -   [90 Structure of XML files](SACImportMetadata.md#90)
    -   [91 Does an ID number exist in an environment?](SACImportMetadata.md#91)
    -   [92 Is an ID number 'missing' in an environment?](SACImportMetadata.md#92)
    -   [93 How to find a range of ID numbers](SACImportMetadata.md#93)
    -   [94 Does a name already exist in an environment?](SACImportMetadata.md#94)
    -   [95 Comparison of export and import functions in WW and WE](SACImportMetadata.md#95)
    -   [97 Import history in log file](SACImportMetadata.md#97)
    -   [100 Need more on this page?](SACImportMetadata.md#100)

## 02 Knowledge you need first {#02 .section}

This topic assumes you are familiar with these topics:

-   "**Export metadata overview**",
-   "**WE Security overview**".

Links to these overviews are under **Related concepts** below.

## 03 What is import of metadata? {#03 .section}

Import means data in an XML file creates or updates metadata in a target environment.

As for export, an XML file has a "main" item and potentially some "related" items". The "main" metadata types are:

-   Physical file,
-   Logical file,
-   Logical record,
-   Lookup path,
-   View.

The table below shows the possible "related" items:

|"Main" item|Possible "related" items|
|-----------|------------------------|
|Physical file|User-exit routine|
|Logical file|Physical file, user-exit routine|
|Logical record|Logical file, physical file, user-exit routine|
|Lookup path|Logical record, logical file, physical file, user-exit routine|
|View|Control record, lookup path, logical record, logical file, physical file, user-exit routine|

![](images/MImp_01Intro_01_Main_Related.gif)

## 04 Why is import useful? {#04 .section}

![](images/MImp_01Intro_02_Export_Import.gif)

There are three reasons to import metadata from XML files:

-   Restore from a backup of a metadata item into the same environment.
-   Copy a metadata item into a different target environment in the same SAFR database. This is effectively the same as a migration of that metadata item.

All backup, restore and copy options are outlined in help topic "**Metadata - advanced overview**". A link to that overview is under **Related concepts** below.

## 10 Always import to same database as export {#10 .section}

![](images/MImp_02Basic_01_Must_SameDB.gif)

Do NOT import into a different database to the export database. This corrupts the target database. To survive this import, you must find what backups you have available for the target database and run a restore of that database. IBM does not support copy of metadata to a different database from where the metadata was sourced.

## 11 Critical issues for an import {#11 .section}

Critical issues for metadata in the SAFR Workbench are:

-   Database for the target environment which must be the same as the database for the export of the XML file.
-   Target environment . This could be a new environment or an existing environment.
-   Name and ID number of existing metadata items.
-   Related items of metadata.

Critical issues for data in the import XML file are:

-   Name and ID number of the "**main**" item.
-   Name and ID number of each "**related**" item.

Always import using **blank** for field "**Replace IDs**" on the Import Utility screen. A value of blank means that the exact ID number in the XML file is used in the target environment.

![](images/MImp_02Basic_02_Critical_Issues.gif)

ID numbers are a complex issue. Before importing, the relevant sections to read are:

-   [20 Ranges of ID numbers and 'missing' ID numbers](SACImportMetadata.md#20)
-   [21 Delete also creates 'missing' ID numbers](SACImportMetadata.md#21)
-   [22 Import can increase a range by 1](SACImportMetadata.md#22)
-   [23 How to find most 'missing' ID numbers](SACImportMetadata.md#23)
-   [30 Ideal situation for import: 'All New'](SACImportMetadata.md#30)
-   [32 Ideal situation for import: 'All Update'](SACImportMetadata.md#32)
-   [35 Non-ideal situations for import](SACImportMetadata.md#35)
-   [38 Message about replace of existing items](SACImportMetadata.md#38)
-   [40 Prepare for ideal situation 'All New'](SACImportMetadata.md#40)
-   [42 Prepare for ideal situation 'All Update'](SACImportMetadata.md#42)
-   [45 Prepare for a non-ideal situation](SACImportMetadata.md#45)

## 20 Ranges of ID numbers and 'missing' ID numbers {#20 .section}

A SAFR **database** can contain many **environments**. The current database and environment are always shown at the bottom of the screen in the SAFR Workbench.

Every SAFR database has a range of ID numbers for each metadata type. The range for each metadata type applies to all the environments inside that database.

The range is always between 1 and the largest ID number for that metadata type in that database.

A new item always increases the range for that metadata type by 1 . Notice how creating an item in one environment increases the range for all environments in that database.

Let's look at an example. Consider a metadata type T in a **SAFR Database X** with **Environment A** and **Environment B**.

In this example, a user in Environment A creates an item of type T. The new item has name TAAA and ID number 1. Later, a user in Environment B creates another item of type T. This second item has name TBBB and ID number 2.

Notice that both environments have the same range for metadata type "T" - from 1 to 2.

Notice that Environment A has a **'missing' ID number** of 2. In the same way, Environment B has a 'missing' ID number of 1. A diagram of this example is below.

![](images/MImp_03IDNum_01_RangeMissingIDs.gif)

These 'missing' ID numbers are normal. You can import into 'missing' ID numbers in any environment, without affecting the range.

For example, in the above situation, a user in Environment A can import a "main" item of type T, using name TCCC and ID number 2. The result is below:

![](images/MImp_03IDNum_02_ImpMissID.gif)

In the above example, the name TCCC from the XML file is typically the same as TBBB \(because of a migration\). It is possible these names are different because an item can be renamed after a migration.

Almost all environments have 'missing' ID numbers.

## 21 Delete also creates 'missing' ID numbers {#21 .section}

This section is relevant only when ID numbers are important to your company, as discussed in section [10 Always import to same database as export](SACImportMetadata.md#10).

In the previous section, the 'missing' ID numbers are the result of creating items in different environments in the same database.

A delete of metadata also creates 'missing' ID numbers. In the example below, if item THHH with ID number 2 is deleted, then Environment A now has 'missing' ID number 2.

![](images/MImp_03IDNum_03_DelCauseMissID.gif)

## 22 Import can increase a range by 1 {#22 .section}

-

If an import XML file has an ID number larger than the range in the target database, then an **import increases the range by 1.**

This section is not a normal situation.**Do not proceed with this import unless you know why this situation has occurred, and you accept the risk** that the target database may be corrupted after the import.

Consider a detailed example. In this example physical files have a range of 1 to 1000 in a target database. Consider an import into a target environment in that database.

If an XML file has a physical file of ID 23, then this ID is in the range. If the target environment has a 'missing' ID 23, then the import creates a physical file of ID 23. If the target environment already has a physical file of ID 23, then the import updates this record. In both cases, the ID after import is unchanged at 23.

If an XML file has a physical file of ID **2345**, then this ID is out of the range for the target environment and database. An import creates an ID number of **1001**.

What can cause this situation? Two possible causes are as follows:

-   **Import to a different database compared to the database for export** of the XML file.

    Do NOT import into a different database to the export database. This corrupts the target database. To survive this import, you must find what backups you have available for the target database and run a restore of that database. IBM does not support copy of metadata to a different database from where the metadata was sourced.

-   **Manual update of one or more ID numbers in the import XML file.**

    This is not recommended as it is very easy to result in corruption of the target database. To survive this import, you must find what backups you have available for the target database and run a restore of that database.


![](images/MImp_03IDNum_04_RangeIncrease1.gif)

Notice that after an import the ID number of a metadata item may not be the same as in the XML file. This may be a problem for your company, for example for audit results. This issue is further discussed in section [61 Possible problem A - import ID out of range](SACImportMetadata.md#61).

## 23 How to find most 'missing' ID numbers {#23 .section}

When the Metadata List is sorted into ID number order, most 'missing' ID numbers are clearly visible. Do the following:

1.  Log into the Workbench using the relevant environment.
2.  In the Navigator, **click on the relevant metadata type**.
3.  The Metadata List displays a list of existing metadata items of that type. **Click on the heading "Id"** to sort the list into descending order for ID number. If you click this heading multiple times, the list varies between descending and ascending order for ID number.
4.  If every ID number exists, you will see a complete list of numbers: 1, 2, 3, 4 etc. Any gaps indicate 'missing' ID numbers. An example is below.

    ![](images/MImp_03IdNum_05_MissingIDs_PF.gif)


To find all the 'missing' ID numbers, see section [93 How to find a range of ID numbers](SACImportMetadata.md#93). Once you know the range, you can determine if there are any 'missing' ID number between the last ID number displayed above and the limit of the range. For example, if the range in the above image is 8420, then all the numbers from 8408 to 8420 are 'missing' in this environment.

## 30 Ideal situation for import: 'All New' {#30 .section}

This is an ideal situation for an import where the following is true:

-   Names of every item in the XML file do not exist in the target environment.
-   ID numbers of every item in the XML file are 'missing' ID numbers in the target environment.

In this ideal situation, an import creates only new metadata items with the exact ID number given in the XML file.

This type of import is useful because the existing metadata in the target environment is untouched by the import.

![](images/MImp_04Ideal_01_Allnew.gif)

The above ideal is not mandatory for import. If it is possible and appropriate, it is recommended to adjust your data to conform to this ideal.

To use this ideal, see section [40 Prepare for ideal situation 'All New'](SACImportMetadata.md#40).

## 32 Ideal situation for import: 'All Update' {#32 .section}

This is an ideal situation for an import where the following is true:

-   Every combination of name and ID in every record in the XML file already exists in the target environment,
-   The related items are the same when comparing the main items in the XML file with the relationships for the same items in the target environment.

In this ideal situation, an **import with blank for "Replace IDs"** updates only the existing items listed in the XML file.

This type of import is useful because the changes to the target environment are limited. This ideal often applies when restoring from a backup.

This import may change some metadata items to status "inactive", which is normal when data is updated.

This type of import generates a standard message given in section [38 Message about replace of existing items](SACImportMetadata.md#38).

![](images/MImp_04Ideal_02_AllUpd.gif)

**This ideal needs to be used with care:** the list of "related" items for the main items in the XML file must be accurate when compared to the relationships for the same items in the target environment \(unless the differences are acceptable\). If any existing related metadata itemsin the target environment are not in the XML file, then these related items are deleted during the import. For more on this, see section [70 Possible problem D - delete of relationships](SACImportMetadata.md#70).

To use this ideal, read these sections:

-   [38 Message about replace of existing items](SACImportMetadata.md#38),
-   [42 Prepare for ideal situation 'All Update'](SACImportMetadata.md#42).

## 35 Non-ideal situations for import {#35 .section}

Almost all situations for import are **non-ideal** - which means the import includes both adding new items and updating existing items in the target environment.

A non-ideal situation is a normal way to import metadata. With correct preparation a non-ideal situation produces useful results.

A non-ideal situation may happen when as a surprise - when you believe the data is in an ideal situation. Often you can discover the data is in a non-ideal situation when one of these things happens:

-   A surprise **fail** result for an import.
-   A surprise in **data displayed** in messages during the import. The relevant messages are discussed in these sections:
    -   [38 Message about replace of existing items](SACImportMetadata.md#38)
    -   [39 Message about name duplications](SACImportMetadata.md#39)

If you are surprised by data in the above messages, make a note of the data in the messages and press **Cancel** to stop the import, and review the import you are attempting.

Note that it is recommended that **all import use blank for "Replace IDs"**.

For non-ideal situations, read these sections:

-   [38 Message about replace of existing items](SACImportMetadata.md#38)
-   [39 Message about name duplications](SACImportMetadata.md#39)
-   [45 Prepare for a non-ideal situation](SACImportMetadata.md#45)

## 38 Message about replace of existing items {#38 .section}

The strategy for import is "**replace not merge**". This means that update of an existing item in the target environment is achieved by a total replacement of the item by the data in the XML file.

If an import updates \(replaces\) existing items in the target environment, the import displays a standard message. The messages is similar to:

![](images/Import_Exist_comps_2_LF_02.gif)

This is a normal and important message. You must be familiar with all the metadata items listed and the intended updates.

Press **OK** to allow the import to proceed and update the metadata listed in the message. Press **Cancel** to stop the import.

## 39 Message about name duplications {#39 .section}

This message only occurs for an import with a **tick for Replace IDs**.

This message occurs when the XML file has at least one metadata name that already exists in the target environment. The ID numbers of the metadata items with the duplicated names may be different. The message offers a choice of actions for each case where there is a duplicated name.

This message is a normal message and the correct choices depends on deciding the best choices for your data.

An example of the message is below:

![](images/Import_Utility_05_Imp_Name_Dupl_01.gif)

The message gives a list of metadata items in the XML file where the name already exists in the target environment. There items are listed in the column "**Old Name**". The item type is also listed as a heading above a group of names.

Each item listed has a **suggested new name and a box "Use Existing"**. The choices for the "Use Existing" box are:

-   EITHER put a **tick for "Use Existing"**. This means no import occurs for that metadata item. Instead, any references to that item use the existing data. A tick for "Use Existing" results in a blank value in the "New Name" column because the new name is not used.
-   OR ensure a **blank for "Use Existing"**. This means that item in the XML file is given the new name suggested, and is imported with a new ID number. After the import completes, the target environment contains both the existing item \(with the old name\) and the new item from the XML file \(with the new name\).

Your choice for each listed metadata item is to tick "Use Existing" or leave this field blank. Clicking the box repeatedly alternates between a tick and a blank value.

Each item listed also has a **box "Remember"**. The choices are:

-   EITHER put a **tick** for "Remember" if you prefer to make a decision **once** for "Use Existing" for that metadata item. Your decision applies every time that metadata name appears in the import, which may occur many times.
-   OR ensure a **blank** for "Remember" if you prefer to make a decision **every time** for "Use Existing" for that metadata item. With this choice, you may need to make a decision multiple times on "Use Existing" for the same metadata item in one import.

Tick "Remember All" to ensure all items listed have a tick for "Remember". Clicking the box repeatedly alternates between a tick and a blank value. Removing the tick for "Remember All" removes the tick from all "Remember" boxes listed.

Your choice is to tick some or all of the "Remember" boxes and possibly the "Remember All" box.

When your choices are complete, press **OK** to allow the import to proceed with your choices. Press **Cancel** to stop the import.

## 40 Prepare for ideal situation 'All New' {#40 .section}

There is an easy way and a hard way to prepare for this ideal situation.

The easy way is to create a new environment in the same database as the exported items. This is only possible if the exported items were all from one database.

![](images/Mdata_Imp_Ideal_AllNew_Prepare_Easy_03.gif)

A totally new environment has no names, so all imported names are automatically new. A new environment in the same database has the same range, so the ID numbers in the XML file are always 'missing' in this new environment.

If you can create a new environment in this way, go to section [50 Perform the import](SACImportMetadata.md#50).

The hard way to prepare for ideal 'All New' is as follows:

1.  Check that all names in the XML file do not exist in the target environment. To determine this, see section [94 Does a name already exist in an environment?](SACImportMetadata.md#94).

    If some names in the XML file exist in the target environment, either change the name in the XML file or in the target environment. If this cannot be fixed, then this ideal does not apply so proceed to section [45 Prepare for a non-ideal situation](SACImportMetadata.md#45).

    When all names pass this check, then proceed to the next step.

2.  Check that all ID numbers in the XML file are 'missing' and in range in the target environment. To determine this, see sections:

    -   [93 How to find a range of ID numbers](SACImportMetadata.md#93)
    -   [92 Is an ID number 'missing' in an environment?](SACImportMetadata.md#92)
    If some ID numbers in the XML file exist in the target environment, then possible fixes are:

    -   EITHER change the ID number in the XML file,
    -   OR delete the item containing that ID number in the target environment.
    If the fixes above are not appropriate, then this ideal does not apply so proceed to section [45 Prepare for a non-ideal situation](SACImportMetadata.md#45).

    If all ID numbers pass this check, then proceed to the next step.

3.  Preparation is complete - go to section [50 Perform the import](SACImportMetadata.md#50).

![](images/Mdata_Imp_Ideal_AllNew_Prepare_Hard_03.gif)

## 42 Prepare for ideal situation 'All Update' {#42 .section}

There is a risk that an import only appears to conform to be the 'All Update" ideal and that the import may perform unwanted update or delete to existing data in the target environment. Some preparation is necessary to avoid this risk.

There is an easy way and a hard way to prepare for this ideal while eliminating risk.

The easy way to prepare is to **take a backup of the "main" item** for the planned import. This means that if the import deletes or modifies metadata that you still require, you can use the backup to restore your data.

![](images/Mdata_Imp_Ideal_AllUpd_Prepare_Easy_03.gif)

Instructions for the easy way are as follows:

1.  The XML file you are planning to import can be called Import XML file \(see diagram above\). The actual name of that file describes the "main" item. Find that "main" item in the target environment. If the "main" item does not exist in the target environment, then the "easy" preparation is complete, and you can now proceed to [50 Perform the import](SACImportMetadata.md#50).
2.  If the "main" item exists in the target environment, backup that item using topic "**Exporting metadata**" in the Administration Guide. A link to that task is under **Related tasks** below.
3.  The previous step creates an XML file that we can call the Backup XML file \(see diagram above\). Once that file exists, the "easy" preparation is complete. Proceed to [50 Perform the import](SACImportMetadata.md#50).

The "hard" way to prepare for ideal 'All Update' is to carefully check the XML file and the target environment before performing the import.

![](images/Mdata_Imp_Ideal_AllUpd_Prepare_Hard_03.gif)

The "hard" way to prepare is as follows:

1.  Be aware that the strategy for import is "**replace not merge**". This means that existing related items in the target environment are replaced by the data in the XML file. Read these sections:
    -   [70 Possible problem D - delete of relationships](SACImportMetadata.md#70)
    -   [71 Fix problem D](SACImportMetadata.md#71)
    -   [72 Prevent problem D](SACImportMetadata.md#72)
2.  Check that all combinations of name and ID number in the XML file exist in the target environment. Do this as follows:
    1.  Choose the next name for a metadata item in the XML file.
    2.  Check that name exists in the target environment, by using section [94 Does a name already exist in an environment?](SACImportMetadata.md#94).
    3.  If the name in the XML file does not exist in the target environment, then this ideal does not apply so proceed to section [45 Prepare for a non-ideal situation](SACImportMetadata.md#45).
    4.  If the name in the XML file exists in the target environment, check that the ID number in the target environment for this item is the same as given in the XML file.
    5.  If the ID number is different to the XML file, then this ideal does not apply so proceed to section [45 Prepare for a non-ideal situation](SACImportMetadata.md#45).
    6.  If the ID number matches the XML file, then return to step 2a above to check the next name in the XML file. If all combinations of name and ID number in the XML file pass this check, then proceed to step 3 below.
3.  Check that the main item in the XML file has the same related items when you compare the XML file to the target environment. Do this as follows:
    1.  Find the main metadata item in the XML file.
    2.  Find the same item in the target environment using section [94 Does a name already exist in an environment?](SACImportMetadata.md#94).
    3.  Make a list of the name and ID number for the related items in the target environment for that main item. The related items depend on the main item type - for a list of possible related item types, see section [03 What is import of metadata?](SACImportMetadata.md#03). Make a list of the actual related items for each possible type of related item.
    4.  Check that the list of related items from the target environment are also related items in the XML file. The name and ID number must both match for each related item.
    5.  If the related items are different, decide if the differences are acceptable or not. If all changes are acceptable, proceed to the next step below. If the differences are not acceptable, then this ideal does not apply so proceed to section [45 Prepare for a non-ideal situation](SACImportMetadata.md#45).
4.  Preparation is complete - go to section [50 Perform the import](SACImportMetadata.md#50).

## 45 Prepare for a non-ideal situation {#45 .section}

Non-ideal means your import involves a combination of creating new items and updating existing items. With care, this import is useful.

Preparing for a non-ideal situation is the same for ID numbers important or not important.

There is an easy way and a hard way to prepare for a non-ideal situation.

The easy to prepare is to **take a backup of the "main" item** for the planned import. This means that if the import deletes or modifies metadata that you still require, you can use the backup to restore your data.

![](images/Mdata_Imp_NonIdeal_Prepare_Easy_03_Both.gif)

Instructions for the easy way are as follows:

1.  The XML file you are planning to import can be called Import XML file \(see diagram above\). The actual name of that file describes the "main" item. Find that "main" item in the target environment. If the "main" item does not exist in the target environment, then you must choose the "Hard" way to prepare given below, because there is a risk that the import may damage some related items of metadata that already exist in the target environment.
2.  If the "main" item exists in the target environment, backup that item using topic "**Exporting metadata**" in the Administration Guide. A link to that task is under **Related tasks** below.
3.  The previous step creates an XML file that we can call the Backup XML file \(see diagram above\). Once that file exists, the "easy" preparation is complete. Proceed to [50 Perform the import](SACImportMetadata.md#50).

The hard way to prepare for a non-ideal situation is to carefully check the XML file and the target environment before performing the import.

![](images/Mdata_Imp_NonIdeal_Prepare_Hard_03_Both.gif)

Do the following:

1.  Read these sections:
    -   [60 Possible data problems during import](SACImportMetadata.md#60)
    -   [61 Possible problem A - import ID out of range](SACImportMetadata.md#61)
    -   [62 Fix problem A](SACImportMetadata.md#62)
    -   [63 Prevent problem A](SACImportMetadata.md#63)
    -   [64 Possible problem B - import ID and name in different items](SACImportMetadata.md#64)
    -   [65 Fix problem B](SACImportMetadata.md#65)
    -   [66 Prevent problem B](SACImportMetadata.md#66)
    -   [67 Possible problem C - import name exists and ID not found](SACImportMetadata.md#67)
    -   [68 Fix problem C](SACImportMetadata.md#68)
    -   [69 Prevent problem C](SACImportMetadata.md#69)
    -   [70 Possible problem D - delete of relationships](SACImportMetadata.md#70)
    -   [71 Fix problem D](SACImportMetadata.md#71)
    -   [72 Prevent problem D](SACImportMetadata.md#72)
2.  Be aware that the strategy for import is "**replace not merge**". This means that existing items in the target environment are replaced by the data in the XML file. This may result in existing data being deleted, as discussed in section [70 Possible problem D - delete of relationships](SACImportMetadata.md#70).
3.  Ensure you know the answers to these questions:

    -   What items does import of the XML file **create** in the target environment?
    -   What items does import of the XML file **update** in the target environment?
    To answer these questions, use the following sections:

    -   [91 Does an ID number exist in an environment?](SACImportMetadata.md#91)
    -   [92 Is an ID number 'missing' in an environment?](SACImportMetadata.md#92)
    -   [93 How to find a range of ID numbers](SACImportMetadata.md#93)
    -   [94 Does a name already exist in an environment?](SACImportMetadata.md#94)
    Adjust your target environment and XML file as required to prevent problems found in Step 1 above.

4.  Preparation is complete - go to section [50 Perform the import](SACImportMetadata.md#50).

## 50 Perform the import {#50 .section}

Do the following:

1.  Ensure you have prepared using one of the following sections:
    -   [40 Prepare for ideal situation 'All New'](SACImportMetadata.md#40)
    -   [42 Prepare for ideal situation 'All Update'](SACImportMetadata.md#42)
    -   [45 Prepare for a non-ideal situation](SACImportMetadata.md#45)
2.  Import may result in change to existing metadata in the target environment. It is recommended that you backup all relevant metadata in the target environment before you import, so that you can restore the existing data if required. The relevant metadata is listed in each XML file for import - the "main" item and the "related" items. For complete safety, backup all metadata in the target environment into XML files. You may have already done this as part of Step 1 above.

    A backup is done using an export - see help topic "**Export metadata overview**". A link to that task is under **Related tasks** below.

3.  Perform the import using help topic "**Importing metadata**" in the Administration Guide and then return here. A link to that task is under **Related tasks** below.
4.  If the import has problems, see [60 Possible data problems during import](SACImportMetadata.md#60).

    If that section is not sufficient, see help topic "**Import Utility errors**". A link to that task is under **Related tasks** below.

5.  The WE log file contains data about imports you perform in this session. See section [97 Import history in log file](SACImportMetadata.md#97).

## 60 Possible data problems during import {#60 .section}

The section below contains some common errors and is useful for planning your import and a learning how to handle problem. For a full list of possible error messages, see help topic "**Import Utility errors**". A link to that task is under **Related tasks** below.

The table below describes possible problems and solutions:

|Possible problem|Solution|
|----------------|--------|
|![](images/Import_Exist_comps_2_LF_03_ForTable.gif)

|This is a normal message that displays before the import updates existing metadata items.

 **You have a choice to update the metadata items listed.**

 Be aware that updating the metadata items listed may affect other data in the environment. For example, update of a logical record may affect many views and lookup paths and logical files in the target environment.

 Press **Cancel** to stop the import.

 Press **OK** to allow the import to proceed and update the metadata listed in the message.

|
| | |
|![](images/Import_Error_IDsRange_02_ForTable.gif)

|This is an example of "problem A". See sections -   [61 Possible problem A - import ID out of range](SACImportMetadata.md#61)
-   [62 Fix problem A](SACImportMetadata.md#62)

|
| | |
|"**Fail**" appears in the "**Import Utility**" screen on the row for this import. When you highlight the row with "Fail" a message appears in the "Errors" section of the screen. An example error message for importing a physical file is: **The Physical File name 'AAAA' already exists. Please specify a different name.**

|This is either "problem B" or 'problem C". See sections:-   [64 Possible problem B - import ID and name in different items](SACImportMetadata.md#64)
-   [65 Fix problem B](SACImportMetadata.md#65)
-   [67 Possible problem C - import name exists and ID not found](SACImportMetadata.md#67)
-   [68 Fix problem C](SACImportMetadata.md#68)

|
| | |
|After an import, a metadata item is missing or has missing related items. For example, a logical file may have less related physical files.|This may be "problem D". See sections -   [70 Possible problem D - delete of relationships](SACImportMetadata.md#70)
-   [71 Fix problem D](SACImportMetadata.md#71)

|

## 61 Possible problem A - import ID out of range {#61 .section}

An import can assign an ID number to a metadata item that is different to the ID number in the XML file. This is discussed in section [22 Import can increase a range by 1](SACImportMetadata.md#22).

This problem occurs when the ID number is the XML is too big for the relevant range in the target environment. The import must assign a lower ID number to fit the range in the target environment, and the range in the target environment is increased by 1.

**Possible problem A is indicated by a warning message similar to the following:**

![](images/Import_Error_IDsRange_01_PF_UER.gif)

Click **OK** to allow the import to assign lower ID numbers than shown in the XML file. Take this action if your company is comfortable with the changed ID numbers.

Click **Cancel** to stop the import.

This problem can never occur in a "restore" type of import. This is because a range only gets larger, so during a "restore" import the range can always include the ID numbers in the XML file.

For the same reason, this problem never occurs in a "copy" type of import where the target environment is in the same SAFR database as the export environment.

This problem may only occur for a "copy" import where the target environment is in a different SAFR database to the export environment. For that situation, the problem occurs when at least one of the ranges in the target environment is smaller then the export environment and cannot fit at least one ID number in the XML file. If that occurs, the import assigns a lower ID number in the target environment than shown in the XML file.

## 62 Fix problem A {#62 .section}

This problem is described in section [61 Possible problem A - import ID out of range](SACImportMetadata.md#61).

If you incorrectly click **OK** on the screen "**Imported IDs out of range**" then the import creates metadata items with an incorrect ID number. Fix this by deleting the metadata items created. The affected items were listed in the warning message similar to that shown in [61 Possible problem A - import ID out of range](SACImportMetadata.md#61). Another way to find the affected items is to check the XML file.

## 63 Prevent problem A {#63 .section}

This problem is described in section [61 Possible problem A - import ID out of range](SACImportMetadata.md#61).

This problem can be prevented as follows:

|Options to prevent this problem|Details|
|-------------------------------|-------|
| | |
|Target environment is a new environment in the same SAFR Database where the XML file was exported.|1.  Perform the 'easy' way in section [40 Prepare for ideal situation 'All New'](SACImportMetadata.md#40).
2.  **Import** to the new environment. 

|
| | |
|Create dummy items in the target environment to ensure the range accommodates the ID numbers in the XML file.|1.  **Analyze the XML file** for the metadata type, ID number and name in each record for import.
2.  **Analyze the target environment** to find the metadata types that require more ID numbers to accommodate the XML file data.
3.  **Create dummy metadata items** of the correct type to increase the range in the target environment, so that the ID numbers in the XML file records are "in range". Ensure that the ID number for the import has the correct name \(not a dummy name\).
4.  **Check if the names in the XML file exist in the target environment.** It may be acceptable that the name exists with the correct ID number in the target environment so the that the import updates that metadata item. Check that all related items are included - see section [70 Possible problem D - delete of relationships](SACImportMetadata.md#70). Make any changes to the target environment or the XML file as appropriate.
5.  **Import** to the target environment.

|

## 64 Possible problem B - import ID and name in different items {#64 .section}

In this case, a record in the XML file refers to two items in the target environment, as shown below.

![](images/Mdata_Imp_Prob_B_IDNameDiffRecs_01.gif)

On the "**Import Utility**" screen, this import is marked with result "**Fail**" and when you highlight the line with "Fail" a message appears in the "Errors" section of the screen.

An example error message for importing a physical file is: **The Physical File name 'AAAA' already exists. Please specify a different name.**

In this example, the message is identical to the example in section [67 Possible problem C - import name exists and ID not found](SACImportMetadata.md#67).

## 65 Fix problem B {#65 .section}

This problem is described in section [64 Possible problem B - import ID and name in different items](SACImportMetadata.md#64).

Fix as follows:

1.  **In the XML file, find the record of the correct type** that has the name "AAAA'.
2.  **Check that the name is correct in the XML file.** The correct name is based on your choice of name, and on a review of existing names in the target environment. Check all names of that metadata item type in the target environment to see if your choice of name is appropriate. You may choose to change the name of this record in the XML file.
3.  **Check that the ID number is correct in the XML file.** The correct ID number is either a missing ID number in the target environment \(for import of a new metadata item\), or the ID number of an existing metadata item \(for update of that metadata item\).
4.  **Alternatively, you may choose to change the target environment** to ensure this import can proceed. Options are deleting or renaming one or more existing metadata items.
5.  Once the XML or target environment are updated, then **repeat the import**. Note that if you update the XML file, there may be errors in the format of the XML file that stop the import from completing.

## 66 Prevent problem B {#66 .section}

This problem is described in section [64 Possible problem B - import ID and name in different items](SACImportMetadata.md#64).

Some preparation before the import can prevent this problem occurring.

|Options to prevent this problem|Details|
|-------------------------------|-------|
| | |
|Target environment is a new environment|1.  Perform the 'easy' way in section [40 Prepare for ideal situation 'All New'](SACImportMetadata.md#40).
2.  **Import** to the new environment.

|
| | |
|Analyze the XML file and the target environment to detect and fix problems before the import starts.|1.  **Analyze the XML file** for the metadata type, ID number and name in each record for import.
2.  **Check that each name is correct in the XML file.** The correct name is based on your choice of name, and on a review of existing names in the target environment. Check all names of that metadata item type in the target environment to see if your choice of name is appropriate. You may choose to change the name of this record in the XML file.
3.  **Check that the ID number is correct in the XML file.** The correct ID number is either a missing ID number in the target environment \(for import of a new metadata item\), or the ID number of an existing metadata item \(for update of that metadata item\).
4.  **Alternatively, you may choose to change the target environment** to ensure this import can proceed. Options are deleting or renaming one or more existing metadata items.

|

## 67 Possible problem C - import name exists and ID not found {#67 .section}

In this case, the record in the XML file is only matched in the target environment with the name of the metadata item. The ID number in the record is not anywhere in the target environment.

![](images/Mdata_Imp_Prob_C_NameexistsIDbad_01.gif)

On the "**Import Utility**" screen, this import is marked with result "**Fail**" and when you highlight the line with "Fail" a message appears in the "Errors" section of the screen.

An example error message for a physical file is: **The Physical File name 'AAAA' already exists. Please specify a different name.**

In this example, the message is identical to the example in section [64 Possible problem B - import ID and name in different items](SACImportMetadata.md#64).

## 68 Fix problem C {#68 .section}

This problem is described in section [67 Possible problem C - import name exists and ID not found](SACImportMetadata.md#67).

Fix as follows:

1.  **In the XML file, find the record of the correct type** that has the name "AAAA'.
2.  **Check that the name is correct in the XML file.** The correct name is based on your choice of name, and on a review of existing names in the target environment. Check all names for that metadata item type in the target environment to see if your choice of name is appropriate. You may choose to change the name of this record in the XML file.
3.  **Check that the ID number is correct in the XML file.** The correct ID number is either a missing ID number in the target environment \(for import of a new metadata item\), or the ID number of an existing metadata item \(for update of that metadata item\).
4.  **Alternatively, you may choose to change the target environment** to ensure this import can proceed. Options are deleting or renaming one or more existing metadata items.
5.  Once the XML or target environment are updated, then **repeat the import**. Note that if you update the XML file, there may be errors in the format of the XML file that stop the import from completing.

## 69 Prevent problem C {#69 .section}

This problem is described in section [67 Possible problem C - import name exists and ID not found](SACImportMetadata.md#67).

Some preparation before the import can prevent this problem occurring.

|Options to prevent this problem|Details|
|-------------------------------|-------|
| | |
|Target environment is a new environment|1.  Perform the 'easy' way in section [40 Prepare for ideal situation 'All New'](SACImportMetadata.md#40).
2.  **Import** to the new environment.

|
| | |
|Analyze the XML file and the target environment to detect and fix problems before the import starts.|1.  **Analyze the XML file** for the metadata type, ID number and name in each record for import.
2.  **Check that each name is correct in the XML file.** The correct name is based on your choice of name, and on a review of any existing names in the target environment. Check all names of that metadata item type in the target environment to see if your choice of name is appropriate. You may choose to change the name of this record in the XML file.
3.  **Check that the ID number is correct in the XML file.** The correct ID number is either a missing ID number in the target environment \(for import of a new metadata item\), or the ID number of an existing metadata item \(for update of that metadata item\).
4.  **Alternatively, you may choose to change the target environment** to ensure this import can proceed. Options are deleting or renaming one or more existing metadata items.

|

## 70 Possible problem D - delete of relationships {#70 .section}

In this case, the main record in the XML file has a matching main metadata item in the target environment. The problem is the XML file has different "related" items compared to the target environment. In this case, an import deletes existing relationships and replaces with the relationships in the XML file. This may be a problem for your company.

Be aware that the strategy for import is "**replace not merge**". This means that existing relationships in the target environment are deleted and replaced by the relationships in the XML file.

For example, a metadata item of type "T" has related items of type "Q". The XML file only has two related items of type Q, whereas the target environment as10 related items of type Q. An import replaces 10 related items with two related items. The import has resulted in delete of at least eight existing relationships.

![](images/Mdata_Imp_Prob_D_DelAssocMdtata_01.gif)

There is **no error message** warning of the delete of relationships.

Delete of existing relationships may be OK for your company for some data. No action is required if this is true.

## 71 Fix problem D {#71 .section}

This problem is described in section [70 Possible problem D - delete of relationships](SACImportMetadata.md#70).

The only fix is to restore from a backup of the metadata that was deleted. The backup may be in XML files, or in a "whole" database backup.

Restore from backup as follows:

|How the backup was created|How to restore|
|--------------------------|--------------|
|"Whole" database backup using the given utilities for that database tool. The tool may be, for example, DB2.|Use the given utilities for that database tool.

|
|XML file\(s\) created by help topic "**Export metadata overview**".|For each backup XML file, go to section [50 Perform the import](SACImportMetadata.md#50)|

## 72 Prevent problem D {#72 .section}

This problem is described in section [70 Possible problem D - delete of relationships](SACImportMetadata.md#70).

If the delete of existing relationships is a possible problem, consider the following actions:

|Options to prevent this problem|Details|
|-------------------------------|-------|
| | |
|Backup target environment before import.|1.  Before the import, **export** all metadata items that may be overwritten by an import. The exported XML files are the backups.
2.  If an import deletes relationships that are required, restore the relationships using an **import from a backup**. The import recreates the deleted relattionships.

|
| | |
|Analyze the XML file and the target environment to detect and fix problems before the import starts.|1.  **Analyze the XML file** for the metadata type, ID number and name in each record for import.
2.  **Check all related metadata in the XML file.** Make a list of the related items, the metadata types, ID numbers and names.
3.  **Check the target environment.** List the equivalent metadata items in the target environment and check the related items. If there are differences, decide if the differences are OK or a problem.
4.  **If the differences are a problem, modify the XML as appropriate.** This may require a new export to create a new XML file which you can then modify if required.

|

## 90 Structure of XML files {#90 .section}

See help topic "**XML structure for metadata overview**". A link to that overview is under **Related concepts** below.

## 91 Does an ID number exist in an environment? {#91 .section}

An XML file specifies an ID number for a certain metadata item. To determine if that ID number exists in a particular environment, do the following:

1.  Log into the Workbench using the relevant environment.
2.  In the Navigator, **click on the relevant metadata type**.
3.  The Metadata List displays a list of existing metadata items of that type. **Click on the heading "Id"** to sort the list into descending order for ID number. If you click this heading multiple times, the list varies between descending and ascending order for ID number.
4.  Look for the particular ID number in the Metadata List. If the ID number is not listed, then the ID number does not exist in that environment.

## 92 Is an ID number 'missing' in an environment? {#92 .section}

For the purposes of this help topic, a 'missing' ID number must meet two requirements:

-   The ID number does not exist for that metadata type in that environment.
-   The ID number is "in range" for that metadata type in that environment.

An XML file specifies an ID number for a certain metadata item. To determine if that ID number is 'missing' from a particular environment, do the following:

1.  You must first determine the range of ID numbers for the relevant metadata type in that environment using section [93 How to find a range of ID numbers](SACImportMetadata.md#93). The ID number you are checking must be equal to or less than the range for the metadata type.
2.  Log into the Workbench using the relevant environment.
3.  In the Navigator, **click on the relevant metadata type**.
4.  The Metadata List displays a list of existing metadata items of that type. **Click on the heading "Id"** to sort the list into descending order for ID number. If you click this heading multiple times, the list varies between descending and ascending order for ID number.
5.  Look for the particular ID number in the Metadata List. If the ID number is not listed, then the ID number is 'missing' from that environment.

When the Metadata List is sorted into ID number order, most 'missing' ID numbers are clearly visible, as shown below.

![](images/Mdata_Imp_MissingIDs_PF_01.gif)

## 93 How to find a range of ID numbers {#93 .section}

A range of ID numbers applies to each metadata type in a database. The database may contain multiple environments. To import to a target environment, it is important to know the range of ID numbers for the relevant metadata type.

A range always starts at 1. The upper limit is the information you need.

There is an easy way and a hard way to find the upper limit to the range.

The easy way is to create a new "dummy" item of that metadata type in the target environment. The ID number of that "dummy" item is \(at that moment\) the upper limit for the range for that metadata item in that database. Delete that "dummy" item.

The hard way to find the upper limit of the range is as follows:

1.  Log into the Workbench using the an environment in the target database for the intended import.
2.  In the Navigator, **click on the relevant metadata type**.
3.  The Metadata List displays a list of existing metadata items of that type. **Click on the heading "Id"** to sort the list into descending order for ID number. If you click this heading multiple times, the list varies between descending and ascending order for ID number. Make a note of the highest ID number in that Metadata List.
4.  Follow the above steps for every environment in the database. The upper limit of the range is the largest ID number for that metadata type across all environments in that database.

## 94 Does a name already exist in an environment? {#94 .section}

An XML specifies a name for a certain metadata item. To determine if that name already exists in that particular environment, do the following:

1.  Log into the Workbench using the relevant environment.
2.  In the Navigator, **click on the relevant metadata type**.
3.  The Metadata List displays a list of existing metadata items of that type. **Click on the heading "Name"** to sort the list into descending order for name. If you click this heading multiple times, the list varies between descending and ascending order for name.
4.  Look for the particular name in the Metadata List for the appropriate metadata type. If the name is listed, then the name exists in that environment.

## 95 Comparison of export and import functions in WW and WE {#95 .section}

This online help is provided for the SAFR Workbench called **WE \(Workbench Eclipse\)**.

The export and import functions were provided in an older version of the SAFR Workbench called **WW\(Windows Workbench\).**

At a high level, the export and import in WW and WE are similar but not compatible. For example, an XML file created by an export in WW cannot be imported into WE.

A **comparison of the export functions of WW and WE** is as follows:

-   WE provides export for only these metadata types:
    -   Physical file,
    -   Logical file,
    -   Logical record,
    -   Lookup path,
    -   View.
-   XML files exported from WE have a different format for date/time stamp compared to XML files exported from WW. The formats are as follows:
    -   WW format in the USA is: **MM/DD/YYYY HH:MM:SS AMPM** \(at midnight the time part is omitted\)
    -   WW format in some other countries is: **DD/MM/YYYY HH:MM:SS AMPM** \(at midnight the time part is omitted\)
    -   WE format is: **YYYY-MM-DD HH:MM:SS** \(24 hour clock\)
-   WE does not request selecting a SAFR database at the start of the export function. WE export uses the database for your current session.
-   WE provides a choice of location for the XML file that is generated by the export.

A **comparison of the import functions of WW and WE** is as follows:

-   WE import performs more checks on the XML files and their relationship with existing metadata in the target environment.
-   WE import is more consistent and reliable.
-   WE import ensures that serious potential problems are blocked and the import cannot proceed.
-   WE import provides a warning for minor potential problems, and gives a choice to proceed or cancel the import.
-   Overall, the WE import function preserves the integrity of the metadata in the target environment after import is complete.

## 97 Import history in log file {#97 .section}

For an introduction to WE log files, see topic "**WE log file overview**". A link to this topic is under **Related concepts** below.

The WE log file records data about any imports you perform in this session. An example extract from a WE log file is below:

![](images/Import_log_01.gif)

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

