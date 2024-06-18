
## How do I use SKIP and SKIPIF in ERF?
 
In this logic text, SKIP or SKIPIF define the input records to be excluded in the extract phase.

If there are **no SELECT, SELECTIF, SKIP or SKIPIF statements** in Extract Record Filter, then **all input records** are selected.

The idea is that you either SELECT or SKIP but you cannot do both in the same logic text. Once you have selected records then all others are skipped. Alternatively, once you skip records then all others are selected.

SKIPIF defines the input records to skip based on a condition.

SKIP must always be inside an IF statement, in a THEN or ELSE case. The path through the IF statement decides which records reach the SKIP statement.

Extract Record Filter can have **one SKIPIF** or **one IF that contains one or more SKIP statements**. Once either of these is present, no SELECT or SELECTIF statements are allowed.

The syntax details of a SKIP and SKIPIF statements in **Extract Record Filter** are shown below.
