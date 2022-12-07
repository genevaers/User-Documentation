# Program Runbook: MR86 VDP Builder {#PERMR86 .reference}

## 01 Summary of this topic {#01 .section}

For **MR86 parameters**, see Section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).

The sections in this topic are as follows:

-   [02 Diagram](PERMR86.md#02)
-   [03 What MR86 does](PERMR86.md#03)
-   [05 Checklist for select phase](PERMR86.md#05)
-   [08 MR86 can run in "Development"](PERMR86.md#08)
-   [10 PARM options for MR86 job step](PERMR86.md#10)
-   [20 DD DSNAOINI - ODBC parameters](PERMR86.md#20)
-   [30 DD \(from PARM\) - Configuration file](PERMR86.md#30)
-   [40 DD MR86RPT - VDP Builder Report](PERMR86.md#40)
-   [50 DD SYSOUT](PERMR86.md#50)
-   [60 DD XMLOUT - VDP XML file](PERMR86.md#60)
-   [75 Output: PARM -H option](PERMR86.md#75)
-   [80 JCL Sample](PERMR86.md#80)
-   [99 Troubleshooting](PERMR86.md#99)
-   [100 Need more on this page?](PERMR86.md#100)

## 02 Diagram {#02 .section}

![](images/MR86_Action_XML_01.gif)

## 03 What MR86 does {#03 .section}

See these overviews:

-   "**MR86 VDP Builder overview**"
-   "**VDP file overview**"

Links to the above overviews are under **Related concepts** below.

## 05 Checklist for select phase {#05 .section}

See help topic "**Checklist: Select phase**". A link to that topic is under **Related reference** below.

## 08 MR86 can run in "Development" {#08 .section}

MR86 is an example of a PE program that can run in "**Development**" rather than "**Production**". See section "**PE split between Development and Production**" in topic "**Typical PE batch flow**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR86 job step {#10 .section}

Only one PARM option is required and recommended - the -c option. It is recommended to avoid using all other PARM options and to use the input configuration file instead - see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).

Examples of the PARM options for the MR86 job step are shown below. The only recommended example is the first example.

|```
PARM='-C DD:CONFIG'

PARM='-C DD:CONFIG -X DD:XMLOUT'
PARM=('-X DD:XMLOUT -G IBM-1047 -C DD:CONFIG')
PARM='-H'

```

|

The complete PARM options are given below:

|PARM option|Details|
|-----------|-------|
|**-C DD:ddname**|**\(Required.\)** The value "ddname" is a DDNAME for the input configuration file in the MR86 job step. This allows use of the input configuration file as shown in section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).

|
|**-D "dbconnection"**|\(Optional.\) The value "dbconnection" overrides the CONNECTION parameter given in the \[DATABASE\] section of the input configuration file for MR86. The string for dbconnection must be in double quotes. For more on the CONNECTION parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-E environmentID**|\(Optional.\) The value "environmentID" overrides the ENVIRONMENTID parameter given in the \[DATABASE\] section of the input configuration file for MR86. For more on the ENVIRONMENTID parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-F folderID**|The value "folderID" overrides the FOLDERID parameter given in the \[VIEW SELECTION\] section of the input configuration file for MR86. For more on the FOLDERID parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30). \(Optional.\)|
|**-G XMLencoding**|\(Optional.\) The value "XMLencoding" overrides the ENCODING parameter given in the \[XML\] section of the input configuration file for MR86. For more on the ENCODING parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-H**|\(Optional.\) Displays help in SYSOUT describing the PARM options.For details, see section [75 Output: PARM -H option](PERMR86.md#75).

|
|**-I initialdatabase**|\(Optional.\) The value "initialdatabase" overrides the SCHEMA parameter given in the \[DATABASE\] section of the input configuration file for MR86. For more on the SCHEMA parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-L DD:ddname**|\(Optional.\) The value "ddname" overrides the FILE parameter given in the \[LOG\] section of the input configuration file for MR86. For more on the FILE parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-N foldername**|\(Optional.\) The value "foldername" overrides the FOLDERNAME parameter given in the \[VIEW SELECTION\] section of the input configuration file for MR86. For more on the FOLDERNAME parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-O DD:ddname**|\(Optional.\) It is recommended to avoid using this option and to instead use the \[XML\] section of the input configuration file to configure MR86 to create a VDP XML file.

The value "ddname" in this option overrides the FILE parameter given in the \[VIEW DEFINITION PARAMETERS\] section of the input configuration file for MR86. For more on the FILE parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).

|
|**-P workbenchpassword**|\(Optional.\) The value "workbenchpassword" overrides the PASSWORD parameter given in the \[DATABASE\] section of the input configuration file for MR86. For more on the PASSWORD parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-Q frequencycode**|This is an obsolete parameter - do not code. If this parameter is present, this can prevent MR86 from selecting views.

|
|**-R rundate**|\(Optional.\) The value "rundate" overrides the RUNDATE parameter given in the \[VIEW SELECTION\] section of the input configuration file for MR86. For more on the RUNDATE parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-S passnumber**|This is an obsolete parameter - do not code. If this parameter is present, this can prevent MR86 from selecting views.

|
|**-T databasetype**|\(Optional.\) The value "databasetype" overrides the TYPE parameter given in the \[DATABASE\] section of the input configuration file for MR86. For more on the TYPE parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-U username**|\(Optional.\) The value "databasetype" overrides the USERID parameter given in the \[DATABASE\] section of the input configuration file for MR86. For more on the USERID parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-V viewidlist**|\(Optional.\) The view numbers in "viewidlist" override the VIEWID parameter given in the \[VIEW SELECTION\] section of the input configuration file for MR86. For more on the VIEWID parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|
|**-X DD:ddname**|\(Optional.\) The value "ddname" overrides the FILE parameter given in the \[XML\] section of the input configuration file for MR86. For more on the FILE parameter see section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 20 DD DSNAOINI - ODBC parameters {#20 .section}

This is DDNAME **DSNAOINI** in the MR86 job step. This file describes parameters for ODBC access to DB2. This is a typical TSO dataset of record length 80, and records are not numbered.

For contents of this file, see FAQ topic "**DB2 ODBC parameters**" A link to that topic is under **Related reference** below.

## 30 DD \(from PARM\) - Configuration file {#30 .section}

This file is the recommended method to configure MR86. This is a typical TSO dataset of record length 80, and records are not numbered.

It is essential to supply the DDNAME for this file in the -c option of the PARM keyword: see section [10 PARM options for MR86 job step](PERMR86.md#10).

**Example configuration file:**

|```
;**********************************
; MR86 PARAMETERS
;**********************************

[DATABASE]
TYPE=IBMDB2
CONNECTION=DSN=ZZ
ENVIRONMENTID=ZZ
SCHEMA=ZZ
USERID=ZZ
PASSWORD=ZZ

[LOG]
FILE=DD:MR86RPT

[EXTRACT]
MAXIMUMFILENUM=ZZZ
* DECIMALDIGITS=ZZ
* DECIMALPLACES=ZZ

[VIEW DEFINITION PARAMETERS]
FILE=DD:VDPOUT

[VIEW SELECTION]
VIEWID=VV01,VV02,VV03,VV04,VV05
VIEWID=VV06,VV07,VV08,VV09,VV10
FOLDERID=FolderIDlist
FOLDERNAME=Foldernamelist
* RUNDATE=20XXMMDD

[XML]
File=DD:XMLOUT
ENCODING=IBM-1047

```

|

The **configuration file** is coded as follows:

-   Case matters for values, so ensure CAPS OFF for this file.
-   Section headings are given in square brackets **\[ \]**. Sections can be listed in any order. Parameters can also be listed in any order as long as they are grouped under the correct section heading.
-   Section heading are required, and the parameters must be grouped under the relevant section heading.
-   Comments are marked with a semicolon "**;**" or asterisk "**\***" at the start of the line.
-   Set a value for a parameter using format "**PARAM=value**" where
    -   "**PARAM**" is a choice in the "**Parameter**" column below, and
    -   "**value**" is described in the corresponding "**Details**" column below.

|Parameter|Details|
|---------|-------|
|**\[DATABASE\]**|This section contains parameters that refer to the SAFR Database used by the SAFR Workbench to store metadata.|
|TYPE|\(Optional.\) The type of database for the SAFR Database. The only value at present is **IBMDB2**, and this is the default value.The value of this parameter can be overridden by the -T value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|CONNECTION|**\(Required.\)** The connection to the DB2 database that contains the SAFR Database. Code this parameter as follows: ****CONNECTION=DSN=ZZ**** where ZZ is the Database Name given in SAFR Connection Manager when running the SAFR Workbench. The value of this parameter can be overridden by the -D value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|ENVIRONMENTID|**\(Required.\)** ID number of the environment in the SAFR Database that contains the view\(s\) to be processed. The value of this parameter can be overridden by the -E value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|SCHEMA|**\(Required.\)** DB2 schema name for the database that contains the SAFR Database. This value is the Schema Name given in SAFR Connection Manager when running the SAFR Workbench.The value of this parameter can be overridden by the -I value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|USERID|\(Optional.\) A TSO user account that has DB2 access to the SAFR Database and permission to run SQL against that database. Default is the user account for the job for MR86.The value of this parameter can be overridden by the -U value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|PASSWORD|**\(Required.\)** Password for the account given in USERID above or the default user account that applies.The value of this parameter can be overridden by the -P value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|**\[EXTRACT\]**|This section contains parameters for the data in both the VDP and VDP XML files. The parameters in this section apply to later processing of the VDP by MR95 in the extract phase.|
|MAXIMUMFILENUM|\(Optional.\) The maximum number of extract work files \(called EXT files\) that can be created by MR95 in the extract phase. If set, the value of **MAXIMUMFILENUM** must be the same as the value of parameter **STDEXTR in MR95 in the extract phase**. If these values are different, then unpredictable results can occur.

The value must be three digits between **000** and **999** \(inclusive\). A value of 000 means the view has no format phase. The default value is 001.

For more on STDEXTR in the MR95 parameters in the extract phase, see help topic "**Program Runbook: MR95 Extract Data**". A link to that topic is under **Related reference** below.

For more on EXT files, see topic "**EXT file overview**". A link to that overview is under **Related concepts** below.

|
|DECIMALDIGITS|\(Optional.\) This gives a maximum number of decimal digits to the left of the decimal point. This maximum applies to every numeric field in all views in the VDP and VDP XML file.The choices for this parameter are:

-   DECIMALDIGITS = 15, DECIMALPLACES = 8
-   DECIMALDIGITS = 20, DECIMALPLACES = 3

|
|DECIMALPLACES|\(Optional.\) This gives a maximum number of decimal places to the right of the decimal point. This maximum applies to every numeric field in all views in the VDP and VDP XML file.The choices for this parameter are:

-   DECIMALDIGITS = 15, DECIMALPLACES = 8
-   DECIMALDIGITS = 20, DECIMALPLACES = 3

|
|**\[LOG\]**|This section contains parameters about a report file produced by MR86.|
|FILE|\(Optional.\) Output DDNAME for the MR86 report file. Code this parameter as follows: **FILE=DD:ddname**. The value of "ddname" applies to the MR86 job step. Default is SYSOUT.For more on the report, see section [40 DD MR86RPT - VDP Builder Report](PERMR86.md#40).

The value of this parameter can be overridden by the -L value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|**\[VIEW SELECTION\]**|This section contains parameters about the views to select for processing by MR86.|
|FOLDERID|\(Optional.\) MR86 selects all views in the view folders specified. All views in the specified folders must be status Active. Examples of how to code this parameter are as follows -   "**FOLDERID=987**"
-   "**FOLDERID=987,123**"
-   "**FOLDERID=987,123,555**"

where "987", "123" and "555" are valid ID numbers for view folders in the SAFR Database specified in the \[DATABASE\] section above.

The selections for FOLDERID are in addition to active views specified for other parameters such as VIEWID and FOLDERNAME.

Folder ID numbers can be listed in any order, separated by a comma. The number of digits in a view ID number is not restricted.

The value of this parameter can be overridden by the -F value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|FOLDERNAME|\(Optional.\) MR86 selects all views in the view folders specified. All views in the specified folders must be status Active. Examples of how to code this parameter are as follows -   "**FOLDERNAME=fname1**"
-   "**FOLDERNAME=fname1,fname2**"

where fname1 and fname2 are valid view folder names in the SAFR Database specified in the \[DATABASE\] section above. FOLDERNAME can accept at most two folder names.

The selections for FOLDERNAME are in addition to active views specified for other parameters such as VIEWID and FOLDERID.

Folder names can be listed in any order, separated by a comma. \(Optional.\)

The value of this parameter can be overridden by the -N value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|FREQUENCYCODE|This is an obsolete parameter - do not code. If this parameter is present, this can prevent MR86 from selecting views.|
|PASSNUMBER|This is an obsolete parameter - do not code. If this parameter is present, this can prevent MR86 from selecting views.|
|RUNDATE|\(Optional.\) The value of this parameter is the rundate for all views included in the VDP created in this run. Code this parameter as follows "**RUNDATE=CCYYMMDD**", where CCYYMMDD is a valid date. The value of this RUNDATE parameter can be overridden by the -R value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

The value of the RUNDATE parameter can also be overridden in MR90 and also overridden in the logic text functions of RUNDAY, RUNMONTH, RUNPERIOD, RUNQUARTER and RUNYEAR.

For details of RUNDATE in MR90 see the section on the input configuration file in topic "**Program Runbook: MR90 Logic Table Generator**" - a link is under **Related reference** below.

For details of logic text functions such as of RUNDAY, see topic "**Syntax: functions**" - a link is under **Related reference** below.

|
|VIEWID|\(Optional.\) MR86 selects the active views specified in the VIEWID parameter. Examples of how to code this parameter are as follows -   "**VIEWID=987**"
-   "**VIEWID=987,123**"
-   "**VIEWID=987,123,555**"

where "987", "123" and "555" are valid ID numbers for active views in the SAFR Database specified in the \[DATABASE\] section above.

The selections for VIEWID are in addition to active views specified by other parameters such as FOLDERID and FOLDERNAME.

Views can be listed in any order, separated by a comma. The number of digits in a view ID number is not restricted. If required, code multiple VIEWID parameters, each on a separate line.

The value of this parameter can be overridden by the -V value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|**\[VIEW DEFINITION PARAMETERS\]**|It is recommended to use MR86 to create an XML file for input to MR84, as shown in the \[XML\] section parameters two rows below. Following that recommendation means that section \[VIEW DEFINITION PARAMETERS\] is not required and can be deleted.

|
|FILE|\(Optional.\) Output DDNAME for the VDP file created by MR86. Code this parameter as follows "**FILE=DD:ddname**". The value of "ddname" applies to the MR86 job step. It is recommended to use MR86 to create a VDP XML file for input to MR84. Following that recommendation means this parameter is not required and can be deleted.

The value of this parameter can be overridden by the -O value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|**\[XML\]**|**\(Required.\)** This section contains parameters that refer to the VDP XML file produced by MR86. This section is recommended for all input configuration files for MR86.|
|FILE|**\(Required.\)** Output DDNAME for the VDP XML file created by MR86. Code this parameter as follows: **FILE=DD:ddname**. The value of "ddname" applies to the MR86 job step. The value of this parameter can be overridden by the -X value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|
|ENCODING|**\(Required.\)** This parameter defines the character set used for the VDP XML file created by MR86. Code this parameter as follows: **ENCODING=IBM-1047** . This is the character set required by MR84.The value of this parameter can be overridden by the -G value in the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10).

|

## 40 DD MR86RPT - VDP Builder Report {#40 .section}

If a report DDNAME is provided, MR86 produces a report file giving information about the data processed.

The report DDNAME is given in the FILE parameter of the input configuration file - section [30 DD \(from PARM\) - Configuration file](PERMR86.md#30).

The report DDNAME can also be given in the -L value of the PARM options - see section [10 PARM options for MR86 job step](PERMR86.md#10). If both are given, the PARM -L value overrides the FILE parameter in the input configuration file.

An example of the MR86 report is as follows:

|```
IBM Scalable Architecture for Financial Reporting (SAFR)
IP Asset Family Component ID 6949-17P                   
Performance Engine (MVS) - Base Product                 
Build PM 4.11.009                                       
                                                        
GVBMR86 - VDP Builder                                   
(Rev. 04000052: 2012-05-10 22:04)                       
                                                        
Executed: 2012-07-30 11:26:12                           
                                                        
INFO: VDP Builder settings for this run:                
      Database Type:     IBMDB2                         
      Connection String: DSN=ZZ                         
      Initial Schema:    YYYY                           
      User ID:           ADMIN                          
      Password:          <Not specified>`               
      VDP File:          out.vdp                        
      XML File:          DD:XMLOUT                      
      Log File:          DD:MR86RPT                     
      Environment ID:    1                              
      Environment Name:  <Not specified>                
      View ID(s):        8475                           
      Folder ID(s):      <Not specified>                
      Folder Name(s):    <Not specified>                
      Run Date:          <Not specified>                
      Frequency Code:    <Not specified>                
      Pass Number:       <Not specified>                
      Extract Path:      $extractdir                    
      Extract Prefix:    $extractfile                   
      Maximum Extract #: 1                              
      Decimal Digits:    0 (default)                    
      Decimal Places:    0 (default)                    
      Extract DSN:       SAFR.EXTRACT                   
      Extract Device:    SYSDA                          
      Ext Space Primary: 20                             
      Ext Space Second:  200                            
      Ext Volume Count:  0                              
      Ext Retention Per: 0                              
      Summary Path:      $summarydir                    
      Summary DSN:       $HLQ                           
      Summary Device:    SYSDA                          
      Sum Space Primary: 1                              
      Sum Space Second:  1                              
      Sum Volume Count:  0                              
      Sum Retention Per: 0                              
      Test Mode:         No                             
INFO: Connecting to database 'DSN=ZZ'                   
      on Mon Jul 30 11:26:12 2012                       
                                                        
INFO: Loading code table                                
INFO: Creating VDP file 'out.vdp'                       
INFO: The batch number for this build is 259            
INFO: Using view IDs 8475                               
INFO: View ID 8475, Environment ID 1, Extract # 1 'Report' 
INFO: 1 view is in this VDP                                
INFO: Found control ID 1 'Default_Install'                 
INFO: Found 1 control records                              
INFO: Building meta data                                   
INFO: Building logical records (type 300)                  
INFO: Found LR ID 1390 'DATA_PRODUCT'                      
INFO: Found LR ID 1391 'DATA_SALES'                        
INFO: Found 2 logical records                              
INFO: Need to retrieve 1 LR index records                  
INFO: Need to retrieve 2 logical files                     
INFO: Building LR fields (type 400)                        
INFO: Found 6 LR fields                                    
INFO: Checking for output partitions used in the extract phase
INFO: Building logical file partitions (type 200)          
INFO: Found File ID 1392, Partition ID 8450, Partition Number 1 'DATA_SALES' 
INFO: Found File ID 1391, Partition ID 8449, Partition Number 1 'DATA_PRODUCT
INFO: Building indexes (type 500)                          
INFO: Found LR Index ID 2938                               
INFO: Building servers (type 100)                          
INFO: Found Server ID 1 'Local'                            
INFO: Found 1 servers                                      
INFO: Building lookup steps (type 600)                     
INFO: Found Lookup ID 2017 'LP_PRODUCT_Desc', Step Number 1, Sequence Number 
INFO: Loading view specific data                           
INFO: Building titles and footers (type 1300 & 1400)       
INFO: Found 5 titles and footers                           
INFO: Building references to input source files (type 3000)
INFO: Found Source reference ID 13350                      
INFO: Found 1 references to input source files             
INFO: Building column mappings (type 4000)                 
INFO: Found 3 column mappings                              
INFO: Building columns (type 2000)                         
INFO: Found 3 columns                                      
INFO: Building sort keys (type 2300)                       
INFO: Found 1 sort key                                     
INFO: Building logic text and logic tables                 
INFO: Building program files/exits (type 210)              
INFO: Found 0 program files/exits                          
INFO: VDP completed                                        
WARNING: Invalid VSAM ORG code 0, assuming keyed sequential
WARNING: Invalid VSAM ORG code 0, assuming keyed sequential

```

|

## 50 DD SYSOUT {#50 .section}

This type of output is always produced by MR86.

|```
IBM Scalable Architecture for Financial Reporting (SAFR)  
IP Asset Family Component ID 6949-17P                      
Performance Engine (MVS) - Base Product                    
Build PM 4.11.009                                          
                                                           
GVBMR86 - VDP Builder                                      
(Rev. 04000052: 2012-05-10 22:04)                          
                                                           
Executed: 2012-07-30 11:26:12                              
                                                           
  Connecting to the database DSN ...                       
More data???                                               
INFO: Saving VDP file to 'out.vdp'                         
INFO: 37 records written to VDP file                                              
```

|

MR86 can also produce extra output when the PARM-H option is used - see section [75 Output: PARM -H option](PERMR86.md#75).

## 60 DD XMLOUT - VDP XML file {#60 .section}

See help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 75 Output: PARM -H option {#75 .section}

This is one of the PARM options from section [10 PARM options for MR86 job step](PERMR86.md#10).

This option writes the following to SYSOUT:

|```
 Usage: GVBMR86 [-h] [-v view-id-list] [-f folder-id-list] [-n folder-name-list]
                [-l [log-file]] [-e environ-id] [-d database-connection]
                [-i initial-schema] [-t database-type] [-s pass-number] 
                [-q frequency-code] [-r rundate-override]               
                [-c configuration-file] [-o output-VDP-file]            
                [-u workbench-user-id] [-p [workbench-password]] [-x XML-file]
                [-g [XML-file-encoding]]                                
                                                                        
 Options/Arguments:                                                     
         -h                       Display command usage                 
         -v view-id-list          A list of view IDs                    
         -f folder-id-list        A list of view folder IDs             
         -n folder-name-list      A list of view folder names           
         -l [log-file]            The output log file. Default is stdout
         -e environ-id            Select only views with this environment ID
         -d database-connection   Database connection string. In double quotes.
         -i initial-schema        Initial database schema to read from  
         -t database-type         Either MSSQLServer, IBMDB2, or Oracle 
         -s pass-number           Select only views with this pass number
         -q frequency-code        Select only views with this frequency letter 
         -r rundate-override      Must be in CCYYMMDD format            
         -c configuration-file    The VDP build configuration file.     
         -o output-VDP-file       The output view definition file.
                                  Default is out.vdp
         -u workbench-user-id     A Workbench user ID. Default is the current
                                  login ID.
         -p [workbench-password]  The password for the Workbench user ID
         -x XML-file              The output XML file. Default is no XML created.
         -g [XML-file-encoding]   XML encoding string                   
```

|

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

The sample JCL below runs a job for the entire select phase.

|```
//V9999AS JOB (ACCT),'View 9999 Select',                                00010000
//          NOTIFY=^SYSUID.,                                            00020000
//          CLASS=A,                                                    00030000
//          MSGLEVEL=(1,1),                                             00040000
//          MSGCLASS=H                                                  00050000
//*                                                                     00060000
//JOBLIB   DD DISP=SHR,DSN=GEBT.PM4XX.BTCHLOAD                          00070001
//         DD DISP=SHR,DSN=DB2V910.XXX                                  00080001
//         DD DISP=SHR,DSN=DB2.XXX                                      00090001
//         DD DISP=SHR,DSN=XXXDLL                                       00100001
//*                                                                     00110000
//********************************************************************* 00120000
//*                                                                     00130000
//*   SELECT VIEW DEFINITIONS TO BE PROCESSED                           00140000
//*                                                                     00150000
//********************************************************************* 00160000
//*                                                                     00170000
// SET HISPN='USERNAME.DATA' INPUT SAFR PVT NON-VSAM                    00180001
// SET HISPV='USERNAME.DATA' INPUT SAFR PVT VSAM                        00190001
// SET HISSN='USERNAME.DATA' INPUT SAFR SHR NON-VSAM                    00200001
// SET HISSV='USERNAME.DATA' INPUT SAFR SHR VSAM                        00210001
// SET HIUPN='USERNAME.V9999' INPUT USER PVT NON-VSAM                   00220001
// SET HIUPV='USERNAME.V9999' INPUT USER PVT VSAM                       00230001
// SET HIUSN='USERNAME.V9999' INPUT USER SHR NON-VSAM                   00240001
// SET HIUSV='USERNAME.V9999' INPUT USER SHR VSAM                       00250001
// SET HOSPN='USERNAME.DATA' OUTPUT SAFR PVT NON-VSAM                   00260001
// SET HOSPV='USERNAME.DATA' OUTPUT SAFR PVT VSAM                       00270001
// SET HOSSN='USERNAME.DATA' OUTPUT SAFR SHR NON-VSAM                   00280001
// SET HOSSV='USERNAME.DATA' OUTPUT SAFR SHR VSAM                       00290001
// SET HOUPN='USERNAME.V9999' OUTPUT USER PVT NON-VSAM                  00300001
// SET HOUPV='USERNAME.V9999' OUTPUT USER PVT VSAM                      00310001
// SET HOUSN='USERNAME.V9999' OUTPUT USER SHR NON-VSAM                  00320001
// SET HOUSV='USERNAME.V9999' OUTPUT USER SHR VSAM                      00330001
// SET JOBLIB='USERNAME.AA.SAFR.JOB' JOB LIB                            00340001
// SET PARMLIB='USERNAME.AA.SAFR.PARM' PARM LIB                         00350001
// SET UNIT='SYSDA'  DASD POOL FOR PERM DATASETS                        00360000
//*                                                                     00370000
//*                                                                     00380000
//*                                                                     00390000
//********************************************************************* 00400000
//* PSTEP100 - PRINT ODBC FILE                                          00410000
//*                                                                     00420000
//* NORMAL RETURN CODE = 0                                              00430000
//*                                                                     00440000
//* IF THIS STEP ABENDS:                                                00450000
//* 1) FIX APPLICATION IF POSSIBLE                                      00460000
//* 2) RESTART THE JOB IN THIS STEP                                     00470000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00480000
//*                                                                     00490000
//********************************************************************* 00500000
//*                                                                     00510000
//PSTEP100  EXEC PGM=IKJEFT1A,                                          00520000
// PARM='REPRO INFILE(INFILE) OUTFILE(ODBCINI)'                         00530000
//*                                                                     00540000
//*        <<< INPUT FILES >>>                                          00550000
//*                                                                     00560000
//SYSTSIN  DD DUMMY                                                     00570000
//*                                                                     00580000
//INFILE   DD DSN=^PARMLIB.(MYODBC),                                    00590000
//            DISP=SHR                                                  00600000
//*                                                                     00610000
//*        <<< OUTPUT FILES >>>                                         00620000
//*                                                                     00630000
//ODBCINI  DD SYSOUT=*                                                  00640000
//*                                                                     00650000
//SYSTSPRT DD SYSOUT=*                                                  00660000
//*                                                                     00670000
//********************************************************************* 00680000
//* IF THIS STEP ABENDS:                                                00690000
//* 1) FOLLOW RESTART GIVEN IN STEP PSTEP100                            00700000
//*                                                                     00710000
//********************************************************************* 00720000
//*                                                                     00730000
//PSTEP101 EXEC PGM=GVBUT99,                                            00740000
//            COND=(0,EQ,PSTEP100),                                     00750000
//            PARM='1099'                                               00760000
//*                                                                     00770000
//SYSMDUMP DD SYSOUT=*                                                  00780000
//*                                                                     00790000
//********************************************************************* 00800000
//* PSTEP 110: PRINT CONFIG FILE                                        00810000
//*                                                                     00820000
//********************************************************************* 00830000
//*                                                                     00840000
//PSTEP110  EXEC PGM=IKJEFT1A,                                          00850000
// PARM='REPRO INFILE(INFILE) OUTFILE(CONFIGO)'                         00860000
//*                                                                     00870000
//*        <<< INPUT FILES >>>                                          00880000
//*                                                                     00890000
//SYSTSIN  DD DUMMY                                                     00900000
//*                                                                     00910000
//INFILE   DD DSN=^PARMLIB.(V9999M86),                                  00920000
//            DISP=SHR                                                  00930000
//*                                                                     00940000
//*        <<< OUTPUT FILES >>>                                         00950000
//*                                                                     00960000
//CONFIGO  DD SYSOUT=*                                                  00970000
//*                                                                     00980000
//SYSTSPRT DD SYSOUT=*                                                  00990000
//*                                                                     01000000
//********************************************************************* 01010000
//* IF THIS STEP ABENDS:                                                01020000
//* 1) FOLLOW RESTART GIVEN IN STEP PSTEP110                            01030000
//*                                                                     01040000
//********************************************************************* 01050000
//*                                                                     01060000
//PSTEP111 EXEC PGM=GVBUT99,                                            01070000
//            COND=(0,EQ,PSTEP110),                                     01080000
//            PARM='1099'                                               01090000
//*                                                                     01100000
//**********************************************************************01110000
//* PSTEP120 - DELETE FILE(S) CREATED IN NEXT STEP                      01120000
//*                                                                     01130000
//* NORMAL RETURN CODE = 0                                              01140000
//*                                                                     01150000
//* IF THIS STEP ABENDS:                                                01160000
//* 1) FIX APPLICATION IF POSSIBLE                                      01170000
//* 2) RESTART THE JOB IN THIS STEP                                     01180000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01190000
//*                                                                     01200000
//**********************************************************************01210000
//*                                                                     01220000
//PSTEP120 EXEC PGM=IDCAMS                                              01230000
//*                                                                     01240000
//SYSPRINT DD SYSOUT=*                                                  01250000
//*                                                                     01260000
//SYSIN    DD *                                                         01270000
 DELETE  USERNAME.V9999.MR86.XML PURGE                                  01280001
 IF LASTCC > 0  THEN /* IF FAILS,  */ -                                 01290000
     SET MAXCC = 0   /* KEEP GOING */                                   01300000
                                                                        01310000
//*                                                                     01320000
//********************************************************************* 01330000
//* PSTEP140 - CREATE VIEW DEFINITION PARAMETERS (VDP) FILE             01340000
//*                                                                     01350000
//* IF THIS STEP ABENDS:                                                01360000
//* 1) FIX APPLICATION IF POSSIBLE                                      01370000
//* 2) RESTART THE JOB IN PSTEP120                                      01380000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01390000
//*                                                                     01400000
//********************************************************************* 01410000
//*                                                                     01420000
//PSTEP140 EXEC PGM=GVBMR86,                                            01430000
// PARM='-C DD:CONFIG'                                                  01440000
//*                                                                     01450000
//DSNAOINI DD DSN=^PARMLIB.(MYODBC),                                    01460000
//            DISP=SHR                                                  01470000
//*                                                                     01480000
//*        <<< INPUT FILES >>>                                          01490000
//*                                                                     01500000
//CONFIG   DD DSN=^PARMLIB.(V9999M86),                                  01510000
//            DISP=SHR                                                  01520000
//*                                                                     01530000
//*        <<< OUTPUT FILES >>>                                         01540000
//*                                                                     01550000
//XMLOUT   DD DSN=^HOUPN..MR86.XML,                                     01560000
//            DISP=(NEW,CATLG,DELETE),                                  01570000
//            UNIT=^UNIT.,                                              01580000
//            SPACE=(TRK,(10,10),RLSE),                                 01590000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=32756)                       01600000
//*                                                                     01610000
//MR86RPT  DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01620000
//*MR86RPT  DD DSN=^HOUPN..MR86RPT,                                     01630000
//*             DISP=(NEW,CATLG,DELETE),                                01640000
//*             UNIT=SYSDA,                                             01650000
//*             SPACE=(TRK,(1,1),RLSE),                                 01660000
//*             DCB=(DSORG=PS,RECFM=FB,LRECL=132)                       01670000
//SYSPRINT DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01680000
//SYSOUT   DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01690000
//ODBCTRAC DD SYSOUT=*                                                  01700000
//CEEDUMP  DD SYSOUT=*                                                  01710000
//SYSMDUMP DD SYSOUT=*                                                  01720000
//*                                                                     01730000
//********************************************************************* 01740000
//* IF THIS STEP ABENDS:                                                01750000
//* 1) FOLLOW RESTART GIVEN IN STEP PSTEP140                            01760000
//*                                                                     01770000
//********************************************************************* 01780000
//*                                                                     01790000
//PSTEP141 EXEC PGM=GVBUT99,                                            01800000
//            COND=(0,EQ,PSTEP140),                                     01810000
//            PARM='1099'                                               01820000
//*                                                                     01830000
//SYSMDUMP DD SYSOUT=*                                                  01840000
//*                                                                     01850000
//*******************************************************************   01860000
//* JSTEPN10 - SUBMIT NEXT JOB                                          01870000
//*                                                                     01880000
//* IF THIS STEP ABENDS:                                                01890000
//* SUBMIT JOB SPECIFIED IN SYSUT1 MANUALLY                             01900000
//*******************************************************************   01910000
//*                                                                     01920000
//*JSTEPN10 EXEC PGM=IEBGENER                                           01930000
//*                                                                     01940000
//*SYSIN    DD DUMMY                                                    01950000
//*                                                                     01960000
//*SYSUT1   DD DSN=^JOBLIB.(V9999BC),                                   01970000
//*            DISP=SHR                                                 01980000
//*                                                                     01990000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        02000000
//*                                                                     02010000
//*SYSPRINT DD SYSOUT=*                                                 02020000
//*                                                                     02030000
//********************************************************************* 02040000
//* IF THIS STEP ABENDS:                                                02050000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN10                               02060000
//*                                                                     02070000
//********************************************************************* 02080000
//*                                                                     02090000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           02100000
//*            COND=(0,EQ,JSTEPN10),                                    02110000
//*            PARM='1099'                                              02120000
//*                                                                     02130000
//*SYSMDUMP DD SYSOUT=*                                                 02140000
//*                                                                     02150000
//*                                                                     02160000
//*                                                                     02170000
```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR86**". A link to that topic is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

