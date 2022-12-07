# Stage 7: Run PE to get results {#SATImp07RunPM .task}

You must already have completed Stages 1 to 6.

Links to Stages 1 to 6 are under **Related tasks** below.

The documented results of stage 1 cover:

-   The problems identified and the target SAFR solutions.
-   The relevant parts of the IT systems in your company.
-   The savings that are the goal of the implementation of SAFR.

The documented results of stage 2 cover:

-   The business objectives involved in the relevant parts of the IT systems in your company.
-   How SAFR can achieve those business objectives.
-   Any changes the SAFR solutions brings to the list of relevant parts of the IT systems in your company.
-   Event and reference files available in the relevant existing systems.
-   Data fields commonly used in those event and reference files.

The documented results of stage 3 cover:

-   The output files required for the SAFR solution to work. This includes details such as:
    -   Type of output \(flat file or hardcopy report\). There may also be more than one file produced.
    -   SAFR techniques such as pipes and tokens that speed benefits for processing.
    -   Data fields involved.
    -   Key fields and sorting requirements.
    -   Timing of producing the output file. This covers the length of the processing time and when the file is required.
-   The processing for each data field that must be complete in those output files. This covers issues such as:
    -   Description of the contents,
    -   Data type and format,
    -   Aggregation of values in reports,
    -   Suppression of zero values in some cases,
    -   Fill characters for some report fields,
    -   Selection of input or output records,
    -   Header and footerrequirements for reports,
    -   Special formatting, such as page breaks and key value changes in reports,
    -   Special processing such as encryption, decryption, compression and decompression requirements.

The documented results of stage 4 cover:

-   The particular SAFR output that requires that input file.
-   The input files itself. This includes details such as:
    -   Type of input \(flat file or database\).
    -   Data fields involved.
    -   Key fields and sorting requirements.
    -   Timing of accessing the input This covers the length of the processing time and when the file is available.
-   The processing for each data field that must be complete in those input files. This covers issues such as:
    -   Description of the contents,
    -   Data type and format,
    -   Aggregation of values,
    -   Suppression of zero values in some cases,
    -   Selection of input records,
    -   Special processing such as encryption, decryption, compression and decompression requirements.

The documented results of stages 5 and 6 cover:

-   A batch flow for each view or group of views that produces a distinct output. Each batch flow includes the following
    -   Programs required.
    -   Metadata required \(see below\).
    -   Utilities that may be necessary.
    -   Exits that may be necessary.
    -   Careful attention to handling of different data types and the processing of the compiler.
-   The metadata required covers items such as:
    -   **Environments** to contain all the items above in logical collections, such as **Sales** or **Accounts\_Receivable**.
    -   **Global fields** to describe common fields of data in the mainframe systems in your company. For example, a customer identification number might be a global field.
    -   **Physical files** to describe actual datasets on the mainframe systems in your company.
    -   **User-exit routines** to performs some unique and necessary computing task specifically for your company.
    -   **Logical records** to describe record layouts for logical files.
    -   **Logical files** to describe collections of input and output data.
    -   **View folders** to contain collections of views.
    -   **Control records** to control how a view processes data.
    -   **Lookup paths** to describe how one or more source files can lookup a target file by using fields of data.
    -   **Views** to describe the results that SAFR must produce.

All these details of programs, utilities and exits required for PE should already be known - see the results of previous stages mentioned under heading "**Before you begin**" above.

1.  Check you have all the details and understanding mentioned under headings "**Before you begin**" and "**About this task**" above.

2.  Go to task "**Stage 7.1: Run PE**".

    A link to that task is under **Related tasks** below.


See task "**Stage 7.2: Analyze PE results**". A link to that task is under **Related tasks** below.

**Parent topic:**[How to implement SAFR](../html/AAR420ImplementSAFR.md)

