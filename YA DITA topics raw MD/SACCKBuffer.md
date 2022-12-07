# Common Key Buffers overview {#SACCKBuffer .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a large cardinality file?](SACCKBuffer.md#10)
-   [20 What is a Common Key Buffer?](SACCKBuffer.md#20)
-   [40 Example: Complex search](SACCKBuffer.md#40)
-   [60 Components of a Common Key Buffer](SACCKBuffer.md#60)
-   [80 Strengths and weaknesses](SACCKBuffer.md#80)
-   [100 Need more on this page?](SACCKBuffer.md#100)

## 10 What is a large cardinality file? {#10 .section}

Cardinality refers to how many records in a file. For example, if a customer file has 20 million records, then the customer key must allow for at least 20 million unique key values. Large cardinality files create special processing problems, which are addressed by Common Key Buffers.

## 20 What is a Common Key Buffer? {#20 .section}

This is a method to improve SAFR performance when two or more sorted logical files share the same key \(or part of a key\). Common Key Buffers are especially useful for processing large cardinality files.

The best way to understand is with an example. Consider an insurance company situation where the data files are as follows:

-   **Claim** File, with a primary key of Claim Number. This describes who is making a claim and other broad details.
-   **Claim Vehicle** File, with a primary key of Claim Number and a Vehicle Number. This describes the vehicles that are involved in the claim.
-   **Claim Result** File, with a primary key of Claim Number. This describes whether the claimant is at fault and other details.

An example of the data of the three files is below. The Common Key Buffer shows all the records for Claim Number 124. The number of Claim Vehicle records is variable, with at least one per claim.

![Missing Diagram](images/CKB_Data_01.gif)

## 40 Example: Complex search {#40 .section}

SCENARIO: the US Department of Homeland Security receives foreign intelligence reports that a suspect has gained entry to the USA in the last two years. All that is known about the suspect is some information the suspect told to a friend who was overheard bragging about it.

The information is about a strange coincidence when the suspect arrived in the US:

-   The flight number was the same as the day of the month of the flight.
-   The flight number was the same as the seat number for the suspect.
-   The flight number was exactly the same as how many minutes the flight was late.

The challenge is to go through all the flights into the US in the last two years and search for all flights into the USA and find passengers that fit this pattern.

Below is way to use the extract phase to find the solution.

The solution reads three files:

-   Flights file - to provide the scheduled arrival time for a flight \(to calculate the delay in landing\),
-   Arrivals file - to determine if the flight was into the USA and provide actual arrival time for a flight \(to calculate the delay in landing\),
-   Seats file - to provide passenger data for seats \(to find the passengers sitting in seats with the same number as the flight number\).

These three files are read in a technique called a "**Common Key Buffer**". This means that the three files share part of a key - in this case a flight number and the arrival date. The Common Key Buffer coordinates the read of all three files, so that the program MR95 can see the same key value in all three files. For example, flight 123 on a certain date is a common key to all three files. When MR95 can see matching records then MR95 can determine if any passengers meet the search requirements, and write the relevant data to a Suspects file.

![Missing Diagram](images/PMExtFmt_CKB_01.gif)

Below are the processing steps for this complex search. The diagram shows the extract phase and format phase for this complex search.

![Missing Diagram](images/PMExtFmt_CKB_02.gif)

## 60 Components of a Common Key Buffer {#60 .section}

In general, there are at least two source files \(each file may have multiple partitions\). Each source file is sorted into the common key order.

The following are the minimum components to make up a Common Key Buffer:

![Missing Diagram](images/CKB_Concept_02.gif)

## 80 Strengths and weaknesses {#80 .section}

The **strengths** of a common key buffer are:

-   Can handle large cardinality files.
-   Allows high performance lookups because searches are limited to the records in the Common Key Buffer \(rather than to entire files\).
-   Loads into memory only a minimum number of records at a time.
-   Can handle complex groups of logical records.
-   Saves indexed reads \(by using sequential reads\).
-   Can be used in combination with pipes.
-   Can be used in combination with tokens.

The **weaknesses** of a common key buffer are:

-   Calls user exit routines, which have an overhead \(whereas pipes can avoid this overhead\).
-   All reader views are in the same thread as the Common Key Buffer. This can be avoided if one reader view writes to a Pipe, which is read in a different thread.
-   Assumes that the processing for each value of the common key is independent of any other value of the common key.

Overall, a common key buffer is best used when there are one or more large cardinality files, or when pipes or tokens are not practical.

See also topics "**Pipes overview**" and "**Tokens overview**". Links to these overviews are under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

