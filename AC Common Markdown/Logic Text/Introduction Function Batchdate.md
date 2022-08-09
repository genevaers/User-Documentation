# Syntax: function BATCHDATE 

# How do I use BATCHDATE? 

The BATCHDATE returns a date in CCYYMMDD format that is when the view is run. The group of views all running in the same batch in the Performance Engine all use the same BATCHDATE.

The parameter for BATCHDATE is a number of days to add or delete from the default BATCHDATE. For example, BATCHDATE\(-5\) provides the day five days before the date the view is run.

BATCHDATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

{{ Logic Text\AA Syntax Legend }}

# Syntax 

{{ Logic Text\Syntax Function BATCHDATE }}

# Rules for the syntax 

BATCHDATE can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](Rules for all Logic Text) 

# Examples: BATCHDATE function in Extract Record Filter

{{ Logic Text\Example Function BATCHDATE ERF }}

# Examples: BATCHDATE function in Extract Column Assignment

{{ Logic Text\Example Function BATCHDATE ECA }}

