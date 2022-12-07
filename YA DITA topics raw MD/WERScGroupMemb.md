# Group Membership screen help {#WERScGroupMemb .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScGroupMemb.md#02)
-   [05 Errors](WERScGroupMemb.md#05)
-   [10 Action on this screen](WERScGroupMemb.md#10)
-   [20 Searching in Associated Users](WERScGroupMemb.md#20)
-   [30 Searching in "Select components to be associated"](WERScGroupMemb.md#30)
-   [50 Fields](WERScGroupMemb.md#50)
-   [99 Keyboard Shortcuts](WERScGroupMemb.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Group_Membership_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to maintain which users are members of which groups.

This screen is for system administrators only.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**Group Membership errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

**Select a group** from the drop down box. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

Optionally, **right** click any value already in the field "**Group**" and select "**Open Editor**". This opens the "**Edit Group**" screen.

Change the membership of this group as follows:

|If you want to ...|then ...|
|------------------|--------|
|**Add** one or more users to the group|Click **Add**. On the screen "**Select components to be associated**", tick the relevant users and click OK. If the list of users in "Select components to be associated" is long, this list can be searched - see the section below. If the Add button is grey, select a group.|
|**Remove** one or more users from the group|Tick one or more users under **Associated Users** and click **Remove.** If the list of users in "Associated Users" is long, this list can be searched - see the section below. If the Remove button is grey, ensure at least one user has a tick.|
|See details of a listed **user**.|**Right** click in any existing **row** of values in the Associated Users table and select "**Open Editor**". This opens the "**Edit User**" screen.|

Modify membership as shown above and save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 20 Searching in Associated Users {#20 .section}

If there is a long list of associated users, then the list can be searched as follows:

1.  Click inside the list under "**Associated Users**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the User name.
5.  Click OK to start the search.

If the User is found, then you are returned to the list with that User highlighted.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 30 Searching in "Select components to be associated" {#30 .section}

After clicking **Add**, the screen "**Select components to be associated**" lists the Users available. If there is a long list of Users, then this list can be searched as follows:

1.  Click inside the list under "**Select components to be associated**".
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the User name.
5.  Click OK to start the search.
6.  If the component is found, then you are returned to the screen "Select components to be associated" with that component highlighted. Tick the file to include \(later\) in the list of associated Users.
7.  You may search again if required. You may tick as many Users as required.
8.  When all ticks are in place, click OK to complete the add of ticked files.

For more about this searching, read task "**Searching lists of metadata**". A link to that topic is under **Related tasks** below.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|Groups|Choose from a drop down list of all groups in the current environment. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.|
|User ID|A User Id of a user in the group. \(Display only.\) If the list of users in "Associated Users" is long, this list can be searched - see the section above.|
|Name|The User Name for the User Id given at left. \(Display only.\) If the list of users in "Associated Users" is long, this list can be searched - see the section above.|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

