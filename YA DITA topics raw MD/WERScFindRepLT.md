# Find/Replace Logic Text screen help {#WERScFindRepLT .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScFindRepLT.md#02)
-   [05 Errors](WERScFindRepLT.md#05)
-   [10 Recommended preparation before using this screen](WERScFindRepLT.md#10)
-   [20 Overview of actions on this screen](WERScFindRepLT.md#20)
-   [30 Action - searching for existing logic text](WERScFindRepLT.md#30)
-   [35 How can I see all the logic text in "Search Results"?](WERScFindRepLT.md#35)
-   [40 Action - replacing logic text](WERScFindRepLT.md#40)
-   [50 Fields - Search Criteria](WERScFindRepLT.md#50)
-   [60 Fields - Views to Search In](WERScFindRepLT.md#60)
-   [70 Fields - Search Results](WERScFindRepLT.md#70)
-   [80 Fields - Replace](WERScFindRepLT.md#80)
-   [99 Keyboard Shortcuts](WERScFindRepLT.md#99)

## 02 Screen function and rights {#02 .section}

![](images/FRLT_ASearch_02.gif)

![](images/FRLT_BReplace_02.gif)

![](images/FRLT_CSearchRes_03.gif)

In the image above, parts of this screen are rearranged and compressed vertically for ease of printing and display.

Use this screen to update logic text by finding certain parts of existing logic text and replacing those parts.

This screen is for system and environment administrators only.

## 05 Errors {#05 .section}

For messages on this screen, see topic "**Find/Replace Logic Text errors**". For a link, see under **Related reference** below.

## 10 Recommended preparation before using this screen {#10 .section}

Ensure you know the following:

-   The **component to find** in existing logic text. That component may be an existing metadata item, such as a lookup path, logical file, logical record, physical file or user-exit routine. That component may be a string of text such as a specific value of a product code. You must find all the views that have logic text with that existing component.

    If the component is the name of a metadata item, a simple method to find all the affected views is to use the **Dependency Checker Report**. For details, see topic "**How do I generate a Dependency Checker Report?**" A link to that topic is under **Related reference** below.

-   The **replacement component** for the logic text. The replacement may be a metadata item such as a lookup path, logical file, logical record, physical file or user-exit routine. The replacement may be a string of text such as a new value of a product code.
-   The appropriate **environment** and **views** to search for the logic text to be changed. The views may be selected as one of:

    -   All views for that **environment**
    -   **Specific views chosen** from a list of all views in that environment
    -   All views in one or more **view folders**
    The above selection of views can be **further filtered by date of creation or modification.** For example, select views created before a certain date.


## 20 Overview of actions on this screen {#20 .section}

Broadly, there are two high level actions:

1.  **Search** for views that contain logic text. Search for either some metadata name in logic text, or for specific logic text that you provide. For example, the metadata name can be the name of a **lookup path, logical file, logical record, physical file or a user-exit routine**. An example of specific logic text is "**\{Current\_Quarter\} = 01**". You can limit the views that are included in the search.
2.  **Replace** the logic text found in the previous step with something else. You can further limit the views that receive the replacement logic text, so not all views and logic text found get updated.

For messages on this screen, see topic "**Find/Replace Logic Text errors**". For a link, see under **Related reference** below.

## 30 Action - searching for existing logic text {#30 .section}

You must perform the following at least once:

1.  **Select an environment** from the list in the drop down box. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

    A system administrator selects from a list of all environments. An environment administrator selects from a list where the group selected for login provides administrator access.

    Optionally, **right** click any value already in the field "**Environment**" and select "**Open Editor**". This opens the "**Edit Environment**" screen.

2.  **Create a value to search for** in field "Find What". Choose one of these two methods:

    **EITHER** type in logic text to be replaced

    **OR** click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select Component**". The window "**Select Component**" allows choosing a \(metadata\) component type and hence a \(metadata\) component. For component, sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

    If there is no value in this field, the button "**Search**" is grey.

3.  **Decide which views to search.** By default, the radio button "**Search all views in the specified environment**" is selected. See the table below for more options.

Options to decide which views are searched are as follows:

|If you want to ...|then ...|
| | |
|------------------|--------|
|--|--|
|Limit search to views based on **creation date**|1.  Tick the field "**Refine Search to View\(s\)**"
2.  Tick "**Created**"
3.  Select a value for "When" - the field immediately below
4.  Select a value for "Date" - the field to the right.

The comparison reads "Created" "When" "Date", for example, "Created After 01/01/2010". This comparison further refines the views selected in the three radio buttons immediately under the heading "Views to Search In".|
| | |
|Limit search to views based on **modification date**|1.  Tick the field "**Refine Search to View\(s\)**"
2.  Tick "**Modified**"
3.  Select a value for "When" - the field immediately below
4.  Select a value for "Date" - the field to the right.

The comparison reads "Modified" "When" "Date", for example, "Modified After 01/01/2010". This comparison further refines the views selected in the three radio buttons immediately under the heading "Views to Search In".|
| | |
|Make the search **case sensitive \(or not\)**|Tick "**Match Case**". Click again to remove the tick \(and relax any testing of case for letters\)|
| | |
|Search all views in the **environment**|Select the radio button for "**Search all views in the specified environment**".|
| | |
|**Select the views** to search|Select radio button "**Search these specific view\(s\)**" and click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select View\(s\) to search in**". This window allows ticking individual views to include in the search for logic text. Click OK to close this window. The total number of views ticked is shown as "X selected" to the right of the ![](images/Icon_Three_Dots_01.gif) icon. Note that selecting this radio button clears the radio buttons immediately above and below.

If there is a long list in the window "**Select View\(s\) to search in**", then the list can be searched as follows:

1.  Click inside the list.
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar or the window. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the view name.
5.  Click OK to start the search.

When the view is found, tick the view and click OK to select the view in the search.

For more about this searching, read task "**Searching lists of metadata**". A link is under "Related tasks" below.

|
| | |
|**Select view folders** where all views are searched|Select the radio button "**Search views in these view folder\(s\)**" and click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select View Folder\(s\) to search in**". This window allows ticking an individual view folder so that all the views in that folder are included in the search for logic text. Click OK to close the window. The total number of view folders ticked is shown as "X selected" to the right of the ![](images/Icon_Three_Dots_01.gif) icon.Not that selecting this radio button clears the radio buttons immediately above.

If there is a long list in the window "**Select View Folder\(s\) to search in**", then the list can be searched as follows:

1.  Click inside the list.
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar or the window. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the view folder name.
5.  Click OK to start the search.

When the view folder is found, tick the view folder and click OK so that all views in that view folder are included in the search.

For more about this searching, read task "**Searching lists of metadata**". A link is under "Related tasks" below.

|
| | |
|Use **Pattern Matching**|Tick "**Use Pattern Matching**" to allow for the "Find What" to contain a regular expression. For example, a star \(\*\) stands for one or more of any character.|

## 35 How can I see all the logic text in "Search Results"? {#35 .section}

There are two ways to see all the text in column "**Logic text**" in "**Search Results**":

1.  To see all the logic text **for one row** under "Search Results", **click on that row** in "Search Results". The white area below the table displays all of the logic text, possibly with a vertical scroll bar. This displays logic text of any size and is recommended.
2.  To see more logic text **for the entire "Search Results" table**, click on topic "**I want to see more logic text for all rows in the Find/Replace Logic Text screen**". A link to this topic is under "**Related Reference**" at the bottom of this screen. This displays more for each row than the default layout of the table, but is not suitable for displaying logic text longer than one line in each row.

## 40 Action - replacing logic text {#40 .section}

You must select \(tick\) at least one view listed under "**Search Results**" in order to allow replacing some text in the logic text for that view\(s\).

To help decide which views to tick under "Search Results", the following optional action may be useful: **right** click any row with data under "**Search Results**" and select "**Open Editor**". This opens the "**Edit View**" screen. You can see the view and the logic text contained in that view.

To replace some text inside logic text inside the views under "Search Results", perform all of the following:

1.  At least one row is ticked under **"Search Results"** in the "Replace" column. If there are no values in "Search Results", see "**Action - searching for existing logic text**" above.
2.  There is text in the "Replace With" field. This is the text that replaces the text in field "Find What" above. Choose one of the methods below to put values in the "Replace With" field.

    **EITHER** type in replacement logic text

    **OR** click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select Component**". The window "**Select Component**" allows choosing a component type and hence a component. For component, sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

3.  Click the "**Replace**" button. Once pressed, a warning appears. Click OK to proceed with the replacement of the logic text, and make the status of the updated views **inactive**. Click Cancel to stop the attempted replace. If this button is grey, check the previous two points above.

For messages on this screen, see topic "**Find/Replace Logic Text errors**". For a link, see under **Related reference** below.

## 50 Fields - Search Criteria {#50 .section}

|Field|Definition|
|-----|----------|
|Environment|Select an environment from the drop down list. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. System administrators sees a list of all environments. Environment administrators see a list of only the environments where group selected for login provides administrator access. Selecting one environment is mandatory. If you choose a different environment and click anywhere, all values in "Search Results" are cleared and all selections of views and view folders below are cleared, and the "Replace" button is grey.|
|Find What|Choose one of the methods below to put values in this field. **EITHER** type in logic text to be replaced

**OR** click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select Component**". The window "**Select Component**" allows choosing a component type and hence a component. For component, sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

If there is no value in this field, the button "**Search**" is grey. Once text exists in this field, click "**Search**" to find existing logic text that contains the value in this field.

|
|Match Case|Tick this box to ensure the search finds the exact case of the text in "Find What". Untick this box to relax any case testing.|
|Use Pattern Matching|Tick this box to allow for the "Find What" to contain a regular expression. For example, a star \(\*\) stands for one or more of any character.|

## 60 Fields - Views to Search In {#60 .section}

|Field|Definition|
|-----|----------|
|Search All Views|Select this radio button to search the logic text in all views in the environment given in the "Search Criteria" above. Selecting this radio button clears the radio buttons immediately below. \(Optional.\)|
|Search Specific Views|Select this radio button and click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select View\(s\) to search in**". \(Optional.\) The window "**Select View\(s\) to search in**" allows ticking individual views to include in the search for logic text. Click OK to close the window "**Select View\(s\) to search in**" and display "X selected" to the right of the ![](images/Icon_Three_Dots_01.gif) icon. This shows how many views are ticked. Selecting this radio button clears the radio buttons immediately above and below.

If there is a long list in the window "**Select View\(s\) to search in**", then the list can be searched as follows:

1.  Click inside the list.
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar or the window. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the view name.
5.  Click OK to start the search.

When the view is found, tick the view and click OK to select the view in the search.

For more about this searching, read task "**Searching lists of metadata**". A link is under "Related tasks" below.

|
|Search Specific View Folders|Select this radio button and click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select View Folder\(s\) to search in**". \(Optional.\) The window "**Select View Folder\(s\) to search in**" allows ticking an individual view folder so that all the views in that folder are included in the search for logic text. Click OK to close the window "**Select View Folder\(s\) to search in**" and display "X selected" to the right of the ![](images/Icon_Three_Dots_01.gif) icon. This shows how many view folders are ticked. Selecting this radio button clears the radio buttons immediately above and below.

If there is a long list in the window "**Select View Folder\(s\) to search in**", then the list can be searched as follows:

1.  Click inside the list.
2.  Press the **F3 key**. Alternatively, click on the **search icon** ![](images/Icon_SearchMetadata_01.gif) in the Workbench toolbar or the window. If the icon is grey, repeat the previous step and the icon should now be available.
3.  The screen "**Search Metadata Component**" appears. Choose the type of search you require: either "**By ID**" or "**By Name**".
4.  In the field "**Search text**" type either the ID or the first characters in the view folder name.
5.  Click OK to start the search.

When the view folder is found, tick the view folder and click OK so that all views in that view folder are included in the search.

For more about this searching, read task "**Searching lists of metadata**". A link is under "Related tasks" below.

|
|Refine Search to Views|Tick this box to enable the fields in the box below. \(Optional.\) If ticked, the fields below are mandatory.|
|Created|Tick this radio button to refine the search using the date a view was created. When this radio button is selected, the drop down box and the date below refer to the date the view was created. \(Mandatory if "Refine Search to Views" is ticked, otherwise grey.\) See the Date field below for how this field is used.|
|Modified|Tick this radio button to refine the search using the date a view was most recently modified. When this radio button is selected, the drop down box and the date below refer to the date the view was most recently modified. \(Mandatory if "Refine Search to Views" is ticked, otherwise grey.\) See the Date field below for how this field is used.|
|When|This is a drop down box that describes a relationship between two dates. The two dates are the radio button above \("Created" or "Modified"\) and the date value below. See Date field below for how the relationship works. \(Mandatory if "Refine Search to Views" is ticked, otherwise grey.\)|
|Date|A date value that allows a comparison, using the fields above. The comparison reads "Radio button" "When" "Date", for example, "Created After 01/01/2010". This comparison further refines the views selected in the three radio buttons immediately under the heading "Views to Search In". \(Mandatory if "Refine Search to Views" is ticked, otherwise grey.\)|

## 70 Fields - Search Results {#70 .section}

|Field|Definition|
|-----|----------|
|Replace|A tick selects the view in this row for replacement. There must be at least one tick for a replacement to occur. Ticks can be created or removed by ticking in this box. The buttons **Select All** and **Deselect All** apply to the entire list of views and can avoid ticking or clearing a large number of rows.|
|View ID|The ID of a view found in the search. \(Display only.\)|
|View Name|The name of a view found in the search. \(Display only.\)|
|View Folder|The view folder for a view found in the search. \(Display only.\)|
|Found In|The type of logic text in that view that contains the "Find What" text. \(Display only.\)|
|Column|This field shows the relevant Column number in the view for logic text of type Extract Column Assignment or Format-Phase Column Calculations. This field displays "N/A" for logic text of type Extract Record Filter or Format Record Filter. \(Display only.\)|
|Logic Text|The logic text found that contains the "Find What" text. \(Display only.\)|
|Text|A larger display of the logic text for the row highlighted above. Click on any row to display the logic text for that row. \(Display only\).|

## 80 Fields - Replace {#80 .section}

|Field|Definition|
|-----|----------|
|Replace With|Choose one of the methods below to put values in this field. **EITHER** type in text to replace the text in "Find What"

**OR** click ![](images/Icon_Three_Dots_01.gif) to display the window "**Select Component**". The window "**Select Component**" allows choosing a component type and hence a component. For component, sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header.

If there is no value in this field, the button "**Replace**" is grey. Once text exists in this field, click "**Replace**" to attempt replacement of logic text.

|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

