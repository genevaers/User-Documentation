# **GenevaERS Assignment and Comparison Rules**
  

## **GenevaERS Data Characteristics**
  
GenevaERS manipulates several kinds of data items:
- LR field
- View column
- View sort key
- Lookup key
- Logic text function
- Constant

These data items may be defined with the following Data Types:

*Table 1.* **Data Types**  

|Data Type|Data Type Category|Data Type Cast Operator|  
|:---|:---|:---|  
|Alphanumeric|String|\<ALPHA\>|
|Binary|Numeric|\<BINARY\>|
|Binary-Coded Decimal|Numeric|\<BCD\>|
|Edited Numeric|Numeric|\<EDITED\>|
|Masked Numeric|Numeric|\<MASKED\>|
|Packed Decimal|Numeric|\<PACKED\>|
|Sortable Binary|Numeric|\<SBINARY\>|
|Sortable Packed|Numeric|\<SPACKED\>|
|Zoned Decimal|Numeric|\<ZONED\>|

For a description of the data types see [Data Types](../AdvancedFeatures/MetaData/DataTypes.md) in [Advanced Features](../AdvancedFeatures/index.md).

The Data Type for a view column can be overridden by prefixing the `COLUMN` keyword with a cast operator.  For example, if a column is defined as Alphanumeric, that Data Type can be changed to Packed Decimal with the following logic text:  

    <PACKED>COLUMN = {PACKED_FIELD}  
  
Also, the Data Type of an LR field can be overridden with a cast operator.  For example, if a column is defined as Alphanumeric and a field is defined as Packed Decimal, the field can be redefined as Alphanumeric on the fly in logic text as follows:   
  
    COLUMN = <ALPHA>{PACKED_FIELD}  
  
Cast operators can be used in data comparisons as well:  
  
    IF <ALPHA>{PACKED_FIELD} = " "  THEN 
        COLUMN = "Y"  
    ENDIF  
  
A data item may also be optionally assigned a Date/Time Format that defines the layout of the data it contains.  
  
Date/Time Formats may contain the following elements:

*Table 2.* **Date/Time Format Elements**

|Element|Name|Examples|  
|:-|:-|:-|
|-|Dash||
|(blank)|Blank||
|.|Dot||
|/|Slash||
|:|Colon||
|AP|AM/PM Designator|AM, PM|
|CC|Century|19, 20|
DD|Day of Month|01, 31|
|DDD|Day of Year|001, 365|
|HH|Hour|00, 01, 12|
|MM|Month (digits)|01, 12|
|MMM|Month (abbr.)|JAN, DEC|
|NN|Minute|00, 59|
|SS|Second|00, 59|
|TT|Hundredths of a Second|00, 99|
|YY|Year|18, 97|
  
The Date/Time Format for a view column or an LR field can be removed in logic text by prefixing the item with the `<NODTF>` cast operator.  For example, if a column is defined with a Date/Time Format, it can be removed as follows: 
  
    <NODTF>COLUMN = {NONDATE_FIELD}
      
The `<NODTF>` cast operator can be used in conjunction with Data Type cast operators; for example: 
  
    <NODTF><BCD>COLUMN = {BCD_NONDATE_FIELD}
  
Logic Text functions have the following characteristics:  
  
*Table 3.*  **Characteristics of Logic Text Functions**

|Function|Return Data Type|Date/Time Format|Length|
|:-|:-|:-|:-|
|ALL|Alphanumeric||Length of target (if assignment) or other operand (if comparison)|
|BATCHDATE|Zoned Decimal|CCYYMMDD|8|
|CURRENT|(Values obtained from the field specified)|||
|DATE|Zoned Decimal|User-specified|Length of date/time format|
|DAYSBETWEEN|Zoned Decimal||33|
|FISCALDAY|Zoned Decimal|CCYYMMDD|8|
|FISCALMONTH|Zoned Decimal|CCYYMM|6|
|FISCALYEAR|Zoned Decimal|CCYY|4|
|MONTHSBETWEEN|Zoned Decimal||33|
|PRIOR|(Values obtained from the field specified)|||
|REPEAT|Alphanumeric||Value of length argument|
|RUNDAY|Zoned Decimal|CCYYMMDD|8|
|RUNMONTH|Zoned Decimal|CCYYMM|6|
|RUNYEAR|Zoned Decimal|CCYY|4|
|YEARSBETWEEN|Zoned Decimal||33|
  
