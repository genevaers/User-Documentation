# Troubleshooting MR90 {#PERZZMR90 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Symptoms](PERZZMR90.md#10)
-   [40 Possible problems](PERZZMR90.md#40)
-   [80 Solutions](PERZZMR90.md#80)
-   [100 Need this page completed?](PERZZMR90.md#100)

## 10 Symptoms {#10 .section}

|Symptom|Details of symptom|Possible problems|
|-------|------------------|-----------------|
|No views in output VDP|MR90 output VDP has no views.|MR90 excluded all views|
|Output XLT file is empty or very short|MR90 output XLT file may be empty, have only two instructions or something similar.|MR90 excluded all views|
|**USER ABEND U1099** from step after MR90or **return code 02** from MR90 step

|SYSOUT contains these messages:

```
**GVBMR90: too many arguments given.** 
```

|Missing or incorrect PARM options for MR90|
|Wrong views in output VDP|The output VDP file contains more views than required.|MR90 did not correctly exclude views|

## 40 Possible problems {#40 .section}

|Problem|Details of problem|Solutions|
|-------|------------------|---------|
|Missing or incorrect PARM options for MR90|Even if the SYSOUT error message says 'too many arguments given", it may be that a required PARM option is missing. Alternatively, an incorrect PARM option may be encoded.|Review PARM options|
|MR90 did not correctly exclude views|The input config file for MR90 does not contain the appropriate VIEWID and/or FOLDERID parameters. These parameters must be under the section \[VIEWS TO RUN\], be spelled correctly, and refer to relevant id numbers that are already in the input VDP file.|Review input parameters|
|MR90 excluded all views|MR90 coded some VIEWID and/or FOLDERID parameters in the input config file, and this resulted in no views being selected by MR90. This can occur if the values for these two parameters do not refer to values that are already in the input VDP file.|Review input parameters|

## 80 Solutions {#80 .section}

|Solution|Details of solution|
|--------|-------------------|
|Review input parameters|See section on the input configuration file in topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.

|
|Review PARM options|See section on the PARM options in topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.

|

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Troubleshooting](../html/AAR910PMProgTr.md)

