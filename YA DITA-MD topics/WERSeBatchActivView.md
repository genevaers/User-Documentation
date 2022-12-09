# Batch Activate Views errors {#WERSeBatchActivView .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Display of errors](WERSeBatchActivView.md#02)
-   [10 Errors other than data type errors](WERSeBatchActivView.md#10)
-   [20 Error messages: data type](WERSeBatchActivView.md#20)
-   [30 Example Load Error messages](WERSeBatchActivView.md#30)

## 02 Display of errors {#02 .section}

The column **Result** displays **Pass** or **Fail** or **Load Error**. This indicates the success of the batch activation.

-   "**Pass**" means the view is now status **active** and ready for use.
-   "**Fail**" means the view has an error. Click on "Fail" for that row and the **View Activation Errors** section displays the errors in that view. For these error messages, see below for sections "**Errors other than data type errors**" and "**Error messages: data type**".
-   "**Load error**" means a logical record or lookup path used in the view is inactive. Click on "Load error" for that row and the **Errors** section displays which items are inactive in that view. See section "**Example Load Error messages**" below.

## 10 Errors other than data type errors {#10 .section}

|Error|Column|Source|Solution|
|-----|------|------|--------|
|Cannot have blank value for non-alphanumeric column.|\(Displays the column for the error.\)|\(Displays the view source for the error.\)|Provide a value for the constant in this column.|
|Duplicate View sources are not allowed.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Select a different logical record/logical file pair for all the View Sources.|
|Errors related to view Column Properties|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Refer to heading **Data type errors** below.|
|Hardcopy, Drilldown and Delimited outputs cannot contain Binary visible columns.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Delete the visible columns which has data type as Binary for Hardcopy, Drilldown and Delimited outputs.|
|Hard copy summary View must have at least one Sort Key break.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Provide Footer option as 'PRINT' to at least one sort key.|
|Hard copy Summary View must have last Sort Key Footer Option as Print.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|The last sort key \(i.e. the sort key with the highest number\) must have Sort Key Footer Option set to "Print". Click on the sort key cell for the last sort key to display the Sort Key Properties screen that has the field Sort Key Footer Option.

|
|Sort Key \# : Sort key title field selected for all the View Sources should be same.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Provide sort key to the View which complies the following conditions:

 1. The sort key title field Ids are same for all the View Sources.

 2. The target logical file Id of the lookup from which the sort key fields are selected are same for all the View Sources.

 3. The title length is proper. This length should not exceed the actual length of the selected source field.

|
|Sort Key \# : Sort key title length cannot be greater than length.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Provide sort key to the View which complies the following conditions:

 1. The sort key title field Ids are same for all the View Sources.

 2. The target logical file Id of the lookup from which the sort key fields are selected are same for all the View Sources.

 3. The title length is proper. This length should not exceed the actual length of the selected source field.

|
|Sort Key \# : Sort key title length should be between 1 and length \(inclusive\).|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Provide sort key to the View which complies the following conditions:

 1. The sort key title field Ids are same for all the View Sources.

 2. The target logical file Id of the lookup from which the sort key fields are selected are same for all the View Sources.

 3. The title length is proper. This length should not exceed the actual length of the selected source field.

|
|Sort Key \# : Target Logical File of the Lookup paths, used to select sort key title field for all the View Sources, should be same.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Provide sort key to the View which complies the following conditions:

 1. The sort key title field Ids are same for all the View Sources.

 2. The target logical file Id of the lookup from which the sort key fields are selected are same for all the View Sources.

 3. The title length is proper. This length should not exceed the actual length of the selected source field.

|
|This View must have at least one Sort Key.|\(Blank or displays the column for the error.\)|\(Blank or displays the view source for the error.\)|Provide a sort key column to the View.|

## 20 Error messages: data type {#20 .section}

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

## 30 Example Load Error messages {#30 .section}

|Message|Solution|
|-------|--------|
|Logical Record Name \[ID\]|The given logical record name and id is inactive. This logical record must be active for the view to be activated. Modify the given logical record to ensure it is active and then retry the activation of this view.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

