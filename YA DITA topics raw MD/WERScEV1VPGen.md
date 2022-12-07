# Edit View \(View Properties, General tab\) screen help {#WERScEV1VPGen .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScEV1VPGen.md#02)
-   [03 Summary of how to prepare a view](WERScEV1VPGen.md#03)
-   [05 Errors](WERScEV1VPGen.md#05)
-   [10 Action on the "View Properties, General" tab](WERScEV1VPGen.md#10)
-   [50 Fields - above the General sub-tab](WERScEV1VPGen.md#50)
-   [60 Fields - General sub-tab](WERScEV1VPGen.md#60)
-   [99 Keyboard Shortcuts](WERScEV1VPGen.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_View_1_ViewProps_1Genl_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to define the given fields in a view.

This screen is available to all users of the workbench. General users can save a view if the group selected during login has at least the modify right to the relevant view folder that contains the view. See your system administrator if you require more rights.

## 03 Summary of how to prepare a view {#03 .section}

The main focus of preparing a view is preparing the **columns**. Each column is a field in the logical record for the output file of the view.

A view is displayed in two large tabs:

-   The first large tab is the "**View Properties**" tab, which has sub-tabs:



    -   **General sub-tab**

        This sub-tab names the view, the view folder and the control record. This sub-tab also defines the type of output of the view as a whole and whether a format phase is required.

    -   **Extract Phase sub-tab**

        This sub-tab defines some parameters of the extract phase processing in the Performance Engine. An output logical file and physical file for the extract phase are only defined if this view has no format phase. Other parameters are available regardless of the existence or not of a format phase.

    -   **Format Phase sub-tab**

        This sub-tab only exists if the **General sub-tab** has a tick for format phase. This sub-tab defines some parameters of the format phase processing in the Performance Engine.

    -   **Header/ Footer sub-tab**

        This tab only exists if the **General sub-tab** has **Hardcopy Report** selected, which ensures a format phase. This sub-tab defines a Header and Footer for the report.

    The "**View Properties**" tab can also be called the "**Properties**" tab.

-   The second large tab is the "**View Editor**" tab.

    This tab describes the columns in the output logical file. Most of the action on this screen is about the columns each headed with "Column X".

    Normally the first action on the 'View Editor" tab is to define at least one **view source file**, which is an input logical record and logical file for the view.

    You can save the view without a view source. To activate a view there must be at least one view source.

    The "**View Editor**" tab can also be called the "**Grid**" tab because of the display of the columns.


Only one large tab is displayed at a time. To switch between the large tabs click the **Show Grid / Properties** button ![](images/Icon_Show_Grid_Props_01.gif) or press F9 or select **Edit -\> Show Grid / Properties**.

The objective of all the tabs is an **active** view, because only active views can produce results in the SAFR Performance Engine.

A high level overview of reaching the objective is as follows:

-   Enter or modify values you require in the tabs.
-   **Save the values** in the view. When you save, the workbench performs validation checks and any validation error prevents the save. For example, there must be a unique view name. Fix any validation errors and repeat the save until successful.
-   **Activate the view** to change the status to "Active".

    When the view is first created the screen heading says "**New View - \[Inactive\]**". After successful activation, the screen heading becomes "**New View - \[Active\]**" or "**Edit View - \[Active\]**".

    If you modify any value in an existing "Active" view, when you click or tab away from the modified field the screen heading changes to "**Edit View - \[Inactive\]**". This means it is necessary to activate the view again.

    When you attempt to activate a view, the workbench performs activation checks. Any activation errors keep the status as "Inactive". For example, a view must have at least one sort key and at least one view source, even though a view can be saved without these items. Fix any activation errors and repeat the attempt to activate until successful.


General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

When creating or editing a view, if you open a list and cannot see the required items such as logical records or logical files, see your system or environment administrator.

## 05 Errors {#05 .section}

For error messages on the 'View Activation Errors" screen, see topic "**View Activation Errors message help**". For a link, see under **Related reference** below.

For all other messages on this screen, see topic "**Edit View errors**". For a link, see under **Related reference** below.

## 10 Action on the "View Properties, General" tab {#10 .section}

Remember to switch between the large tabs "**View Editor**" \(which has a grid for the columns\) and "**View Properties**" by clicking![](images/Icon_Show_Grid_Props_01.gif) \(the **Show Grid / Properties** button\) or press F9 or select **Edit -\> Show Grid / Properties**.

Enter or modify values on the "**View Properties, General**" tab. See the sections below for help on the fields on this screen.

Optionally, **right** click any value already in the field "**View Folder**" and select "**Open Editor**". This opens the "**Edit View Folder**" screen.

Optionally, **right** click any value already in the field "**Control Record**" and select "**Open Editor**". This opens the "**Edit Control Record**" screen.

When required,

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

When you save, there are **validations** of the values, and any validation error prevents the save. For example, there must be a unique view name. Once these validation errors are fixed, clicking save is successful.

Activation is explained in topics "**New View \(View Editor tab\) screen help**" and "**Edit View \(View Editor tab\) screen help**" because activation is normally performed on the "View Editor" tab.

## 50 Fields - above the General sub-tab {#50 .section}

|Field|Definition|
|-----|----------|
|ID|The position in the list of all logical records. \(Display only.\)|
|Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique \(among view names in this environment\).Examples of permitted names:

-   Report\_CA\_SF\_Accounts\_Receivable\_2009
-   Update\_Sales\_DivisionC76

These names are not permitted:

-   2009\_Expenses\_Report \(doesn't start with a letter\)
-   New York Sales Update \(must not include spaces\)
-   USA/Canada Summary Report 1.1 \(must not include "/" or fullstop\)

|

## 60 Fields - General sub-tab {#60 .section}

|Field|Definition|
|-----|----------|
|Flat File|Select this button to indicate that the output of this view is a flat file. By default selecting this button also selects Fixed Length Fields and Use Format Phase, although these defaults can be changed. \(Optional\).|
|Fixed Length Fields|Select this button to indicate that the fields in the output flat file are of fixed length. \(Optional.\)|
|Use Format Phase|Tick this box to include a format phase for this view. \(Optional.\)|
|Delimited Fields|Select this button to indicate that the fields in the output file are delimited. A format phase is mandatory if this button is selected. See the Delimiters section in the Format Phase sub-tab to choose the delimiting characters. \(Optional.\)|
|Source-Record Structure|Select this button to indicate that the output flat file has the same structure as the source record. A format phase is not possible if this button is selected. \(Optional.\)|
|Hardcopy Report|Select this button to indicate the output of the view is a hardcopy report. If this field is selected, the Lines Per Page field and the Report Width field display \(Optional.\)|
|Lines Per Page|The number of lines per page for the output hardcopy report. An integer between 0 and 999999999. This field is 60 by default and can be changed. This field is required if the Hardcopy Report button is selected.|
|Report Width|The width of the output hardcopy report. This field is 132 by default and can be changed to any integer between 0 and 999999999. \(Optional\).|
|View Folder|Select the view folder to store this view. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. The only view folders available to choose are those view folders where you have access rights.|
|Control Record|Select a control record for this view. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.\)|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|

## 99 Keyboard Shortcuts {#99 .section}

Go to topic "**What are the keyboard shortcuts?**" and read these sections:

-   "**10 Shortcuts: All workbench screens**" and
-   "**32 Shortcuts: New/Edit View screen \(View Properties tab\)**".

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

