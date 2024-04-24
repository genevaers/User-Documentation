
## How do I use SELECTIF in FRF?
 
In this logic text, SELECTIF defines the output records to be written in the format phase, based on a condition. The selection criteria refers to column numbers, not field names.

You can either SELECTIF or SKIPIF but you cannot do both in the same logic text. Once you have selected records then all others are skipped. Alternatively, once you skip records then all others are selected.

If there are **no SELECTIF or SKIPIF statements** in the Format Record Filter, then **all output records** are written.

The syntax details of a SELECTIF statement in **Format Record Filter** are shown below.
