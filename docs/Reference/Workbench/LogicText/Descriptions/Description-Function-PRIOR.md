
# How do I use PRIOR? 

The PRIOR function refers to the previous source record. For any source record, you can compare the current value of a field with the value in the previous record.
  
PRIOR is used by specifying the name of the field, for example:
  
<pre><b>     PRIOR( {product_code} ) </b></pre>
  
If you type
  
<pre><b>     {product_code}   </b></pre>
  
then this means the value in the current record.
  
If you use PRIOR, it is recommended you use the CURRENT function for fields that refer to the current source record. As mentioned, this is not necessary - it is recommended because it makes the logic text much easier to understand. For example:  
<pre><b>     IF (CURRENT({product_code}) = PRIOR({product_code})) THEN   </b></pre>
  
Notice how CURRENT makes the meaning very clear, even though if you omit the word CURRENT then the logic text works the same way. Normally, CURRENT is used only when a statement contains PRIOR.
  
CURRENT and PRIOR can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.
