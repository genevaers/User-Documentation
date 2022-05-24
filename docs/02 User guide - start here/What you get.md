---
layout: default
title: "What you get"
parent: 02 User guide - start here
nav_order: 3
---

# What you get (in this product)
{: .no_toc}
TABLE OF CONTENTS 
1. TOC\
{:toc}  

# Workbench
The workbench is where you describe what processing you require.  This goes down to the level of individual fields in files and specific calculations using those fields.

# Main programs to produce the results
Our product updates files and create reports saving an enormous amount of run time as given in [What is GenevaERS?](What is GenevaERS).  
The most important program is called the Performance Engine, and it is actually two programs out of four that together produce the actual results.  The four main programs are:  
1.  **MR91  (Control File Generator)**
This program takes the output from the workbench and creates the files needed by the Performance Engine.  
To run this program, see [Runbook MR91](../52 PE Programs/A Runbook MR91 Control File Generator).  
  
1.  **MR95R  (Performance Engine - Reference Data)**
This program sets up references to another file (e.g. using a customer key to access customer details).  
To run this program, see [Runbook MR95R](../52 PE Programs/B Runbook MR95R Reference Data).  
  
1.  **MR95E  (Performance Engine - Extract Data)**
This program does most of the high speed processing by extracting data from the inputs and providing the outputs.  
To run this program, see [Runbook MR95E](../52 PE Programs/C Runbook MR95E Extract Data).  
  
1.  **MR88   (Format Data)**
This **optional** program formats output data for complex reporting situations.  
To run this program, see [Runbook MR88](../52 PE Programs/D Runbook MR88 Format Data).  
  


# User Exits
These programs are for advanced users of this product and allows extensions to normal orocessing.  For example, normally this product does not calculate exponential mathematical values - the user-exit GVBXLEXP will do these calculations if requested.  
To learn more about User-Exits, see [53 User-Exists](../53 User-Exits).  

# Sub-Programs
These programs are for advanced users of this product who wanto to write their own programs that work with our product.  The sub-programs are callable services that provide some useful standard functions such as date conversion.  
See also:  [54 PE Sub-Programs](../54 PE Sub-Programs)  


# General Utilties
These programs provide extra benefits when running the Performance Engine.  
Once example is printing the Logic Table which shows the fine details of that particular solution.  Understanding the Logic Table allows you to turbocharge our product for even faster performance.  
For more details see: [55 General Utilities](../55 General Utilities)  

# Useful Links
Link back to [First steps](First steps)  

