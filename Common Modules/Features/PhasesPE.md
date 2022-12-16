
# What are GenevaERS phases?

The phases are shown below:

[//]: # (  Comment - fancy image is <img src="../images/PM_All_Progs_10_Thin.gif" alt="Phases of PE" width="300" height="300"/> )

![Phases of PE](../images/PM_All_Progs_10_Thin.gif)


# 1. Logic phase

This phase creates the files needed to run PE.

This phase does the following:

1.  Creates the XLT and JLT files for the selected views.
2.  Translates the VDP file into EBCDIC format \(from ASCII\).
3.  Translates the XLT file into EBCDIC format \(from ASCII\).
4.  Translates the JLT file into EBCDIC format \(from ASCII\).

For more, see these overviews:

-   "**Logic phase overview**"
-   "**Logic tables and codes overview**"
-   "**JLT file overview**"
-   "**VDP file overview**"
-   "**XLT file overview**"


# 2. Reference phase

This phase does the following:

1.  Creates a report of the JLT file which is useful in debugging problems.
2.  Prepares reference file data for processing in the next phase.
3.  Creates a Reference File Creation Control Report \(Extract\)
4.  Creates a Reference File Creation Control Report \(Sort Title\)

For more, see these overviews:

-   "**Reference phase overview**"
-   "**JLT file overview**"
-   "**VDP file overview**"


# 3. Extract phase

This phase does the following:

1.  Creates a report of the XLT file which is useful in debugging problems.
2.  Perform the extract processing, which may be most of the processing done in PE.

For more, see these overviews:

-   "**Extract phase overview**"
-   "**VDP file overview**"
-   "**XLT file overview**"


# 4. Format phase

This phase is optional and formats output files from the extract phase. There can be multiple format phases - one phase per output. file.

For more, see these overviews:

-   "**Format phase overview**"
-   "**VDP file overview**"


