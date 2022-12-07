# Checklist: Partition a physical file {#SARChPartition .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What does "partition a physical file" mean?](#02)
-   [03 Why are partitions an advantage?](#03)
-   [04 Metadata required](#04)
-   [05 File and PE Job stream requirements](#05)
-   [07 Troubleshooting](#07)

## 02 What does "partition a physical file" mean? {#02 .section}

See help topic "**Parallelism overview**" for the sections on Physical File Partitions. A link to that overviews is under **Related concepts** below.

## 03 Why are partitions an advantage? {#03 .section}

![](images/PM_partitions_01_Before_SAFR.gif)

![](images/PM_partitions_02_SAFR.gif)

## 04 Metadata required {#04 .section}

The following metadata items must exist in your SAFR database.

|Metadata|Notes|
|--------|-----|
|View|View that uses Logical File PARTS \(the logical file can be any name\).|
|Logical File PARTS|This logical file is the collection of the partitions \(each a physical file\). This logical file can be any name.|
|Physical File PART01|Partition 01 of the physical file. The physical files that are the partitions can be any name.|
|Physical File PART02|Partition 02 of the physical file. The physical files that are the partitions can be any name.|
|etc.|etc.|

## 05 File and PE Job stream requirements {#05 .section}

|Requirement|Notes|
|-----------|-----|
|Partition the physical file|Ensure that the physical file has been split into partitions.See help topic "**Parallelism overview**" for the sections on Physical File Partitions. A link to that overviews is under **Related concepts** below.

|
|Run the view|PE automatically runs multiple copies of the view so that a single output file by running the partitions in parallel.|

## 07 Troubleshooting {#07 .section}

See help topic "**Troubleshooting: Partition a physical file**". A link to that topic is under **Related reference** below.

**Parent topic:**[PE Checklists](../html/AAR520PMChecklists.md)

