
# How do I use ENDS_WITH?

Tha ENDS_WITH keyword is used as a string comparison operator. You can check a string ends with certain characters.

For example, a field with "LONDON" ends with the string "N" and "ON" and even "LONDON".

ENDS_WITH is an example of string comparisons that return a true or false value that can be part of an IF statement.

ENDS_WITH can only be used at extract-phase time in **Extract Record Filter** or **Extract Column Logic** text.

The first value in the ENDS_WITH compare statement can be a source file field, lookup field, column reference or PRIOR field.
The second value in the ENDS_WITH compare statement must be a constant.

The syntax details of ENDS_WITH are shown below.
