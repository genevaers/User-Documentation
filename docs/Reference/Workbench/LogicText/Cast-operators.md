{: .no_toc}
# Cast Operators 

{: .no_toc}
TABLE OF CONTENTS 
1. TOC
{:toc}  

# Description

Cast Operators are used to override the data type of a column, or the data type of an LR field.

The following keywords are valid:

\<ALPHA>  
\<BINARY>  
\<BCD>  
\<EDITED>  
\<MASKED>  
\<NODTF>  
\<PACKED>  
\<SBINARY>  
\<SPACKED>  
\<ZONED>  

They define the data type you wish to change the column or LR field to.

The \<NODTF> cast operator is a special case. By prefixing the column or field with the \<NODTF> cast operator, the Date/Time Format can be removed.

The \<NODTF> cast operator can be used in conjunction with Data Type cast operators; for example:  

**\<NODTF>\<BCD>**COLUMN = {BCD_NONDATE_FIELD}


For more information and examples see [Assignment and Comparison Rules](../../Assignment-and-Comparison-Rules.md)

# Examples

1. In this example the column and the field **discount** bothe have a data type of **packed**. If the column is not cast to **alpha** an error will be flagged because you would be trying to assign an alphanumeric constant to a packed column.

    IF {discount} = 0 THEN  
    &nbsp;&nbsp;&nbsp; **\<ALPHA>**COLUMN = " "   
    ELSE	  
    &nbsp;&nbsp;&nbsp; COLUMN = {discount}  
    ENDIF  

2. If a column is defined with a Date/Time Format, it can be removed as follows:  
    **\<NODTF>**COLUMN = {NONDATE_FIELD}  
