# New Control Record screen help {#WERScNCtrlRec .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScNCtrlRec.md#02)
-   [05 Errors](WERScNCtrlRec.md#05)
-   [10 Action on this screen](WERScNCtrlRec.md#10)
-   [50 Fields](WERScNCtrlRec.md#50)
-   [99 Keyboard Shortcuts](WERScNCtrlRec.md#99)

## 02 Screen function and rights {#02 .section}

![](images/New_Ctrl_Rec_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to create a new control record.

This screen is for system and environment administrators only.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**New Control Record errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values and save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all control records. \(Display only.\)|
|Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique among control record names in this environment.Examples of permitted names:

-   CA\_SF\_Accounts\_Receivable\_2009
-   Sales\_DivisionC76

These names are not permitted:

-   2009\_Expenses \(doesn't start with a letter\)
-   New York Sales \(must not include spaces\)
-   USA/Canada Summary 1.1 \(must not include "/" or fullstop\)

|
|Maximum Extract File Number|The maximum number of extract files that can be created in the Extract Phase. Must be greater than zero and up to nine digits.|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|
|First Fiscal Month|Mandatory: the calendar month in which the fiscal year starts. A number in the range one to 12, representing the months January to December.|
|Beginning Period|A month numbered from zero to 11. This is an alternative to First Fiscal Month which is from one to 12. \(Optional.\)|
|Ending Period|A month numbered from zero to 11. Must be larger than Beginning Period, if set. \(Optional.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

