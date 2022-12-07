# Edit Environment screen help {#WERScEEnv .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScEEnv.md#02)
-   [05 Errors](WERScEEnv.md#05)
-   [10 Action on this screen](WERScEEnv.md#10)
-   [50 Fields](WERScEEnv.md#50)
-   [99 Keyboard Shortcuts](WERScEEnv.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_Environment_01.gif)

Use this screen to edit any existing environment record.

This screen is for system and environment administrators only.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Edit Environment errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values and save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all environments. \(Display only.\)|
|Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique \(among environment names\).Examples of permitted names:

-   CA\_SF\_Accounts\_Receivable\_2009
-   Sales\_DivisionC76

These names are not permitted:

-   2009\_Expenses \(doesn't start with a letter\)
-   New York Sales \(must not include spaces\)
-   USA/Canada Summary 1.1 \(must not include "/" or fullstop\)

|
|Enable Archiving?|Tick if this environment might be a target of the Migration Utility. Once ticked, the Migration Utility archives data to an XML file before overwriting this environment. \(Optional.\)|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

