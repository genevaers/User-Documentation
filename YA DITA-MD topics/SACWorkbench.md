# Workbench overview {#SACWorkbench .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Introduction](SACWorkbench.md#02)
-   [10 What do I use the workbench for?](SACWorkbench.md#10)
-   [20 How do I login to the workbench?](SACWorkbench.md#20)
-   [30 How do I use the screens in the workbench?](SACWorkbench.md#30)
-   [40 Keyboard shortcuts in the workbench](SACWorkbench.md#40)
-   [50 Virtualization for the workbench](SACWorkbench.md#50)
-   [80 How do I optimize SAFR?](SACWorkbench.md#80)
-   [100 Need more on this page?](SACWorkbench.md#100)

## 02 Introduction {#02 .section}

![](images/splash_02.bmp)

The **SAFR Workbench** is software that you use to configure SAFR in order to do work.

The SAFR Workbench software runs on a PC and communicates to the mainframe computers in your company.

The SAFR Workbench can also be called **WE** which stands for **Workbench Eclipse.**

**Eclipse** refers to a programming platform that was invented by IBM and is now free and open source software.

In 2010, IBM upgraded the original SAFR **Windows Workbench \(WW\)** software to use Eclipse, and added greater functionality.

## 10 What do I use the workbench for? {#10 .section}

Use the workbench to configure SAFR by configuring metadata. Metadata covers the following items:

-   Users \(meaning general users, environment administrators and system administrators\),
-   Groups,
-   Environments,
-   Physical Files,
-   Logical Files,
-   Logical Records,
-   Global Fields,
-   Control Records,
-   User-Exit Routines,
-   View Folders,
-   Views,
-   Lookup Paths.

For more, see topic "**Metadata overview**". A link to this overview is under **Related concepts** below.

## 20 How do I login to the workbench? {#20 .section}

For instructions on how to start the workbench software, see your system administrator.

To login, see topic "**Logging into the SAFR Workbench**". A link to this topic is under **Related tasks** below.

## 30 How do I use the screens in the workbench? {#30 .section}

See topic "**Basics of using the SAFR Workbench**" for details. A link to this topic is under **Related reference** below.

## 40 Keyboard shortcuts in the workbench {#40 .section}

See topic "**What are the keyboard shortcuts?**" for details.

A link to this topic is under **Related reference** below.

## 50 Virtualization for the workbench {#50 .section}

Virtualization means the workbench can be installed on a server so that multiple workstations can run using the server copy of the software, for example using Citrix.

Virtualization uses three Windows user profiles:

-   **Local Profile area**



    The path to the Local Profile area for the workbench depends on the version of Windows:

    -   In **Windows XP**, the path is "**C:\\Documents and Settings\\<user\>\\Local Settings\\Application Data\\SAFR\\Workbench Eclipse**".
    -   In **Windows 7**, the path is "**C:\\Users\\<user\>\\AppData\\Local\\SAFR\\Workbench Eclipse**".
    The Local Profile area stores potentially large files of data. If required, the workbench automatically creates these sub-folders:

    -   **csv folder** containing CSV files of exported dependency checker reports
    -   **log folder** containing log files about workbench sessions
    -   **pdf folder** containing PDF reports
    -   **workspace folder** containing Eclipse RCP work files for running the workbench
    -   **xml folder** containing XML files of exported metadata.
-   **Roaming Profile area**



    The path to the Roaming Profile area for the workbench depends on the version of Windows:

    -   In **Windows XP**, the path is "**C:\\Documents and Settings\\<user\>\\Application Data\\SAFR\\Workbench Eclipse**".
    -   In **Windows 7**, the path is "**C:\\Users\\<user\>\\AppData\\Roaming\\SAFR\\Workbench Eclipse**".
    The Roaming Profile area stores data that is mirrored on the Windows Domain server.

    The Roaming Profile area stores the following unique data for that user:

    -   Values entered by the user on the SAFR Connection Manager screen.
    -   Any user updates to the WE log file path.

        For more on WE log files, see topic "**WE log file overview**". A link to this topic is under **Related concepts** below.

    -   The user choice for Old Compiler during login.
    -   The User ID for the last login to the workbench.
    -   The views recently accessed by the user.
    Any user can create/delete/modify a local database connection name, or can modify/default a global database connection name.

    For more on database connection names, see topic "**SAFR Connection Manager screen help**". A link to this topic is under **Related reference** below.

-   **All Users Profile area**

    This is a profile area on the server used for virtualization. The path to the All Users Profile area for the workbench depends on the version of Windows:

    -   In **Windows XP**, the path is "**C:\\Documents and Settings\\All Users\\Application Data\\SAFR\\Workbench Eclipse**".
    -   In **Windows 7**, the path is "**C:\\ProgramData\\SAFR\\Workbench Eclipse**".
    The All Users Profile area optionally stores default data for all users of the workbench.


## 80 How do I optimize SAFR? {#80 .section}

See topic "**SAFR optimization overview**" for details. This assumes you have read all other overviews and are familiar with SAFR overall.

A link to this topic is under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

