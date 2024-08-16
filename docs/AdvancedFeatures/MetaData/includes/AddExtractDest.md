### Output destinations

The default output destination for Extract-Phase only Views is the DD **F*****nnnnnnn*** where ***nnnnnnn*** is the view ID. For example, if the view ID is **12183** the default DD name for Extract-Phase only Views is **F0012183**.

You can specify your own output destination. To do this:

1. Left click on the View Sources blue cell you added earlier. This opens the **View Source Properties** tab in the Metadata List Area.
2. From the **Extract-Phase Output** > **Logical File** list select the LF you want to write to.
3. From the **Extract-Phase Output** > **Physical File** list select the PF you want to write to.
4. Save the view **File** > **Save**

You will see that the WRITE statement in the **Record Logic** field has changed.

You can also replace the WRITE statement with Extract Record Logic. For example you may want to have logic that directs some output to one file and the rest to another file, depending on some condition. See [Extract-Phase Record Logic](../../Reference/Workbench/LogicTextERLStatements.html) for more details.