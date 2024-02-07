## Example 4: Adding column logic

GenevaERS provides column assignment logic and column calculations, which use GenevaERS logic text. Column logic is used to populate output columns with field values, constants, or calculations.

In this example you will add a column with some logic to the view created in Example 1 and modified in Examples 2 and 3. The column logic will display the discount, if the quantity is 10 or greater.

1. Open the **CustomerOrders** view by double-clicking the view listed in the Metadata List Area
2. Select **Column 4** by clicking on the column header.
3. Select **Edit** > **Insert Column After**  
or insert a new column using the buttons in View Editor toolbar.  
4. Click the green cell at the bottom of the new column.  
The Column Source Properties frame opens on the right.  
5.  From the **Column Source Type** list, select **Column Logic**
6.  To create and edit the column logic click in **Column Source Value**, then click in the icon on the right side.  
This opens the **Extract-Phase Column Logic** tab (**ECL** tab) in the Editor Area.  
  
Opening the **ECL** tab also opens the **Logic Text Helper**, which enables you to place keywords, field names, and column numbers into logic for column assignment. These functions are similar to functions provided by record filtering.

Add the following logic. 

      IF {QUANTITY}  >= 10 THEN
         COLUMN = {DISCOUNT_PERCENT}
      ELSE
         COLUMN = 0
      ENDIF

You can build up the logic by placing the curser in the **ECL** editor area, then double-clicking on the required text in the **Logic Text Helper**:  
1. **Keywords** > **Language Constructs** > IF THEN ELSE ENDIF
2. **Fields** > {QUANTITY}
3. **Keywords** > **Language Constructs** > COLUMN =
4. **Fields** > {DISCOUNT_PERCENT}

![Add column logic screen shot](../../images/AddColumnLogic.png)

Save the Column Logic **File** > **Save**,  
   or click the Save icon in the Workbench toolbar,  
   or press **Ctrl + s**

Close the **Extract-Phase Column Logic** tab.

Save the view **File** > **Save**,  
   or click the Save icon in the Workbench toolbar,  
   or press **Ctrl + s**

### Activate the View 

To activate the view, use any of these methods: 
- Select  **Action** > **Activate** 
- Press the Activate icon on the View Editor toolbar 
- Press **F5**

The view title bar now displays the word "Active". Save the view again to preserve this active state. The view is now ready to be run.

For more information on column logic see [Introduction to column logic](Intro6_Introduction_to_Column_Formulas.md) 


[Running the View](../RunView/RunView.md)

