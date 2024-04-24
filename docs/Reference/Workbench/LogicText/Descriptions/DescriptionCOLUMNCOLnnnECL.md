
## How do I use COLUMN & COL.nnn statements in ECL? 

The **COLUMN** statement sets the value of the current column. A **COLUMN** statement is allowed in Extract Column Logic.

**COL.nnn** refers to a column value where **nnn** is the number of that column in the current view (starting at one on the leftmost column).

You can set the value of a column in the view using a COL.nnn statement in **Extract Column Logic**. This is the only logic text where COL.nnn is a statement. You can also use COL.nnn in a query, for example "IF (COL.nnn = ? " ). 