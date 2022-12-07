# Checklist: Common Key Buffers {#SARChCKB0 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What are Common Key Buffers?](#10)
-   [20 Metadata required](#20)
-   [30 Executable items required](#30)
-   [40 File and PE Job stream requirements](#40)
-   [50 Other requirements](#50)
-   [90 Troubleshooting](#90)
-   [100 Need this page completed?](#100)

## 10 What are Common Key Buffers? {#10 .section}

See help topic "**Common Key Buffers overview**". A link to that overviews is under **Related concepts** below.

## 20 Metadata required {#20 .section}

The following metadata items must exist in your SAFR database.

|Metadata|Notes|
|--------|-----|
|GVBXRCK|This read user-exit routine is installed as part of the SAFR install. This user-exit routine must be defined in SAFR Workbench WE. If your company requires a different name to GVBXRCK then apply the appropriate name where GVBXRCK appears in this help topic.|
|GVBXLCK|This lookup user-exit routine is installed as part of the SAFR install. This user-exit routine must be defined in SAFR Workbench WE. If your company requires a different name to GVBXLCK then apply the appropriate name where GVBXLCK appears in this help topic.|
|Physical files|Each physical file for the Common Key Buffer view needs to have **GVBXRCK** defined as the read exit.|
|Logical records|There are two requirements:1.  All logical records in a Common Key Buffer view need a prefix area of 11 bytes added to the front. The prefix consists of:

    -   Entity ID of 8 bytes
    -   Partition ID of 2 bytes
    -   Category ID or 1 byte
2.  For a lookup in a Common Key Buffer view, the target logical record must have **GVBXLCK** defined as the lookup exit.

|

## 30 Executable items required {#30 .section}

The following items must be installed on your mainframe system running SAFR.

|Executable item|Notes|
|---------------|-----|
|GVBXRCK|This read user-exit routine is installed as part of the SAFR install.|
|GVBXLCK|This lookup user-exit routine is installed as part of the SAFR install.|

## 40 File and PE Job stream requirements {#40 .section}

|Job|Notes|
|---|-----|
|To be completed|To be completed|

## 50 Other requirements {#50 .section}

|Issue|Notes|
|-----|-----|
|To be completed|To be completed|

## 90 Troubleshooting {#90 .section}

See help topic "**Troubleshooting: Common Key Buffers**". A link to that topic is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Checklists](../html/AAR520PMChecklists.md)

