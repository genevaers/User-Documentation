{: .no_toc}
# Record Filters

TABLE OF CONTENTS 
1. TOC
{:toc}  


Record filters can be used to filter input records at extract-phase time, and output records at format phase time, using functions like SELECTIF() and SKIPIF().Record filters are optional. 

## Extract-Phase Record Filter

The function of the Extract-Phase Record Filter is to include or exclude source records, based upon specific criteria. The criteria is specified using logic text.

Specifically, this logic text changes the **records selected for processing** in the extract phase of the Performance Engine. The records selected during this phase are the **input records** for processing the view(s) in that run of the Performance Engine.

Extract Record Filter logic text is performed at the start of the extract phase processing for each view.

### Statements for selecting input files

The overall idea is that your logic text describes how to select or skip, but not both.

|Choice for logic text|Notes|
|---------------------|-----|
|One SELECTIF statement|A SELECTIF statement gives a condition for selecting input records. Skip any records that do no meet the condition.|
|One SKIPIF statement|A SKIPIF statement gives a condition for skipping input records. Select any records that do not meet the condition.|
|One IF statement using only SELECT statements|One IF statement can contain a SELECT statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SELECT statements or IF statements, and the whole thing still counts as one IF statement. Skip any records that do not qualify for a SELECT somewhere in the IF statement. No actual SKIP statements are allowed.|
|One IF statement using only SKIP statements|One IF statement can contain a SKIP statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SKIP statements or IF statements, and the whole thing still counts as one IF statement. Select any records that do not qualify for a SKIP somewhere in the IF statement. No actual SELECT statements are allowed.|

### Logic text syntax and examples

The syntax of this logic text and examples are described in the Reference section [Workbench Logic Text - Extract-Phase Record Filter](../Reference/Workbench/LogicTextERFStatements.md)

### Create logic text for Extract Record Filter

This logic text is part of a view and is associated with a view source file. To create this logic text in an existing view, do the following:

1. Open the view by double-clicking the view listed in the Metadata List Area.
2. The view must have at least one view source defined. If there is no view source defined, see **Edit View \(View Editor tab\) screen help**. 
3. Ensure you are on the **View Editor** tab. If the **View Properties** tab is displayed, click the **Show Grid / Properties** button. <img src="../images/Icon_Show_Grid_Props_01.gif" alt="Missing image" width="35" height="35"/> or press F9 or select **Edit -\> Show Grid/Properties**.
4. In the column immediately below "View Editor", if there is a plus + sign to the left of **View Source**, double click the plus sign to expand the list of view sources.
5. Click in the cell with a relevant view source name under **View Sources**.  This opens the **View Source Properties** tab in the Metadata List Area.
6. From the **Extract-Phase Source** > **Record Filter** double-click in the empty cell.  This opens the **Extract-Phase Record Filter** area in the Editor Area, and the Logic Text Helper on the right side. The Logic Text Helper displays keywords and values that can be used in logic text.
7. Type your logic text in the **Extract-Phase Record Filter** window. You can use the **Logic Text Helper** to build your logic text, by double-clicking on keywords, operators, or field names.
8. When the new logic text is complete,
    -   **EITHER** click <img src="../images/Icon_Save_03.GIF" alt="Missing image" width="35" height="35"/> ,
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
  
You may wish to close the open windows. Closing the **Extract-Phase Record Filter** window will also close the **Logic Text Helper**.


## Format-Phase Record Filter

The function of the Format-Phase Record Filter is to select or skip output records for a view.

Specifically, this logic text changes the **records selected for output** in the format phase of the Performance Engine. The format phase is optional, because the extract phase may be sufficient to produce the results of that view.

The Format phase performs record filtering as the last step before writing to the output file. It works against aggregated records if the view summarizes records. Otherwise it works against detailed records.

### Logic text syntax and examples

The syntax of this logic text and examples are described in the Reference section [Workbench Logic Text - Format-Phase Record Filter](../Reference/Workbench/LogicTextFRFStatements.md)

### Create logic text for Format Record Filter

This logic text is part of a view and is associated with the format phase. The view must have a format phase. To create this logic text in an existing view, do the following:

1. Open the view by double-clicking the view listed in the Metadata List Area.
2. Ensure you are on the **View Properites** tab. If the **View Editor** tab is displayed, click the **Show Grid / Properties** button. <img src="../images/Icon_Show_Grid_Props_01.gif" alt="Missing image" width="35" height="35"/> or press F9 or select **Edit -\> Show Grid/Properties**.
3.  Go to the **View Properties, Format Phase** tab, and click on the **Edit** button under heading **Format-Phase Record Filter**.
4.  Type your logic text in the window **Format-Phase Record Filter**. You can use the **Logic Text Helper** to build your logic text, by double-clicking on keywords, operators, or column names.
5.  When the new logic text is complete,
    -   **EITHER** click <img src="../images/Icon_Save_03.GIF" alt="Missing image" width="35" height="35"/> \(the save icon\" alt="Missing image" width="35" height="35"/>,
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
  
You may wish to close the open windows. Closing the **Format-Phase Record Filter** window will also close the **Logic Text Helper**.
