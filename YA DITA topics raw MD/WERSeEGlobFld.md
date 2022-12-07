# Edit Global Field errors {#WERSeEGlobFld .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Display of messages](WERSeEGlobFld.md#02)
-   [10 Error saving Global Field - data type errors](WERSeEGlobFld.md#10)
-   [20 Error saving Global Field - other errors](WERSeEGlobFld.md#20)
-   [30 Warning messages](WERSeEGlobFld.md#30)

## 02 Display of messages {#02 .section}

If there are **errors**:

-   A window "**Error saving Global Field**" lists all the errors, and the global field is not saved. No warning messages are shown. Warnings are only shown if there are no errors.
-   A large error icon ![](images/Icon_Error_Large_01.gif) appears to the left of "Edit Global Field".
-   **Hover** over "**N errors detected**" to see all errors in the entire global field.
-   If present, **hover** over the small error icon ![](images/Icon_Error_Field_01.gif) to see the error in that field.

If there are **warnings**:

-   A window "**Validations**" lists all the warnings. This means there are no errors, only warning messages.
-   An large warning icon ![](images/Icon_Warning_Large_01.gif) appears to the left of "Edit Global Field".
-   **Hover** over "**N warnings detected**" to see all warnings in the entire global field.
-   If present, **hover** over the small warning icon ![](images/Icon_Warning_Field_01.gif) to see all warnings in that field.

## 10 Error saving Global Field - data type errors {#10 .section}

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

## 20 Error saving Global Field - other errors {#20 .section}

|Message|Solution|
|-------|--------|
|Global Field name cannot be empty.|Enter a user global field name.|
|The Global Field name **\(value from screen\)** should begin with a letter and should comprise of letters, numbers and underscores only.|Alter the name as appropriate. Fullstops, dashes \("-"\) and slashes \("/"\) are not permitted.|
|The Global Field name **\(value from screen\)** already exists. Please specify a different name.|Enter unique global field name|

## 30 Warning messages {#30 .section}

|Message|Solution|
|-------|--------|
|This Global Field does not have a valid data type. Please select a valid data type before saving.|This message displays on opening a Global Field with a data type that is no longer valid. The data type field in the Global Field editor displays a blank value. Select a valid data type to allow saving of this Global Field.|
|This Global Field does not have a valid date/time format. Please select a valid date/time format, if required, before saving.|This message displays on opening a Global Field with a date/time format that is no longer valid. The date/time format field in the Global Field editor displays a blank value.|
|This Global Field does not have a valid header alignment. Please select a valid header alignment, if required, before saving.|This message displays on opening a Global Field with a header alignment that is no longer valid. The header alignment field in the Global Field editor displays a blank value.|
|This Global Field does not have a valid numeric mask. Please select a valid numeric mask, if required, before saving.|This message displays on opening a Global Field with a numeric mask that is no longer valid. The numeric mask field in the Global Field editor displays a blank value.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

