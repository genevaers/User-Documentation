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
 
[[ INCLUDE: Logic Text\Descriptions\Description COLUMN & COL.nnn FCC ]]

[[ INCLUDE: Logic Text\Syntax Diagrams\CMAA How the syntax works Level 3 ]]

# Syntax for COLUMN in FCC

[[ INCLUDE: Logic Text\Syntax Diagrams\CMSyntax Diag COLUMN & COL.nnn FCC Level 3 ]]

# Rules for the syntax 

-   You can only set the value of the current column using the COLUMN statement.
-   COL.nnn can only appear in an **inquiry** \(for example "IF \(COL.nnn = ? " \). The nnn must be a column number between 1 and the current column \(inclusive\).

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

[[ INCLUDE: Logic Text\Examples\CMExample COLUMN & COL.nnn FCC ]]

[[ INCLUDE: Logic Text\Examples and Clipboard ]]




