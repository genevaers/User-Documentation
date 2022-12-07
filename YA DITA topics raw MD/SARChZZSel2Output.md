# Troubleshooting: Select output records {#SARChZZSel2Output .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What does "select output records" mean?](#02)
-   [03 Format Record Filter logic text](#03)
-   [04 Troubleshooting checks](#04)
-   [05 Other relevant troubleshooting topics](#05)

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

## 04 Troubleshooting checks {#04 .section}

|Issue|What to check|
|-----|-------------|
|To be completed|To be completed|

## 05 Other relevant troubleshooting topics {#05 .section}

Your problem may be solved by considering the following troubleshooting topics:

-   Section "**Troubleshooting - format phases in general**" in topics "**Troubleshooting: Format phase - single run**" or "**Troubleshooting: Format phase - multiple runs**"

    Links to these topics are under **Related reference** below.


**Parent topic:**[PE Checklist Troubleshooting](../html/AAR905PMChecklistTr.md)

