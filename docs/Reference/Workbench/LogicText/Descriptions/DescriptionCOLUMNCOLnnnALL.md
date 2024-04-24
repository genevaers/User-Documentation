
## How do I use COLUMN & COL.nnn statements?

The **COLUMN** statement sets the value of the current column.
A **COLUMN** statement is allowed in Extract Column Logic and Format Column Logic only.

**COL.nnn** refers to a column value where **nnn** is the number of that column in the current view (starting at one on the leftmost column).

In the **extract phase**, you can set the column value in previous columns in the view using a COL.nnn statement. This is done in Extract-Phase Column Logic. This is the only logic text where COL.nnn is a statement.  

In the **format phase**,  COL.nnn can only appear in an inquiry, for example "IF (COL.nnn = ? " ). In Format Column Logic, the nnn must be the column number of a numeric column (aggregatable column), between 1 and the current column (inclusive). In Format Record Filter, nnn can be any aggregatable  column in the view.
