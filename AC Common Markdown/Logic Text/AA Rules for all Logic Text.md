# Rules for all logic text 

|Rules|Notes|
|-----|-----|
|**Extra blanks between keywords and expressions** have no effect.|For example, these IF statements are all the same:```
IF ({field1}={field2}) THEN COLUMN=
   {field1} ENDIF

IF ({field1} = {field2}) THEN
    COLUMN = {field1} ENDIF

IF
  ({field1}
           =
            {field2})
                     THEN
                         COLUMN
                          =
                          {field1}
                              ENDIF

IF ({field1} = {field2})THEN
    COLUMN = {field1}
ENDIF

IF ({field1} = {field2})
   THEN COLUMN  =  {field1}
ENDIF

```

**WARNING: Extra blanks change text strings**, for example "ABC" and "A B C" are different strings.

|
| | |
|Logic text can continue on the next line. A backslash \(\\\) is optional at line end.|In previous versions of SAFR, a backslash \(\\\) was required in order to continue a line of logic text on the next line. This backslash is no longer required. The backslash is still allowed for backwards compatibility. This means the following statements are the same:```
 IF ({FIELD1} >= 2)\
    THEN COLUMN = {FIELD1} ENDIF

 IF ({FIELD1} >= 2)
    THEN COLUMN = {FIELD1} ENDIF
          
```

|
| | |
|The **case of keywords** has no effect.|For example, these IF statements are all the same:```
 IF ({FIELD1} >= COL.2)
    THEN COLUMN = {FIELD1}
    ELSE COLUMN = COL.2 ENDIF

if ({field1} >= col.2)
   then column = {field1}
   else column = col.2 endif

If ({Field1} >= Col.2)
    Then Column = {Field1}
    Else Column = Col.2 Endif                          
```

**WARNING: Case changes text strings**, for example "ABC" and "abc" are different strings.

|
| | |
|**After a single quote** everything on that line is a **comment**|Examples are: ```
 ' Make col the larger of field1 & col.2
IF ({FIELD1} >= COL.2)
   THEN COLUMN = {FIELD1} ENDIF
COLUMN = {field3}  ' Rest is comment (OK).
   
```

**WARNING: comments to the left of keywords result in hiding the keywords**, for example:

```
 IF ({field1} = {field2})THEN
    COLUMN = {field1}
' This comment hides keyword:     ENDIF
```

|
| | |
|Use **curly brackets \{ \}** to enclose **input fields** or names of metadata from the SAFR Workbench \(such as a lookup path, logical file, physical file\).|Examples are:```
{shipping_date}
{product_category}
{CA_Sales_2009_Logical_File}
{Products_Logical_File}
{Products_USA_File}
{Lookup_Sales_to_Product_Category}
```

|

## Keyboard shortcuts for all logic text screens 

See topic "**What are the keyboard shortcuts?**"


