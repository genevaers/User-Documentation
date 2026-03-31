{: .no_toc}
# Function LEFT 

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/Description-Function-LEFT.md %}

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

# Syntax 

<pre><b>
<i>    ►►──LEFT(─┬─&lt;Field Reference&gt;───┬─,─&lt;Length&gt;─)───────────►◄</i>
<i>              ├─&lt;COL.nnn Reference&gt;─┤</i>
<i>              └─&lt;String&gt;────────────┘ </i>   
</b></pre>

{% include_relative SyntaxDiagrams/CMSyntax-Diag-Function-LEFT.md %}

# Rules for the syntax

The length is a positive integer and must be equal or less than the field, column or string length.

LEFT can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.  
If used in an **Extract Record Filter (ERF)**, the Column references COL.nnn can not be used.

LEFT can be used in a comparison but only using the string comparison operators BEGINS_WITH, CONTAINS and ENDS_WITH.

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-Function-LEFT-ERF.md %} 

{% include_relative Examples/CMExample-Function-LEFT-ECL.md %} 
