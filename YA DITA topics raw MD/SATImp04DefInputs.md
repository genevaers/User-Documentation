# Stage 4: Define available inputs {#SATImp04DefInputs .task}

You need the results of stages 1 to 3.

See tasks named "**Stage 1**" to "**Stage 3**". Links are under **Related tasks** below.

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

This task requires detailed knowledge of the IT systems in your company. You must be familiar with at least he specific IT systems relevant to SAFR.

1.  Review the SAFR outputs identified in the previous stage. These imply the input data that is required for SAFR.

    The requirements include timing issues, such as when the input is available and when the output is required.

2.  Identify the existing event and reference files, and what new event and reference files may be necessary for the new SAFR processing.

3.  Define the SAFR inputs required to meet the business objectives.

    SAFR inputs may be existing files, or may combine existing data in new files. The SAFR inputs need to consider the following issues:

    -   Hardware and software infrastructure. For example, DB2 data can be accessed sequentially faster than by SQL queries.
    -   User-exit routines which provide tailored processing. Exits can be written by IBM or written by your company.
4.  Document the SAFR inputs required so that these details are available for later stages.

    The documented results of this stage cover:

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

See task "**Stage 5: Design SAFR batch flows**". A link to that overview is under **Related tasks** below.

**Parent topic:**[How to implement SAFR](../html/AAR420ImplementSAFR.md)

