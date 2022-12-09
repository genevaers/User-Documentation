# Stage 2: Analyze existing systems {#SATImp02AnalyzeExist .task}

You need the results of stage 1.

See task "**Stage 1: Define objectives**". A links is under **Related tasks** below.

The documented results of stage 1 cover:

-   The problems identified and the target SAFR solutions.
-   The relevant parts of the IT systems in your company.
-   The savings that are the goal of the implementation of SAFR.

This task requires detailed knowledge of the IT systems in your company. You must be familiar with at least he specific IT systems relevant to SAFR.

1.  Identify the business objectives of these relevant existing IT systems.

    For example, the objective may be "produce necessary accounting reports". This analysis must focus on why the system is required rather than the existing methods used by the system.

2.  Identify how SAFR can achieve the same business objectives.

    For example, entirely new accounting reports may achieve the same result as the old reports. This may change the boundaries of the relevant IT systems involved in the SAFR implementation.

    The SAFR design is at a high level. Examples are as follows:

    -   Sequentially read a DB2 database to produce a report much faster.
    -   Combine data from many different sources to update files and produce a reports faster
    -   Completely replace an accounting reporting cycle with new processing that achieves the same results faster with complete access to details behind figures, and allows recalculation of past accounts quickly and at any time.
3.  Identify the data stores in the relevant existing IT systems.

    The data stores need to be classified into the following choices:

    -   Event files that define business events such as sales.
    -   Reference files that define ongoing data such a products and customers. Reference files can be stored in databases such as DB2.
4.  Identify data fields that are commonly used in the above data stores. These fields may be key fields or attribute fields.

5.  Document the results so that these details are available for later stages.

    The documented results of this stage cover:

    -   The business objectives involved in the relevant parts of the IT systems in your company.
    -   A high level picture of how SAFR can achieve those business objectives.
    -   Any changes the SAFR solutions brings to the list of relevant parts of the IT systems in your company.
    -   Event and reference files available in the relevant existing systems.
    -   Data fields commonly used in those event and reference files.

See task "**Stage 3: Define required outputs**". A link to that overview is under **Related tasks** below.

**Parent topic:**[How to implement SAFR](../html/AAR420ImplementSAFR.md)

