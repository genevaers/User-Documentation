# PE Programs overview {#SACPEAAProg .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Typical PE batch flow](SACPEAAProg.md#10)
-   [20 Table of PE Programs](SACPEAAProg.md#20)
-   [100 Need more on this page?](SACPEAAProg.md#100)

## 10 Typical PE batch flow {#10 .section}

See "**Typical PE batch flow**". A link to that overview is under **Related reference** below.

## 20 Table of PE Programs {#20 .section}

|Program|Notes|Overview under "Related concepts"|
|-------|-----|---------------------------------|
|MR48 VDP XML Importer|This is a utility. Reads a VDP Schema file and some VDP XML files, and updates a SAFR Database.|MR48 VDP XML Importer overview|
|MR71 Reference Report|Produces a report on the REH or RTH file.|MR71 Reference Report overview|
|MR75 VDP to EBCDIC|Translates VDP from ASCII to EBCDIC format.|MR75 VDP to EBCDIC overview|
|MR76 LT to EBCDIC|Translates the JLT or XLT from ASCII to EBCDIC format.|MR76 LT to EBCDIC overview|
|MR77 VDP VSAM Update|MR77 updates the VDP file with details of the relevant VSAM files for DB2 databases involved in a run of PE|MR77 VDP VSAM Update overview|
|MR84 VDP XML Converter|Reads a VDP XML file and creates a z/OS VDP file with fresh compilation of the contents.|MR84 VDP XML Converter overview|
|MR86 VDP Builder|Reads the metadata in a SAFR Database and creates a VDP XML file for the selected views.|MR86 VDP Builder overview|
|MR88 Format|Runs the format phase for one EXT file and an associated SXT file that were created in the extract phase. MR88 \(and the format phase\) may be run multiple times for a single run of PE. Alternatively, MR88 is not run if no format phase is required.|MR88 Format overview|
|MR90 Logic Table Generator|Generates the JLT and XLT from a given VDP file.|MR90 Logic Table Generator overview|
|MR93 Job Scheduler|This is a utility. Allows one job to be dependent on other jobs completing first.|MR93 Job Scheduler overview|
|MR95 Reference and Extract|Does two jobs: either reference data or extract data. The first job requires the JLT file as an input. The second job requires the XLT file as an input.|MR95 Reference and Extract overview|

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

