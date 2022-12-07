# Edit User-Exit Routine screen help {#WERScEUserExR .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScEUserExR.md#02)
-   [05 Errors](WERScEUserExR.md#05)
-   [10 Action on this screen](WERScEUserExR.md#10)
-   [50 Fields](WERScEUserExR.md#50)
-   [99 Keyboard Shortcuts](WERScEUserExR.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_User-Exit_Routine_01.gif)

Use this screen to edit a user-exit routine record.

System and environment administrators can always use this screen. General users can use this screen if the **group selected during login** has **Modify or Delete** rights to the particular user-exit routine in that environment. See your system administrator if you require more rights.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Edit User-Exit Routine errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values and save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all user-exit routines. \(Display only.\)|
|Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique \(among user-exit routine names in this environment\).Examples of permitted names:

-   Accounts\_Format\_401
-   Read\_Special\_Fields

These names are not permitted:

-   2009\_Write\_Routine \(doesn't start with a letter\)
-   Special Lookup \(must not include spaces\)
-   USA/Canada Format 1.1 \(must not include "/" or fullstop\)

|
|Type|The function of the user-exit routine.|
|Optimize|This tells SAFR to avoid an unnecessary read. Check this field to tell SAFR to reuse previously read lookup values if the record keys/value have not changed. \(Optional.\)|
|Language|The language of the user-exit routine.|
|Path|The path to the user-exit routine. Up to 1016 characters. \(Optional.\)|
|Executable|The executable name must be unique within an environment. Up to 18 characters, consisting of letters \(both cases\), \#, $, and the underscore \(\_\).|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

