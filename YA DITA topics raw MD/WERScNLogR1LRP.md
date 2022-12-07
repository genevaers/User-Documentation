# New Logical Record \(LR Properties tab\) screen help {#WERScNLogR1LRP .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScNLogR1LRP.md#02)
-   [05 Errors](WERScNLogR1LRP.md#05)
-   [10 Action on this screen](WERScNLogR1LRP.md#10)
-   [50 Fields - LR Properties tab](WERScNLogR1LRP.md#50)
-   [99 Keyboard Shortcuts](WERScNLogR1LRP.md#99)

## 02 Screen function and rights {#02 .section}

![](images/New_Logical_Record_1_LRProps_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to add a name and some basic data to a new logical record.

System and environment administrators can always use this screen. General users can use this screen if the **group selected during login** has the **Create Logical Record** right in that environment. See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For messages on this screen, see topic "**New Logical Record errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values as required.

Optionally, **right** click any value already in the field "**Lookup User-Exit Routine**" and select "**Open Editor**". This opens the "**Edit User-Exit Routine**" screen.

When work on this screen is complete, either select another tab or save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 50 Fields - LR Properties tab {#50 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all logical records. \(Display only.\)|
|Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique \(among logical record names\).Examples of permitted names:

-   CA\_SF\_Accounts\_Receivable\_2009
-   Sales\_DivisionC76

These names are not permitted:

-   2009\_Expenses \(doesn't start with a letter\)
-   New York Sales \(must not include spaces\)
-   USA/Canada Summary 1.1 \(must not include "/" or fullstop\)

|
|Type|Indicates the whether the record describes the logical file or describes a structure specific to a view.|
|Status|Indicates the status of the logical record as a whole.|
|Lookup User-Exit Routine|Specify a routine with type Lookup. \(Optional.\) Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. In rare cases, the User-Exit Routine named in this field may no longer be type Lookup due to some external update. If this occurs, the existing name is not shown in the drop down list, and you must select a new name from the drop down list.|
|Lookup User-Exit Routine Parameters|Up to 32 characters. \(Optional.\)|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

