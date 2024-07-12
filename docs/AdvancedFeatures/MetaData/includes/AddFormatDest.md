### Output destinations

Summary views have two phases. The extract phase writes to an extract file **EXTRnnn** where **nnn** is the **File Number**.  

This is defined on the **View Properties** screen > **Extract Phase** sub-tab > **File Number**.  
  
The default File Number is 0, so the default file name is EXTR000. If you are planning to create many summary views to run in the same pass, you may require the extract phase to write to different extract work files.  If you change the File Number you will see that the WRITE statement changes in the Extract-Phase Record Logic **View Source Properites** > **Record Logic**.

The default output destination for the format phase is the DD **F*****nnnnnnn*** where ***nnnnnnn*** is the view ID. For example, if the view ID is **12188** the default output file for the view is **F0012188**.

You can specify your own format phase output destination.

1. Select the **View Properties** sub-tab **Format Phase**. 
2. From **Output File** > **Logical File** list select the LF you want to write to.
3. From **Output File** > **Physical File** list select the PF you want to write to.
4. Save the view **File** > **Save**
