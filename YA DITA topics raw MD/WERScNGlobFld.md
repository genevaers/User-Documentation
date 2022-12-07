# New Global Field screen help {#WERScNGlobFld .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScNGlobFld.md#02)
-   [05 Errors](WERScNGlobFld.md#05)
-   [10 Action on this screen](WERScNGlobFld.md#10)
-   [50 Fields - General section](WERScNGlobFld.md#50)
-   [60 Fields - View Defaults section](WERScNGlobFld.md#60)
-   [99 Keyboard Shortcuts](WERScNGlobFld.md#99)

## 02 Screen function and rights {#02 .section}

![](images/New_Global_Field_01.gif)

The above screen image has been compressed horizontally for ease of printing and display. Some fields are wider than shown.

Use this screen to create a new global field record.

This screen is for system and environment administrators only.

## 05 Errors {#05 .section}

For errors or messages on this screen, see topic "**New Global Field errors**". For a link, see under **Related reference** below.

## 10 Action on this screen {#10 .section}

Enter or modify values and save as follows:

-   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
-   **OR** select **File, Save**,
-   **OR** press **Ctrl+S**.

## 50 Fields - General section {#50 .section}

|Field|Definition|
|-----|----------|
|Field ID|The position in the list of all global fields. \(Display only.\)|
|Name|Up to 48 characters, starting with a letter, and composed of letters, numbers, the Number sign \(\#\) and the underscore \(\_\). Pressing the spacebar automatically creates an underscore in this field. Must be unique \(among global field names in this environment\).Examples of permitted names:

-   Adjustment\_Parameter\_2009
-   Company\_Number

These names are not permitted:

-   2009\_Report\_Code \(doesn't start with a letter\)
-   Growth factor \(must not include spaces\)
-   USA/Canada.Region.Code \(must not include "/" or fullstop\)

|
|Data Type|Choose one of Alphanumeric, Binary, Binary Coded Decimal, Binary Sortable, Edited Numeric, Masked Numeric, Packed, Packed Sortable or Zoned Decimal. If the choice is Masked Numeric, then a Numeric Mask is mandatory in the section "Fields - view defaults" below.|
|Signed|Check this box if your data values could be both positive and negative. This field is disabled if the Data Type field is **Alphanumeric**. This field is also disabled if the field Data Type is **Binary** and you have selected a value in the field Date/Time Format below. \(Optional.\)|
|Length|The length of this global field. A number up to five digits. -   Values 1-256 for data types **alphanumeric, edited numeric and masked numeric.**
-   Values 1-16 for data types **packed, packed sortable, and zoned decimal.**
-   Values 1, 2, 4, or 8 for data types **binary and binary sortable.**
-   Values 1-10 for data type **binary coded decimal**.

|
|Decimal Places|The number of decimal places for this global field. Must be a value between 0 and 9 inclusive. If the data type is Alphanumeric this field is automatically set to zero and is display only. \(Optional.\)|
|Scaling Factor|This field is used for rounding off the values. A number between -9 to +9. If the data type is Alphanumeric this field is automatically set to zero and is display only. \(Optional.\)|
|Date/Time Format|Choose one of the formats from the drop down list. If the data type is Edited Numeric this field is automatically set to blank and is display only. \(Optional.\)|
|Comments|Useful notes, up to 254 characters. \(Optional.\)|
|Created|The person who created this record, and the date and time of creation. \(Display only.|
|Last Modified|The last person who modified this record, and the date and time of the change. \(Display only.\)|

## 60 Fields - View Defaults section {#60 .section}

|Field|Definition|
|-----|----------|
|Header Alignment|The position of the header on that line. \(Optional.\)|
|Column Heading 1|Up to 254 characters. \(Optional.\)|
|Column Heading 2|Up to 254 characters. \(Optional.\)|
|Column Heading 3|Up to 254 characters. \(Optional.\)|
|Numeric Mask|Controls the display of numeric values. Mandatory for a data type of "Masked Numeric", otherwise optional.|
|Sort key label|Up to 48 characters. \(Optional.\)|
|Default value|Up to 254 characters. \(Optional.\)|

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

