### Specify column aggregation functions

Aggregation is performed in the format phase, only on non-sort key columns with a numeric data type. You can specify the type of aggregation for each column: Group Calculation, Maximum, Minimum, Sum (default).

To specify the type of subtotaling, double-click in the **Record Aggregation Function** cell for the column, and select the function from the drop-down list.

- **Maximum** returns the maximum column value for each unique sort key value.  
- **Minimum** returns the minimum column value for each unique sort key value.  
- **Sum** returns the sum of the column values for each unique sort key value. Any Format-Phase Column Logic is performed before aggregation i.e. on every extract record.  
- **Group Calculation** returns the sum of the column values for each unique sort key value. Any Format-Phase Column Logic is performed after aggregation i.e. on the summarized record.  

![Defining Record Aggregation Functions](../../images/CreateViewAggrFunc.png)  

Note that the cell will be grey, and can not be selected, if the column is data type Alphanumeric, the column is a sort key, there is no format phase defined, or Format Record Aggregation is not selected for the view.