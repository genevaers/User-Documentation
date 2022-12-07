# Migration Utility messages {#WERSeMigration .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Essential reading](WERSeMigration.md#02)
-   [03 Display of errors](WERSeMigration.md#03)
-   [10 Window: Confirm Migration](WERSeMigration.md#10)
-   [20 Window: Logical Record dependency warning](WERSeMigration.md#20)
-   [21 Window: Lookup Path dependency warning](WERSeMigration.md#21)
-   [30 Window: Migration Complete](WERSeMigration.md#30)
-   [31 Window: Migration component error](WERSeMigration.md#31)
-   [32 Window: Migration dependency error](WERSeMigration.md#32)
-   [40 Window: Physical File dependency warning](WERSeMigration.md#40)
-   [50 Window: User Exit Routine dependency warning](WERSeMigration.md#50)
-   [60 Window: View Folder migration warning](WERSeMigration.md#60)
-   [70 Windows: View migration warning](WERSeMigration.md#70)

## 02 Essential reading {#02 .section}

It is essential that you read topic "**Migrate metadata overview**". A link to that overview is under **Related concepts** below.

## 03 Display of errors {#03 .section}

Errors can appear in the following ways:

-   A **window** may appear with an error message and choices of action. See the sections in this topic about windows for more details.
-   A component may receive**Result "Fail"** or **Result "Cancel"**. **Highlight the row for that component** to see any messages in the **Errors section** on the right. These messages give extra information about the cancel or fail result.

## 10 Window: Confirm Migration {#10 .section}

|Message|Solution|
|-------|--------|
|The following component\(s\) will be migrated. Red items marked with '\*' exist in the target environment and will be overwritten.|Review the red items. Decide if you are comfortable with overwrite of the red items.

 Be aware that the migration can change the number of related items for a main item already in the target environment, and there may be no warning message about this.

 It is recommended to backup in the target environment the red items on this screen before proceeding with the migration. You need to note the red items, cancel this migration, take the backup and then return to this migration.

 One way to backup is using topic "**Exporting metadata**". A link to that topic is under **Related tasks** below.

 When all review and preparation is complete, click OK to proceed with the migration. Click Cancel to avoid update of the target environment.

|

## 20 Window: Logical Record dependency warning {#20 .section}

|Message|Solution|
|-------|--------|
|The following Lookup Paths or Views in the target environment are dependent on Logical Record \(name\[id\]\). Migrating this Logical Record will make them Inactive.|This window lists views and lookup paths in the target environment that use an existing logical record where a migration intends to overwrite that logical record. If the migration proceeds, the existing logical record is overwritten and this makes the listed views and lookup paths inactive. Click OK for the migration to proceed, or click cancel to stop the import.

 For more discussion on existing components becoming inactive, see topic "**Migrate metadata overview**".

|
|A new Lookup Path or View dependency has been created in the target environment on Logical Record \(name\[id\]\) since the last warning was issued. Migrating this Logical Record will make this component\(s\) Inactive too.|This is a similar message to the previous section. Since you clicked OK for that above error, extra Views or Lookup Paths refer to the given Logical Record, and so these extra Views and Lookup Paths are made inactive by a migration. Click OK to proceed with the migration and click Cancel to stop.|

## 21 Window: Lookup Path dependency warning {#21 .section}

|Message|Solution|
|-------|--------|
|The following Views in the target environment are dependent on Lookup Path \(name\[id\]\). Migrating this Lookup Path will make them Inactive.|Click OK to migrate the named Lookup Path and make the listed Views inactive. Click Cancel to stop the migration.|
|A new View dependency has been created in the target environment on Lookup Path \(name\[id\]\) since the last warning was issued. Migrating this Lookup Path will make this component\(s\) Inactive too.|This is a similar message to the previous section. Since you clicked OK for that above error, an extra View\(s\) refers to the given Lookup Path, and so this extra View\(s\) are made inactive by a migration.|

## 30 Window: Migration Complete {#30 .section}

|Message|Solution|
|-------|--------|
|**Migration Complete.** See the Result column.|A value of "**Pass**" in the **Result** column means the migration of that component is complete. A value of "**Cancel**" means you clicked cancel for a message window displayed during the migration.

A value of "**Fail**" means an error prevented the migration of that component.

**Highlight the row for that component** to see any messages in the **Errors section** on the right. These messages give extra information about the cancel or fail result.

For errors or messages on this screen, see topic "**Migration Utility messages**"

|

## 31 Window: Migration component error {#31 .section}

|Message|Solution|
|-------|--------|
|Related components that are not migrated must exist in the target Environment but the related \(component type\) \(name\[id\]\) does not exist there.|This migration cannot proceed because the related component identified does not exist in the target environment. Repeat the migration and tick "Migrate Related" to allow this migration to complete.|
|Logical File \(name\[id\]\) cannot be migrated with the following related Physical Files because these are already associated with another Logical File in the target environment. As these Physical Files are of type Pipe or Token, they cannot be associated with more than one Logical File|Review your Pipe or Token Physical File in the source and target environments to determine if migration is still required. You may need to rename one or more Physical Files or Logical Files to allow a migration to proceed.|
|A new View dependency has been created on a deleted Physical File association for Logical File 'name\[id\]' since the last deletion warning was issued. Migration cancelled. Please review and migrate again.|The migration cannot proceed because a view now depends data that the migration deletes. Please review and migrate again.|
|Migration cancelled due to dependency errors in the target Environment. Logical Record \(name\[id\]\) exists in the source and target environments, so the target LR should be replaced by the source LR and any LR Fields which appear in the target LR but not in the source LR should be removed from the target environment. However, some of these LR Fields are already used by existing Lookup Paths or Views in the target environment. These dependencies \(shown below\) must be removed before this LR can be migrated.|The named Logical Record cannot be migrated because there are existing Lookup Paths and Views in the target environment that refer to fields in that Logical Record, and the migration removes those fields. Ensure any existing Lookup Paths or Views that refer to fields in this Logical Record are using fields present in the source environment.|
|Migration cancelled due to dependencies in the target Environment. Logical Record \(name\[id\]\) exists in the target environment so it will be replaced by the source LR and any Logical File associations which appear in the target LR but not in the source LR should be removed from the target environment. However, some of these Logical File associations are already used by existing Lookup Paths or Views in the target environment. These dependencies \(shown below\) must be removed before this LR can be migrated.|The named Logical Record cannot be migrated because the import changes associations with Logical Files, and the import cannot change metadata in the target environment that refers to the LRLF associations. Ensure the listed Lookup Paths and Views in the target environment are using LRLF associations that are present in the source environment.|
|A new Lookup Path or View dependency has been created on a Logical File associated with Logical Record \(name\[id\]\) after the file association was deleted by migration. Migration cancelled.|Migration cancelled because a LRLF association that this migration deletes is now required by a Lookup Path or View in the target environment.|
|Migration stopped because the source View Folder contains no active Views so there is nothing to migrate.|Only active views can be migrated.|

## 32 Window: Migration dependency error {#32 .section}

|Message|Solution|
|-------|--------|
|The \(Lookup Path\|View\) \(name\[id\]\) in the source Environment cannot be loaded because of Inactive components shown below. Activate these components first.|Activate the listed components in the source environment to allow the listed Lookup Path or View to migrate.|
|The \(component type\) \(name\[id\]\) in the target Environment cannot be loaded because of Inactive components shown below. Activate these components first or delete the \(component type\) from the target Environment.|Activate or delete the listed components in the target environment to allow the listed Lookup Path or View to migrate. If you delete the listed components, ensure a tick for "Migrate Related" to allow this migration to complete.|
|The login Group must have at least Read rights on all related components but has no edit rights on the following components:|You do not have read rights to all the related components in the source environment that are listed in the message. See your system administrator for a login group that has sufficient read rights.|

## 40 Window: Physical File dependency warning {#40 .section}

|Message|Solution|
|-------|--------|
|When Logical File 'name\[id\]' is overwritten in the target environment the following Physical Files will no longer be associated with it because they were not associated with the file in the source environment and Views which use these for Output will be made Inactive.|Click OK to make the listed views inactive in the target environment due to a change in the Physical Files associated with the listed Logical File. Click Cancel to stop the migration.|

## 50 Window: User Exit Routine dependency warning {#50 .section}

|Message|Solution|
|-------|--------|
|The following Views have a logic text dependency on User Exit Routine 'name\[id\]'. Migrating this User Exit Routine will make them Inactive.|Click OK to allow the migration to make the listed views inactive in the target environment. Click Cancel to stop the migration.|

## 60 Window: View Folder migration warning {#60 .section}

|Message|Solution|
|-------|--------|
|View Folder \(name\[id\]\) already exists in the target environment, so it will be replaced by the source View Folder and any Views in the target which do not exist in the source will be deleted \(moved to the Deleted Views folder\). These are shown below.|Click OK for the listed views to be deleted from the target environment. Click Cancel to stop the migration.|

## 70 Windows: View migration warning {#70 .section}

|Message|Solution|
|-------|--------|
|These inactive Views in the source View Folder will not be migrated:|Only active views can be migrated.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

