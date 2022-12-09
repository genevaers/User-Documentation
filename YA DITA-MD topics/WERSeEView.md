# Edit View errors {#WERSeEView .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 View Activation messages are elsewhere](WERSeEView.md#02)
-   [03 Display of messages](WERSeEView.md#03)
-   [10 Error saving View](WERSeEView.md#10)
-   [20 Inactive Dependencies](WERSeEView.md#20)
-   [30 Warnings](WERSeEView.md#30)
-   [40 Delete Columns](WERSeEView.md#40)

## 02 View Activation messages are elsewhere {#02 .section}

For messages on the 'View Activation Errors" screen, see topic "**View Activation Errors message help**". A link is under **Related reference** below.

## 03 Display of messages {#03 .section}

If there are **errors**:

-   A window "**Error saving View**" lists all the errors, and the view is not saved. No warning messages are shown. Warnings are only shown if there are no errors.
-   A large error icon ![](images/Icon_Error_Large_01.gif) appears to the left of "Edit View".
-   **Hover** over "**N errors detected**" to see all errors in the entire view.
-   If present, **hover** over the small error icon ![](images/Icon_Error_Field_01.gif) to see the error in that field.

If there are **warnings**:

-   A window "**Validations**" lists all the warnings. This means there are no errors, only warning messages.
-   An large warning icon ![](images/Icon_Warning_Large_01.gif) appears to the left of "Edit View".
-   **Hover** over "**N warnings detected**" to see all warnings in the entire view.
-   If present, **hover** over the small warning icon ![](images/Icon_Warning_Field_01.gif) to see the warning in that field.

If you are attempting to **delete a column** in the "View Editor" tab, a window "**Delete Columns**" appears. Click OK to proceed, otherwise click Cancel.

If there are issues with **dependencies** then this window appears:

-   **Inactive dependencies** - if particular View access a Logical Record or Lookup Path that is inactive. The window lists the inactive items. This window **cancels the save** \(there is no choice\).

## 10 Error saving View {#10 .section}

|Message|Solution|
|-------|--------|
|View name cannot be empty.|Enter a View name.|
|The View name **\(value on screen\)** should begin with a letter and should comprise of letters, numbers, pound sign \(\#\) and underscores only.|A View name is up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Must be unique \(among logical record names\).Examples of permitted names:

-   Report\_CA\_SF\_Accounts\_Receivable\_2009
-   Update\_Sales\_DivisionC76

These names are not permitted:

-   2009\_Expenses\_Report \(doesn't start with a letter\)
-   New York Sales Update \(must not include spaces\)
-   USA/Canada Summary Report 1.1 \(must not include "/" or fullstop\)

|
|The View name **\(value on screen\)** already exists. Please specify a different name.|Provide a unique View name.|
|View Folder cannot be empty.|Select a view folder from the drop down box.|
|Control Record cannot be empty.|Select a control record from the drop down box.|
|Lines per page must be greater than or equal to 54.|Provide a value greater than or equal to 54.|
|This operation requires at least one View Source.|See instructions **Define a View Source** either in topic "**Edit View \(View Editor tab\) screen help**" or "**New View \(View Editor tab\) screen help**".Links to these topics are under **Related reference** below.

|
|Please select a Logical File/Logical Record pair to continue.|See instructions **Define a View Source** either in topic "**Edit View \(View Editor tab\) screen help**" or "**New View \(View Editor tab\) screen help**".Links to these topics are under **Related reference** below.

|
|Sort Key \# : Sort key title field selected for all the View Sources should be same.|Provide sort key to the View which complies the following conditions: 1.  The sort key title field Ids are same for all the View Sources.
2.  The target logical file Id of the lookup from which the sort key fields are selected are same for all the View Sources
3.  The title length is proper. This length should not exceed the actual length of the selected source field.

|
|Sort Key \# : Sort key title length should be between 1 and length \(inclusive\)|Provide sort key to the View which complies the following conditions: 1.  The sort key title field Ids are same for all the View Sources.
2.  The target logical file Id of the lookup from which the sort key fields are selected are same for all the View Sources
3.  The title length is proper. This length should not exceed the actual length of the selected source field.

|
|Sort Key \# : Sort key title length cannot be greater than length.|Provide sort key to the View which complies the following conditions: 1.  The sort key title field Ids are same for all the View Sources.
2.  The target logical file Id of the lookup from which the sort key fields are selected are same for all the View Sources
3.  The title length is proper. This length should not exceed the actual length of the selected source field.

|
|An error occurred while activating the View. A new View must be saved before activation.|Save the view before performing activation.|
|The User-Exit Routine **\(value on screen\)** is not of type 'Write'. Please select a valid User-Exit Routine.|Select a User-Exit Routine from the drop down list for the Name field for Output User-Exit Routine in the "View Properties, Extract Phase" tab.|
|The User-Exit Routine **\(value on screen\)** is not of type 'Format'. Please select a valid User-Exit Routine.|Select a User-Exit Routine from the drop down list for the Name field for Format User-Exit Routine in the "View Properties, Format Phase" tab.|
|Sort Key \#: Please specify a data type.|Select a data type for the specified Sort Key from the drop down list in the Sort Key Properties view.|
|Sort Key \#: Please specify a sort sequence.|Select a sort sequence for the specified Sort Key from the drop down list in the Sort Key Properties view.|
|Sort Key \#: Please specify a sort key header option.|Select a header option for the specified Sort Key from the drop down list in the Sort Key Properties view.|
|Sort Key \#: Please specify a sort key footer option.|Select a footer option for the specified Sort Key from the drop down list in the Sort Key Properties view.|
|The user exit routine with id \[ \(value on screen\) \] does not exist. Please select a valid user exit routine.|Select a valid user exit routine \(or a blank value\) from the drop down list.|
|View Column Source for Column No. \(value on screen\) and Source Sequence No. \(value on screen\) does not have a valid Source Type.|Select a valid source type for that column source from the drop down list. This error may have occurred because this view was first created in an older version of the SAFR Workbench called the Windows Workbench \(WW\).|
|ANY OTHER ERRORS NOT LISTED ABOVE|These are compiler errors, based on the data in this view. To find the compiler errors do the following:1.  Go to [http://safr.ibm.com:9060/help/index.jsp](http://safr.ibm.com:9060/help/index.jsp)
2.  At left, click on **SAFR Information Center**
3.  At left, expand **Error messages and codes**
4.  At left, click on **Compiler error messages**
5.  Find the error message in that table. If the error is not listed, see your IBM representative for SAFR.

|

## 20 Inactive Dependencies {#20 .section}

|Message|Solution|
|-------|--------|
|The View could not be loaded because the following component\(s\) are inactive. Please reactivate these and try again.|This error window lists any Logical Records and Lookup Paths used by this View that are inactive. An inactive item prevents this View being opened. You must activate all the listed items to allow this View to be opened.|

## 30 Warnings {#30 .section}

|Message|Solution|
|-------|--------|
|This View does not have a valid output format. Please select a valid output format before saving.|This message displays on opening a View with an output format that is no longer valid. Select a valid output format to allow saving of this View.|
|This View does not have a valid field delimiter. Please select a valid field delimiter, if required, before saving.|This message displays on opening a View with a delimiter field that is no longer valid. The delimiter field in the View editor displays a blank value.|
|This View does not have a valid string delimiter. Please select a valid string delimiter, if required, before saving.|This message displays on opening a View with a string delimiter field that is no longer valid. The string delimiter field in the View editor displays a blank value.|
|View Column \(value on screen\) does not have a valid data alignment. Please select a valid data alignment, if required, before saving.|This message displays on opening a View which contains a view column with a data alignment that is no longer valid. The data alignment cell for this column in the View Editor grid displays a blank value.|
|View Column \(value on screen\) does not have a valid data type. Please select a valid data type, if required, before saving.|This message displays on opening a View which contains a view column with a data type that is no longer valid. The data type cell for this column in the View Editor grid displays a blank value.|
|View Column \(value on screen\) does not have a valid date/time format. Please select a valid date/time format, if required, before saving.|This message displays on opening a View which contains a view column with a date/time format that is no longer valid. The date/time format cell for this column in the View Editor grid displays a blank value.|
|View Column \(value on screen\) does not have a valid header alignment. Please select a valid header alignment, if required, before saving.|This message displays on opening a View which contains a view column with a header alignment that is no longer valid. The header alignment cell for this column in the View Editor grid displays a blank value.|
|View Column \(value on screen\) does not have a valid numeric mask. Please select a valid numeric mask, if required, before saving.|This message displays on opening a View which contains a view column with a numeric mask that is no longer valid. The numeric mask cell for this column in the View Editor grid displays a blank value.|
|The User Exit Routine with id \[ \(value on screen\) \] referred to by this View in the extract phase does not exist. Please select another User Exit Routine if required.|The User-Exit Routine previously named in this field either no longer exists or exists with an inappropriate type due to some external update. That name is no longer shown in the drop down list, and you may select a new name from the drop down list.|
|The User Exit Routine with id \[ \(value on screen\) \] referred to by this View in the format phase does not exist. Please select another User Exit Routine if required.|The User-Exit Routine previously named in this field either no longer exists or exists with an inappropriate type due to some external update. That name is no longer shown in the drop down list, and you may select a new name from the drop down list.|
|View Column Source of column \(value on screen\) does not have a valid source type. Please select a valid source type before saving.|This message displays on opening a View which contains a view column source with a source type that is no longer valid. The column source type cell for this column source in the Column Source Properties view displays a blank value. Select a valid column source type to allow saving this View.|
|View Column Source of column \(value on screen\) does not have a valid effective date type. Please select a valid effective date type, if required, before saving.|This message displays on opening a View which contains a view column source with an effective date type that is no longer valid. The effective date type cell for this column source in the Column Source Properties view displays a blank value.|
|Sort Key \(value on screen\) does not have a valid sort sequence. Please select a valid sort sequence before saving.|This message displays on opening a View which contains a sort key with a sort sequence that is no longer valid. The sort sequence cell for this sort key in the Sort Key Properties view displays a blank value. Select a valid sort sequence to allow saving this View.|
|Sort Key \(value on screen\) does not have a valid sort key footer option. Please select a valid sort key footer option before saving.|This message displays on opening a View which contains a sort key with a footer that is no longer valid. The footer cell for this sort key in the Sort Key Properties view displays a blank value. Select a valid sort key footer to allow saving this View.|
|Sort Key \(value on screen\) does not have a valid sort key header option. Please select a valid sort key header option before saving.|This message displays on opening a View which contains a sort key with a header that is no longer valid. The header cell for this sort key in the Sort Key Properties view displays a blank value. Select a valid sort key header to allow saving this View.|
|Sort Key \(value on screen\) does not have a valid data type. Please select a valid data type before saving.|This message displays on opening a View which contains a sort key with a data type that is no longer valid. The data type cell for this sort key in the Sort Key Properties view displays a blank value. Select a valid sort key data type to allow saving this View.|
|Sort Key \(value on screen\) does not have a valid display mode. Please select a valid display mode, if required, before saving.|This message displays on opening a View which contains a sort key with a display mode that is no longer valid. The display mode cell for this sort key in the Sort Key Properties view displays a blank value.|
|Sort Key \(value on screen\) does not have a valid date time format. Please select a valid date time format, if required, before saving.|This message displays on opening a View which contains a sort key with a date time format that is no longer valid. The date time format cell for this sort key in the Sort Key Properties view displays a blank value.|
|This View's \(header/footer value\) \(Left/Center/Right Selection\) contains an invalid function \(value on screen\). Please select a valid function, if required, before saving.|This message displays on opening a View which contains a header or a footer with a function code that is no longer valid. The header/footer field of the corresponding selection \(left/center/right\) displays a blank value for that particular function.|

## 40 Delete Columns {#40 .section}

|Message|Solution|
|-------|--------|
|This action will delete the selected X column\(s\).|Click **OK** to proceed with the delete of the highlighted column\(s\) and click **Cancel** to retain the column\(s\).|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

