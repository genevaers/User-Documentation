# Checklist: Select input records {#SARChSel1Input .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What does "select input records" mean?](#02)
-   [03 Extract Record Filter logic text](#03)
-   [04 Metadata required](#04)
-   [06 File and PE Job stream requirements](#06)
-   [07 Troubleshooting](#07)

## 02 What does "select input records" mean? {#02 .section}

The above phrase means that not every record in a source file is processed in a view. Some records are accepted for processing and other records are ignored.

For example, the source file may be all worldwide sales transactions, and a view selects only the sale transactions for a specific product in a specific country.

Note that this is **NOT** these features:

-   "**Zero-Value Record Suppression**" in a view.

    That is covered in topic "**Checklist: Zero-Value Record Suppression**". A link to that topic is under "**Related reference**" below.

-   "**Aggregate all records with identical sort keys**" in a view.

    That is covered in topic "**Checklist: Aggregate Records**". A link to that topic is under "**Related reference**" below.

-   "**Aggregate all records with identical sort keys using a buffer of X records**" in a view.

    That is covered in topic "**Checklist: Aggregate Records**". A link to that topic is under "**Related reference**" below.

-   "**Stop extract-phase for this view after X records are written**" in a view.

    That is covered in topic "**Checklist: Limit Records Read or Written**". A link to that topic is under "**Related reference**" below.


Selecting input records is done using a feature called **Extract Record Filter logic text.** This is described in the next section.

## 03 Extract Record Filter logic text {#03 .section}

For an introduction, see topic "**Logic text 1: Extract Record Filter overview**". A link to that overview is under "**Related concepts**" below.

For details of the syntax and how to create this logic text, see topic "**Logic text 1: Extract Record Filter**". A link to this topic is under **Related reference** below.

## 04 Metadata required {#04 .section}

The following metadata items must exist in your SAFR database.

|Metadata|Notes|
|--------|-----|
|Extract Record Filter logic text inside a view|The logic text must be written for the specific view and the specific source file.|

## 06 File and PE Job stream requirements {#06 .section}

|Job|Notes|
|---|-----|
|Run the view|PE executes the Extract Record Filter logic text as part of the processing of the view.|

## 07 Troubleshooting {#07 .section}

See help topic "**Troubleshooting: Select input records**". A link to that topic is under **Related reference** below.

**Parent topic:**[PE Checklists](../html/AAR520PMChecklists.md)

