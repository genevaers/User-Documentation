# Syntax: COLUMN and COL.nnn statements {#WERLTSColumnCol0 .reference}

## Introduction { .section}

**COLUMN** is always a statement where you set the value of the current column. A COLUMN statement is only allowed in **Extract Column Assignment** and **Format Column Calculations.**

**COL.nnn** refers to a column value where nnn is the number of that column in that view \(starting at one on the leftmost column\).

You can **set the value** column in the view using a COL.nnn statement in **Extract Column Assignment**. This is the only logic text where COL.nnn is a statement.

COL.nnn can only appear in an **inquiry** \(for example "IF \(COL.nnn = ? " \) in the format phase. In **Format Column Calculations**, the nnn must be a column number between 1 and the current column \(inclusive\). In **Format Record Filter**, nnn can be any column in the view.

-   **[Syntax: COLUMN and COL.nnn in Extract Column Assignment](../html/WERLTSColumnCol2ECA.md)**  

-   **[Syntax: COLUMN and COL.nnn in Format Column Calculations](../html/WERLTSColumnCol3FCC.md)**  

-   **[Syntax: COL.nnn in Format Record Filter](../html/WERLTSColumnCol4FRF.md)**  


**Parent topic:**[Logic text: syntax](../html/WERLTSAAASyntax.md)

