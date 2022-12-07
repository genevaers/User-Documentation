# Deleting metadata messages {#WERSeDelMetadata .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Messages starting with "This action"](WERSeDelMetadata.md#10)
-   [15 Control Record dependencies](WERSeDelMetadata.md#15)
-   [20 Groups dependencies](WERSeDelMetadata.md#20)
-   [25 Global Field dependencies](WERSeDelMetadata.md#25)
-   [30 Logical File dependencies](WERSeDelMetadata.md#30)
-   [35 Logical Record dependencies](WERSeDelMetadata.md#35)
-   [40 Lookup Path dependencies](WERSeDelMetadata.md#40)
-   [45 Physical File dependencies](WERSeDelMetadata.md#45)
-   [50 User Exit Routine dependencies](WERSeDelMetadata.md#50)
-   [55 Delete View Folder](WERSeDelMetadata.md#55)
-   [60 View Folder dependencies](WERSeDelMetadata.md#60)
-   [65 Environment dependency found](WERSeDelMetadata.md#65)

## 10 Messages starting with "This action" {#10 .section}

|Message|Solution|
|-------|--------|
|This action will move the selected view to the 'Deleted Views' folder.|Click OK to proceed with the move, otherwise click Cancel.|
|This action will permanently delete the selected view and cannot be undone.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the following Physical File/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected Control Record/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected Environment/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected Global Field/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected Group/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected Logical File/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected Logical Record/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected Lookup Path/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected User Exit Routine/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected View Folder/s.|Click OK to proceed with the delete, otherwise click Cancel.|
|This action will delete the selected User/s.|Click OK to proceed with the delete, otherwise click Cancel.|

## 15 Control Record dependencies {#15 .section}

|Message|Solution|
|-------|--------|
|The Control Record cannot be deleted due to the following dependencies. You must first remove these dependencies.|Remove all dependencies in order to delete the Control Record.|

## 20 Groups dependencies {#20 .section}

|Message|Solution|
|-------|--------|
|The Group cannot be deleted due to the following dependencies. You must first remove these dependencies.|Remove all dependencies in order to delete the Group.|

## 25 Global Field dependencies {#25 .section}

|Message|Solution|
|-------|--------|
|The Global Field is used in the following Logical Record\(s\). This action will delete any reference of the Global Field from these Logical Records.|This message asks for user confirmation whether he actually wants to proceed with removing references of global Field from Logical Records and deleting the global field from the SAFR database.|

## 30 Logical File dependencies {#30 .section}

|Message|Solution|
|-------|--------|
|The Logical File cannot be deleted. You have to manually add another Logical File to the following Logical Record\(s\) before deleting this Logical File.|Associate other Logical Files to the Logical Records to which this Logical file is the only associated Logical File.|
|The Logical File cannot be deleted due to the following dependencies. You must first remove these dependencies.|Remove all dependencies in order to delete the Logical File.|

## 35 Logical Record dependencies {#35 .section}

|Message|Solution|
|-------|--------|
|The Logical Record cannot be deleted due to the following dependencies. You must first remove these dependencies.|Remove all dependencies in order to delete the Logical Record.|

## 40 Lookup Path dependencies {#40 .section}

|Message|Solution|
|-------|--------|
|The Lookup Path cannot be deleted due to the following dependencies. You must first remove these dependencies.|Remove all dependencies in order to delete the Lookup Path.|

## 45 Physical File dependencies {#45 .section}

|Message|Solution|
|-------|--------|
|The Physical File cannot be deleted. You have to manually add another Physical File to the following Logical File\(s\) before deleting this Physical File.|Associate other physical file to the Logical files to which this physical file is the only associated PF.|
|The Physical File cannot be deleted due to the following dependencies. You must first remove these dependencies.|Remove all dependencies in order to delete the Physical File.|

## 50 User Exit Routine dependencies {#50 .section}

|Message|Solution|
|-------|--------|
|The User Exit Routine cannot be deleted due to the following dependencies. You must first remove these dependencies.|Remove all dependencies in order to delete the User Exit Routine.|

## 55 Delete View Folder {#55 .section}

|Message|Solution|
|-------|--------|
|Error occurred while deleting the View Folder. Cannot delete view folder because there are currently views in it.|Delete all the views present in the view folder in order to proceed with the deletion of the view folder.|

## 60 View Folder dependencies {#60 .section}

|Message|Solution|
|-------|--------|
|The View Folder is used as a default view folder for following user\(s\). This action will delete any reference of the View Folder from these user\(s\).|This message asks for user confirmation whether he actually wants to proceed with removing references of View Folder from user and deleting the View Folder from the SAFR database.|

## 65 Environment dependency found {#65 .section}

|Message|Solution|
|-------|--------|
|The Environment cannot be deleted as its not empty. Please use the 'Clear Environment' utility to clear the environment before deleting.|Ensure there is no metadata in the environment with the administration task 'Clear environment' - see a link under "Related tasks" below. Then repeat the delete of the environment.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

