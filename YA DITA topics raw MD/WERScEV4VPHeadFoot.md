# Edit View \(View Properties, Header/ Footer tab\) screen help {#WERScEV4VPHeadFoot .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScEV4VPHeadFoot.md#02)
-   [03 Summary of how to prepare a view](WERScEV4VPHeadFoot.md#03)
-   [05 Errors](WERScEV4VPHeadFoot.md#05)
-   [10 Action on this screen](WERScEV4VPHeadFoot.md#10)
-   [50 Fields](WERScEV4VPHeadFoot.md#50)
-   [99 Keyboard Shortcuts](WERScEV4VPHeadFoot.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Edit_View_4_HeadFoot_01.gif)

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

## 10 Action on this screen {#10 .section}

The header or footer are both split into three selections: **Left**, **Center** and **Right**.

Headers and footers typically contain useful information for long hardcopy reports such as page numbers, dates, and sort keys. This screen allows creating a header and footer specifically for this view \(this hardcopy report\).

A header or footer selection area can use a function by using text such as **&\[PageNumber\]** for the page number. If this text is changed in some way, then the function no longer works, and the literal text is used. For example, if the page number text is changed to **&\[PPPageNNNumber\]** then these actual characters are printed in the header or footer, rather than the page number. The text for functions must not be changed, although text or spaces can be placed before and after that function text.

Make changes to the Header and Footer as follows:

|If you want to ...|then ...|
|------------------|--------|
|**Add your own text** \(such as "Accounts Report"\).|1.  **Place your cursor** in the appropriate place in a header or footer selection area. If you highlight any existing text in that area, then that highlighted text is replaced.
2.  Type in the text you require.

|
|**Delete** existing text in a header or footer.|1.  **Highlight any existing text** in one of the header or footer selection areas.
2.  Press the **Delete** key.

|
|**Insert** function text for the **Date**, **Time**, **Page** number or **View** number in a header or footer.|1.  **Place your cursor** in the appropriate place in a header or footer selection area. If you highlight any existing text in that area, then that highlighted text is replaced.
2.  Press the relevant button:

![](images/Icon_VHeadFoot_DPTV_01.gif)


|
|**Insert** function text from the **drop down box under "Functions"** into a header or footer.|1.  **Place your cursor** in the appropriate place in a header or footer selection area. If you highlight any existing text in that area, then that highlighted text is replaced.
2.  Select the function text from the drop down box under section "**Functions**".
3.  Press ![](images/Icon_VHeadFoot_InsertText_01.gif)

|
|**Save** changes to the view|-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

|

Activation is explained in topics "**New View \(View Editor tab\) screen help**" and "**Edit View \(View Editor tab\) screen help**" because activation is normally performed on the "View Editor" tab.

## 50 Fields {#50 .section}

|Field|Definition|
|-----|----------|
|Functions \(drop down\)|Provides a list of function text. Add to a header or footer selection area as described in "Action on this screen" above. \(Optional.\)|
|Header Left Selection|Area for text for the left hand side of the header. \(Optional\)|
|Header Center Selection|Area for text for the center of the header. \(Optional\)|
|Header Right Selection|Area for text for the right hand side of the header. \(Optional\)|
|Footer Left Selection|Area for text for the left hand side of the footer. \(Optional\)|
|Footer Center Selection|Area for text for the center of the header. \(Optional\)|
|Footer Right Selection|Area for text for the right hand side of the footer. \(Optional\)|

## 99 Keyboard Shortcuts {#99 .section}

Go to topic "**What are the keyboard shortcuts?**" and read these sections:

-   "**10 Shortcuts: All workbench screens**" and
-   "**32 Shortcuts: New/Edit View screen \(View Properties tab\)**".

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

