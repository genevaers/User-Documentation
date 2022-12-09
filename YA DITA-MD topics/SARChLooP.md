# Checklist: Lookup paths {#SARChLooP .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What are lookup paths?](#02)
-   [03 Metadata required](#03)
-   [05 File and PE Job stream requirements](#05)
-   [06 Other requirements](#06)
-   [07 Troubleshooting](#07)

## 02 What are lookup paths? {#02 .section}

See help topic "**Lookup paths overview**". A link to that overviews is under **Related concepts** below.

## 03 Metadata required {#03 .section}

To generate any output in PE, there must be a **view** stored in a **view folder**. In addition, the following metadata items must exist in your SAFR database.

|Metadata|Notes|
|--------|-----|
|Lookup path|The lookup path required|
|Logical records|All source and target logical records for the lookup path required. For an effective date lookup, the source logical record must have a date field that is marked "Start date". Optionally, there can be a date field that is marked "End date". These two dates cannot be part of the primary key of that logical record.|
|Logical files|The logical file for each logical record required|

## 05 File and PE Job stream requirements {#05 .section}

|Phase|Job|Notes|
|-----|---|-----|
|Reference|MR95 Reference Data|Include a DDNAME for each combination of source logical file and logical record for each step in the lookup path. This ensures that MR95 can read the reference data for the lookup path and create the appropriate RED and RTH files for the extract phase.|
|Extract|MR95 Extract Data|The RED files and RTH file must be input to this step.|
|Format|MR88 Format Data|If the lookup path is a Sort Key Title, then the RED files must be input to this step.|

## 06 Other requirements {#06 .section}

|Issue|Notes|
|-----|-----|
|Key for a source logical record that is used in an effective date lookup path.|For an effective date lookup, the source logical record must have a date field that is marked "**Start date**". Optionally, there can be a date field that is marked "**End date**". These two dates **cannot** be part of the primary key of that logical record.|

## 07 Troubleshooting {#07 .section}

See help topic "**Troubleshooting: Lookup paths**". A link to that topic is under **Related reference** below.

**Parent topic:**[PE Checklists](../html/AAR520PMChecklists.md)

