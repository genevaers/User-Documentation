# Edit Logical File errors {#WERSeELogF .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Display of messages](WERSeELogF.md#02)
-   [10 Error saving Logical File](WERSeELogF.md#10)
-   [20 Logical File/Physical File Dependencies](WERSeELogF.md#20)

## 02 Display of messages {#02 .section}

If there are **errors**:

-   A window "**Error saving Logical File**" lists all the errors, and the logical file is not saved.
-   A large error icon ![](images/Icon_Error_Large_01.gif) appears to the left of "Edit Logical File".
-   **Hover** over "**N errors detected**" to see all errors in the entire logical file.
-   If present, **hover** over the small error icon ![](images/Icon_Error_Field_01.gif) to see the error in that field.

If there are issues with **dependencies** then this window may appear:

-   **Logical File/Physical File Dependencies** - if the physical file to be dissociated is used in a view. This window allows a **choice to proceed or cancel the save**.

## 10 Error saving Logical File {#10 .section}

|Message|Solution|
|-------|--------|
|Logical File name cannot be empty.|Enter a Logical File name.|
|The Logical File name **\(value from screen\)** should begin with a letter and should comprise of letters, numbers and underscores only.|Alter the name as appropriate. Fullstops, dashes \("-"\) and slashes \("/"\) are not permitted.|
|The Logical File name **\(value from screen\)** already exists. Please specify a different name.|Provide a unique Logical File name.|
|There must be at least one corresponding physical file.|Associate at least one Physical File with this Logical File before saving.|
|A new View dependency has been created on a deleted physical file association since the last warning issued, during deletion. These deleted associations have now been restored. Please review and save again.|If you delete an associated PF with no dependencies, but before you save the Logical File another user creates a dependency on that Physical File, you see the error message at left when you try to save the Logical File, and the Physical Files that you deleted are restored.|

## 20 Logical File/Physical File Dependencies {#20 .section}

|Message|Solution|
|-------|--------|
|Dissociating this physical file will cause the following views to become inactive.|Click OK to save the logical file and inactivate the listed views. Click Cancel to avoid saving the logical file and avoid affecting the listed views.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

