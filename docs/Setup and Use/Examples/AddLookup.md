## Example 3: Adding a Lookup field 

GenevaERS allows users to combine data, or "lookup" data from different files for selection tests or inclusion in an output. 

A lookup path is a GenevaERS metadata component defining how to retrieve information from a target logical record (LR) using data from a source LR.

For detailed information on lookups see [Overview of lookup paths](../../AdvancedFeatures/OverviewLookupPaths.md) in Advanced Features.

In this example you will add a new column with a lookup field as the source to the view created in Example 1. You will use existing metadata from the Demo that defines the source LR, the target LR, and the Lookup path. 

For more information on how to define your own logical record, logical file and physical file definitions look at [Create LR, LF, and PF metatdata](../../AdvancedFeatures/MetaData/CreateLRLFPFs.md) in Advanced Features.

For more information on how to define your own lookup path definitions look at [Create Lookup Path metadata.](../../AdvancedFeatures/MetaData/CreateLookupPath.md) in Advanced Features.

1. Open the **CustomerOrders** view by double-clicking the view listed in the Metadata List Area
2. Select **Column 2** by clicking on the column header.
3. Select **Edit** > **Insert Column After**  
or insert a new column using the buttons in View Editor toolbar.
4. Click the green cell at the bottom of the new column.  
The Column Source Properties frame opens on the right.  
5.  From the **Column Source Type** list, select **Lookup Field**
6.  From the **Lookup LR** list, click the list box and select the target LR **DEMO_PRODUCT_DESC_LR**
7.  From the **Lookup Path** list, click the list box and select **DEMO_ORDER_ITEM_TO_PRODUCT_DESC_LP**
8.  From the **Lookup Field** list, click the list box and select **PRODUCT_DESC**
9.  Save the view **File** > **Save**

![Column source properties showing lookup path.](../../images/AddLookupColumn.png)

### Activate the View 

To activate the view, use any of these methods: 
- Select  **Action** > **Activate** 
- Press the Activate icon on the View Editor toolbar 
- Press **F5**

The view title bar now displays the word "Active". Save the view again to preserve this active state. The view is now ready to be run.

[Running the View](../RunView/RunView.md)