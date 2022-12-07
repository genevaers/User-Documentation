# New User screen help {#WERScNUser .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScNUser.md#02)
-   [05 Errors](WERScNUser.md#05)
-   [10 Action on this screen](WERScNUser.md#10)
-   [50 Fields - Login section](WERScNUser.md#50)
-   [60 Fields - Details section](WERScNUser.md#60)
-   [70 Fields - Default section](WERScNUser.md#70)
-   [99 Keyboard Shortcuts](WERScNUser.md#99)

## 02 Screen function and rights {#02 .section}

![](images/New_User_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to create new user records.

This screen is for system administrators only.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**New User errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values on this screen.

Optionally, **right** click any value already in the field "**Default Environment**" and select "**Open Editor**". This opens the "**Edit Environment**" screen.

Optionally, **right** click any value already in the field "**Default Group**" and select "**Open Editor**". This opens the "**Edit Group**" screen.

Optionally, **right** click any value already in the field "**Default View Folder**" and select "**Open Editor**". This opens the "**Edit View Folder**" screen if the view folder is in the environment of your current session. The words "Open Editor" are grey if the view folder is not in the environment of your current session.

When required, save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

Immediately afterwards, make the user a member of their default group or at least one group using topic "**Modifying group membership**". To change the permissions in the group, see topics "**Modifying group permissions by group**" and "**Modifying group permissions by environment**".

Links to these topics are under **Related tasks** below.

## 50 Fields - Login section {#50 .section}

|Field|Definition|
|-----|----------|
|User ID|A unique identifier for this user. Type 4 to 8 characters, composed of letters, numbers, and special characters ! @ \# $ % ^ & \* and the underscore \(\_\). Must be unique among user names in this SAFR database.|
|Password|As you type the screen shows only asterisks. A string of up to 20 characters. \(Optional.\)|
|Comments|Useful notes, up to 200 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|

## 60 Fields - Details section {#60 .section}

|Field|Definition|
|-----|----------|
|System Administrator|If ticked, the user has system administrator rights. If not ticked, this is a general user. Note that a general user can become an environment administrator with the help of group rights which are not configured here. \(Optional.\)|
|First Name|A string of up to 50 characters. \(Optional.\)|
|Middle Initial|Any single character. \(Optional.\)|
|Last Name|A string of up to 50 characters. \(Optional.\)|
|Log Level|Choose from 0-Errors Only, 1-High Level, 2-Detail Level. \(Optional.\)Log level 0 - the error log contains only error messages.

Log level 1 - the error log contains error messages and various events like buttons clicked.

Log level 2 - the error log contains all log level 1 data with database data such as SQL statements and procedure calls.

|
|Max Compilation error|The maximum number of errors SAFR displays when compiling a view before it stops. A number up to four digits. Zero is allowed. The default value is 20.|

## 70 Fields - Default section {#70 .section}

|Field|Definition|
|-----|----------|
|Default Environment|Choose an environment from the drop down list. This environment is the first environment that the user sees during login to SAFR. The user can choose a different environment during login. The only environments the user can select during login are those environments where the user has access rights. For an existing General User, this drop down list consists of all Environments associated with any Group that the user is a member of. For an existing system administrator, this drop down list consists of all environments. Sort the drop down list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. \(Optional.\)|
|Default View Folder|Choose from a drop down list of view folders. All views created by the user are stored in this view folder, unless the user explicitly chooses a different view folder for that view. The only view folders the user can select are those folders where the user has access to that environment. The Default Environment field must have a value to set this field. Sort the drop down list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. \(Optional.\)|
|Default Group|Choose from a drop down list of groups. Set this field only for a general user \(not a system administrator\). This group is the first group that the user sees during login to SAFR. The user can choose a different group during login. The only groups the user can select during login are those groups where the user is a member. The Default Environment field must have a value to set this field, and the default group must have access to the default environment chosen. A value in this field does not make the user a member of that default group - use the Group Membership screen to do this. Sort the drop down list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. \(Optional.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

