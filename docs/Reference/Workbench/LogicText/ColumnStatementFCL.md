{: .no_toc}
## COLUMN & COL.nnn statements <br>(Format-Phase Column Logic)

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/DescriptionCOLUMNCOLnnnFCL.md %} 

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %} 

## Syntax for COLUMN in FCL

{% include_relative SyntaxDiagrams/CMSyntaxDiagCOLUMNCOLnnnFCLLevel3.md %} 

**Rules for the syntax**

You can only set the value of the current column using the COLUMN statement.

COL.nnn can only appear in an **inquiry** \(for example "IF \(COL.nnn = ? " \). The nnn must be a column number between 1 and the current column \(inclusive\).

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 


{% include_relative Examples/CMExampleCOLUMNCOLnnnFCL.md %} 
