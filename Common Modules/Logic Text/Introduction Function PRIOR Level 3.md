
# How do I use PRIOR? 

PRIOR means the previous input record. For any input record, you can compare the current value of a field with the value in the previous record.
  
PRIOR is typed before the name of the field, for example:
  
> PRIOR {product_code}
  
If you type
  
> {product_code}
  
then this means the value in the current record.
  
If you use PRIOR, it is recommended you put CURRENT in front of all fields that refer to the current input record. As mentioned, this is not necessary - it is recommended because it makes the logic text much easier to understand. For example:  
> IF ((CURRENT {product_code} = PRIOR {product_code}) THEN
  
Notice how CURRENT makes the meaning very clear, even though if you omit the word CURRENT then the logic text works the same way. Normally, CURRENT is used only when a statement contains PRIOR.
  
CURRENT and PRIOR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.
  
[[INCLUDE: Logic Text\AA Syntax Legend Level 3 ]]

# Syntax 

[[INCLUDE: Logic Text\Syntax Function PRIOR Level 3 ]]

# Rules for the syntax 

PRIOR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic: [Rules for all Logic Text](../Rules for all Logic Text) 

# Examples: PRIOR function in Extract Record Filter 

[[ INCLUDE: Logic Text\Example Function PRIOR ERF ]]

# Examples: PRIOR function in Extract Column Assignment 

[[ INCLUDE: Logic Text\Example Function PRIOR ECA ]]

