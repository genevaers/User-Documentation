# Troubleshooting: Lookup paths {#SARChZZLooP .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What are lookup paths?](#02)
-   [03 Troubleshooting Checks](#03)
-   [04 Other relevant troubleshooting topics](#04)

## 02 What are lookup paths? {#02 .section}

See help topic "**Lookup paths overview**". A link to that overviews is under **Related concepts** below.

## 03 Troubleshooting Checks {#03 .section}

|Issue|What to check|
|-----|-------------|
|MR90 in the logic phase|When MR90 completes, the JLT file must not be empty,|
|UT90 in the reference phase|When UT90 completes, the JLT Report must show the required lookup path.|
|MR95 in the reference phase|When MR95 completes, RED files are created, and an RTH file is created if a format phase is required.|
|MR95 in the extract phase|If the lookup path runs in the extract phase, then the output from this step contains the results.|
|MR88 in the format phase|If the lookup path is a Sort Key Title, then the correct titles are present in the hardcopy output.|

## 04 Other relevant troubleshooting topics {#04 .section}

Your problem may be solved by considering the following troubleshooting topics:

-   Section "**Troubleshooting - extract phases in general**" in topic "**Troubleshooting: Extract phase**".

    A link to that topic is under **Related reference** below.


**Parent topic:**[PE Checklist Troubleshooting](../html/AAR905PMChecklistTr.md)

