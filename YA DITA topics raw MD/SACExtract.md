# Extract phase overview {#SACExtract .concept}

## 01 Summary of this topic {#01 .section}

**Basics** for the extract phase:

-   [02 Basics of extract phase](SACExtract.md#02)

**Writing output files** in the extract phase:

-   [10 Writing output files in the extract phase](SACExtract.md#10)
-   [20 Implicit WRITE function](SACExtract.md#20)
-   [25 Explicit WRITE function](SACExtract.md#25)
-   [30 Logic text for the extract phase](SACExtract.md#30)
-   [35 WRITE of a particular file](SACExtract.md#35)
-   [40 WRITE when reading input records](SACExtract.md#40)
-   [45 WRITE when an output record is not yet complete](SACExtract.md#45)

**Examples of processing** in the extract phase:

-   [60 Example: Simple Report](SACExtract.md#60)
-   [62 Example: Simple Update](SACExtract.md#62)
-   [64 Example: Common Key Buffer](SACExtract.md#64)
-   [66 Example: Pipe](SACExtract.md#66)
-   [68 Example: Token](SACExtract.md#68)
-   [70 Example: Aggregation in the extract phase](SACExtract.md#70)

**Setup** for an extract phase:

-   [80 How to setup an extract phase](SACExtract.md#80)

The last section is:

-   [100 Need this page completed?](SACExtract.md#100)

## 02 Basics of extract phase {#02 .section}

![](images/PM_5Extr_Progs_01.gif)

The extract phase is the fifth phase of PE, and consists of these programs.

-   **UT90** .
-   **MR95** .

This phase does the following:

1.  Creates a report of the XLT file which is useful in debugging problems.
2.  Perform the extract phase processing, which may produce most of the SAFR results for the selected views in the VDP.

The extract phase processing is done by MR95 as follows

-   Inputs:
    -   VDP file
    -   **XLT file** \(effectively, this file "drives" the extract phase\)
    -   RED files
    -   REH files
    -   Source files, which are either event or reference files
-   Outputs:
    -   **EXT files** \(optional\)
    -   **SXT files** \(optional\)
    -   **View output files** \(optional\)
    -   **MR95 Report**
    -   **MR95 Trace** \(optional\)

For more, see these overviews:

-   "**Event and Reference files overview**",
-   "**EXT file overview**"
-   "**Logic tables and codes overview**"
-   "**MR95 Reference and Extract overview**"
-   "**RED file overview**"
-   "**REH file overview**"
-   "**SAFR phases overview**"
-   "**SXT file overview**"
-   "**UT90 Logic Table Report overview**"
-   "**VDP file overview**"
-   "**View output file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

## 10 Writing output files in the extract phase {#10 .section}

The two most important output files in the extract phase are the EXT files and the view output files:

![](images/PMExt_Out_Types_01.gif)

There are two methods to write the above files:

-   The **implicit WRITE function**. This is automatically provided by MR95 and you can decide the output file\(s\) that are created. See section [20 Implicit WRITE function](SACExtract.md#20)
-   The **explicit WRITE function** in logic text for the extract phase. The logic text possible for the extract phase is Extract Record Filter and Extract Column Assignment. You have more control over any explicit WRITE functions than for the implicit WRITE. For more, see section [25 Explicit WRITE function](SACExtract.md#25)

## 20 Implicit WRITE function {#20 .section}

The implicit WRITE function is an automatic output of data in MR95 in the extract phase.

MR95 in the extract phase reads input files one record at a time. The write occurs when all processing for a view for a particular input record is complete.

The data is written to either an EXT file or to a view output file, and the view controls this choice as follows:

|Type of output file|Data in "View Properties, General tab" of view|
|-------------------|----------------------------------------------|
|EXT|**Flat file, Fixed-Length Fields, Use Format Phase**|
|EXT|**Hardcopy Report**|
|View output file|\(Any other values\)|

If the implicit WRITE is writing to an EXT file, the particular EXT file is given in field **Extract Work File Number** on the "**View Properties, Extract Phase tab**". If you specify blank or zero in this field, then MR95 writes records to each EXT file one after the other - called "round robin". This method makes the EXT files approximately equal in size.

For details of the screens, see these topics:

-   "**Edit View \(View Properties, General tab\) screen help**",
-   "**New View \(View Properties, General tab\) screen help**",
-   "**Edit View \(View Properties, Extract Phase tab\) screen help**",
-   "**New View \(View Properties, Extract Phase tab\) screen help**".

Links to these topics are under **Related reference** below.

## 25 Explicit WRITE function {#25 .section}

An explicit WRITE is a WRITE function that you have coded in logic text for the extract phase. The types of logic text for the extract phase are given in section [30 Logic text for the extract phase](SACExtract.md#30).

Examples of an explicit WRITE are described in these sections:

-   [35 WRITE of a particular file](SACExtract.md#35)
-   [40 WRITE when reading input records](SACExtract.md#40)
-   [45 WRITE when an output record is not yet complete](SACExtract.md#45)

## 30 Logic text for the extract phase {#30 .section}

The extract phase allows two types of logic text:

-   **Extract Record Filter**. This logic text allows selecting input records, instead of processing every input record.

    For more details, see "**Logic text 1: Extract Record Filter overview**". A link to that overview is under **Related concepts** below.

-   **Extract Column Assignment**. This logic text allows using a formula to calculate a value for a column in the output file.

    For more details, see "**Logic text 2: Extract Column Assignment overview**". A link to that overview is under **Related concepts** below.


## 35 WRITE of a particular file {#35 .section}

This section covers writing output records to a particular output file. This can be for any purpose required for the view.

This is an explicit WRITE because you must code a WRITE statement in Extract Column Assignment logic text. See the following topics:

-   Topic "**Logic text 2: Extract Column Assignment overview**". The WRITE statement is the most important part of this logic text.

    A link to that overview is under **Related concepts** below.

-   Topic "**Syntax: WRITE statements in Extract Column Assignment**".

    A link to that overview is under **Related reference** below.


## 40 WRITE when reading input records {#40 .section}

This section covers writing input records to an output file. This can be useful as a trace or a backup.

This is an explicit WRITE because you must code a WRITE statement in Extract Record Filter logic text. This type of explicit WRITE is always to a view output file.

See the following topics:

-   Topic "**Logic text 1: Extract Record Filter overview**". The WRITE statement is the most important part of this logic text.

    A link to that overview is under **Related concepts** below.

-   Topic "**Syntax: WRITE statements in Extract Record Filter**".

    A link to that overview is under **Related reference** below.


## 45 WRITE when an output record is not yet complete {#45 .section}

This section covers writing an output record that is incomplete to a different view output file. For example, if the primary output file has 20 fields, you can choose to write that record when only 10 of the fields are completed in a record. The short record forms a different view output file. This can be useful as a trace or a backup.

This is an "explicit" write because you must code a WRITE statement in Extract Column Assignment logic text. See the following topics:

-   Topic "**Logic text 2: Extract Column Assignment overview**". The WRITE statement is the most important part of this logic text.

    A link to that overview is under **Related concepts** below.

-   Topic "**Syntax: WRITE statements in Extract Column Assignment**".

    A link to that overview is under **Related reference** below.


## 60 Example: Simple Report {#60 .section}

Below is a typical reporting program:

![](images/PMExtFmt_Report_01.gif)

Below are the processing steps for this report example.

![](images/PMExtFmt_Report_02.gif)

Below is a summary of the SAFR terms involved:

![](images/PMExtFmt_Report_03.gif)

These are SAFR terms used here:

-   An "**Event**" file is a SAFR term for input files of transactions such as sales. There is usually at least one event file when running the Performance Engine.

    For more, see topic "**Event and Reference files overview**". A link to that overview is under **Related concepts** below.

-   A "**Reference**" file is a SAFR term for input files of information about some entity such a product or customer. Each entity has a unique identifier, such as Intl\_Currency. There is usually at least one reference file when running the Performance Engine. There can be one or many such reference files.

    For more, see topic "**Event and Reference files overview**". A link to that overview is under **Related concepts** below.

-   A **lookup path** is the method of starting with an ID number in an event file and finding data in a reference file. For more on lookup paths, event files and reference files, see these topics:

    -   "**Lookup paths overview**",
    -   "**Event and Reference files overview**",
    Links to these overviews are under **Related concepts** below.


## 62 Example: Simple Update {#62 .section}

Below is a typical update program, that changes currency amounts into US dollars.

![](images/PMExtFmt_Update_01.gif)

Below are the processing steps for this update example.

![](images/PMExtFmt_Update_02.gif)

Below is a summary of the SAFR terms involved:

![](images/PMExtFmt_Update_03.gif)

These are SAFR terms used here:

-   An "**Event**" file is a SAFR term for input files of transactions such as sales. There is usually at least one event file when running the Performance Engine.

    For more, see topic "**Event and Reference files overview**". A link to that overview is under **Related concepts** below.

-   A "**Reference**" file is a SAFR term for input files of information about some entity such a product or customer. Each entity has a unique identifier, such as Intl\_Currency. There is usually at least one reference file when running the Performance Engine. There can be one or many such reference files.

    For more, see topic "**Event and Reference files overview**". A link to that overview is under **Related concepts** below.

-   A **lookup path** is the method of starting with an ID number in an event file and finding data in a reference file. For more on lookup paths, event files and reference files, see these topics:

    -   "**Lookup paths overview**",
    -   "**Event and Reference files overview**",
    Links to these overviews are under **Related concepts** below.


## 64 Example: Common Key Buffer {#64 .section}

This section describes a complex computing problem, and how a technique called a "common key buffer" can provide a solution.

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

![](images/PMExtFmt_CKB_01.gif)

Below are the processing steps for this complex search.

![](images/PMExtFmt_CKB_02.gif)

Below is a summary of the SAFR terms involved:

![](images/PMExtFmt_CKB_03.gif)

The terms "XRCK", "prefix" and "transactional" input file are discussed in topic "**Common Key Buffers overview**". A link to that overview is under **Related concepts** below.

## 66 Example: Pipe {#66 .section}

This section describes a complex reporting problem, and how a technique called a "pipe" can provide a solution.

SCENARIO: one sales file produces at least six reports, and the reports require data from other files. The Sales file has only ID numbers for products and customers for example, and the actual product names, product category names, customer names and customer category names are required.

![](images/PMExtFmt_Pipe_01.gif)

The solution is a **pipe**, which is a special type of logical file that has a single physical file. The complex lookups required are performed, and relevant data is written in records to the pipe. The reports read the pipe records, and generate the reports while new pipe records are still being written.

Below are the processing steps for this complex reporting.

![](images/PMExtFmt_Pipe_02.gif)

Below is a summary of the SAFR terms involved:

![](images/PMExtFmt_Pipe_03.gif)

The terms "pipe", "pipe view" and "reader view" are discussed in topic "**Pipes overview**". A link to that overview is under **Related concepts** below.

## 68 Example: Token {#68 .section}

This section describes a complex reporting problem, and how a technique called a "token" can provide a solution.

SCENARIO: a hospital want many reports involving patient, diagnosis and treatment records. The data fields in the reports may change at any time in an unpredictable way, depending on the medical issues at the time. The input files and the minimum lookups are shown below.

![](images/PMExtFmt_Token_01.gif)

The solution is a **token**, which is a special type of logical file. The complex lookups required are performed, and relevant data is written in records to the token. Once the token record is written, the reports immediately process that record.

Below are the processing steps for this complex reporting.

![](images/PMExtFmt_Token_02.gif)

Below is a summary of the SAFR terms involved:

![](images/PMExtFmt_Token_03.gif)

The terms "token", "token view" and "reader view" are discussed in topic "**Tokens overview**". A link to that overview is under **Related concepts** below.

## 70 Example: Aggregation in the extract phase {#70 .section}

To be completed.

## 80 How to setup an extract phase {#80 .section}

A view always has an extract phase. You must configure the extract phase for each particular view.

Critical issues are:

To **setup the extract phase in the workbench**, see these tasks:

-   "**Creating views**",
-   "**Modifying views**".

Links to these topics are under **Related tasks** below.

To **setup the extract phase to run in PE**, see these reference topics:

-   "**Checklist: Extract phase**",
-   "**Program Runbook: MR95 Extract Data**".

Links to these topics are under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