A *string constant* in Logic Text follows the following rules: 		
1.	It is enclosed in double-quotes.	
2.	If it begins with \X or \x, it is considered to be a *hex constant*, and the characters that follow must be 0-9 or A-F (or a-f).	
3.	Hex constants must contain an even number of characters.  	
4.	The Data Type of a string constant is considered to be Alphanumeric. 	
5.	The length of a string constant is: 	
    1.	For non-hex constants, the number of characters between the double-quotes.
    1.	For hex constants, the number of characters between the double-quotes minus 2, then divided by 2.
  
A *string expression* may contain only string constants, string functions, and string fields.
  
A *constant string expression* may contain only string constants and string functions whose value is known at compile time.  All other string expressions are known as *variable string expressions*. 
  
A *numeric constant* in Logic Text follows the following rules: 	
1.	It may contain the digits 0-9, an optional leading sign, and an optional decimal point. 
2.	The Data Type of a numeric constant is considered to be Zoned Decimal.
  
A *numeric expression* may contain only numeric constants, numeric functions, and numeric fields.
  
A *constant numeric expression* may contain only numeric constants and numeric functions whose value is known at compile time.  All other numeric expressions are known as *variable numeric expressions*. 
  

## **GenevaERS Data Assignments**

Data can be transferred from a source to a target in one of three different ways: 
- String assignment
- Numeric assignment
- Date assignment

The type of assignment performed depends on the Data Type Category (String or Numeric) and the presence or absence of a Date/Time Format (DTF) in the source and target: 
  
*Table 4.*  **Types of Assignments Performed** 

|Type|Source Category|Source DTF|Target Category|Target DTF|Result|
|:-|:-|:-|:-|:-|:-|
|1A|String|No|String|No|**String**|
|1B|String|Yes|String|No|**String**|
|1C|Numeric|No|String|No|**Numeric**|
|1D|Numeric|Yes|String|No|**Numeric**|
|2A|String|No|String|Yes|**String**|
|2B|String|Yes|String|Yes|**Date**|
|2C|Numeric|No|String|Yes|**Numeric**|
|2D|Numeric|Yes|String|Yes|**Date**|
|3A|String|No|Numeric|No|**Numeric**|
|3B|String|Yes|Numeric|No|**Numeric**|
|3C|Numeric|No|Numeric|No|**Numeric**|
|3D|Numeric|Yes|Numeric|No|**Numeric**|
|4A|String|No|Numeric|Yes|**Numeric**|
|4B|String|Yes|Numeric|Yes|**Date**|
|4C|Numeric|No|Numeric|Yes|**Numeric**|
|4D|Numeric|Yes|Numeric|Yes|**Date**|
  
### **Rules for String assignments**
1.	If the target item is longer than the source item:	
    1.  In the Extract or Format Phase, the source is padded with spaces on the right to the length of the target. 
2.	If the target item is shorter than the source item:	
    1.	In the Compile Phase, a warning appears.
    1.	In the Extract or Format Phase, the source is truncated on the right to the length of the target.
3.	A constant string expression cannot be longer than the target. 	
4.	A constant numeric expression cannot be assigned to a string data item.  
5.	Any Date/Time Format on the source or target is ignored and a warning appears in the Compile Phase. 
6.	If the source item is a lookup field, and the lookup fails to find a matching key, the source item is set to spaces.
		
### **Rules for Numeric assignments**
1.	If the target item is longer than the source item, the source is padded with zeroes on the left to the length of the target.	
2.	If the source item has more significant digits than the target allows:	
    1.	In the Compile Phase, a warning appears.
    1.	In the Extract or Format Phase, the source is truncated on the left to the length of the target.
3.	A constant numeric expression cannot have more significant digits than the target allows.	
4.	A constant numeric expression cannot have more decimal places than the target allows.	
5.	A constant numeric expression cannot have a sign if the target does not.	
6.	A Masked Numeric data item may be the target of an assignment, but not the source.  
7.	A constant string expression cannot be assigned to a numeric data item.  
8.	If a numeric data item is assigned to a string target, the target data item’s Data Type is set to Zoned Decimal, the Decimal Places is set to zero, the Scaling Factor is set to zero, and the Sign Indicator is set to Unsigned.
9.	If a string data item is assigned to a numeric target, the source data item’s Data Type is set to Zoned Decimal, the Decimal Places is set to zero, the Scaling Factor is set to zero, and the Sign Indicator is set to Unsigned.  
10.	Any Date/Time Format on the source or target is ignored and a warning appears in the Compile Phase.
11.	If the source item is a lookup field, and the lookup fails to find a matching key, the source item is set to zero.  

