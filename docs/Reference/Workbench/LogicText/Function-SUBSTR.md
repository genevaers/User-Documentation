{: .no_toc}
# Function SUBSTR 

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/Description-Function-SUBSTR.md %}

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

# Syntax 

<pre><b>
<i>    ►►─SUBSTR(─┬─&lt;Field Reference&gt;──┬─,─&lt;Position&gt;─,─&lt;Length&gt;─)───────►◄</i>
<i>               └─&lt;String&gt;───────────┘ </i>   
</b></pre>

{% include_relative SyntaxDiagrams/CMSyntax-Diag-Function-SUBSTR.md %}

# Rules for the syntax

The position and length are integers. They must reference bytes within the field or string referenced.

SUBSTR can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-Function-SUBSTR-ERF.md %} 

{% include_relative Examples/CMExample-Function-SUBSTR-ECL.md %} 
