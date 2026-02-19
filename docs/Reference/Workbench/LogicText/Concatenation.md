{: .no_toc}
#  Concatenation String Operator **&**

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  

{% include_relative Descriptions/Description-String-concatenation.md %}

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

# Syntax 

<pre>
<i>                             ┌──────────────────────────┐</i>   
<i>                             ▼                          │</i>   
<i>    ►►──┬─Field Reference──┬─── & ──┬─Field Reference───┼──────────────────►◄</i>
<i>        └─String───────────┘        └─String────────────┘</i>   
</pre>


{% include_relative SyntaxDiagrams/CMSyntax-Diag-Concatenate.md %}

# Rules for the syntax

Multiple fields and constants can be concatenated. The total length of the concatenated fields should not be greater than the column length.  

The concatenation function **&** can be used in assignments.  

The concatenation function **&** can not be used in comparisons.

**&** can only be used in **Extract Column Logic** text.

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-Concatenation.md %} 

