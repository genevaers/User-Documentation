{: .no_toc}
# Function ISNOTFOUND 

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/Description-Function-ISNOTFOUND.md %}

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

# Syntax 

{% include_relative SyntaxDiagrams/CMSyntax-Diag-Function-ISNOTFOUND-Level-3.md %}

# Rules for the syntax

ISNOTFOUND can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.

If **no effective date** is specified, ISNOTFOUND uses RUNDAY\( \) - see [function RUNDAY](./Function-RUNDAY.md)

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-Function-ISNOTFOUND-ERF.md %} 

{% include_relative Examples/CMExample-Function-ISNOTFOUND-ECL.md %} 
