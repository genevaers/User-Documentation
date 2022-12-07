# DB2 ODBC parameters {#PERFaq05DB2ODBC .reference}

## What is ODBC? { .section}

ODBC = Open Database Connectivity. This is open source middleware software written in C that allows an application program to access a database regardless of the operating system hosting the database and the specific database software involved.

## File DSNAOINI { .section}

DSNAOINI = **DB2 Subsystem Name Application ODBC INItialization.** This file describes parameters for optimizing ODBC access to DB2. This file is used by programs that access DB2 using ODBC, including MR86 and MR48. This is a typical TSO dataset of record length 80, and records are not numbered.

Example of contents of DSNAOINI:

|```
;************************************
; DB2 ODBC INITIALIZATION PARAMETERS 
;************************************

[COMMON]
MVSDEFAULTSSID=ZZ
* APPLTRACEFILENAME="DD:ODBCTRAC"
* APPLTRACE=0

[subsystemname]

[datasourcename]
CURRENTSQLID=ZZ
UNDERSCORE=0

```

|

Parameters of DSNAOINI are as follows:

|Parameter|Notes|
|---------|-----|
|\[COMMON\]|This section applies to all applications using this file.|
|MVSDEFAULTSSID|To **DB2 subsystem** for the SAFR Database, which stores metadata created and maintained from the SAFR Workbench.|
|APPLTRACEFILENAME|This field only applies when APPLTRACE=1. This field specifies the dataset name or DD name for writing out the ODBC trace. The file name must be defined in the job step.|
|APPLTRACE|This field turns on or off the ODBC trace in DB2. The possible values are:-   **0** - means disable and is default.
-   **1**- means enable.

|
|\[subsystemname\]|This section applies to the named subsystem.|
|\[datasourcename\]|This section applies to the named data source. There can be zero, one or many datasourcename sections.|
|CURRENTSQLID|The CURRENTSQLID keyword is valid only for those DB2 versions that support SET CURRENT SQLID \(such as DB2 UDB for z/OS\). If this keyword is present, then a SET CURRENT SQLID statement is sent to the DBMS after a successful connect. This allows users and the application to name SQL objects without having to qualify by schema name. The value that you specify for current\_sqlid must be no more than 128 bytes.|
|CURRENTSCHEMA|This parameter sets the default prefix for tables in SQL statements.|
|UNDERSCORE|This parameter is set to 1 or 0. Value 1 is default.

This keyword is placed in a datasourcename section. The UNDERSCORE keyword specifies whether the underscore character \(\_\) is to be used as a wildcard character \(matching any one character, including no character\), or to be used as itself. This parameter only affects catalog function calls that accept search pattern strings. You can set the UNDERSCORE keyword to the following settings:

-   **1**: The underscore character \(\_\) acts as a wildcard \(default\). The underscore is treated as a wildcard matching any one character or none. For example, two tables are defined as follows:

CREATE TABLE "OWNER"."KEY\_WORDS" \(COL1 INT\)

CREATE TABLE "OWNER"."KEYWORDS" \(COL1 INT\)

In the example above, SQLTables\(\) \(the DB2 ODBC catalog function call that returns table information\) returns both the ″KEY\_WORDS″ and ″KEYWORDS″ entries if ″KEY\_WORDS″ is specified in the table name search pattern argument.

-   **0**: The underscore character \(\_\) acts as itself. The underscore is treated literally as an underscore character. If two tables are defined as shown in the example above, SQLTables\(\) returns only the ″KEY\_WORDS″ entry if ″KEY\_WORDS″ is specified in the table name search pattern argument. Setting this keyword to 0 can result in performance improvement in those cases where object names \(owner, table, column\) in the data source contain underscores.

|

## Full details of DB2 ODBC parameters { .section}

See the IBM documentation on the Web at: "[DB2 ODBC initialization file](http://publib.boulder.ibm.com/infocenter/dzichelp/v2r2/topic/com.ibm.db2z10.doc.odbc/src/tpc/db2z_hdinide.htm)"

**Parent topic:**[FAQ for PE](../html/SARFaqPM.md)

