# Troubleshooting MR86 {#PERZZMR86 .reference}

## 01 Summary of this topic {#01 .section}

This topic assumes JCL problems are already solved using the IBM JCL standards.

The sections in this topic are as follows:

-   [10 Symptoms](PERZZMR86.md#10)
-   [40 Possible problems](PERZZMR86.md#40)
-   [80 SOLUTIONS](PERZZMR86.md#80)
-   [100 Need this page completed?](PERZZMR86.md#100)

## 10 Symptoms {#10 .section}

|Symptom|Details|Possible problems|
|-------|-------|-----------------|
|Unexpected results from MR86|Examples are:-   VDP XML file contains no data or is not created. The input configuration file appears to request a VDP XML file.
-   MR86 Report data is not present in a dataset specified in the MR86 job step.

|-   Incorrect input parameters

|
|USER ABEND U1099|MR86 report contains:**ERROR: View ID 9999 'View name' is inactive. A view which is inactive cannot be run**

|-   Inactive views selected

|
|USER ABEND U1099|MR86 report contains:**ERROR: No views were found that match the VDP builder configuration settings No VDP file will be created.**

|-   Obsolete input parameters
-   Obsolete PARM options

|
|USER ABEND U1099|MR86 report contains:**ERROR: Build configuration is invalid or failed to connect to the database**

|-   Problem with database connection parameters

|

## 40 Possible problems {#40 .section}

|Possible Problem|Details|Solutions|
|----------------|-------|---------|
|Inactive views selected|MR86 processes only views with status "active". All views specified in VIEWID parameters or the -V PARM option must be status "active".

Ensure that all views in folders specified by FOLDERID and FOLDERNAME parameters or the -F and -N PARM options contain only "active" views.

|-   Activate views
-   Review input parameters
-   Review PARM options

|
|Incorrect input parameters|MR86 will ignore parameters that are misspelled. For example, MR86 ignores a parameter FLE \(instead of FILE\). If MR86 does not produce expected results, check the coding of all parameters in the input configuration file to ensure there are no spelling errors.|-   Review input parameters
-   Review PARM options

|
|Obsolete input parameters|Ensure the input configuration file for MR86 does not contain these parameters:-   **FREQUENCYCODE**
-   **PASSNUMBER**

The above parameters are obsolete and should not be coded. These parameters can prevent MR86 selecting any views to process.|-   Review input parameters

|
|Obsolete PARM options|Ensure MR86 does not contain these PARM options:-   **-Q**
-   **-S**

The above PARM options are obsolete and should not be coded. These options can prevent MR86 selecting any views to process.|-   Review PARM options

|
|Problem with database connection parameters|MR86 could not connect to the SAFR database that contains the views to select. This could mean a problem in either the file DSNAOINI or the input config file or PARM options some combination of these.|-   Review DSNAOINI file
-   Review input parameters
-   Review PARM options

|

## 80 SOLUTIONS {#80 .section}

|Solutions|Details|
|---------|-------|
|Activate Views|Activate selected views using the SAFR Workbench. For help, see the instruction "**Activate the view**" in topic "**Modifying Views**". A link to that topic is under **Related tasks** below.

|
|Review DSNAOINI file|See FAQ topic "**DB2 ODBC parameters**" A link to that topic is under **Related reference** below.

|
|Review input parameters|See section on the input configuration file in topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

|
|Review PARM options|See section on PARM options in topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

|

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Troubleshooting](../html/AAR910PMProgTr.md)

