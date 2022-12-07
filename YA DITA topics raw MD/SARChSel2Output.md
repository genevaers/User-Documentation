# Checklist: Select output records {#SARChSel2Output .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What does "select output records" mean?](#02)
-   [03 Format Record Filter logic text](#03)
-   [04 Metadata required](#04)
-   [06 File and PE Job stream requirements](#06)
-   [07 Troubleshooting](#07)

## 02 What does "select output records" mean? {#02 .section}

The above phrase means that not every processed in the extract phase of a view is included in the output of that view. Some records are output and other records are ignored.

For example, the extract phase may produce a file with sales transactions of all prices, and a view outputs only the sale transactions above a certain value.

Note that this is **NOT** these features:

-   "**Zero-Value Record Suppression**" in a view.

    That is covered in topic "**Checklist: Zero-Value Record Suppression**". A link to that topic is under "**Related reference**" below.

-   "**Aggregate all records with identical sort keys**" in a view.

    That is covered in topic "**Checklist: Aggregate Records**". A link to that topic is under "**Related reference**" below.

-   "**Aggregate all records with identical sort keys using a buffer of X records**" in a view.

    That is covered in topic "**Checklist: Aggregate Records**". A link to that topic is under "**Related reference**" below.

-   "**Stop extract-phase for this view after X records are written**" in a view.

    That is covered in topic "**Checklist: Limit Records Read or Written**". A link to that topic is under "**Related reference**" below.


Selecting output records is done using a feature called **Format Record Filter logic text.** This is described in the next section.

## 03 Format Record Filter logic text {#03 .section}

For an introduction, see topic "**Logic text 4: Format Record Filter overview**". A link to that overview is under "**Related concepts**" below.

For details of the syntax and how to create this logic text, see topic "**Logic text 4: Format Record Filter**". A link to this topic is under **Related reference** below.

## 04 Metadata required {#04 .section}

The following metadata items must exist in your SAFR database.

|Metadata|Notes|
|--------|-----|
|Format Record Filter logic text inside a view|The logic text must be written for the specific view that has a format phase.|

## 06 File and PE Job stream requirements {#06 .section}

|Job|Notes|
|---|-----|
|Run the view|PE executes the Format Record Filter logic text as part of the processing of the view in the format phase.|

## 07 Troubleshooting {#07 .section}

See help topic "**Troubleshooting: Select output records**". A link to that topic is under **Related reference** below.

**Parent topic:**[PE Checklists](../html/AAR520PMChecklists.md)

