---
layout: default
title: "Function PRIOR"
parent: Functions
grand_parent: Workbench Logic Text Full Details
nav_order: 19
---
# Function PRIOR
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  


# How do I use PRIOR? 

PRIOR means the previous input record. For any input record, you can compare the current value of a field with the value in the previous record.
  
PRIOR is typed before the name of the field, for example:
  
<pre><b>     PRIOR {product_code}   </b></pre>
  
If you type
  
<pre><b>     {product_code}   </b></pre>
  
then this means the value in the current record.
  
If you use PRIOR, it is recommended you put CURRENT in front of all fields that refer to the current input record. As mentioned, this is not necessary - it is recommended because it makes the logic text much easier to understand. For example:  
<pre><b>     IF ((CURRENT {product_code} = PRIOR {product_code}) THEN   </b></pre>
  
Notice how CURRENT makes the meaning very clear, even though if you omit the word CURRENT then the logic text works the same way. Normally, CURRENT is used only when a statement contains PRIOR.
  
CURRENT and PRIOR can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment (ECA)** logic text.
  

![(Syntax Legend)](../../images/LTZZ_Syntax_legend.gif )

# Syntax 

![Function PRIOR](../../images/LTS_CURRENT_PRIOR_01.gif)

# Rules for the syntax 

PRIOR can only be used in **Extract Record Filter (ERF)** and **Extract Column Assignment(ECA)** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 


# Examples: PRIOR function in Extract Record Filter 

|Example logic text|Meaning|
|------------------|-------|
|**IF (CURRENT({field1}) <> PRIOR({field1}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records with unique values for field1.<br>This assumes the input file is sorted into field1 order.<br>This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(CURRENT({field1}) <> PRIOR({field1}))**|



# Examples: PRIOR function in Extract Column Assignment 

|Example logic text|Meaning|
|------------------|-------|
|**IF (CURRENT({field2}) <> PRIOR({field2}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN COLUMN = "PRODUCT: "<br>&nbsp;&nbsp;&nbsp;&nbsp;    ELSE COLUMN = " "<br>ENDIF**|If the current record has a different value of field2 from<br>the previous record, set the current column to "PRODUCT: "<br>otherwise set the current column to blank.<br>This assumes the input file is sorted into field2 order.|
  

  
  (Examples can be copied to the clipboard.)
  

