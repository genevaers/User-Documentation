{: .no_toc}
# Create Record Filters

TABLE OF CONTENTS 
1. TOC
{:toc}  

Record filters are decribed in the [overview of record filters.](../OverviewRecordFilters.md)

## Create logic text for an Extract Record Filter

This logic text is part of a view and is associated with a view source file. To create this logic text in an existing view, do the following:

1. Open the view by double-clicking the view listed in the Metadata List Area.
2. The view must have at least one view source defined. If there is no view source defined, see **Edit View \(View Editor tab\) screen help**. 
3. Ensure you are on the **View Editor** tab. If the **View Properties** tab is displayed, click the **Show Grid / Properties** button. <img src="../../images/Icon_Show_Grid_Props_01.gif" alt="Missing image" width="35" height="35"/> or press F9 or select **Edit -\> Show Grid/Properties**.
4. In the column immediately below "View Editor", if there is a plus + sign to the left of **View Source**, double click the plus sign to expand the list of view sources.
5. Click in the cell with a relevant view source name under **View Sources**.  This opens the **View Source Properties** tab in the Metadata List Area.
6. From the **Extract-Phase Source** > **Record Filter** double-click in the empty cell.  This opens the **Extract-Phase Record Filter** area in the Editor Area, and the Logic Text Helper on the right side. The Logic Text Helper displays keywords and values that can be used in logic text.
7. Type your logic text in the **Extract-Phase Record Filter** window. You can use the **Logic Text Helper** to build your logic text, by double-clicking on keywords, operators, or field names.
8. When the new logic text is complete, save the view **File** > **Save**.
  
You may wish to close the open windows. Closing the **Extract-Phase Record Filter** window will also close the **Logic Text Helper**.

### Logic text syntax and examples

The syntax of this logic text and examples are described in the Reference section [Workbench Logic Text - Extract-Phase Record Filter](../../Reference/Workbench/LogicTextERFStatements.md)


## Create logic text for a Format Record Filter

This logic text is part of a view and is associated with the format phase. The view must have a format phase. To create this logic text in an existing view, do the following:

1. Open the view by double-clicking the view listed in the Metadata List Area.
2. Ensure you are on the **View Properites** tab. If the **View Editor** tab is displayed, click the **Show Grid / Properties** button. <img src="../../images/Icon_Show_Grid_Props_01.gif" alt="Missing image" width="35" height="35"/> or press F9 or select **Edit -\> Show Grid/Properties**.
3.  Go to the **View Properties, Format Phase** tab, and click on the **Edit** button under heading **Format-Phase Record Filter**.
4.  Type your logic text in the window **Format-Phase Record Filter**. You can use the **Logic Text Helper** to build your logic text, by double-clicking on keywords, operators, or column names.
5.  When the new logic text is complete, save the view **File** > **Save**.
  
You may wish to close the open windows. Closing the **Format-Phase Record Filter** window will also close the **Logic Text Helper**.

### Logic text syntax and examples

The syntax of this logic text and examples are described in the Reference section [Workbench Logic Text - Format-Phase Record Filter](../../Reference/Workbench/LogicTextFRFStatements.md)
