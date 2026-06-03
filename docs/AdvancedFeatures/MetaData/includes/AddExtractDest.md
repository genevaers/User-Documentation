### Output destinations

The default output destination for Extract-Phase only Views is the ddname **F*****nnnnnnn*** where ***nnnnnnn*** is the view ID. For example, if the view ID is **12183** the default ddname for Extract-Phase only Views is **F0012183**.

You can specify your own output destination. To do this:

1. Left click on the View Sources blue cell you added earlier. This opens the **View Source Properties** tab in the Metadata List Area.
2. From the **Extract-Phase Output** > **Logical File** list select the LF you want to write to.
3. From the **Extract-Phase Output** > **Physical File** list select the PF you want to write to.
4. Save the view **File** > **Save**

You will see that the WRITE statement in the **Record Logic** field has changed.

#### User Exits
You can specify that each output record is passed to a Write User-Exit. To do this:

1. Left click on the View Sources blue cell. This opens the **View Source Properties** tab in the Metadata List Area.
2. From the **Extract-Phase Output** > **Write User-Exit Routine Name** list select the User-Exit you want to be called.
3. In the field **Extract-Phase Output** > **Parameters** You can specify up to 32 characters to be passed to the User-Exit.
4. Save the view **File** > **Save**

You will see that the WRITE statement in the **Record Logic** field has changed.  
Note that after the Write User-Exit had processes the output record it has a choice of passing it back to GenevaERS to write to the specified output destination, or not. See [User exits]() for more detail.

#### Extract Record Logic
You can also replace the WRITE statement with **Extract Record Logic**. 
1. Tick the **Override default Record Logic?** box.
2. To create and edit the Extract Record Logic click in the **Record Logic** field displaying the default WRITE statement, then click the icon on the right side ![three dot icon](../../../images/Icon_Three_Dots_01.gif).  
This opens the **Extract-Phase Record Logic** tab, which enables you to add conditional logic and WRITE statements. For example you may want to have logic that directs some output to one file and the rest to another file, depending on some condition.  
3. Save the view **File** > **Save**

See [Extract-Phase Record Logic](../../Reference/Workbench/LogicTextERLStatements.html) for more details.