---
layout: default
title: "Examples - Functions (ERF)"
parent: Examples - Extract Record Filter (ERF)
grand_parent: Workbench Logic Text Examples
nav_order: 3
---

# Examples - Functions (ERF)
{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  
 


# Examples: ALL function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF NOT ({field1} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output those records with field1 is not equal<br> to all dashes. Skip all other records. This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} = ALL("-"))**|
|**IF ({field2} = ALL("-"))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with field2 is equal to all dashes.<br> Select all other records. This example gives the same result as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field2} = ALL("-"))**|



# Examples: BATCHDATE function in ERF

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} < BATCHDATE(-7))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip any input records where field1 is more than 7 days before the<br>date of running this view. Select all other records.<br> This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} < BATCHDATE(-7))**|



# Examples: DATE function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF {field1} = DATE("20111201",CCYYMMDD)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select those input records where<br>field1 is December 1, 2011.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field1}= DATE("20111201",CCYYMMDD))**|



# Examples: DAYSBETWEEN function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (DAYSBETWEEN({field1},{field2}) > 7)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<BR>ENDIF**|Select only records where<BR>there are more than 7 days<BR>between field1 and field2, <BR>and skip all other records. <BR>This example can also be written:<BR>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(DAYSBETWEEN({field1},{field2}) > 7)**|


# Examples: DAYSBETWEEN function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (DAYSBETWEEN({field1},{field2}) > 7)<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<BR>ENDIF**|Select only records where<BR>there are more than 7 days<BR>between field1 and field2, <BR>and skip all other records. <BR>This example can also be written:<BR>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(DAYSBETWEEN({field1},{field2}) > 7)**|


# Examples: FISCALDAY function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} < FISCALDAY(-7))<BR>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<BR>ENDIF**|Skip any input records where field1 is more than 7 fiscal days before<BR>the date of running this view, and select all other records.<BR>Fiscal days means that if the date of running this view is fiscal day five<BR>of a fiscal year, then only records from fiscal days one to five<BR> are selected. This example assumes that field1 is a fiscal day number.<BR>The code at left can also be written as<BR>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} < FISCALDAY(-7))**|


# Examples: FISCALMONTH function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= FISCALMONTH(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous fiscal month or later,<br>and skip all other records. Fiscal months means that if the date of<br>running this view is fiscal month one, then only records from<br>fiscal month one are selected.<br>The example at left assumes that field2 is a fiscal month number.<br>The code at left can also be written as:<br>**SELECTIF({field2} >= FISCALMONTH(-1))**|


# Examples: FISCALQUARTER function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= FISCALQUARTER(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous fiscal quarter<br>or later,and skip all other records. Fiscal quarter means that if<br>the date of running this view is fiscal quarter one, then<br>only records from fiscal quarter one are selected.<br>The example at left assumes that field2 is a fiscal quarter number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field2} >= FISCALQUARTER(-1))**|


# Examples: FISCALYEAR function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = FISCALYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous fiscal year<br>and skip all other records.<br>The example at left assumes that field4 is a fiscal year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} >= FISCALYEAR(-1))**|



# Examples: ISFOUND function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISFOUND({Lookup2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where lookup path Lookup2 successfully<br>finds a target record, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISFOUND({Lookup2}))**|



# Examples: ISNOTFOUND function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTFOUND({Lookup3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where lookup path Lookup3 does not successfully<br>find a target record, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNOTFOUND({Lookup3}))**|



# Examples: ISNOTNULL function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNULL({field3})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field3 does not contain null values,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTNULL({field3}))**|
|**IF ISNOTNULL({Lookup1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where the lookup field for lookup path Lookup1<br>does not contain null values, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTNULL({Lookup1}))**|



# Examples: ISNOTNUMERIC function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTNUMERIC({field7})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field7 is not numeric, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNOTNUMERIC({field7}))**|



# Examples: ISNOTSPACES function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNOTSPACES({field2})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field2 is not spaces, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNOTSPACES({field2}))**|



# Examples: ISNULL function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNULL({field1})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field1 contains null values,<br>and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISNULL({field1}))**|



# Examples: ISNUMERIC function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISNUMERIC({field5})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select all input records where field5 is numeric, and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(ISNUMERIC({field5}))**|



# Examples: ISSPACES function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ISSPACES({field9})<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip all input records where field9 is spaces, and select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF(ISSPACES({field9}))**|


# Examples: MONTHSBETWEEN function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (MONTHSBETWEEN({field1},{field2}) >= 3)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where there are at least 3 months between field1 and field2,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(MONTHSBETWEEN({field1},{field2}) >= 3)**|



# Examples: PRIOR function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF (CURRENT({field1}) <> PRIOR({field1}))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records with unique values for field1.<br>This assumes the input file is sorted into field1 order.<br>This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(CURRENT({field1}) <> PRIOR({field1}))**|



# Examples: Q1, Q2, Q3 and Q4 function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} = Q1())<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where field1 is a date in Q1 of the current year,<br>and skip all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field1} = Q1())**|



# Examples: REPEAT function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF NOT ({field7} = REPEAT("-", 13))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select for output those records with field7 is not equal<br>to 13 dashes. This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field7} = REPEAT("-", 13))**|
|**IF ({field8} = REPEAT("-", 13))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip for output those records with field8 is equal<br>to 13 dashes. Select all other records.<br>This example is the same as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field8} = REPEAT("-", 13))**|



# Examples: RUNDAY function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field1} < RUNDAY(-7))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SKIP<br>ENDIF**|Skip any input records where field1 is more than 7 days before the<br>date of running this view, and select all other records.<br>This example assumes that field1 is a date.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SKIPIF({field1} < RUNDAY(-7))**|



# Examples: RUNMONTH function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field2} >= RUNMONTH(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field2 is the previous month or later,<br>and skip all other records.<br>The example at left assumes that field2 is a month number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field2} >= RUNMONTH(-1))**|



# Examples: RUNPERIOD function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field3} >= RUNPERIOD(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field3 is the previous period or later,<br>and skip all other records.<br>The example at left assumes that field3 is a period number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field3} >= RUNPERIOD(-1))**|



# Examples: RUNPERIOD function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field3} >= RUNPERIOD(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field3 is the previous period or later,<br>and skip all other records.<br>The example at left assumes that field3 is a period number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field3} >= RUNPERIOD(-1))**|



# Examples: RUNYEAR function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = RUNYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous year,<br>and skip all other records.<br>The example at left assumes that field4 is a year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} = RUNYEAR(-1))**|



# Examples: YEARSBETWEEN function in ERF 

|Example logic text|Meaning|
|------------------|-------|
|**IF ({field4} = RUNYEAR(-1))<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select any input records where field4 is the previous year,<br>and skip all other records.<br>The example at left assumes that field4 is a year number.<br>The code at left can also be written as:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF({field4} = RUNYEAR(-1))**|
|**IF (YEARSBETWEEN({field1},{field2}) >= 1)<br>&nbsp;&nbsp;&nbsp;&nbsp;THEN SELECT<br>ENDIF**|Select only records where there is at least one year<br>between field1 and field2, and skip all other records.<br>This example can also be written:<br>&nbsp;&nbsp;&nbsp;&nbsp;**SELECTIF(YEARSBETWEEN({field1},{field2}) >= 1)**|


