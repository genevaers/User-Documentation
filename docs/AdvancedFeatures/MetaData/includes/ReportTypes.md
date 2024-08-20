### Report with Columns 

The simplest report contains the sort fields displayed as data in columns, and includes no subtotals. To produce a report that is formatted to display information as data and to have no sort key footer, 

1. Select the **View Editor** tab. 
2. Open the **Sort Key Properties** frame by clicking on the yellow **Sort Keys** cell in the column grid.
3. Select **As Data** for the **Display Mode**. This indicates the sort key data to be displayed in a column.
4. Select **Suppress Print** for the **Sort Key Footer Option**. This indicates no subtotal to be displayed at the sort key break (change in sort key value).  

![Define report with columns.](../../images/CreateReportCol.png)  

If all sort keys have these same parameters, the report will look much like a spreadsheet with columns and rows of data.

### Report with Categories

As an alternative to displaying sort key values “as data” (that is, in columnar format), you can display sort key values on the left side of the page, with indentation, and group records with the same sort key values together. This is known as the “categorized” format.

1. Select the **View Editor** tab. 
2. Open the **Sort Key Properties** frame by clicking on the yellow **Sort Keys** cell in the column grid.
3. Select **Categorize** for the **Display Mode**. This indicates the sort key data to be displayed as categories.
With **Categorize** selected, the following options are available: 
4. The **Sort Key Label** defaults to the text in Heading 1 for the Sort Key. This can be edited.
5. The **Sort Key Footer Label** is used when subtotaling is required. See [Report options - Subtotals](#report-style-options---subtotals).
6. The **Sort Key Header Option**. Select from the options:  
- **Print on New Page** - the sort key headings, for each sort key break, are printed on a new page along with page headers and footers.  
- **Print on Same Page** -  the sort key headings are printed for each sort key break.  
- **Suppress Print**  - no sort key headings printed.  
7. Select **Suppress Print** for the **Sort Key Footer Option**. This indicates no subtotal to be displayed at the sort key break (change in sort key value). 

![Define report with categories.](../../images/CreateReportCat1.png)

### Report with columns and categories

Report styles can be mixed, for example Sort Key 1 can be defined with category headings displayed, and sort key 2 can be defined "As Data" in columns.

![Mixed report sample output.](../../images/ReportScreenshot1.png)

### Report with Subtotals

You can opt to print subtotals for numeric columns, at each sort break (change in sort key value). You can choose to define this for one or many of the defined sort keys. For example, you may want to print the subtotals for the primary sort key, but not a secondary sort key.  

The value to be placed in this subtotal field is determined by the group aggregation functions, for the numeric columns. 

1. Select the **View Editor** tab. 
2. Open the **Sort Key Properties** frame by clicking on the yellow **Sort Keys** cell in the column grid.
3. Select **Print** for the **Sort Key Footer Option**. This indicates subtotals are to be displayed for numeric fields, at the break (change in sort key value) for this sort key.
4. The subtotals will be prefaced with the value in the **Sort Key Footer Label** field. The default is "Subtotal," but this can be edited.

The value to be placed in the subtotal field is determined by the group aggregation function, for the numeric column.  You can specify the type of aggregation for each numeric column: Group Calculation, Maximum, Minimum, Sum (default).

To specify the type of subtotaling, click in the **Group Aggregation Function** cell for the column, and select the function from the drop-down list.

- **Maximum** returns the maximum column value for each unique sort key value.  
- **Minimum** returns the minimum column value for each unique sort key value.  
- **Sum** returns the sum of the column values for each unique sort key value. Any Format-Phase Column Logic is performed before aggregation i.e. on every extract record.  
- **Group Calculation**

Note that the cell will be grey, and can not be selected, if the column is data type Alphanumeric, the column is a sort key, or there is no format phase defined.
