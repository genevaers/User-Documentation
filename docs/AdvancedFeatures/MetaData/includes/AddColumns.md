### Add columns

Next define the output layout by adding columns to the view. The columns contain the characteristics of the output such as data type, the length, and the alignment, such as left, right, or center. They can also contain constants, logic and lookup fields.

1. Select **Edit** > **Insert Column After**  
or you can insert a new column using the View Editor toolbar in the top right of the Editor Area. The arrow icons are used to insert new columns, or to move columns.  
A new column is added to the grid.
2.  Click the green cell at the bottom of the new column.  
The Column Source Properties frame opens on the right.  
3.  From the **Column Source Type** list, you can select 
**Column Logic**, 
**Constant**, 
**Lookup Field** or 
**Source File Field**.  
4. The following depend the **Column Source Type** selection
- For **Column Logic**:  
To open the Extract-Phase Column Logic editor, click on the icon ![Three dot icon](../../images/Icon_Three_Dots_01.gif) in **Column Source Value**
- For **Constant**:  
Type the constant value in **Column Source Value**
- For **Lookup Field**:  
Select the target **Lookup LR** from the drop down list.  
Select the **Lookup Path** from the drop down list.  
Select the **Lookup Field** from the drop down list.  
Click anywhere in the Column Source Properties panel, and the properties of the selected field will be filled in.  
- For **Source File Field**:
Select the field from the **Column Source Value** drop down list.  
Click anywhere in the Column Source Properties panel, and the properties of the selected field will be filled in.

After filling in the Column Source Properties, you can select the Column Output properties. For example you can specify in the column properties the Data Type, any Date/Time formatting, data alignment etc.

For more information on the column types see [Column Assignment](../ColumnLogic.html), [Data Types](./DataTypes.html), [Lookup Paths](../OverviewLookupPaths.html), and [Extract-Phase Column Logic](../../Reference/Workbench/LogicTextECLStatements.html).


You can add as many columns as you want, but be aware of the output record length. Each column displays the start and end position in the output record.
