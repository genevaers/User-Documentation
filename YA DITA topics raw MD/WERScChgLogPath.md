# Change Log Path screen help {#WERScChgLogPath .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Screen function and rights](WERScChgLogPath.md#02)
-   [05 Errors](WERScChgLogPath.md#05)
-   [10 Action on this screen](WERScChgLogPath.md#10)
-   [99 Keyboard Shortcuts](WERScChgLogPath.md#99)

## 02 Screen function and rights {#02 .section}

![](images/Chg_Log_Path_01.gif)

Use this screen to specify a path to the WE log file. This new path applies only to your current User ID to WE.

For an introduction to the WE log file, see topic "**WE log file overview**"

A link to that overview is under "**Related concepts**" below.

This screen is available to all users of the workbench.

## 05 Errors {#05 .section}

There are no workbench errors displayed on this screen.

## 10 Action on this screen {#10 .section}

When this screen displays for the first time, the screen shows the existing log file path. This screen is similar to Windows Explorer, and navigation on this screen works the same way. If viewing the existing log path is sufficient, then press Cancel.

To change the log file path, use one of the following methods:

-   **EITHER** navigate to an existing folder. The right click options of Windows Explorer are available. Scroll down to access **Computer** and **Network** to select a drive letter on this computer or a remote computer.
-   **OR** in the Folder field type the full path to an existing folder. For example, type "**C:\\Log**" \(without the quotes\). If the folder specified in this field does not exist, then this field is ignored and clicking OK results in no change to the log file path. If the folder specified does exist, then that folder becomes the new log file path after clicking OK.
-   **OR**navigate to an existing folder and click the **Make New Folder** button to create a new sub-folder under the current folder. Type the name of the new sub-folder and press enter. This can be repeated to create further sub-folders.

When the new path is highlighted, click OK to save. When the log file path changes, the existing log is transferred to the new path and no log file data is lost for that session. Log files for completed sessions are untouched by this process.

This screen was called from the task topic "**Changing Log Path**".

A link to that topic is under "**Related tasks**" below.

## 99 Keyboard Shortcuts {#99 .section}

See section "**10 Shortcuts: All workbench screens**" in topic "**What are the keyboard shortcuts?**" .

A link to this topic is under **Related reference** below.

**Parent topic:**[Workbench Screen help](../html/AAR586WEScreens.md)

