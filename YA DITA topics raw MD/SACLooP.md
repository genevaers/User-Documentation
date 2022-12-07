# Lookup paths overview {#SACLooP .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a lookup path?](SACLooP.md#10)
-   [20 Where to call lookup paths in a view](SACLooP.md#20)
-   [22 Call a lookup from a Column Lookup Field](SACLooP.md#22)
-   [24 Call a lookup from a Sort Key Title](SACLooP.md#24)
-   [26 Call a lookup from Extract Column Assignment logic text](SACLooP.md#26)
-   [28 Call a lookup from Extract Record Filter logic text](SACLooP.md#28)
-   [30 Multi-step lookup paths](SACLooP.md#30)
-   [32 Use fields from the current and previous steps](SACLooP.md#32)
-   [34 Constant in a lookup path step](SACLooP.md#34)
-   [36 Symbol in a lookup path step](SACLooP.md#36)
-   [40 Effective date lookup paths](SACLooP.md#40)
-   [42 Effective date using source field](SACLooP.md#42)
-   [44 Effective date using run date](SACLooP.md#44)
-   [46 Effective date using constant](SACLooP.md#46)
-   [50 How do I use a lookup path?](SACLooP.md#50)
-   [60 How do I know which lookup path to use?](SACLooP.md#60)
-   [70 How do I create or modify a lookup path?](SACLooP.md#70)
-   [80 Lookup Path Report](SACLooP.md#80)
-   [85 Metadata relevant to lookup paths](SACLooP.md#85)
-   [90 How do I delete a lookup path?](SACLooP.md#90)
-   [95 PE processing for lookup paths](SACLooP.md#95)
-   [100 Need more on this page?](SACLooP.md#100)

## 10 What is a lookup path? {#10 .section}

A lookup path is a method where a field in record A allows access to a completely different record B. A field in record A is a "foreign key" that can access record B where that field is a "primary key". This is similar to the DB2 situation called a "left outer join".

![](images/LP_Access_Concept_01.gif)

The purpose is that a field in record A now gives access to all the information in record B.

Consider an example: for each sales transaction we need to know the product description .

In this example, call the lookup path **LP\_SalesProduct**.

![](images/LP_Steps_01.gif)

Note the following:

-   Each step has a **source** logical record and a **target** logical record.
-   Each step must **create a primary key** for the target logical record.

    That primary key can be made up of:

    -   A field in the source logical record \(for example the "foreign key" might be all you need\).
    -   Extra fields in the source logical record, when a primary key may be a combination of other fields.
    -   A constant - see section [34 Constant in a lookup path step](SACLooP.md#34)
    -   A symbol - see section [36 Symbol in a lookup path step](SACLooP.md#36)
-   In the example above the lookup path has only one step. For multiple steps, see section [30 Multi-step lookup paths](SACLooP.md#30).
-   The purpose of the example above is to access the field "**PLR\_Prod\_Desc**". This field is the **lookup field** for the example above. Any field in any of the target logical records can be a lookup field.

## 20 Where to call lookup paths in a view {#20 .section}

You can call a lookup path from four locations, as given in the sections below:

1.  [22 Call a lookup from a Column Lookup Field](SACLooP.md#22)
2.  [24 Call a lookup from a Sort Key Title](SACLooP.md#24)
3.  [26 Call a lookup from Extract Column Assignment logic text](SACLooP.md#26)
4.  [28 Call a lookup from Extract Record Filter logic text](SACLooP.md#28)

## 22 Call a lookup from a Column Lookup Field {#22 .section}

|Aspect|Details|
|------|-------|
|Where to call lookup path|A column in a view that has **Column Source Type** set to Lookup Field.|
|Phase for lookup path|Extract phase.|
|How to call the lookup path|See topic "**Edit View \(View Editor tab\) screen help**" and look in the table of actions for the following rows:-   "**Define a column source type**"
-   "**Define a lookup field**"

|
|Reasons to use this|This is useful when a column in a view is simply the result of a lookup path. For example, use a column is the product name which is the result of using the product id in a lookup path. The lookup path provides the value and no further processing is necessary.|

## 24 Call a lookup from a Sort Key Title {#24 .section}

|Aspect|Details|
|------|-------|
|Where to call lookup path|A sort key column that has a **Sort Key Title.**|
|Phase for lookup path|Format phase.|
|How to call the lookup path|See topic "**Edit View \(View Editor tab\) screen help**" and look in the table of actions for the following rows:-   "**Define a column source type**"
-   "**Make a sort key**"
-   "**Modify a sort key**"

|
|Reasons to use this|Purely for a sort key title that needs a value supplied by a lookup path. For example, the sort key may be a product id and the sort key title is the product name.|

## 26 Call a lookup from Extract Column Assignment logic text {#26 .section}

|Aspect|Details|
|------|-------|
|Where to call lookup path|A column in a view that has **Column Source Type** set to Formula. The logic text needs to be created and modified for this column.|
|Phase for lookup path|Extract phase.|
|How to call the lookup path|See topic "**Edit View \(View Editor tab\) screen help**" and look in the table of actions for the following rows:-   "**Define a column source type**"
-   "**Define a formula**"

|
|Reasons to use this|This is necessary when the lookup is part of a more complex calculation. For example, the product id can be input to a lookup that finds a discount percentage for that product. Once found the discount percentage is part of a new calculation of the product price, so performing the lookup is only part of the processing required to calculate the price. This situation needs logic text.|

Note that when a lookup path is typed in logic text, you can optionally include the lookup field name in the logic text. For full details, see topic "**Syntax: lookup paths**". A link to that topic is under **Related reference** below.

## 28 Call a lookup from Extract Record Filter logic text {#28 .section}

|Aspect|Details|
|------|-------|
|Where to call lookup path|Click on a view source file so that the "**View Source Properties**" screen appears. Create or modify logic text in the field "**Record Filter**".|
|Phase for lookup path|Extract phase.|
|How to call the lookup path|See topic "**Edit View \(View Editor tab\) screen help**" and look in the table of actions for the following rows:-   "**Create Extract Record Filter logic text**"
-   "**Modify or delete Extract Record Filter logic text**"

|
|Reasons to use this|This is when a lookup is required to select or deselect input file records for processing. For example, the product id can be input to a lookup path that provides the product category, and the view can select records from only certain product categories to process.|

Note that when a lookup path is typed in logic text, you can optionally include the lookup field name in the logic text. For full details, see topic "**Syntax: lookup paths**". A link to that topic is under **Related reference** below.

## 30 Multi-step lookup paths {#30 .section}

A lookup can have two ore more steps that allows access to more logical records in a single lookup path.

In the example below, for each sales transaction we need to know the product category description.

In this example, call the lookup path **LP\_SalesProdCateg**.

The **steps** are as follows:

1.  Use **SLR\_Prod\_code** to access the **Prod\_LR** logical record.
2.  Use **PLR\_Categ\_code** to access the **Categ\_LR** logical record.

![](images/LP_Steps_02.gif)

## 32 Use fields from the current and previous steps {#32 .section}

Each step in a lookup path creates a primary key. That process can use the following fields:

-   Fields in the source logical record for the current step, and
-   Fields in the source logical records for previous steps.

In the example below, step 2 uses fields from Step 1 and 2.:

![](images/LP_Steps_03_PrevSrc.gif)

## 34 Constant in a lookup path step {#34 .section}

Each step of a lookup path creates the primary key to a target logical record. That primary key may contain a constant value.

In the example below, lookup path **LP\_SalesProduct** uses a constant. The primary key to Prod\_LR consists of "PRD" followed by 5 digits. The lookup path use a constant for the "PRD" and the 5 digits come from field **SLR\_Prod\_code**:

![](images/LP_Constant_02.gif)

A constant works for all calls to lookup paths listed in section [20 Where to call lookup paths in a view](SACLooP.md#20).

## 36 Symbol in a lookup path step {#36 .section}

A symbol is a compromise between a data field and a constant. The symbol value changes \(unlike a constant\) and is not a data field in the source logical record.

A symbol value has a default value in the lookup path, so you only need to change the symbol for exceptions. If symbol always uses the default value, then the symbol is effectively a constant.

A symbol is necessary because the primary key changes structure as given in this example below:

-   For products from 00001 to 49999, the primary key is "PRD\#\#\#\#\#".
-   For products from 50000-59999, the primary key is "WHL\#\#\#\#\#" \(where WHL is for wholesale\).
-   For products from 60000 onwards, the primary key is "RET\#\#\#\#\#" \(where RET is for retail\).

In the above example, "PRD" is default value, and this is changed to "WHL" or "RET" if the product is in the appropriate range of numbers. How is the symbol changed from the default value?

**A symbol can have a non-default value set only in logic text**. This means **this is only possible in:**

-   Section [26 Call a lookup from Extract Column Assignment logic text](SACLooP.md#26)
-   Section [28 Call a lookup from Extract Record Filter logic text](SACLooP.md#28)

A symbol **always uses the default value** in:

-   Section [22 Call a lookup from a Column Lookup Field](SACLooP.md#22)
-   Section [24 Call a lookup from a Sort Key Title](SACLooP.md#24)

To set a symbol to a non-default value in logic text, the syntax requires "**$**" \(a dollar sign\) before the symbol name. The actual symbol name always starts with a letter.

Lookup path LP\_SalesProduct uses a **symbol called Prefix** which has a default value of "PRD". In Extract Column Assignment logic text, the call to LKProduct is different depending on the value of the 5 digits. This is shown below:

![](images/LP_Symbol_02.gif)

Notice how the first call to LP\_SalesProduct does not give a value for symbol Prefix so the default value of "PRD" applies.

Note that a lookup path can only be called from logic text in the extract phase, which means either **Extract Record Filter** or **Extract Column Assignment.** For an introduction to logic text, see topic "**Logic Text overview**". A link to that topic is under **Related concepts** below.

## 40 Effective date lookup paths {#40 .section}

An effective date lookup means the lookup finds a target logical record with the correct key and the correct date.

This feature can be used for any call to a lookup, as shown in section [20 Where to call lookup paths in a view](SACLooP.md#20).

An effective date lookup needs the following:

-   The target logical record to have a **date range**.

    This date range exists if at least one date field in the target logical record is marked "**Start date**". Optionally, the record can also have a date field marked "**End date**". These two dates **cannot** be part of the primary key of that logical record.

-   The view to supply a "**given date**". The given date selects a target logical record by date.

    The "**given date**" can be one of:

    -   A **field** in the **source** logical record,
    -   The **run date** for that run of the Performance Engine,
    -   A **constant** value given in the view or logic text calling the lookup path.

![](images/LP_EffectDate_01_Concept.gif)

For more see these sections:

-   Section [42 Effective date using source field](SACLooP.md#42)
-   Section [44 Effective date using run date](SACLooP.md#44)
-   Section [46 Effective date using constant](SACLooP.md#46)

## 42 Effective date using source field {#42 .section}

The "given" date is any date field in the source logical record.

![](images/LP_EffectDate_02_SrcField.gif)

## 44 Effective date using run date {#44 .section}

The "given" date is the run date for the Performance Engine.

![](images/LP_EffectDate_03_RunDate.gif)

## 46 Effective date using constant {#46 .section}

The "given" date is a constant date value given in a view or logic text. A constant date value is specified as follows:

-   Screen "**Column Source Properties**" in field "**Effective Date Value**".
-   Screen "**Sort Key Titles**" in field "**Effective Date Value**".
-   In **Extract Column Assignment** logic text, which includes a **DATE** keyword for specifying a date constant.
-   In **Extract Record Filter** logic text, which includes a **DATE** keyword for specifying a date constant.

![](images/LP_EffectDate_04_Constant.gif)

## 50 How do I use a lookup path? {#50 .section}

![](images/LP_Usage_Rights_02.gif)

Lookup paths can be used in the **extract phase** and **format phase** processing for a view.

Choose a location to call a lookup path by using section [20 Where to call lookup paths in a view](SACLooP.md#20).

You need to know these things about a lookup to use it:

-   The **lookup path name**.
-   The **last target logical record**.
-   The **last target logical file**.
-   The **lookup field**. This could be any field in the last target logical record.
-   Any **effective date** requirements for the lookup path.
-   The **default and required values** for any **symbols** in that lookup path.

    For example, in [36 Symbol in a lookup path step](SACLooP.md#36) if the product number it 50001 then the default value is "PRD" and the required value is 'WHL".

    If the required value of the symbol is different from the default value then this is only changed in logic text. The two types of logic text available for this are **Extract Record Filter** and **Extract Column Assignment**


A lookup path can only be used if the **status** of the lookup path is **active**. If the status if inactive, fix all problems with the lookup path and save.

See the following topics:

-   "**Creating lookup paths**",
-   "**Creating views**",
-   "**Modifying lookup paths**",
-   "**Modify views**",
-   "**Batch activate lookup paths**".

Links to these topics are under **Related tasks** below.

Any user with access to an environment can create or modify lookup paths in that environment.

## 60 How do I know which lookup path to use? {#60 .section}

Read lookup paths as follows: in the **Navigator**, click on "**Lookup Paths**", and in the **Metadata List** double click on any lookup path.

General users need to be aware of help topic "**What metadata do I want to see?**" A link to that topic is under **Related reference** below.

**See your system or environment administrator** if you need more access to logical files and logical records in your environment, or if you need more logical files and logical records created and you do not have the authority to do this yourself.

Another way is to review lookup paths is to use the report described in the next section.

## 70 How do I create or modify a lookup path? {#70 .section}

![](images/LP_Create_Modify_02.gif)

General users can **create or modify logical files and logical records** if the group for login has the following authorities:

-   **Create Logical File** permission in the relevant environment.
-   **Create Logical Record** permission in the relevant environment.
-   **Create Physical File** permission in the relevant environment \(if required\).
-   **Modify or Delete rights to the specific logical files** in that environment.
-   **Modify or Delete rights to the specific logical records** in that environment.
-   **Modify or Delete rights to the specific physical files** in that environment \(if required\).

General users can **create and modify lookup paths**, in general, with some restrictions. To create or update a lookup path to use **new logical files and logical records**, the group selected during login must have at least **edit** rights to those relevant logical files and logical records. All other aspects of a lookup path can be created or modified by all general users at all times.

General users can **modify a view to use a lookup path** if the group selected during login has at least **modify** rights to the relevant view folder that contains the view and at least **read** rights to the relevant logical files and logical records.

System administrators and environment administrators can always do the above tasks.

For more on these authorities, see topics "**Groups overview**" , "**Groups - advanced overview**" and "**WE Security overview**". Links to these overviews are under **Related concepts** below.

If you have enough authority, **create or modify lookup paths and refer to them in views** by using the tasks below, which are **general user tasks**:

-   "**Creating lookup paths**",
-   "**Creating views**",
-   "**Modifying lookup paths**",
-   "**Modify views**",

Links to these topics are under **Related tasks** below.

## 80 Lookup Path Report {#80 .section}

All users in an environment can run this report on any lookup path, using these topics:

-   FAQ topic "**How do I generate a Lookup Path Report?**"
-   Task "**Generating reports on metadata**"

A link to the FAQ topic is under "**Related Reference**" below. A link to the task topic is under **Related tasks** below.

## 85 Metadata relevant to lookup paths {#85 .section}

A lookup path is referred to in a **view**. The reference could be in a column definition or in logic text.

A lookup path refers to **logical files** and the fields in the associated **logical records**.

![](images/LP_Metadata_02.gif)

This topic is connected to the following topics:

-   "**Logical files overview**",
-   "**Logical records overview**",
-   "**Views overview**",

Links to these overviews are under **Related concepts** below.

## 90 How do I delete a lookup path? {#90 .section}

See topic "**Deleting metadata**". A link is under **Related tasks** below.

## 95 PE processing for lookup paths {#95 .section}

![](images/LP_Phases_02.gif)

Processing of lookup paths is as follows:

1.  The **Join Logic Table \(JLT\)** is created in program **MR90** in the **logic** phase. The JLT contains commands for any lookup paths in the view\(s\) selected for this run of PE. If the view\(s\) contain no lookup paths, then the JLT is empty. When lookup paths exist, the JLT contains logic table function codes specifically for lookup paths.

    For more, see these topics:

    -   "**JLT file overview**"
    -   "**Logic phase overview**"
    -   "**Logic tables and codes overview**"
    -   "**MR90 Logic Table Generator overview**"
    Links to these overviews are under **Related concepts** below.

2.  The **JLT** is converted into EBCDIC format in program **MR76** in the **logic** phase. This conversion covers the commands for lookup paths that are stored in the JLT.

    For more, see these topics:

    -   "**JLT file overview**"
    -   "**Logic phase overview**"
    -   "**MR76 LT to EBCDIC overview**"
    Links to these overviews are under **Related concepts** below.

3.  A report on the **JLT** is created by program **UT90** in the **reference** phase. This report shows the lookup paths contained in the JLT.

    For more, see these topics:

    -   "**JLT file overview**"
    -   "**Reference phase overview**"
    -   "**UT90 Logic Table Report overview**"
    Links to these overviews are under **Related concepts** below.

4.  Program **MR95** runs in the **reference** phase and creates the **Reference Detail \(RED\)** file\(s\) and possibly the **Reference Extract Header \(REH\)** file and possibly the **Reference formaT Header \(RTH\)** file.

    For more, see these topics:

    -   "**RED file overview**"
    -   "**REH file overview**"
    -   "**RTH file overview**"
    -   "**Reference phase overview**"
    -   "**MR95 Reference and Extract overview**"
    Links to these overviews are under **Related concepts** below.

5.  Program **MR71** creates a **Reference Report \(Extract\)** that can also be called the REH Report, because the report includes the contents of the REH file. MR71 runs in the **reference** phase.

    For more, see these topics:

    -   "**REH file overview**"
    -   "**Reference phase overview**"
    -   "**MR71 Reference Report overview**"
    Links to these overviews are under **Related concepts** below.

6.  Program **MR71** creates a **Reference Report \(Sort Titles\)** that can also be called the RTH Report, because the report includes the contents of the RTH file. MR71 runs in the **reference** phase.

    For more, see these topics:

    -   "**RTH file overview**"
    -   "**Reference phase overview**"
    -   "**MR71 Reference Report overview**"
    Links to these overviews are under **Related concepts** below.

7.  Program **MR95** runs in the **extract** phase and executes the lookups using the RED files and the REH file.

    For more, see these topics:

    -   "**Extract phase overview**"
    -   "**RED file overview**"
    -   "**REH file overview**"
    -   "**MR95 Reference and Extract overview**"
    Links to these overviews are under **Related concepts** below.

8.  Program **MR88** executes lookups for sort titles in the view using the RED files and the RTH file. MR88 runs in the **format** phase.

    For more, see these topics:

    -   "**Format phase overview**"
    -   "**RED file overview**"
    -   "**RTH file overview**"
    -   "**MR88 Format Data overview**"
    Links to these overviews are under **Related concepts** below.


Links to the runbooks for the programs mentioned above are under "**Related Reference**" below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

