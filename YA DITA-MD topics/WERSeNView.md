# New View errors {#WERSeNView .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 View Activation Errors are elsewhere](WERSeNView.md#02)
-   [03 Display of messages](WERSeNView.md#03)
-   [10 Error saving View](WERSeNView.md#10)
-   [20 Delete Columns](WERSeNView.md#20)

## 02 View Activation Errors are elsewhere {#02 .section}

For messages on the 'View Activation Errors" screen, see topic "**View Activation Errors message help**". A link is under **Related reference** below.

## 03 Display of messages {#03 .section}

If there are **errors**:

-   A window "**Error saving View**" lists all the errors, and the view is not saved.
-   A large error icon ![](images/Icon_Error_Large_01.gif) appears to the left of "New View" or "Edit View".
-   **Hover** over "**N errors detected**" to see all errors in the entire view.
-   If present, **hover** over the small error icon ![](images/Icon_Error_Field_01.gif) to see the error in that field.

If you are attempting to **delete a column** in the "View Editor" tab, a window "**Delete Columns**" appears. Click OK to proceed, otherwise click Cancel.

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

## 20 Delete Columns {#20 .section}

|Message|Solution|
|-------|--------|
|This action will delete the selected X column\(s\).|Click **OK** to proceed with the delete of the highlighted column\(s\) and click **Cancel** to retain the column\(s\).|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

