# Troubleshooting MR95 {#PERZZMR95 .reference}

## 01 Summary of this topic {#01 .section}

Do the following in this topic:

1.  Lookup your error message in section [10 MR95 error messages](PERZZMR95.md#10) or in section [20 Other symptoms](PERZZMR95.md#20).
2.  If the above sections identify a solution, see section [80 Solutions](PERZZMR95.md#80).

    If the above sections identify possible problems, see section [40 Possible problems](PERZZMR95.md#40).


The sections in this topic are as follows:

-   [10 MR95 error messages](PERZZMR95.md#10)
-   [20 Other symptoms](PERZZMR95.md#20)
-   [40 Possible problems](PERZZMR95.md#40)
-   [80 Solutions](PERZZMR95.md#80)
-   [100 Need this page completed?](PERZZMR95.md#100)

## 10 MR95 error messages {#10 .section}

Error message codes are in the form:

**GVB999X**

where **999** is a message number and **X** is one of the following:

-   **C = Critical**
-   **E = Error**
-   **I = Information**
-   **N = Notice**
-   **S = Severe**
-   **U = Unrecoverable**
-   **W = Warning**

|MR95RPT error message|Other details|Solution or Possible Problem\(s\)|
|---------------------|-------------|---------------------------------|
|**\*\* GVB000E GVBMR95 Message not known**| |See your IBM representative - this error needs investigation by IBM.|
|**\*\* GVB001S GVBMR95 Identify macro failed**| |See your IBM representative - this error needs investigation by IBM.|
|**\*\* GVB002I GVBMR95 TTT threads started**|TTT is the number of threads.|This is an informational message only.|
|**\*\* GVB003S GVBMR95 Attach macro failed XXX**|XXX is the macro name.|See your IBM representative - this error needs investigation by IBM.|
|**\*\* GVB004U GVBMR95 Event file thread abended TTT**|The abend applies to thread number TTT.|Investigate and fix the abend.|
|**\*\* GVB099X GVBMR95 x**| | |
|**\*\* GVB099X GVBMR95 x**| | |
|**\*\* GVB099X GVBMR95 x**| | |
|**\*\* GVB099X GVBMR95 x**| | |
|**\*\* GVB099X GVBMR95 x**| | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |
|**\*\* GVB041U GVBMR95 Incorrect trace execution parameter**|MR95 has **RC = 0008**|Solution: Fix TRACE parameter in MR95 config file.Find the details in section [80 Solutions](PERZZMR95.md#80)

|

## 20 Other symptoms {#20 .section}

|Symptom\(s\)|Other details|Solution or Possible Problem\(s\)|
|------------|-------------|---------------------------------|
|SOC1 in MR95 step.|**IEC130I MR95BILL DD STATEMENT MISSING**|Solution: Insert MR95BILL DD.Find the details in section [80 Solutions](PERZZMR95.md#80)

|

## 40 Possible problems {#40 .section}

This section describes problems that may underly various errors and symptoms. Available solutions are identified.

|Problem|Details|Solutions|
|-------|-------|---------|
|To be completed|To be completed|To be completed|

## 80 Solutions {#80 .section}

|Solution|Details|
|--------|-------|
|Fix TRACE parameter in MR95 config file|Ensure coding it either **TRACE=Y** or **TRACE=N** in the config file. For more details, see the section on MR95 Parameters in topic "**Program Runbook: MR95 Reference Data**" or topic "**Program Runbook: MR95 Extract Data**". Links to those topics are under **Related reference** below.

|
|Insert MR95BILL DD|Insert the following in the MR95 step:```
//MR95BILL DD DUMMY        

```

|

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Troubleshooting](../html/AAR910PMProgTr.md)

