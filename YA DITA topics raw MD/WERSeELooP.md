# Edit Lookup Path errors {#WERSeELooP .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Display of messages](WERSeELooP.md#02)
-   [10 Error saving Lookup Path: data type errors](WERSeELooP.md#10)
-   [20 Error saving Lookup Path: other errors](WERSeELooP.md#20)
-   [30 Warnings](WERSeELooP.md#30)
-   [40 Confirm Deletion](WERSeELooP.md#40)
-   [50 Lookup Path dependencies](WERSeELooP.md#50)

## 02 Display of messages {#02 .section}

If there are **errors**:

-   A window "**Error saving Lookup Path**" lists all the errors, and the lookup path is not saved. Only errors are shown, not warnings. Warnings are only shown if there are no errors.
-   A large error icon ![](images/Icon_Error_Large_01.gif) appears to the left of "Edit Lookup Path".
-   **Hover** over "**N errors detected**" to see all errors in the entire lookup path.
-   If present, **hover** over the small error icon ![](images/Icon_Error_Field_01.gif) to see the error in that field.

If there are **warnings**:

-   A window "**Validations**" lists all the warnings. This means there are no errors, only warning messages. Click OK to save and change the status to **inactive**. The status cannot be changed to active unless the warnings are fixed. Click Cancel to stop the attempted save.
-   An large warning icon ![](images/Icon_Warning_Large_01.gif) appears to the left of "Edit Lookup Path".
-   **Hover** over "**N warnings detected**" to see all warnings in the entire lookup path.
-   If present, **hover** over the small warning icon ![](images/Icon_Warning_Field_01.gif) to see the warning in that field.

If you are saving after a **delete of a source field**, a message window appears: **Confirm Deletion**. This window allows a **choice to proceed or cancel the save**.

If there are issues with **dependencies** then this window may appear:

-   **Lookup Path dependencies** - when saving the changes to this lookup path result in making a view inactive. This window allows a **choice to proceed or cancel the save**.

## 10 Error saving Lookup Path: data type errors {#10 .section}

|Message|Solution|
|-------|--------|
|Data type errors: Please specify a data type.|Enter a data type for the field.|
|Data type errors: Zoned Decimal must have minimum length of 1 and maximum length of 16 \(inclusive\).|If Data type is chosen as Zoned Decimal then enter length between 1 and 16 \(inclusive\).|
|Data type errors: Alphanumeric cannot have decimals.|If Data type is chosen as Alphanumeric then the decimals should be zero.|
|Data type errors: Alphanumeric cannot be signed.|If Data type is chosen as Alphanumeric then it cannot be signed.|
|Data type errors: Alphanumeric length must be between 1 and 256 \(inclusive\).|If Data type is chosen as Alphanumeric then enter length between 1 and 256 \(inclusive\).|
|Data type errors: Date time format ? must have length ?|Enter Length which can accommodate the Date Time Format.|
|Data type errors: Alphanumeric data type should not have scaling.|If Data type is chosen as Alphanumeric then the scaling should be zero.|
|Data type errors: Binary sortable must have length one, two, four or eight only.|If Data type is Binary Sortable then enter length as one, two, four or eight only.|
|Data type errors: BCD must have minimum length of 1 and maximum length of 10.|If Data type is BCD then enter length between 1 and 10.|
|Data type errors: Packed must have length in between 1 and 16.|If Data type is Packed then enter length between 1 and 16.|
|Data type errors: Packed sortable must have length in between 1 and 16.|If Data type is Packed Sortable then enter length between 1 and 16.|
|Data type errors: Binary must have length one, two, four or eight only.|If Data type is Binary then enter length as one, two, four or eight only.|
|Data type errors: Binary with date time format must not be signed.|If Data type is Binary and has a Date Time format then it should not be signed.|
|Data type errors: Masked numeric length must be between one and 256 \(inclusive\).|If Data type is Masked Numeric then enter length between 1 and 256 \(inclusive\).|
|Data type errors: A Numeric Mask format should be added to a Masked Numeric Field.|If Data type is Masked Numeric then select a value in Numeric Mask field.|
|Data type errors: Explicit date time format disallowed for edited numeric type.|If Data type is Edited Numeric then it cannot have an explicit Date Time Format.|
|Data type errors: Edited numeric length must be between one and 256 \(inclusive\).|If Data type is Edited Numeric then enter length between 1 and 256 \(inclusive\).|

## 20 Error saving Lookup Path: other errors {#20 .section}

|Message|Solution|
|-------|--------|
|Lookup Path name cannot be empty.|Enter a Lookup Path name.|
|The Lookup Path name **\(value from screen\)** should begin with a letter and should comprise of letters, numbers and underscores only|Alter the name as appropriate. Fullstops, dashes \("-"\) and slashes \("/"\) are not permitted.|
|The Lookup Path name **\(value from screen\)** already exists. Please specify a different name.|Provide a unique Lookup Path name.|
|The length of Lookup Path name **\(value from screen\)** cannot exceed 48 characters.|Alter the name as appropriate.|
|Step ?: Source Logical Record cannot be empty.|Select a source Logical Record from the drop down list for the first step, and for subsequent steps, ensure that the target Logical Record of the previous step is selected.|
|The Logical Record you have selected does not have a primary key defined.|Select a target Logical Record which has a primary key defined.|
|Step ?: Target Logical File cannot be empty if Target Logical Record is selected.|Select a target Logical File from the drop down list.|
|Field ?: Constant source value cannot be empty.|If the type of source field is Constant, enter a source value.|
|Field ?: Symbol name cannot be empty.|If the type of source field is Symbol, enter a symbol name.|
|You cannot change this source Logical Record as it is being used in the source fields of the current step and/or subsequent steps as indicated below:|You must first remove the source fields which depend on this Logical Record before attempting to change this source Logical Record.|
|You cannot change this target Logical Record as it is being used in the source fields of subsequent steps as indicated below:|You must first remove the source fields which depend on this Logical Record before attempting to change this target Logical Record.|
|You cannot change this target Logical File as it is being used in the source fields of subsequent steps as indicated below:|You must first remove the source fields which depend on this Logical File before attempting to change this target Logical File.|
|The current step must have a valid Source \[Logical Record\] before you can proceed.|Select a valid Source before trying to add a source field for first step.|
|The current step must have a valid Source \[Logical Record/Logical File\] before you can proceed.|Select a valid Source before trying to add a source field for subsequent steps.|
|The first step must have a valid Source \[Logical Record\] and Target \[Logical Record/Logical File\] before you can proceed.|Select a valid Source and Target for the first step before adding new steps.|
|The last step must have a valid Target \[Logical Record/Logical File\] before you can proceed.|Select a valid Target for the last step before adding new steps.|
|You cannot delete the first step. A Lookup Path must have at least one step.|The first step cannot be deleted.|

## 30 Warnings {#30 .section}

|Message|Solution|
|-------|--------|
|This Lookup path is inactive because of the following reason\(s\):|A Lookup Path may become inactive due to the following reasons:-   If for any step, the target and source lengths do not match.
-   If for any step, the target Logical Record and Logical File are not specified.
-   If for any step, the target length is 0.

|
|This Lookup path was active when it was saved but it is inactive now because of the following reason\(s\):|Changes to other SAFR Workbench data affect this Lookup Path. The reasons why this Lookup Path is now inactive are listed.|
|Source Field \(value on screen\) of step \(value on screen\) does not have a valid data type. Please select a valid data type before saving.|This message displays on opening a Lookup Path which contains a Source Field with a data type that is no longer valid. The data type field in the Data Attributes section for this Source Field displays a blank value. Select a data type value to allow saving of this Lookup Path.|
|Source Field \(value on screen\) of step \(value on screen\) does not have a valid date/time format. Please select a valid date/time format, if required, before saving.|This message displays on opening a Lookup Path which contains a Source Field with a date/time format that is no longer valid. The date/time format field in the Data Attributes section for this Source Field displays a blank value.|
|Source Field \(value on screen\) of step \(value on screen\) does not have a valid numeric mask. Please select a valid numeric mask, if required, before saving.|This message displays on opening a Lookup Path which contains a Source Field with a numeric mask that is no longer valid. The numeric mask field in the Data Attributes section for this Source Field displays a blank value.|
|Source Field \(value on screen\) of step \(value on screen\) does not have a valid header alignment. Please select a valid header alignment, if required, before saving.|This message displays on opening a Lookup Path which contains a Source Field with a header alignment that is no longer valid. The header alignment field in the Data Attributes section for this Source Field displays a blank value.|

## 40 Confirm Deletion {#40 .section}

|Message|Solution|
|-------|--------|
|Are you sure you want to delete the selected source field X from the list?|Click OK to proceed with the delete of the selected source field. Click Cancel to retain the selected source field.|

## 50 Lookup Path dependencies {#50 .section}

|Message|Solution|
|-------|--------|
|The following View\(s\) are dependent on this Lookup Path. Saving this Lookup Path will make these View\(s\) inactive.|Click OK to proceed with the save of this Lookup Path and make the listed Views inactive. Click Cancel to avoid change to this Lookup Path.|
|A new View dependency has been created on this Lookup Path since the last warning was issued. Saving this Lookup Path will make these View\(s\) inactive.|Click OK to proceed with the save of this Lookup Path and make the listed Views inactive. Click Cancel to avoid change to this Lookup Path.|
|This Lookup Path will be saved as 'Inactive' due to below errors.|A Lookup Path may become inactive due to the following reasons:-   If for any step, the target and source lengths do not match.
-   If for any step, the target Logical Record and Logical File are not specified.
-   If for any step, the target length is 0.

|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

