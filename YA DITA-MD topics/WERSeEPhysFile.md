# Edit Physical File errors {#WERSeEPhysFile .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Display of messages](WERSeEPhysFile.md#02)
-   [10 Error saving Physical File](WERSeEPhysFile.md#10)
-   [20 Warnings](WERSeEPhysFile.md#20)

## 02 Display of messages {#02 .section}

If there are **errors**:

-   A window "**Error saving Physical File**" lists all the errors, and the physical file is not saved. No warning messages are shown. Warnings are only shown if there are no errors.
-   A large error icon ![](images/Icon_Error_Large_01.gif) appears to the left of "Edit Physical File".
-   **Hover** over "**N errors detected**" to see all errors in the entire physical file.
-   If present, **hover** over the small error icon ![](images/Icon_Error_Field_01.gif) to see the error in that field.

If there are **warnings**:

-   A window "**Validations**" lists all the warnings. This means there are no errors, only warning messages.
-   An large warning icon ![](images/Icon_Warning_Large_01.gif) appears to the left of "Edit Physical File".
-   **Hover** over "**N warnings detected**" to see all warnings in the entire physical file.
-   If present, **hover** over the small warning icon ![](images/Icon_Warning_Field_01.gif) to see all warnings in that field.

## 10 Error saving Physical File {#10 .section}

|Message|Solution|
|-------|--------|
|Please select an access method before saving. Access Method cannot be empty.|Select an access method from the drop down list.|
|File Type cannot be empty.|Select a file type from the drop down list.|
|Physical file name cannot be empty|Enter a physical file name.|
|The physical file name **\(value on screen\)** already exists. Please specify a different name.|Provide a unique physical file name.|
|The physical file name **\(value on screen\)** should begin with a letter and should comprise of letters, digits and underscores only.|Alter the name as appropriate. Fullstops, dashes \("-"\) and slashes \("/"\) are not permitted.|
|The user exit routine \(name from screen\) \[\(id from screen\)\] is not of type 'Read'. Please select a valid user exit routine.|Select a user exit routine of type 'Read' from the drop down list.|
|The user exit routine with id \[\(value from screen\)\] does not exist. Please select a valid user exit routine.|Select a valid user exit routine \(or a blank value\) from the drop down list.|

## 20 Warnings {#20 .section}

|Message|Solution|
|-------|--------|
|This Physical File does not have a valid file type. Please select a valid file type before saving.|This message displays on opening a Physical File with a file type that is no longer valid. The file type field displays a blank value. Select a valid file type to allow saving this Physical File.|
|This Physical File does not have a valid access method. Please select a valid access method before saving.|This message displays on opening a Physical File with an access method that is no longer valid. The access method field displays a blank value. Select a valid access method to allow saving this Physical File.|
|This Physical File does not have a valid Read DISP. Please select a valid Read DISP, if required, before saving.|This message displays on opening a Physical File with a Read DISP that is no longer valid. The Read DISP field displays a blank value.|
|This Physical File does not have a valid space unit. Please select a valid space unit, if required, before saving.|This message displays on opening a Physical File with a space unit that is no longer valid. The space unit field displays a blank value.|
|This Physical File does not have a valid DSORG. Please select a valid DSORG, if required, before saving.|This message displays on opening a Physical File with a DSORG that is no longer valid. The DSORG field displays a blank value.|
|This Physical File does not have a valid RECFM. Please select a valid RECFM, if required, before saving.|This message displays on opening a Physical File with a RECFM that is no longer valid. The RECFM field displays a blank value.|
|This Physical File does not have a valid Write DISP. Please select a valid Write DISP, if required, before saving.|This message displays on opening a Physical File with a Write DISP that is no longer valid. The Write DISP field displays a blank value.|
|This Physical File does not have a valid row format. Please select a valid row format, if required, before saving.|This message displays on opening a Physical File with a row format that is no longer valid. The row format field displays a blank value.|
|The User-Exit Routine with id \(value from screen\) referred to by this Physical File does not exist. Please select another User Exit Routine if required.|The User-Exit Routine for the given id is no longer type Read due to some external update. The User-Exit Routine field displays a blank value.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

