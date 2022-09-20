---
layout: default
title: "Stage3 - Design batch flows"
parent: Use this product in your company
nav_order: 3
---

# Stage3 - Design batch flows
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# Choose a Basic Solution 
Choose the best fit End-to-End example to guide you to create a batch flow:  
[Basic solutions](../Basic solutions)

# Specify a view for each output file
What are the output files?  Each output file can have a view to create it.
Multiple views can have the same input using various techniques, so start with the output requirements.

# Specify output files and fields and access or calculations required
The fields in the output files may simply be sourced from an input file.  For example, a customer key may access the customer state (address), so the output field state is accessed from the customer file.
Other output fields are calculated, such as accumul

# Identify input files and fields required for each view
Once you know the requirements for the output fields, you can work out what input files and what input fields are required.
For example, the sales file must provide the customere key so that the state (address) can be accessed.  This requires the customer file and use of the customer key field and the state field.
In other cases, the output total sales field is accumulated from the sales value of each sales item, so the calculation is a simple accumulation.

# Useful Links
Next topic: [Stage4 - Develop solution in workbench](Stage4 - Develop solution in workbench)  
Previous topic: [Stage2 - Analyze existing systems](Stage2 - Analyze existing systems)  

