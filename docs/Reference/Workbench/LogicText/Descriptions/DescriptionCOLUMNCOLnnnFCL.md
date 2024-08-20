
## How do I use COLUMN & COL.nnn statements in FCL? 

The **COLUMN** statement sets the value of the current column. A COLUMN statement is allowed in **Format-Phase Column Logic**.

**COL.nnn** refers to a column value where nnn is the number of that column in the current view \(starting at one on the leftmost column\).

In the **format phase**,  COL.nnn can only appear in an inquiry, for example "IF (COL.nnn = ? " ). In Format-Phase Column Logic, the nnn must be the column number of a numeric column (aggregatable column), between 1 and the current column (inclusive).
