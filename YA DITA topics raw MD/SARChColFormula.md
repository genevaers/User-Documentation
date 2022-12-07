# Checklist: Column formula {#SARChColFormula .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a "column formula"?](#10)
-   [20 Extract Column Assignment logic text](#20)
-   [30 Metadata required](#30)
-   [40 File and PE Job stream requirements](#40)
-   [90 Troubleshooting](#90)
-   [100 Need more on this page?](#100)

## 10 What is a "column formula"? {#10 .section}

The above phrase means that a column in your view is based on a formula to calculate the value for that column.

Column formulas use a feature called **Extract Column Assignment logic text.** This is described in the next section.

## 20 Extract Column Assignment logic text {#20 .section}

For an introduction, see topic "**Logic text 2: Extract Column Assignment overview**". A link to that overview is under "**Related concepts**" below.

For details of the syntax and how to create this logic text, see topic "**Logic text 2: Extract Column Assignment**". A link to this topic is under **Related reference** below.

## 30 Metadata required {#30 .section}

The following metadata items must exist in your SAFR database.

|Metadata|Notes|
|--------|-----|
|Extract Column Assignment logic text inside a view|The logic text must be written for the specific column and specific view and the specific source file.|

## 40 File and PE Job stream requirements {#40 .section}

|Job|Notes|
|---|-----|
|Run the view|PE executes the Extract Column Assignment logic text as part of the processing of the view.|

## 90 Troubleshooting {#90 .section}

See help topic "**Troubleshooting: Column formula**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Checklists](../html/AAR520PMChecklists.md)

