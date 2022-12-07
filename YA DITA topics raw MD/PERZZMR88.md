# Troubleshooting MR88 {#PERZZMR88 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Symptoms](PERZZMR88.md#10)
-   [40 Possible problems](PERZZMR88.md#40)
-   [80 Solutions](PERZZMR88.md#80)
-   [100 Need this page completed?](PERZZMR88.md#100)

## 10 Symptoms {#10 .section}

|Symptom|Details of symptom|Possible problems|
|-------|------------------|-----------------|
|MR88 **return code = 0008** and the MR88 Report has: **GVBMR88 \(67\) "VDP" TABLE OVERFLOW**

|This is the entire contents of the MR88 report.|VDP size too small|

## 40 Possible problems {#40 .section}

|Problem|Details of problem|Solutions|
|-------|------------------|---------|
|VDP size too small|MR88 needs more memory to store the VDP file.|Increase VDP size|

## 80 Solutions {#80 .section}

|Solution|Details of solution|
|--------|-------------------|
|Increase VDP size|Increase the value for MR88 PARM option **VDPTBLMX**. See topic "**Program Runbook: MR88 Format Data**" in the section on PARM options. A link to that topic is under **Related reference** below.|

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Troubleshooting](../html/AAR910PMProgTr.md)

