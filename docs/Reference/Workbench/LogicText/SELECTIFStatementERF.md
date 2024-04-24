{: .no_toc}
# SELECT and SELECTIF in Extract-Phase Record Filters

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


{% include_relative Descriptions/Description-SELECTIF-ERF.md %}

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

## Syntax 

{% include_relative SyntaxDiagrams/CMSyntax-Diag-SELECTIF-ERF-Level-3.md %}

## Rules for the syntax

Extract Record Filter can have one SELECTIF statement or one IF statement that contains one or more SELECT statements. When one SELECTIF or SELECT is present, then no SKIP or SKIPIF statements are allowed.  

One IF statement can have a SELECT for the THEN or ELSE case. One IF statement can have other IF statements nested inside, which may also have SELECT statements inside. All this counts as one IF statement.

The best way to learn is the examples below. See also the examples in [**IF Statements in Extract Record Filter**](../LogicText/IFstatementsERF.md).

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-SELECTIF-ERF.md %} 

