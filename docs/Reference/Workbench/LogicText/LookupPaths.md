{: .no_toc}
# Lookup Paths

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  

# How to use lookup paths

A lookup path is a method to use one logical file to lookup a record in another logical file. For an introduction, see topic **Lookup paths overview**.

In logic text, lookup paths are only used in the extract phase, where you can use lookup paths to provide values for columns in view data. You can also use the ISFOUND and ISNOTFOUND functions to check if the lookup path is successful in each particular case.

Lookup paths are used in the format phase only in the Sort Key Title field, which is part of the definition of a sort column in a view. There is no logic text syntax for lookup paths in the format phase.

{% include_relative SyntaxDiagrams/CMAAHowthesyntaxworksLevel3.md %}

# Syntax 

{% include_relative SyntaxDiagrams/CMSyntax-Diag-Lookups-Level-3.md %}

# Rules for the syntax

Lookups can only be used in **Extract Record Filter** or **Extract Column Logic** text.

See also topic: [Rules for all Logic Text](../../Workbench/RulesforallLogicText.md) 

{% include_relative Examples/CMExample-Lookup-ECL.md %} 

{% include_relative Examples/CMExample-Lookup-ERF.md %} 