### **Rules for Date assignments**
1.	The elements in the Date/Time Format of a target data item must be able to be derived from the elements in the source item's Date/Time Format. 	
2.	If the source item is a lookup field, and the lookup fails to find a matching key, the target item is set to spaces if it has a Data Type Category of String and zero if it has a Data Type Category of Numeric.  The Date/Time Format is disregarded.  

NOTE:  The default lookup value may be overridden by testing the success of the lookup first.  For example:
  
    IF ISFOUND({PRODUCT})  THEN
        COLUMN = {PRODUCT.DESCRIPTION} 
    ELSE
        COLUMN = “DESCRIPTION NOT FOUND”
    END-IF
  
### **Example of Assignment Type 1A – Assignment of a String without a DTF to a String without a DTF**
  
    COLUMN = {ALPHA_NONDATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|(none)|
|Field Length|8|   
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|(none)|
|Column Length|8|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|String|
|Field Data Type|Alphanumeric|
|Field DTF|(none)|
|Column Data Type|Alphanumeric|
|Column DTF|(none)|
|Column Value (char)|19991231|
|Column Value (hex)|F1F9F9F9F1F2F3F1|

#### **Warnings Issued**  
(none)  

### **Example of Assignment Type 1B - Assignment of a String with a DTF to a String without a DTF**
  
    COLUMN = {ALPHA_DATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|CCYYMMDD|
|Field Length|8|
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|
  
#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|(none)|
|Column Length|8|
  
#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|String|
|Field Data Type|Alphanumeric|
|Field DTF|(none) (changed from original DTF)|
|Column Data Type|Alphanumeric|
|Column DTF|(none)|
|Column Value (char)|19991231|
|Column Value (hex)|F1F9F9F9F1F2F3F1|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
  
Warnings can be suppressed by coding:  
  
    <NODTF>COLUMN = {ALPHA_NONDATE_FIELD}
   
### **Example of Assignment Type 1C - Assignment of a Number without a DTF to a String without a DTF**  
    
    COLUMN = {BCD_NONDATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|(none)|
|Column Length|8|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Column Data Type|Zoned Decimal (changed from initial Data Type)|
|Column DTF|(none)|
|Column Value (char)|19991231|
|Column Value (hex)|F1F9F9F9F1F2F3F1|

#### **Warnings Issued**  
  
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    <ZONED>COLUMN = {BCD_NONDATE_FIELD}
  
### **Example of Assignment Type 1D - Assignment of a Number with a DTF to a String without a DTF**  
  
    COLUMN = {BCD_DATE_FIELD}  
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|CCYYMMDD|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|(none)|  
|Column Length|8|  

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none) (changed from initial DTF)|
|Column Data Type|Zoned Decimal (changed from initial Data Type)|
|Column DTF|(none)|
|Column Value (char)|19991231|
|Column Value (hex)|F1F9F9F9F1F2F3F1|
  
#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    <ZONED>COLUMN = <NODTF>{BCD_DATE_FIELD}
  
### **Example of Assignment Type 2A - Assignment of a String without a DTF to a String with a DTF**  
  
    COLUMN = {ALPHA_NONDATE_FIELD}  
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|(none)|
|Field Length|8|
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|MM/DD/CCYY|
|Column Length|8|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|String|
|Field Data Type|Alphanumeric|
|Field DTF|(none)|
|Column Data Type|Alphanumeric|
|Column DTF|(none) (changed from initial DTF)|
|Column Value (char)|19991231|
|Column Value (hex)|F1F9F9F9F1F2F3F1|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
  
Warnings can be suppressed by coding:  
  
    <NODTF>COLUMN = {ALPHA_NONDATE_FIELD}
  
### **Example of Assignment Type 2B - Assignment of a String with a DTF to a String with a DTF**  
  
    COLUMN = {ALPHA_DATE_FIELD}  
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|CCYYMMDD|
|Field Length|8|
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|MM/DD/CCYY|
|Column Length|8|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Date|
|Field Data Type|Alphanumeric|
|Field DTF|CCYYMMDD|
|Column Data Type|Alphanumeric|
|Column DTF|MM/DD/CCYY|
|Column Value (char)|12/31/1999|
|Column Value (hex)|F1F261F3F161F1F9F9F9|

#### **Warnings Issued**  
(none)

 
### **Example of Assignment Type 2C - Assignment of a Number without a DTF to a String with a DTF**  
  
    COLUMN = {BCD_NONDATE_FIELD}  
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|MM/DD/CCYY|
|Column Length|8|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Column Data Type|Zoned Decimal (changed from initial Data Type)|
|Column DTF|(none) (changed from initial DTF)|
|Column Value (char)|19991231|
|Column Value (hex)|F1F9F9F9F1F2F3F1|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    <NODTF><ZONED>COLUMN = {BCD_NONDATE_FIELD}
  
### **Example of Assignment Type 2D - Assignment of a Number with a DTF to a String with a DTF**  
  
    COLUMN = {BCD_DATE_FIELD}  
      
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|CCYYMMDD|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Alphanumeric|
|Column DTF|MM/DD/CCYY|
|Column Length|8|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Date|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|CCYYMMDD|
|Column Data Type|Zoned Decimal (changed from initial Data Type)|
|Column DTF|MM/DD/CCYY|
|Column Value (char)|12/31/1999|
|Column Value (hex)|F1F261F3F161F1F9F9F9|

#### **Warnings Issued**  
  
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    <ZONED>COLUMN = {BCD_DATE_FIELD}
  
### **Example of Assignment Type 3A – Assignment of a String without a DTF to a Number without a DTF**  
  
    COLUMN = {ALPHA_NONDATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|(none)|
|Field Length|8|
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Zoned Decimal (changed from initial Data Type)|
|Field DTF|(none)|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Value (hex)|19991231|

#### **Warnings Issued**  
  
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:   
  
    COLUMN = <ZONED>{ALPHA_NONDATE_FIELD}
  
### **Example of Assignment Type 3B - Assignment of a String with a DTF to a Number without a DTF**  
  
    COLUMN = {ALPHA_DATE_FIELD}  
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|CCYYMMDD|
|Field Length|8|
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Zoned Decimal (changed from initial Data Type)|
|Field DTF|(none) (changed from initial DTF)|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Value (hex)|19991231|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    COLUMN = <NODTF><ZONED>{ALPHA_DATE_FIELD}
  
### **Example of Assignment Type 3C - Assignment of a Number without a DTF to a Number without a DTF**  
  
    COLUMN = {BCD_NONDATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Value (hex)|19991231|

#### **Warnings Issued**  
(none)
 
### **Example of Assignment Type 3D - Assignment of a Number with a DTF to a Number without a DTF**
    
    COLUMN = {BCD_DATE_FIELD}  
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|CCYYMMDD|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none) (changed from initial DTF)|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none)|
|Column Value (hex)|19991231|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
  
Warnings can be suppressed by coding:  
  
    COLUMN = <NODTF>{BCD_DATE_FIELD}
  
### **Example of Assignment Type 4A - Assignment of a String without a DTF to a Number with a DTF**  
    
    COLUMN = {ALPHA_NONDATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|(none)|
|Field Length|8|
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|MMDDCCYY|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Zoned Decimal (changed from initial Data Type)|
|Field DTF|(none)|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none) (changed from initial DTF)|
|Column Value (hex)|19991231|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    <NODTF>COLUMN = <ZONED>{ALPHA_NONDATE_FIELD}
  
### **Example of Assignment Type 4B - Assignment of a String with a DTF to a Number with a DTF**
  
    COLUMN = {ALPHA_DATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Alphanumeric|
|Field DTF|CCYYMMDD|
|Field Length|8|
|Field Value (char)|19991231|
|Field Value (hex)|F1F9F9F9F1F2F3F1|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|MMDDCCYY|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Date|
|Field Data Type|Zoned Decimal (changed from initial Data Type)|
|Field DTF|CCYYMMDD|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|MMDDCCYY|
|Column Value (hex)|12311999|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    COLUMN = <ZONED>{ALPHA_DATE_FIELD}
  
### **Example of Assignment Type 4C - Assignment of a Number without a DTF to a Number with a DTF**  
  
    COLUMN = {BCD_NONDATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|MMDDCCYY|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Numeric|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|(none)|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|(none) (changed from initial DTF)|
|Column Value (hex)|19991231|

#### **Warnings Issued**  
  
    GVBC0001W - GVBCOMPO - line n:nn: Date/Time format conflict 
    GVBC0003W - GVBCOMPO - line n:nn: Changing Alphanumeric to Zoned Decimal 
  
Warnings can be suppressed by coding:  
  
    <NODTF>COLUMN = {BCD_NONDATE_FIELD}
  
### **Example of Assignment Type 4D - Assignment of a Number with a DTF to a Number with a DTF**  
  
    COLUMN = {BCD_DATE_FIELD}
  
#### **Source**  

|Attribute|Value|
|:-|:-|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|CCYYMMDD|
|Field Length|4|
|Field Value (hex)|19991231|

#### **Target**  

|Attribute|Value|
|:-|:-|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|MMDDCCYY|
|Column Length|4|

#### **Result**  

|Attribute|Value|
|:-|:-|
|Type of Assignment Performed|Date|
|Field Data Type|Binary-Coded Decimal|
|Field DTF|CCYYMMDD|
|Column Data Type|Binary-Coded Decimal|
|Column DTF|MMDDCCYY|
|Column Value (hex)|12311999|

#### **Warnings Issued**  
(none)

 
## **GenevaERS Data Comparisons**

Data items can be compared in one of three different ways: 
- String comparison
- Numeric comparison
- Date comparison

The type of comparison performed depends on the Data Type Category (String or Numeric) and the presence or absence of a Date/Time Format (DTF):   
  
*Table 5.*  **Types of Comparisons Performed**

|Type|Source Category|Source DTF|Target Category|Target DTF|Result|
|:-|:-|:-|:-|:-|:-|
|1A|String|No|String|No|**String**|
|1B|String|Yes|String|No|**String**|
|1C|Numeric|No|String|No|**Numeric**|
|1D|Numeric|Yes|String|No|**Numeric**|
|2A|String|No|String|Yes|**String**|
|2B|String|Yes|String|Yes|**Date**|
|2C|Numeric|No|String|Yes|**Numeric**|
|2D|Numeric|Yes|String|Yes|**Date**|
|3A|String|No|Numeric|No|**Numeric\***|
|3B|String|Yes|Numeric|No|**Numeric\***|
|3C|Numeric|No|Numeric|No|**Numeric**|
|3D|Numeric|Yes|Numeric|No|**Numeric**|
|4A|String|No|Numeric|Yes|**Numeric\***|
|4B|String|Yes|Numeric|Yes|**Date**|
|4C|Numeric|No|Numeric|Yes|**Numeric**|
|4D|Numeric|Yes|Numeric|Yes|**Date**|
   
\* The Numeric comparison may be changed to a String comparison with a cast operator (see above).
   
Data items can be compared using the following Comparison Operators:
  
    <	Less Than
	<=	Less Than or Equal To 
	=	Equal To 
	<>	Not Equal To
	>	Greater Than
	>=	Greater Than or Equal To
  
### **Rules for String comparisons**
1.	A constant string expression cannot be longer than the other data item.   	
3.	If one data item is shorter than the other, then the shorter data item is padded with spaces on the right to the length of the longer data item. 
4.	A constant numeric expression cannot be compared to a string data item.  
5.	Any Date/Time Format on the source or target is ignored.

### **Rules for Numeric comparisons**
1.	A Masked Numeric data item may not be compared.  
2.	A constant string expression cannot be compared to a numeric data item.  
3.	If a numeric data item is compared to a string data item, the string’s Data Type is set to Zoned Decimal, the Decimal Places is set to zero, the Scaling Factor is set to zero, and the Sign Indicator is set to Unsigned.
4.	Any Date/Time Format on either operand is ignored.
5.	Unsigned numeric values are considered to be positive for comparisons.  

### **Rules for Date comparisons**
1.	The elements in the Date/Time Format of one data item must be able to be derived from the elements in the other item's Date/Time Format. 	
  	
NOTE:  If a data item in an IF statement is a lookup field, and the lookup fails, control passes to the ELSE clause, if it exists, or to the first statement after the matching ENDIF.  
  
  
## **GenevaERS String Matching**

Data items can be examined using the following String Matching Operators:	
- BEGINS_WITH
- CONTAINS
- ENDS_WITH

Examples:
  
    IF {FIELD_1} BEGINS_WITH “THE”
  
### **Rules for String matching**
1.	Any Date/Time Format on either operand is ignored.
2.	If an operand is numeric, it is treated as if its Data Type was Alphanumeric.  
3.	The “needle” cannot be longer than the “haystack.”   
