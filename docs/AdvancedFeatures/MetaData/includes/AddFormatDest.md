### Output destinations

Summary views have two phases. The extract phase writes to an extract file **EXTRnnn** where **nnn** is the **File Number**.  

This is defined on the **View Properties** screen > **Extract Phase** sub-tab > **File Number**.  
  
The default File Number is 1, so the default file name is EXTR001. If you are planning to create many summary views to run in the same pass, you may require the extract phase to write to different extract work files.  If you change the File Number you will see that the WRITE statement changes in the Extract-Phase Record Logic **View Source Properites** > **Record Logic**.

The default output destination for the format phase is the DD **F*****nnnnnnn*** where ***nnnnnnn*** is the view ID. For example, if the view ID is **12188** the default output file for the view is **F0012188**.

You can specify your own format phase output destination.

1. Select the **View Properties** sub-tab **Format Phase**. 
2. From **Output File** > **Logical File** list select the LF you want to write to.
3. From **Output File** > **Physical File** list select the PF you want to write to.
4. Save the view **File** > **Save**

#### Write User Exits
At the extract phase you can specify that each extract record is passed to a Write User-Exit. To do this:

1. Select the **View Editor** tab; you can use the toggle button or F9, if required.
2. Left click on the View Sources blue cell. This opens the **View Source Properties** tab in the Metadata List Area.
3. From the **Extract-Phase Output** > **Write User-Exit Routine Name** list select the User-Exit you want to be called.
4. In the field **Extract-Phase Output** > **Parameters** You can specify up to 32 characters to be passed to the User-Exit.
5. Save the view **File** > **Save**

You will see that the WRITE statement in the **Record Logic** field has changed.  
Note that after the Write User-Exit had processes the extract record it has a choice of passing it back to GenevaERS to write to the extract file, or not. See [User exits]() for more detail.

#### Extract Record Logic
You can also replace the WRITE statement with **Extract Record Logic**. 
1. Tick the **Override default Record Logic?** box.
2. To create and edit the Extract Record Logic click in the **Record Logic** field displaying the default WRITE statement, then click the icon on the right side ![three dot icon](../../../images/Icon_Three_Dots_01.gif).  
This opens the **Extract-Phase Record Logic** tab, which enables you to add conditional logic and WRITE statements. For example you may want to have logic that directs some output to one extract file and the rest to another extract file, depending on some condition.  
3. Save the view **File** > **Save**

See [Extract-Phase Record Logic](../../Reference/Workbench/LogicTextERLStatements.html) for more details.