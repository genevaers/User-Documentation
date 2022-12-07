# Checklist: Reports - multiple reports in one run {#SARChRPT1Multi .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What does "multiple reports in one run" mean?](#02)
-   [03 Metadata required](#03)
-   [04 File and PE Job stream requirements](#04)
-   [07 Troubleshooting](#07)

## 02 What does "multiple reports in one run" mean? {#02 .section}

![](images/PM_multii_reports_01.gif)

This is part of a SAFR approach called "Single-Pass Architecture" aimed at reducing unnecessary processing.

## 03 Metadata required {#03 .section}

The following metadata items must exist in your SAFR database.

|Metadata|Notes|
|--------|-----|
|View01 with ID VV01|Produces Report 1 from a source logical file.|
|View02 with ID VV02|Produces Report 2 from the **same** source logical file.|
|View03 with ID VV03|Produces Report 3 from the **same** source logical file.|
|etc.|etc.|

## 04 File and PE Job stream requirements {#04 .section}

|Job|Notes|
|---|-----|
|MR86 VDP Builder|\(Select phase\). The DDNAME CONFIG contains the following data:```
[VIEW SELECTION]
VIEWID=VV01,VV02,VV03
```

|
|MR95 Extract Data|\(Extract phase\). A DDNAME is required for each view, to contain the output report for each view.|
|MR88 Format Data|\(Format phase\). Run MR88 separately for every report output file created in the extract phase.|

## 07 Troubleshooting {#07 .section}

See help topic "**Troubleshooting: Reports - multiple reports in one run**". A link to that topic is under **Related reference** below.

**Parent topic:**[PE Checklists](../html/AAR520PMChecklists.md)

