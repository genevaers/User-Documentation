# Event and Reference files overview {#SACEventRef .concept}

## 01 Summary of this topic {#01 .section}

This topic covers the following:

-   [10 Event files](SACEventRef.md#10)
-   [20 Reference files](SACEventRef.md#20)
-   [30 Lookup paths](SACEventRef.md#30)
-   [100 Need more on this page?](SACEventRef.md#100)

## 10 Event files {#10 .section}

An event file is file of transactions, such as a sales file. An event file is hence a typical input file to batch processing.

A record in an event file commonly does not contain all the details of that transaction. For example, a sales record often contains a product ID number, but not the product name. The product name can be found by using th product ID number in the sale record to access the product file.

This access from the Sales file to the Product file is called a lookup path. In this lookup path example, the sales file is an example of an event file, and the product file is an example of a reference file.

The primary characteristics of an event file are:

-   Each record is a transaction. There is often no sort key to the record.
-   Normally, all the records in the event file are read sequentially, in order to process the transactions.

For more on reference files, see the next section. For more on lookups, see below in section [30 Lookup paths](SACEventRef.md#30).

## 20 Reference files {#20 .section}

A reference file is a file of information about unique entities, and is normally sorted on a unique key. For example, a product file contains a record for each product, with a product ID number as the sort key.

The primary characteristics of a reference file are:

-   Each record has a unique key and stores information about a **unique entity**. The file is usually sorted.
-   Normally, the records in the reference file are read randomly as required.

This process of starting from an ID number and using that to access the product file is an example of a lookup path. Lookup paths are implemented in PE using the following files:

-   **RED files**

    RED = Reference Detail File. This file contains the only the important lookup data, and omits other data in the reference file. The RED file can be used in both the extract and format phases.

    For more, see topic "**RED file overview**". A link to this overview is under **Related concepts** below.

-   **REH files**

    REH file = Reference Extract Header file. This file contains links to all relevant RED files in the extract phase.

    For more, see topic "**REH file overview**". A link to this overview is under **Related concepts** below.

-   **RTH files**

    RTH = Reference formaT Header file. This file contains links to all relevant RED files in the format phase.

    For more, see topic "**RTH file overview**". A link to this overview is under **Related concepts** below.


For more on lookups, see the next section below.

## 30 Lookup paths {#30 .section}

A **lookup path** is the method of starting with an ID number in an event file and finding data in a reference file. For more on lookup paths, see these topics:

-   "**Lookup paths overview**",
-   "**Extract phase overview**".
-   "**Format phase overview**".

Links to these overviews are under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

