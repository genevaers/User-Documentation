# Stage 3: Define required outputs {#SATImp03DefOutputs .task}

You need the results of stages 1 to 2.

See tasks named "**Stage 1**" and "**Stage 2**". Links are under **Related tasks** below.

The documented results of this stage cover:

-   The business objectives involved in the relevant parts of the IT systems in your company.
-   How SAFR can achieve those business objectives.
-   Any changes the SAFR solutions brings to the list of relevant parts of the IT systems in your company.
-   Event and reference files available in the relevant existing systems.
-   Data fields commonly used in those event and reference files.

This task requires detailed knowledge of the IT systems in your company. You must be familiar with at least he specific IT systems relevant to SAFR.

1.  Define the SAFR outputs required to meet the business objectives.

    SAFR outputs may match the existing systems and run simply run faster, or may achieve the same business objectives using different processing to existing systems. The SAFR outputs need to consider the following issues:

    -   Event and reference files existing, and what new event and reference files may be necessary for the new SAFR processing.
    -   Hardware and software infrastructure. For example, zIIP processing may be a new hardware feature that SAFR leverages to achieve both faster results and lower processing costs.
    -   User-exit routines which provide tailored processing. Exits can be written by IBM or written by your company.
2.  Document the SAFR outputs required so that these details are available for later stages.

    The documented results of this stage cover:

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

See task "**Stage 4: Define available inputs**". A link to that overview is under **Related tasks** below.

**Parent topic:**[How to implement SAFR](../html/AAR420ImplementSAFR.md)

