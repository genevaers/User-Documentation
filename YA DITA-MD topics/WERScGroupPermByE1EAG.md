# Group Permissions By Environment \(Environment, Associated Groups sections\) screen help {#WERScGroupPermByE1EAG .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScGroupPermByE1EAG.md#02)
-   [05 Errors](WERScGroupPermByE1EAG.md#05)
-   [10 Action - Environments section](WERScGroupPermByE1EAG.md#10)
-   [20 Action - Associated Groups section](WERScGroupPermByE1EAG.md#20)
-   [30 Searching in Associated Groups](WERScGroupPermByE1EAG.md#30)
-   [40 Searching in "Select components to be associated"](WERScGroupPermByE1EAG.md#40)
-   [50 Fields - Environments section](WERScGroupPermByE1EAG.md#50)
-   [60 Fields - Associated Groups section](WERScGroupPermByE1EAG.md#60)
-   [99 Keyboard Shortcuts](WERScGroupPermByE1EAG.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Group_Perm_1_ByEnv_Env_AssocGroups_01.gif)

This screen specifies the rights of a group to modify components of an environment.

This screen is for system and environment administrators only.

A system administrator can modify permissions for any environment and any group. An environment administrator can modify permissions only for that particular environment and any groups that already have access to that environment.

The Group Permissions By Environment screen has three sections:

|Section|Notes|
|-------|-----|
|**Environments**|Select the environment to work on. If the list is long, sort the drop down list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.|
|**Associated Groups**|Displays the groups that can access this environment. **Only system administrators can change the details of the groups** listed in this section. Environment administrators can only highlight a group in order to make changes in the Component Security section.|
|**Component Security**|Security details of the **highlighted environment** under **Associated Environments**. This section has two tabs:-   "**Permissions**" tab. Allows the group to **create new components of certain types** and **run certain SAFR processes** in this environment.
-   "**Edit Rights**" tab. Allows the group **Read, Modify or Delete** access for **any existing component** in this environment.

|

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Group Permissions By Environment messages**". For a link, see under **Related reference** below.

## 10 Action - Environments section {#10 .section}

**System administrators** can select any environment. If the list is long, sort the drop down list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

**Environment administrators** must have logged into the workbench using a group that provides administrator access to one or more environments. Environment administrators must select one of the environments where their login group provides administrator access.

Optionally, **right** click any environment already in the field "**Environment**" and select "**Open Editor**". This opens the "**Edit Environment**" screen.

## 20 Action - Associated Groups section {#20 .section}

**Only system administrators** can perform actions in this section. Environment administrators can only highlight a group in order to make changes in the Component Security section.

|If you want to ...|then ...|
|------------------|--------|
|**Add one or more groups** to access that environment|Click **Add**. On the screen "**Select components to be associated**", tick the relevant groups and click OK. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. If the list of environments in "Select components to be associated" is long, this list can be searched - see the section below. If the button **Add** is grey, ensure an environment is selected above.|
|**Allow \(or disallow\)** the group to have **administration rights** to this environment.|**Highlight** the group under "**Associated Groups".****A tick in the Admin column** gives administration rights for the group in that environment.

Remove the tick to disallow administration rights. The group can still have rights given in the Component Security section below.

|
|**Remove one or more groups** from access to that environment|Highlight the relevant group\(s\) and click **Remove**. You can sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. If the list of groups in "Associated Groups" is long, this list can be searched - see the section below. If the button **Remove** is grey, ensure a group is highlighted. If you need to highlight more than one group, hold the Ctrl key down and click on an extra group. Hold the Ctrl key down and click on a highlighted group to remove the highlight. Hold the Shift key down to highlight all groups back to and including the last highlighted group.|
|See details of a listed **group**.|**Right** click in any existing **row** of values in the "Associated Groups" table and select "**Open Editor**". This opens the "**Edit Group**" screen.|

When all changes are complete,

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 30 Searching in Associated Groups {#30 .section}

If there is a long list of associated groups, then the list can be searched as follows:

1.  Click inside the list under "**Associated Groups**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the group name.
5.  Click OK to start the search.

If the group is found, then you are returned to the list with that group highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 40 Searching in "Select components to be associated" {#40 .section}

After clicking **Add**, the screen "**Select components to be associated**" lists the groups available. If there is a long list of groups, then this list can be searched as follows:

1.  Click inside the list under "**Select components to be associated**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the group name.
5.  Click OK to start the search.
6.  If the component is found, then you are returned to the screen "Select components to be associated" with that component highlighted. Tick the file to include \(later\) in the list of associated groups.
7.  You may search again if required. You may tick as many groups as required.
8.  When all ticks are in place, click OK to complete the add of ticked files.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 50 Fields - Environments section {#50 .section}

|Field|Definition|
|-----|----------|
|Environments|Select an existing environment. If the list is long, sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. System Administrators can see a list of all environments. Environment Administrators can only see the environments where they have administrator rights.

When a group is selected, the fields in the Associated Groups section are populated.

|

## 60 Fields - Associated Groups section {#60 .section}

|Field|Definition|
|-----|----------|
|Admin|A tick gives the group administration rights to that environment, which means all members of that group are environment administrators. Remove the tick to remove these rights. \(Optional.\)|
|ID|The ID of the group. Click on the column heading **ID** to sort the list by ID. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|
|Name|The name of the group. Click on the column heading **Name** to sort the list by Name. Click repeatedly to switch between ascending and descending sort order. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

