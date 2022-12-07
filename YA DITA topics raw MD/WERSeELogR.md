# Edit Logical Record errors {#WERSeELogR .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Display of messages](WERSeELogR.md#02)
-   [10 Error saving Logical Record: data type errors](WERSeELogR.md#10)
-   [20 Error saving Logical Record: other errors](WERSeELogR.md#20)
-   [30 Warnings](WERSeELogR.md#30)
-   [40 Field dependencies](WERSeELogR.md#40)
-   [50 Logical Record dependencies](WERSeELogR.md#50)
-   [60 Logical Record/Logical File dependencies](WERSeELogR.md#60)

## 02 Display of messages {#02 .section}

If there are **errors**:

-   A window "**Error saving Logical Record**" lists all the errors, and the logical record is not saved. No warning messages are shown. Warnings are only shown if there are no errors.
-   A large error icon ![](images/Icon_Error_Large_01.gif) appears to the left of "Edit Logical Record".
-   **Hover** over "**N errors detected**" to see all errors in the entire logical record.
-   If present, **hover** over the small error icon ![](images/Icon_Error_Field_01.gif) to see all errors in that field.

If there are **warnings**:

-   A window "**Validations**" lists all the warnings. This means there are no errors, only warning messages.
-   An large warning icon ![](images/Icon_Warning_Large_01.gif) appears to the left of "Edit Logical Record".
-   **Hover** over "**N warnings detected**" to see all warnings in the entire logical record.
-   If present, **hover** over the small warning icon ![](images/Icon_Warning_Field_01.gif) to see all warnings in that field.

If there are issues with **dependencies** then these windows may appear:

-   **Field dependencies** - if particular fields in the logical record are used in lookup paths and views. This window **cancels the save** \(there is no choice\).
-   **Logical Record dependencies** - if this logical record is used in lookup paths or views. This window allows a **choice to proceed or cancel the save**.
-   **Logical Record/Logical File dependencies** - if the logical file to be dissociated is used in lookup paths or views. This window **cancels the save** \(there is no choice\).

## 10 Error saving Logical Record: data type errors {#10 .section}

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

## 20 Error saving Logical Record: other errors {#20 .section}

|Message|Solution|
|-------|--------|
|Logical Record name cannot be empty.|Enter a Logical Record name.|
|The Logical Record name **\(value from screen\)** should begin with a letter and should comprise of letters, numbers and underscores only.|Alter the logical record name as appropriate. Fullstops, dashes \("-"\) and slashes \("/"\) are not permitted.|
|The Logical Record name **\(value from screen\)** already exists. Please specify a different name.|Provide a unique Logical Record name.|
|Total key length should not be greater than 256.|Specify lengths such that the total length of the LR Fields with primary keys should be less than 256.|
|The LR primary keys are not in sequence. Please define keys in sequence starting with 1.|Specify primary key order such that they are in sequence starting with 1.|
|The LR Field name should begin with a letter and should comprise of letters, numbers and underscores only.|Alter the field name as appropriate. Fullstops, dashes \("-"\) and slashes \("/"\) are not permitted.|
|SAFR keywords mentioned below cannot be used as Field Name: DATA, DATE.|Change the field name until this error no longer appears.|
|The user exit routine with id \[ \(value on screen\) \] does not exist. Please select a valid user exit routine.|Select a valid user exit routine \(or a blank value\) from the drop down list.|

## 30 Warnings {#30 .section}

|Message|Solution|
|-------|--------|
|Logical Record name cannot be empty.|Enter a Logical Record name.|
|Decimal places value cannot be greater than 9.|Enter a decimal places value less than 9.|
|Fixed position can not be 0|Enter a fixed position value greater than 0.|
|Scaling factor should be in the range -9 to +9.|Enter a scaling factor value between -9 and +9.|
|Effective Date Start or End fields should have Date/Type format.|Enter a Date/Time format for LR Fields having Effective Date defined.|
|There should be at least one LRField.|Enter at least one LR Field before saving the Logical Record.|
|There must be at least one corresponding file.|Associate at least one Logical File with this Logical Record before saving.|
|A field with a primary key is required before a field with an alternate key is created.|Create a field with a primary key before creating a field with some other key type.|
|Field Name must be unique : \(Field Name\) already exists.|Enter a unique LR Field Name.|
|Changing the LR Name may require updates to views having logic text that reference this LR Name. Please use the 'Find/Replace Text in View Logic' utility to update such views.|You must be either a system or environment administrator to use the 'Find/Replace Text in View Logic' utility. Go to Administration, Find/Replace Text in View Logic. Use this utility to search for the old logical record name and replace with the new logical record name. This validation does not force the logical record to change status to inactive.|
|This Logical Record does not have a valid type. Please select a valid type before saving.|This message displays on opening a Logical Record with a type that is no longer valid. The type field in the Logical Record editor displays a blank value. Select a type value to allow saving of this Logical Record.|
|This Logical Record does not have a valid status. Please select a valid status before saving.|This message displays on opening a Logical Record with a status that is no longer valid. The status field in the Logical Record editor displays a blank value. Select a status value to allow saving of this Logical Record.|
|LR Field '\(value on screen\)' does not have a valid data type. Please select a valid data type, if required, before saving.|This message displays on opening a Logical Record which contains a field with a data type that is no longer valid. The Data Type cell for this Logical Record Field in the Logical Record Fields grid displays a blank value.|
|LR Field '\(value on screen\)' does not have a valid date/time format. Please select a valid date/time format, if required, before saving.|This message displays on opening a Logical Record with a date/time format that is no longer valid. The date/time format field in the Logical Record editor displays a blank value.|
|LR Field '\(value on screen\)' does not have a valid header alignment. Please select a valid header alignment, if required, before saving.|This message displays on opening a Logical Record with a header alignment that is no longer valid. The header alignment field in the Logical Record editor displays a blank value.|
|LR Field '\(value on screen\)' does not have a valid numeric mask. Please select a valid numeric mask, if required, before saving.|This message displays on opening a Logical Record with a numeric mask that is no longer valid. The numeric mask field in the Logical Record editor displays a blank value.|
|The user exit routine with id \[ \(value on screen\) \] referred to by this Logical Record does not exist. Please select another user exit routine if required.|This message displays on opening a Logical Record with a user exit routine that is no longer valid. The user exit routine field in the Logical Record editor displays a blank value.|

## 40 Field dependencies {#40 .section}

|Message|Solution|
|-------|--------|
|The selected field cannot be deleted because it is used in a Lookup Path or View. You must first remove this dependency.|The SAFR Workbench does not make the changes you requested because of these dependencies.|
|The selected field\(s\) cannot be deleted because the field\(s\) mentioned below are used in a Lookup Path\(s\) or View\(s\). You must first remove this dependency.|The SAFR Workbench does not make the changes you requested because of these dependencies.|
|The below fields cannot be deleted because they are used in a Lookup Path or View, and hence have been restored. Please review the LR Fields and save again.|The SAFR Workbench does not make the changes you requested because of these dependencies. This message occurs when another user has created a dependency in the few moments before you clicked Save.|

## 50 Logical Record dependencies {#50 .section}

|Message|Solution|
|-------|--------|
|The following Lookup Paths and/or Views are dependent on this logical record. If they are active, saving this Logical Record will make these components inactive.|Click OK to save the logical record and ensure the listed lookup paths and views are inactive. Click Cancel to avoid saving the logical record and avoid affecting the listed lookup paths and views.|
|A new Lookup Path or View dependency has been created on this Logical Record since the last warning was issued. Saving this Logical Record will make this component\(s\) inactive too.|Click OK to save the logical record and inactivate the listed lookup paths and views. Click Cancel to avoid saving the logical record and avoid affecting the listed lookup paths and views. This message occurs when another user has created a dependency in the few moments before you clicked Save.|

## 60 Logical Record/Logical File dependencies {#60 .section}

|Message|Solution|
|-------|--------|
|The below logical files cannot be dissociated as they are used in a Lookup Path and/or View.|The SAFR Workbench does not make the changes you requested because of these dependencies.|
|A new Lookup Path and/or View dependency has been created on a deleted Logical File association since the last warning issued during deletion. These deleted associations have now been restored. Please review and save again.|Another person has created a dependency on that Logical File. Either review whether the new dependency is required, or avoid deleting that Logical File. The SAFR Workbench does not make the changes you requested because of these dependencies.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

