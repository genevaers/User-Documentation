
# How do I use CURRENT? 

The function CURRENT may be used when using the function PRIOR. It refers to the current source record, whereas PRIOR refers to the previous record read. For any input record, you can compare the current value of a field with the value in the previous record.
  
CURRENT may be typed before the name of the field, for example:
  
<pre><b>     CURRENT {product_code}   </b></pre>
  
This is the same as:
  
<pre><b>     {product_code}   </b></pre>
  
If you use PRIOR, it is recommended you put CURRENT in front of all fields that refer to the current input record. This is not necessary but recommended because it makes the logic text much easier to understand. For example:  
<pre><b>     IF ((CURRENT {product_code} = PRIOR {product_code}) THEN   </b></pre>
  
Normally, CURRENT is used only when a statement contains PRIOR.
  
CURRENT and PRIOR can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.
  
