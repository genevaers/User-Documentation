## How do I use WRITE Statements in ECL?

WRITE statements are optional in your Extract-Phase Column Logic text. If there are no WRITE statements in ECL, then there must be a WRITE statement either from the default Extract-Phase Record Logic, or provided in the overriding Extract-Phase Record Logic.

A default WRITE (in Extract-Phase Record Logic) still occurs if you provide WRITE statements in your Extract-Phase Column Logic text.

A WRITE statement in your Extract-Phase Column Logic text allows the following:

-   Writing records to logical files of your choice.
-   Performing a procedure or user-exit routine on input records.
-   Writing only some of the columns.
-   Writing multiple output records for each record read.
-   A combination of the above.

Here are some example cases of a WRITE in Extract-Phase Column Logic:

-   Write a full **copy of the selected input record** to a view output file  
\(SOURCE=INPUT, DEST=FILE=LogicalFile\).
-   Write **all columns up to that point to a named logical file**. The file must be a view output file  
\(SOURCE=DATA, DEST=FILE=LogicalFile\)
-   Write **all columns up to that point to an extract work file** that can be processed in the format phase  
\(SOURCE=VIEW, DEST=EXTRACT=*number*\).  
The default extract work file number is defined on the Extract Phase tab of the view. The ddname of the extract file is of the form EXTRnnn where nnn is the work file number.
-   Pass output records to a **procedure or user-exit routine**  
(USEREXIT=*User_Exit_name* or PROCEDURE=*Executable_name*).

Only the EXTRACT work files are processed in the format phase. All other records written in the above choices are written to view output files and not processed any further after the extract phase.

These WRITE options provide great flexibility in view processing. 

The syntax details of a WRITE statement in **Extract-Phase Column Logic** are shown below.
