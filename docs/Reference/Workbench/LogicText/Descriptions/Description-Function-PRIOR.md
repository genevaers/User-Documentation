
# How do I use PRIOR? 

PRIOR means the previous input record. For any input record, you can compare the current value of a field with the value in the previous record.
  
PRIOR is typed before the name of the field, for example:
  
<pre><b>     PRIOR {product_code}   </b></pre>
  
If you type
  
<pre><b>     {product_code}   </b></pre>
  
then this means the value in the current record.
  
If you use PRIOR, it is recommended you put CURRENT in front of all fields that refer to the current input record. As mentioned, this is not necessary - it is recommended because it makes the logic text much easier to understand. For example:  
<pre><b>     IF ((CURRENT {product_code} = PRIOR {product_code}) THEN   </b></pre>
  
Notice how CURRENT makes the meaning very clear, even though if you omit the word CURRENT then the logic text works the same way. Normally, CURRENT is used only when a statement contains PRIOR.
  
CURRENT and PRIOR can only be used in **Extract Record Filter (ERF)** and **Extract Column Logic (ECL)** text.
  
