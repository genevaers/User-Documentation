# What metadata do I want to see? {#WERFaqBSeeMetadata .reference}

## System administrators not affected { .section}

This help topic has no effect on system administrators. System administrators can always read every metadata item in every environment. System administrators always have enough rights to create, modify and delete any metadata item. System administrators need only read this topic, so that they understand the choices for general users.

## Environment administrators not affected { .section}

This help topic has no effect on environment administrators. Environment administrators can always see every metadata item in the appropriate environment. Environment administrators can create, modify and delete all metadata items except users, groups and environments. Environment administrators can only modify the appropriate environment. Environment administrators can only modify the group permissions in the appropriate environment, but cannot change the group membership or the group record itself. Environment administrators need only read this topic, so that they understand the choices for general users.

## General users have a choice { .section}

**This help topic is for general users.**

General users get rights to access an environment from the **group selected during login**. If the general user has access to an environment, the general user can always see the name and id of every metadata item in that environment. The name and id are the only thing the general user can see, if they do not have any edit rights.

**Edit rights** are rights about individual metadata items. Edit rights are **create, modify and delete rights** to individual metadata items in that environment. Edit rights depend on the group membership and group permissions.

Links to the administrator topics "**Modifying group membership**", "**Modifying group permissions by group**" and "**Modifying group permissions by environment**" are under "**Related tasks**" below.

General users have two choices of what metadata they can see:

-   **Show all** - see all metadata items on a screen. Where the user has no edit rights the metadata items are still listed using grey text.
-   **Show with edit rights** - see only the metadata items where the user has edit rights.

## General users and the Show button { .section}

The two choices in the previous section are controlled by this **"Show" button** on the toolbar: ![](images/Icon_Show_Toggle_01.gif)

When you first start the workbench, the setting is "Show with edit rights". Pass your cursor over the Show button, and the tool tip displays "Show all". This means that when you click on the Show button the current setting changes to "Show all".

After clicking the Show button once, the setting is "Show all" and the tool tip changes to "Show with edit rights". When you click on the Show button a second time, the situation changes back to when you first started in the workbench. The action of the Show button alternates each time the button is clicked.

Notice that the tool tip displays the opposite of the setting that is currently operating. This is because the Show button always offers you the choice to change to the opposite setting.

You can see examples of the action of the Show button in sections further down in this help topic.

The Show button on the workbench toolbar changes all screens in the workbench. When you click on the Show button, screens that are already open change immediately, as well as new screens that you open after that point. The section below discusses how general users can make an exception on some screens.

## General users can make an exception on some screens { .section}

Some screens have a small toolbar that has a Show button ![](images/Icon_Show_Toggle_01.gif) just for that screen.

Call these screens the **exception** screens. Each exception screen is launched from a screen that we can call the exception parent screen.

One example of these screens is as follows:

1.  Click "**Logical Files**" in the Navigator.
2.  In the Metadata List, **double click a logical file** than you have edit rights for. This launches the "**Edit Logical File**" screen which is the exception parent screen.
3.  On the screen "**Edit Logical File**", under the heading "**Associated Physical Files**", click **Add**.
4.  The screen "**select components to be associated**" has a toolbar with a Show button ![](images/Icon_Show_Toggle_01.gif).  This is an exception screen. Clicking the Show button on this screen only changes the metadata displayed on this screen.

The exception screens work as follows:

1.  The first time the exception screen opens, the "Show" setting is the same as that given for the workbench toolbar.
2.  If you click on the Show button on the exception screen, only the exception screen changes. If you close the exception screen and reopen it, the exception screen remembers your choice.
3.  If you close the exception parent screen, and later reopen that screen, then the exception screen behaves like the first time case above.
4.  If you click on the Show button in the workbench toolbar, then all exception screens behave like the first time case above.

## "Show all" example in the workbench { .section}

Note the following about the Metadata List:

-   Any items in normal black text are available to click on. For example, in the Metadata List click on TT2004\_EVENT\_LF\_193 to edit that logical file.
-   Any items listed in grey indicate you have no edit rights. You cannot open these items.

![](images/ER_WB_All_01.gif)

## "Show with edit rights" example in the workbench { .section}

Note the following about the Metadata List:

-   The only items listed are in normal black text. You can click on all of these items.
-   The other items are hidden. For example, the logical files shown in grey above still exist, but are not displayed.

![](images/ER_WB_Edit_01.gif)

**Parent topic:**[Workbench General User Guide](../html/AAR580WEGenUser.md)

**Parent topic:**[FAQ for WE](../html/SARFaqWE.md)

