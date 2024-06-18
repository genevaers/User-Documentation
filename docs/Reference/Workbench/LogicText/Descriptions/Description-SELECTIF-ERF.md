
## How do I use SELECT and SELECTIF in ERF?
 
In this logic text, SELECT or SELECTIF define the input records to be included in the extract phase.

If there are **no SELECT, SELECTIF, SKIP or SKIPIF statements** in Extract Record Filter, then **all input records** are selected.

The idea is that you either SELECT or SKIP but you cannot do both in the same logic text. Once you have selected records then all others are skipped. Alternatively, once you skip records then all others are selected.

SELECTIF defines the input records to select based on a condition.

SELECT must always be inside an IF statement, in a THEN or ELSE case. The path through the IF statement decides which records reach the SELECT statement.

Extract Record Filter can have **one SELECTIF** or **one IF that contains one or more SELECT statements**. Once either of these is present, no SKIP or SKIPIF statements are allowed.

The syntax details of a SELECT and SELECTIF statements in **Extract Record Filter** are shown below.
