{: .no_toc}
# Function RUNDAY 

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/Description-Function-RUNDAY.md %}

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

# Syntax 

{% include_relative SyntaxDiagrams/CMSyntax-Diag-Function-RUNDAY-Level-3.md %}

# Rules for the syntax

The parameter for RUNDAY is a number of days to add or delete from the default RUNDAY. For example, RUNDAY\(-5\) provides the day five days before the date the view is run.

RUNDAY can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-Function-RUNDAY-ERF.md %} 

{% include_relative Examples/CMExample-Function-RUNDAY-ECL.md %} 

