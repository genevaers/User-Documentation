---
layout: default
title: "COLUMN & COL.nnn statements (FCC)"
nav_order: 2
parent: COLUMN & COL.nnn statements
grand_parent: Workbench Logic Text Full Details

---
# COLUMN & COL.nnn statements (FCC)
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  
 

# How do I use COLUMN & COL.nnn statements in FCC? 

**COLUMN** is always a statement where you set the value of the current column. A COLUMN statement is allowed in **Format Column Calculations**.

**COL.nnn** refers to a column value where nnn is the number of that column in that view \(starting at one on the leftmost column\).

COL.nnn can only appear in an **inquiry** \(for example "IF \(COL.nnn = ? " \) in the format phase. In **Format Column Calculations**, the nnn must be a column number between 1 and the current column \(inclusive\). 


![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax for COLUMN in FCC

![Function COLUMN FCC 1](../../images/LTS_COLUMN_3FCC_01.gif)

# Rules for the syntax 

-   You can only set the value of the current column using the COLUMN statement.
-   COL.nnn can only appear in an **inquiry** \(for example "IF \(COL.nnn = ? " \). The nnn must be a column number between 1 and the current column \(inclusive\).

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: COLUMN (FCC)

|Example logic text|Meaning|
|------------------|-------|
|**COLUMN = Col.3 \* Col.4**|Set current column to column 3 times column 4.<br>The current column must be to the right of Column 4.|
|**COLUMN = "TOTAL"**|Set current column to "TOTAL".|
|**COLUMN = "\xFF"**|Set current column to hexadecimal FF.|

# Examples: IF with COLUMN (FCC)

|Example logic text|Meaning|
|------------------|-------|
|**IF (Col.7 = 999)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "TOTAL"<br>ENDIF**|If column 7 is 999 then set current column to "TOTAL".<br>The current column must be to the right of Column 7.|
|**IF (Col.7 = 999)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = Col.3 \* Col.4<br>ENDIF**|If column 7 is 999 then set current column to column 3 times<br>column 4. The current column must be to the right of Column 7.|
|**IF (Col.4 = "14733")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "\xFF"<br>ENDIF**|If column 4 is "14733" then set current column<br>to hexadecimal FF.<br>The current column must be to the right of Column 4.|

# Examples: IF with COL.nnn (FCC)

|Example logic text|Meaning|
|------------------|-------|
|**IF (Col.7 = "X")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "TOTAL"<br>ENDIF**|If column 7 is "X" then set current column to "TOTAL".<br>The current column must be to the right of Column 7.|
|**IF (Col.4 = "14733")<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = COL.2<br>ENDIF**|If column 4 is "14733" then set the current column to column 2.<br>The current column must be to the right of Column 4.|
|**IF ((Col.4 + Col.5) \* COl.6 > 1000)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "\xFF"<br>ENDIF**|If column 4 and column 5 are added and then<br>multiplied by column 6 and the result is greater<br>than 1000 then set current column to hexadecimal FF.<br>The current column must be to the right of Column 6.|


  
  (Examples can be copied to the clipboard.)
  




