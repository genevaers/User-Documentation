# Edit Logical File screen help {#WERScELogF .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScELogF.md#02)
-   [05 Errors](WERScELogF.md#05)
-   [10 Action on this screen](WERScELogF.md#10)
-   [20 Searching in Associated Physical Files](WERScELogF.md#20)
-   [30 Searching in "Select Components to be associated"](WERScELogF.md#30)
-   [40 Searching in Associated Logical Records](WERScELogF.md#40)
-   [50 Fields - General Information section](WERScELogF.md#50)
-   [60 Fields - Associated Physical File](WERScELogF.md#60)
-   [70 Fields - Associated Logical Records section](WERScELogF.md#70)
-   [99 Keyboard Shortcuts](WERScELogF.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_Logical_File_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to edit an existing logical file record.

System and environment administrators can always use this screen. General users can use this screen if the **group selected during login** has **Modify or Delete** rights to the particular logical file in that environment. See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Edit Logical File errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values.

Optionally, **right** click any associated physical file already listed in this table and select "**Open Editor**". This opens the "**Edit Physical File**" screen.

To add an associated physical file, do the following:

1.  Click **Add**. The "**Select components to be associated**" dialog box appears.
2.  If the list on this screen is long, this list can be searched - see the section on this below.
3.  **Tick or untick** the relevant files. To select a large number of files in sequence, select the first file and then**hold the Shift key down and select the last file**. All other files will be deselected when this occurs, so this should be the first action for a complex group of selections.
4.  Click **Select All** or **Deselect All**as required.
5.  Click **OK**.

To remove an associated physical file, do the following:

1.  If the list under "**Associated Physical Files**" is long, this list can be searched - see the section on this below.
2.  **Tick or untick** the relevant files. To select a large number of files in sequence, select the first file and then**hold the Shift key down and select the last file**. All other files will be deselected when this occurs, so this should be the first action for a complex group of selections.
3.  Click **Remove**. If the button **Remove** is grey, ensure there is at least one tick for a physical file to allow the button to be used.

When the logical file is complete,

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 20 Searching in Associated Physical Files {#20 .section}

If there is a long list of associated physical files, then the list can be searched as follows:

1.  Click inside the list under "**Associated Physical Files**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the physical file name.
5.  Click OK to start the search.

If the physical file is found, then you are returned to the list with that physical file highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 30 Searching in "Select Components to be associated" {#30 .section}

After clicking **Add**, the screen "**Select components to be associated**" lists the physical files available. If there is a long list of physical files, then this list can be searched as follows:

1.  Click inside the list under "**Select components to be associated**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the physical file name.
5.  Click OK to start the search.
6.  If the component is found, then you are returned to the screen "Select components to be associated" with that component highlighted. Tick the file to include \(later\) in the list of associated physical files.
7.  You may search again if required. You may tick as many physical files as required.
8.  When all ticks are in place, click OK to complete the add of ticked files.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 40 Searching in Associated Logical Records {#40 .section}

**Right** click any associated logical record listed in this table and select "**Open Editor**". This opens the "**Edit Logical Record**" screen for that particular item.

If there is a long list of associated logical records, then the list can be searched as follows:

1.  Click inside the list under "**Associated Logical Records**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the logical record name.
5.  Click OK to start the search.

If the logical record is found, then you are returned to the list with that logical record highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 50 Fields - General Information section {#50 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all logical files. \(Display only.\)|
|Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique \(among logical file names\).Examples of permitted names:

-   CA\_SF\_Accounts\_Receivable\_2009
-   Sales\_DivisionC76

These names are not permitted:

-   2009\_Expenses \(doesn't start with a letter\)
-   New York Sales \(must not include spaces\)
-   USA/Canada Summary 1.1 \(must not include "/" or fullstop\)

|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|

## 60 Fields - Associated Physical File {#60 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all associated physical files records for this logical file. \(Display only.\)|
|Name|The name of a Physical File associated with this Logical File. \(Display only.\)|

## 70 Fields - Associated Logical Records section {#70 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all associated logical records for this logical file. \(Display only.\)|
|Name|The name of a logical record associated with this logical file. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

