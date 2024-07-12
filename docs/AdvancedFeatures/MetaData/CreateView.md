{: .no_toc}
# Create Views

TABLE OF CONTENTS 
1. TOC
{:toc}  

A view is a GenevaERS metadata component that defines a data transformation. See [Overview of views](../OverviewViews.md) and [overview of summary views](../OverviewFormatViews.md) for a detailed description.

In the workbench views can be grouped together in **View Folders**. To list existing views:  

- Click **View Folders** > **ALL_VIEWS** or,
- Click **View Folders** > *folder-name* in the Navigator pane.

The views are shown in the metadata list at the bottom of the workbench screen.

## Create a view - Extract only with column defined output

Creating an Extract-Phase Output view is described here.  

To create a new view:

1. Select **Administration** > **New** > **View** from the menu.  

{% include ViewToggle.md %}

The first screen presented is the View Properties screen, which contains the sub-tab **General**.

1. In the **Name** field  type a descriptive name.
2. In the **Control Record** field select the control record.
3. Select the **Default Output Format** required. This will affect the other sub-tabs available to you. For this case, an Extract only view with column defined output, select **Extract-Phase Output** > **Fixed-Width Fields**.
4. You can select an output LR to pre-define columns by using **Create View based on Output Logical Record**.  This option is only available before the first save. It could be useful if the output of this view is to become the source of another view via a pipe or a token.

![New View Properties General tab.](../../images/CreateViewNew.png)

5. Select the **View Properties** sub-tab **Extract Phase**. Here you have the option to limit the number of output records written with the **Extract-Phase Output Limit**
6. Save the view **File** > **Save**  

When you save a new view, the view ID is assigned by the Workbench and is not editable.

### View Source 

Next specify the view source. You must have already defined the physical files, logical files and logical records definitions for the source you want to specify.

For information on how to define your own logical record, logical file and physical file definitions look at [Create LR, LF, and PF metatdata](../../AdvancedFeatures/MetaData/CreateLRLFPFs.md) in Advanced Features.

7. Toggle to the **View Editor** screen.
8. Select **Edit** > **Add View Source**  
   Alternatively, you can Right Click on **View Sources** then select **Add View Source**
9. In the pop-up window use the drop down arrow to select the **Logical Record**, and the **Logical File** you require. Click **OK**.

### Adding columns

Next define the output layout by adding columns to the view. The columns contain the characteristics of the output such as data type, the length, and the alignment, such as left, right, or center. They can also contain constants, logic and lookup fields.

10. Select **Edit** > **Insert Column After**  
or you can insert a new column using the View Editor toolbar in the top right of the Editor Area. The arrow icons are used to insert new columns, or to move columns.  
A new column is added to the grid.
11.  Click the green cell at the bottom of the new column.  
The Column Source Properties frame opens on the right.  
12.  From the **Column Source Type** list, you can select 
**Column Logic**, 
**Constant**, 
**Lookup Field** or 
**Source File Field**. 
For more information on the column types see [Column Assignment](../ColumnLogic.md), [Data Types](./DataTypes.md), [Lookup Paths](../OverviewLookupPaths.md), and [Extract-Phase Column Logic](../../Reference/Workbench/LogicTextECLStatements.md).

13. You can add as many columns as you want, but be aware of the output record length. Each column displays the start and end position in the output record.

### Output destinations

The default output destination for Extract-Phase only Views is the DD **F*****nnnnnnn*** where ***nnnnnnn*** is the view ID. For example, if the view ID is **12183** the default DD name for Extract-Phase only Views is **F0012183**.

You can specify your own output destination. To do this:

1. Left click on the View Sources blue cell you added earlier. This opens the **View Source Properties** tab in the Metadata List Area.
2. From the **Extract-Phase Output** > **Logical File** list select the LF you want to write to.
3. From the **Extract-Phase Output** > **Physical File** list select the PF you want to write to.
4. Save the view **File** > **Save**

You will see that the WRITE statement in the **Record Logic** field has changed.

You can also replace the WRITE statement with Extract Record Logic. For example you may want to have logic that directs some output to one file and the rest to another file, depending on some condition. See [Extract-Phase Record Logic](../../Reference/Workbench/LogicTextERLStatements.md) for more details.

### Defining a filter

The view can contain logic to filter input records at extract-phase time.  See [Create Record Filters](./CreateRecordFilters.md).

### Activating the View 

To activate the view, use any of these methods: 
- Select  **Action** > **Activate** 
- Press the Activate icon on the View Editor toolbar 
- Press **F5**

Activation invokes the compiler which checks for errors and warnings.

When the view is active, save it to preserve this active state. The view is now ready to be run.

## Create a view - Extract only copy view

Another type of Extract only view is a copy view. This view has no columns as the output layout is the same as the source record layout. The view can still define record filters and output record logic.

To define a copy view:

1. Select **Administration** > **New** > **View** from the menu.  

{% include ViewToggle.md %}

The first screen presented is the View Properties screen, which contains the sub-tab **General**.

1. In the **Name** field  type a descriptive name.
2. In the **Control Record** field select the control record.
3. Select the **Default Output Format** required. This will affect the other sub-tabs available to you. For this case, an Extract only copy view, select **Extract-Phase Output** > **Source-Record Layout**.

![New View Properties General tab.](../../images/CreateViewCopy.png)
Note that 'Create View based on Output Logical Record' is not selectable in this case.

4. Select the **View Properties** sub-tab **Extract Phase**. Here you have the option to limit the number of output records written with the **Extract-Phase Output Limit**
5. Save the view **File** > **Save**  

Next define the [view source](#view-source), as in the previous case.  
A copy view has no columns.

You can optionally define [output destinations](#output-destinations), and a [record filter](#defining-a-filter).

### Activating the View 

To activate the view, use any of these methods: 
- Select  **Action** > **Activate** 
- Press the Activate icon on the View Editor toolbar 
- Press **F5**

Activation invokes the compiler which checks for errors and warnings.

When the view is active, save it to preserve this active state. The view is now ready to be run.

## Summary views

Summary views require a format phase to be defined. See [create summary views](./CreateSummaryView.md) for details of how to create the different types of summary views.