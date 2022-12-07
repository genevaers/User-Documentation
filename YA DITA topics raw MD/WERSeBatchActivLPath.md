# Batch Activate Lookup Paths errors {#WERSeBatchActivLPath .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Display of errors](WERSeBatchActivLPath.md#02)
-   [10 Example Fail messages](WERSeBatchActivLPath.md#10)
-   [20 Example Load Error messages](WERSeBatchActivLPath.md#20)

## 02 Display of errors {#02 .section}

The column **Result** displays **Pass** or **Fail** or **Load Error**. This indicates the success of the batch activation.

-   **Pass** - means the lookup path is active and ready for use.
-   **Fail** - means the lookup path is inactive. Click on the word **Fail** to highlight that row. The Errors section displays the problems with that lookup path. See Section "**Example Fail messages**" below.
-   **Load Error** - means one or more logical records are inactive. These logical records are necessary for the lookup path. Click on the word **Load Error** to highlight that row. The Errors section displays the inactive logical records causing the problem. See section "**Example Load Error messages**" below.

## 10 Example Fail messages {#10 .section}

|Message|Solution|
|-------|--------|
|The primary key is not matched properly for step \(value on screen\).|The lookup path does not correctly prepare a primary key in the given step. Modify this step in the lookup path to ensure the length and content of the primary key matches the target logical record for this step.|

## 20 Example Load Error messages {#20 .section}

|Message|Solution|
|-------|--------|
|Logical Record Name \[ID\]|The given logical record name and id is inactive. This logical record must be active for the lookup path to be activated. Modify the given logical record to ensure it is active and then retry the activation of this lookup path.|

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

