# Stage 5: Design SAFR batch flows {#SATImp05DesBatch .task}

You need the results of stages 1 to 4.

See tasks named "**Stage 1**" to "**Stage 4**". Links are under **Related tasks** below.

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

This task requires detailed knowledge of SAFR features.

For help with PE programs, see these topics

-   **SAFR Overviews**
-   **PE Programs Reference**
-   **PE Utilities Reference**
-   **PE Exits Reference**
-   **PE Sub-Programs Reference**
-   **PE zIIP Reference**
-   **Compiler and Data Types Reference**

Links to the above topics are under **Related reference** below.

For help with SAFR phases, see the topics below:

-   "**Select phase overview**"
-   "**Compile phase overview**"
-   "**Logic phase overview**"
-   "**Reference phase overview**"
-   "**Extract phase overview**"
-   "**Format phase overview**"

Links to the above overviews are under **Related concepts** below.

1.  Identify the IT systems that need SAFR based on the results of Stages 1 and 2.

    For example, the objective may anything from faster reporting to replacing the entire accounting systems to replacing all the IT systems.

2.  Identify the view features required based on the results of Stages 3 and 4.

    For example, if faster reporting access to DB2 is required, the feature required is "DB2 via VSAM" access method.

3.  Identify the batch flows and metadata required to achieve the output and view features required.

    A batch flow is needed for each view or group of views that produces a distinct output.

    The batch flow for a single view includes the following details:

    -   Programs required. See topic "**PE Programs Reference**".

        A link to this guide is under **Related reference** below.

    -   Metadata required \(see below\). See topic "**Metadata overview**".

        A link to this topic is under **Related concepts** below.

    -   Utilities that may be necessary. See "**PE Utilities Reference**".

        A link to this guide is under **Related reference** below.

    -   Exits that may be necessary. See "**PE Exits Reference**".

        A link to this guide is under **Related reference** below.

    -   Careful attention to handling of different data types and the processing of the compiler. See "**Compiler and Data Types Reference**".

        A link to this guide is under **Related reference** below.

    The metadata required covers items such as:

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
4.  Document the batch flows and metadata so that these details are available for later stages.


See task "**Stage 6: Develop metadata using WE**". A link to that overview is under **Related tasks** below.

**Parent topic:**[How to implement SAFR](../html/AAR420ImplementSAFR.md)

