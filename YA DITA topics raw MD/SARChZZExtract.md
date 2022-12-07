# Troubleshooting: Extract phase {#SARChZZExtract .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What is the extract phase?](#02)
-   [03 Troubleshooting - extract phases in general](#03)
-   [04 Troubleshooting - specific techniques](#04)

## 02 What is the extract phase? {#02 .section}

See help topic "**Extract phase overview**". A link to that overviews is under **Related concepts** below.

## 03 Troubleshooting - extract phases in general {#03 .section}

|Issue|What to check|
|-----|-------------|
|Control record fiscal date values|The fiscal date values in a control record normally apply to the views that refer to that control record. A VDP can **override the fiscal date information** supplied by a control record.For more, see section "Differences in information between a view and a VDP" in help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

|
|Digits in numeric fields|**Size of numeric fields**\(either to the left or right of decimal point\) in extract phase does not match the size of the numeric fields defined in the view.This is caused by the VDP overriding the size of numeric fields that are defined in the view.

For more, see section "Differences in information between a view and a VDP" in help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

|
|Extract \(EXT\) files|**The maximum number of EXT files** can be set in MR86 by a parameter in the input configuration file.

In the input configuration file, look under the **\[EXTRACT\]** section for parameter **MAXIMUMFILENUM** which limits the number of EXT files for the VDP created.

That configuration file is detailed in topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

|
|Fiscal date values|The fiscal date values in a control record normally apply to the views that refer to that control record. A VDP can **override the fiscal date information** supplied by a control record.For more, see section "Differences in information between a view and a VDP" in help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

|
|Number of extract \(EXT\) files|**The maximum number of EXT files** can be set in MR86 by a parameter in the input configuration file.

In the input configuration file, look under the **\[EXTRACT\]** section for parameter **MAXIMUMFILENUM** which limits the number of EXT files for the VDP created.

That configuration file is detailed in topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

|
|Numeric fields|**Size of numeric fields** \(either to the left or right of decimal point\) in extract phase does not match the size of the numeric fields defined in the view.This is caused by the VDP overriding the size of numeric fields that are defined in the view.

For more, see section "Differences in information between a view and a VDP" in help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

|

## 04 Troubleshooting - specific techniques {#04 .section}

Links to the "Troubleshooting topics" below are under **Related reference** below.

|Issue|Troubleshooting topics|
|-----|----------------------|
|Aggregate records|"**Troubleshooting: Aggregate Records**"|
|Column value is incorrect|"**Troubleshooting: Column formula**"|
|Common Key Buffers|"**Troubleshooting: Common Key Buffers**"|
|DB2 via VSAM files|"**Troubleshooting: DB2 via VSAM files**"|
|Delimited record files|"**Troubleshooting: Delimited record files**"|
|Exits|"**Troubleshooting: Exits - Read Exits**""**Troubleshooting: Exits - Write Exits**"

"**Troubleshooting: Exits - Format Exits**"

"**Troubleshooting: Exits - Lookup Exits**"

|
|Format Exits|"**Troubleshooting: Exits - Format Exits**"|
|Lookup Exits|"**Troubleshooting: Exits - Lookup Exits**"|
|Limit records read or written|"**Troubleshooting: Limit Records Read or Written**"|
|Lookup paths|"**Troubleshooting: Lookup paths**"|
|Pipes|"**Troubleshooting: Pipes**"|
|Read Exits|"**Troubleshooting: Exits - Read Exits**"|
|Reports|"**Troubleshooting: Reports - multiple reports in one run**""**Troubleshooting: Reports with sub-totals**"

|
|Select records|"**Troubleshooting: Select input records**""**Troubleshooting: Select output records**"

|
|Sorting|"**Troubleshooting: Sorting**"|
|Tokens|"**Troubleshooting: Tokens**"|
|Variable length records|"**Troubleshooting: Variable length records**"|
|View using source record|"**Troubleshooting: View using source record structure**"|
|Write Exits|"**Troubleshooting: Exits - Write Exits**"|
|Zero value suppression|"**Troubleshooting: Zero Value Record Suppression**"|
|zIIP|"**Troubleshooting: zIIP**"|

**Parent topic:**[PE Checklist Troubleshooting](../html/AAR905PMChecklistTr.md)

