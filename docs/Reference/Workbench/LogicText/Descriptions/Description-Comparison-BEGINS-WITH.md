
# How do I use BEGINS_WITH?

Tha BEGINS_WITH keyword is used as a string comparison operator. You can check a string begins with certain characters.

For example, a field with "LONDON" begins with the string "L" and "LO" and even "LONDON".

BEGINS_WITH is an example of string comparisons that return a true or false value that can be part of an IF statement.

BEGINS_WITH can only be used at extract-phase time in **Extract Record Filter** or **Extract Column Logic** text.

The first value in the BEGINS_WITH compare statement can be a source file field, lookup field, column reference or PRIOR field.
The second value in the BEGINS_WITH compare statement must be a constant.

The syntax details of BEGINS_WITH are shown below.
