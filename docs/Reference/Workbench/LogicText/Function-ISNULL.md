{: .no_toc}
# Function ISNULL 

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/Description-Function-ISNULL.md %}

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

# Syntax 

{% include_relative SyntaxDiagrams/CMSyntax-Diag-Function-ISNULL-Level-3.md %}

# Rules for the syntax

ISNULL can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.

If this functions checks a lookup, and **no effective date** is specified, the lookup uses RUNDAY\( \) - see topic: [Syntax - function RUNDAY](Syntax - function RUNDAY)

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-Function-ISNULL-ERF.md %} 

{% include_relative Examples/CMExample-Function-ISNULL-ECL.md %} 
