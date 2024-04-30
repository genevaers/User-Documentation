## How do I use WRITE Statements in ERL?

The Extract Record Logic can be used to override the **default WRITE statement** that is generated as the Extract Record Logic of a view.

There must be at least one WRITE statement in either the Extract Record Logic or the Extract Column Logic. So if the Extract Record Logic does not contain a WRITE statment, therefore eliminating the default WRITE, there must be at least one WRITE statment in a Column.

A WRITE statement in your ERL logic text allows the following:

-   Writing records to logical files of your choice.
-   Performing a Procedure or UserExit Routine on input records.
-   Writing mutliple output records for each record read.
-   A combination of the above.

Here are some example cases of a WRITE in Extract Record Logic:

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

The syntax details of a WRITE statement in **Extract Record Logic** are shown below.
