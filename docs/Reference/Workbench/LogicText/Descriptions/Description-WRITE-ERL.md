## How do I use WRITE Statements in ERL?

The Extract-Phase Record Logic can be used to override the **default WRITE statement** that is generated in the Extract-Phase Record Logic of a view. The default WRITE statement is generated depending on the Default Output Format selected on the View Properties tab.  
See [Default WRITE Statements.](#default-write-statements)  

There must be at least one WRITE statement in either the Extract-Phase Record Logic or the Extract-Phase Column Logic. So if the Extract-Phase Record Logic does not contain a WRITE statement, therefore eliminating the default WRITE, there must be at least one WRITE statement in a Column.

A WRITE statement in your ERL logic text allows the following:

-   Writing records to logical files of your choice.
-   Performing a Procedure or UserExit Routine on input records.
-   Writing multiple output records for each record read.
-   A combination of the above.

Here are some example cases of a WRITE in Extract-Phase Record Logic:

-  Write a full **copy of the selected input record** to a view output file  
\(SOURCE=INPUT, DEST=FILE=LogicalFile\).
-  Write **to a named logical file**. The file must be a view output file  
\(SOURCE=DATA, DEST=FILE=LogicalFile\)
-  Write **to an extract work file** that can be processed in the format phase  
\(SOURCE=VIEW, DEST=EXTRACT\).  
The extract work file number is defined on the Extract Phase tab of the view. The ddname of the extract file is of the form EXTRnnn where nnn is the work file number.
-  Pass output records to a **procedure or user-exit routine**  
(USEREXIT=*User_Exit_name* or PROCEDURE=*Executable_name*).  

Only the EXTRACT files are processed in the format phase. All other records written in the above choices are written to view output files and not processed any further after the extract phase.

These WRITE options provide great flexibility in view processing.

## Default WRITE Statements

For a Format-Phase Output view the default WRITE statement will be: 
    WRITE(SOURCE=VIEW,DEST=EXT=nnn)
where nnn is the extract work file number.

For an Extract-Phase Output view with output columns, the default WRITE statement will be: 
    WRITE(SOURCE=DATA,DEST=DEFAULT)

For an Extract-Phase Output view with source-record layout, the default WRITE statement will be: 
    WRITE(SOURCE=INPUT,DEST=DEFAULT)    
