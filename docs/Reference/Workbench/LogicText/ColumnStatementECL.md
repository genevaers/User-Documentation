{: .no_toc}
# COLUMN & COL.nnn statements <br>(Extract-Phase Column Logic)

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/DescriptionCOLUMNCOLnnnECL.md %} 

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %} 

## Syntax 

{% include_relative SyntaxDiagrams/CMSyntaxDiagCOLUMNCOLnnnECLLevel3.md %} 

**Rules for the syntax**

You can set the value of previous columns in the view using the COL.nnn statement. This statement can be placed in the Extract Column Logic text for any column. This means that any column can set the value of any other column of a lower column number.  

You can only set the value of the current column using the COLUMN statement.

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExampleCOLUMNCOLnnnECL.md %} 
