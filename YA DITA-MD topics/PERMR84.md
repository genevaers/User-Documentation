# Program Runbook: MR84 VDP XML Converter {#PERMR84 .reference}

## 01 Summary of this topic {#01 .section}

For **MR84 parameters**, see Section [10 PARM options for MR84 step](PERMR84.md#10).

The sections in this topic are as follows:

-   [02 Diagram](PERMR84.md#02)
-   [03 What MR84 does](PERMR84.md#03)
-   [05 Checklist for compile phase](PERMR84.md#05)
-   [08 MR84 can run in "Development"](PERMR84.md#08)
-   [10 PARM options for MR84 step](PERMR84.md#10)
-   [20 DD \(from PARM\) - Configuration file](PERMR84.md#20)
-   [30 DD MR84RPT - XML-to-VDP Converter Report](PERMR84.md#30)
-   [40 DD SCHEMA - XML Schema file](PERMR84.md#40)
-   [50 DD SYSOUT](PERMR84.md#50)
-   [60 DD VDPOUT - VDP \(ASCII\)](PERMR84.md#60)
-   [70 DD XMLIN - VDP XML file](PERMR84.md#70)
-   [75 Output: PARM -H option](PERMR84.md#75)
-   [80 JCL Sample](PERMR84.md#80)
-   [99 Troubleshooting](PERMR84.md#99)
-   [100 Need this page completed?](PERMR84.md#100)

## 02 Diagram {#02 .section}

![](images/MR84_Action_01.gif)

## 03 What MR84 does {#03 .section}

See these overviews:

-   "**MR84 VDP XML Converter overview**"
-   "**VDP file overview**"

Links to the above overviews are under **Related concepts** below.

## 05 Checklist for compile phase {#05 .section}

See help topic "**Checklist: Compile phase**". A link to that topic is under **Related reference** below.

## 08 MR84 can run in "Development" {#08 .section}

Some programs in PE are easy to run in "**Development**" rather than "**Production**". See section "**PE split between Development and Production**" in topic "**Typical PE batch flow**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR84 step {#10 .section}

Examples of PARM options for the JCL step for MR84 are as follows:

|```
PARM='-C DD:CONFIG'

PARM='-X DD:XMLIN -S DD:SCHEMA -O DD:VDPOUT -L DD:MR84RPT -V'  
```

|

The complete PARM options are given below:

|PARM option|Notes|
|-----------|-----|
|**-C DD:ddname**|\(**If not present you must code the PARM options below marked "Required if no config file".**\) The value "ddname" is a DDNAME for the input configuration file for MR84. This allows use of the input configuration file as shown in section [20 DD \(from PARM\) - Configuration file](PERMR84.md#20).

|
|**-H**|\(Optional.\) Displays help on the PARM options.For details, see section [75 Output: PARM -H option](PERMR84.md#75).

|
|**-L DD:ddname**|**\(Required if no config file.\)** This value overrides the FILE parameter given in the \[LOG\] section of the input configuration file for MR84. This value is for the ouput MR84 report. For more on this FILE parameter see section [20 DD \(from PARM\) - Configuration file](PERMR84.md#20)|
|**-O DD:ddname**|**\(Required if no config file.\)** This value overrides the FILE parameter given in the \[VDP\] section of the input configuration file for MR84. This value is for the output VDP file for MR84. For more on this FILE parameter see section [20 DD \(from PARM\) - Configuration file](PERMR84.md#20)|
|**-S DD:ddname**|**\(Required if no config file.\)** This value overrides the SCHEMA parameter given in the \[XML\] section of the input configuration file for MR84. This value is for the input schema \(XSD\) file for MR84. For more on this SCHEMA parameter see section [20 DD \(from PARM\) - Configuration file](PERMR84.md#20)|
|**-V**|\(Optional.\) This value overrides the FILE parameter given in the \[LOG\] section of the input configuration file for MR84. This value controls what is written to the ouput MR84 report. This PARM option has the same effect as VERBOSE=1 in the input config file. For more on this FILE parameter see section [20 DD \(from PARM\) - Configuration file](PERMR84.md#20)|
|**-X DD:ddname**|**\(Required if no config file.\)** This value overrides the FILE parameter given in the \[XML\] section of the input configuration file for MR84. This value is for the input XML file for MR84. For more on this FILE parameter see section [20 DD \(from PARM\) - Configuration file](PERMR84.md#20)|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 20 DD \(from PARM\) - Configuration file {#20 .section}

This file is the recommended method to configure MR84. This is a typical TSO dataset of record length 80, and records are not numbered.

It is essential to supply the DDNAME for this file in the -c option of the PARM keyword: see section [10 PARM options for MR84 step](PERMR84.md#10).

**Example configuration file:**

|```
 ;*********************************
 ;    MR84 PARAMETERS              
 ;*********************************
 ;                                 
 [XML]                             
 FILE=DD:XMLIN                     
 SCHEMA=DD:SCHEMA                  
 ;                                 
 [VDP]                             
 FILE=DD:VDPOUT                    
 ;                                 
 [LOG]                             
 FILE=DD:MR84RPT                   
 VERBOSE=1                         
 ;                   
```

|

The **configuration file** is coded as follows:

-   Case matters for values, so ensure CAPS OFF for this file.
-   Section headings are given in square brackets **\[ \]**. Sections can be listed in any order. Parameters can also be listed in any order as long as they are grouped under the correct section heading.
-   Section heading are required, and the parameters must be grouped under the relevant section heading. For example, the FILE parameter occurs in three different sections and has a different meaning in each section.
-   Comments are marked with a semicolon "**;**" or asterisk "**\***" at the start of the line.
-   Set a value for a parameter using format "**PARAM=value**" where
    -   "**PARAM**" is a choice in the "**Parameter**" column below, and
    -   "**value**" is described in the corresponding "**Details**" column below.

|Parameter|Details|
|---------|-------|
|**\[LOG\]**|**\(Required.\)** This section contains parameters about a report file produced by MR84.|
|FILE|**\(Required.\)** Output DDNAME for the MR84 report. Code this parameter as follows "**FILE=DD:ddname**". The value of "ddname" applies to the MR84 job step. The value of this parameter can be overridden by the -L value in the PARM options - see section [10 PARM options for MR84 step](PERMR84.md#10).

|
|VERBOSE|\(Optional.\) This parameter defines how much information is provided in the MR84 report file. The values are:-   **VERBOSE=0** This value results a minimum of information in the MR84 report. This is the default value.
-   **VERBOSE=1** This value results a maximum of information in the MR84 report.

The value of this parameter can be overridden by the -V value in the PARM options - see section [10 PARM options for MR84 step](PERMR84.md#10).

|
|**\[VDP\]**|**\(Required.\)** This section contains parameters about the output VDP file created by MR84.|
|FILE|**\(Required.\)** Output DDNAME for the VDP file created by MR84. Code this parameter as follows "**FILE=DD:ddname**". The value of "ddname" applies to the MR84 job step. The value of this parameter can be overridden by the -O value in the PARM options - see section [10 PARM options for MR84 step](PERMR84.md#10).

|
|**\[XML\]**|**\(Required.\)** This section contains parameters that refer to the input VDP XML file.|
|FILE|**\(Required.\)** DDNAME for the input VDP XML file. Code this parameter as follows: **FILE=DD:ddname**. The value of "ddname" applies to the MR84 job step. The value of this parameter can be overridden by the -X value in the PARM options - see section [10 PARM options for MR84 step](PERMR84.md#10).

|
|SCHEMA|**\(Required.\)** DDNAME for the input schema \(XSD file. Code this parameter as follows: **SCHEMA=DD:ddname**. The value of "ddname" applies to the MR84 job step. The value of this parameter can be overridden by the -S value in the PARM options - see section [10 PARM options for MR84 step](PERMR84.md#10).

|

## 30 DD MR84RPT - XML-to-VDP Converter Report {#30 .section}

MR84 always produces a report file giving information about the data processed.

The DDNAME is given in the -L value of the PARM options - see section [10 PARM options for MR84 step](PERMR84.md#10).

The MR84 report can be either **VERBOSE=0** \(default\) or **VERBOSE=1**. To set this parameter, see the VERBOSE parameter in section [20 DD \(from PARM\) - Configuration file](PERMR84.md#20).

An example of **VERBOSE=0** is below:

|```
IBM Scalable Architecture for Financial Reporting (SAFR) 
IP Asset Family Component ID 6949-17P                    
Performance Engine (MVS) - Base Product                  
Build PM 4.11.009                                        
GVBMR84 - XML-to-VDP Converter                           
(Rev. 00000000: 2012-05-10 22:04)                        
Executed: 2012-09-14 11:18:49                            
Parsing XML: DD:XMLIN                                    
startDocument Rxed                                       
endDocument Rxed                                         
INFO: Compiler build date May 10 2012 - 22:22:25         

```

An example of **VERBOSE=1** is below:

```
IBM Scalable Architecture for Financial Reporting (SAFR)                  
IP Asset Family Component ID 6949-17P                                     
Performance Engine (MVS) - Base Product                                   
Build PM 4.11.009                                                         
GVBMR84 - XML-to-VDP Converter                                            
(Rev. 00000000: 2012-05-10 22:04)                                         
Executed: 2012-09-14 10:56:49                                             
Parsing XML: DD:XMLIN                                                     
startDocument Rxed                                                        
Set JobInfo GeneratedDate to 2012-09-14                                   
Set JobInfo RunNumber to 295                                              
Set JobInfo MaxStdExtractFileNum to 1                                     
Extract Output File (VDP Record 800)                                      
Set FileInfo Name to Auto-generated Name for Extract Phase Output         
Set FileInfo Server ID to 1                                               
Set FileInfo CodeSet to EBCDI                                             
Set FileInfo RecordDelimiter to VAREX(5)                                  
Set FileInfo FieldDelimiter to FIXED(5)                                   
Set FileInfo TextDelimiter to DBLQT(2)                                    
Set FileInfo ProcessInParallel to 1                                       
Set FileInfo PosixDirectory to $extractdir                                
Set FileInfo PosixFileName to $extractfile                                
Set FileInfo DSN to GEBT.RHNDS.EXT.@D.PASS01.EXTR                         
Set FileInfo DDNameExtract to EXTR                                        
Set FileInfo DeviceType to SYSDA                                          
Set FileInfo AllocSpaceUnit to TRK(2)                                     
Set FileInfo SpacePrimaryQuantity to 20                                   
Set FileInfo SpaceSecondaryQuantity to 200 


(many lines ommitted)


INFO: Compiling extract-phase cell logic for column 2                    
COLUMN = {VER}  
  Row      Seq             Func            Field 1 (Source) Attributes   
   Goto                                                                  
  Num      Num   View ID   Sub   File ID /  LRID  /FieldID   Pos   Len   Format
Row1  Row2                                                                
-------------------------------------------------------------------------------
       1      2  00008349  SKE   00000565/00000595/00030275     6    1  AlphaN
                                 Unsigned/  Left  /rnd=0000     2    0  None  
INFO: Compiling extract-phase cell logic for column 3                      
COLUMN = {PRTN_ID}                                                         
  Row      Seq             Func            Field 1 (Source) Attributes     
   Goto                                                                    
  Num      Num   View ID   Sub   File ID /  LRID  /FieldID   Pos   Len   Format
Row1  Row2                                                                 
-------------------------------------------------------------------------------
       1      3  00008349  DTE   00000565/00000595/00030281    12    4  AlphaN
                                 Unsigned/  Left  /rnd=0000     8    0  None    
```

|

## 40 DD SCHEMA - XML Schema file {#40 .section}

To be completed.

## 50 DD SYSOUT {#50 .section}

This type of output is always produced by MR84.

|```
IBM Scalable Architecture for Financial Reporting (SAFR)  
 IP Asset Family Component ID 6949-17P                    
 Performance Engine (MVS) - Base Product                  
 Build PM 4.11.009                                        

 GVBMR84 - XML-to-VDP Converter                           
 (Rev. 00000000: 2012-05-10 22:04)                        

 Executed: 2012-09-14 10:56:49                            

 INFO: XML from DD:XMLIN                                  
 INFO: Schema from DD:SCHEMA                              
 INFO: VDP to DD:VDPOUT                                   
 INFO: Log to DD:MR84RPT                                  
 INFO: Log verbose processed                              
 INFO: XML Parsing completed successfully.                
 INFO: Saving VDP file to 'DD:VDPOUT'                     
 INFO: 83 records written to VDP file                                       
```

|

MR84 can also produce extra output when the PARM-H option is used - see section [75 Output: PARM -H option](PERMR84.md#75).

## 60 DD VDPOUT - VDP \(ASCII\) {#60 .section}

See help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 70 DD XMLIN - VDP XML file {#70 .section}

See help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 75 Output: PARM -H option {#75 .section}

This is one of the PARM options from section [10 PARM options for MR84 step](PERMR84.md#10).

This option writes the following to SYSOUT:

|```
IBM Scalable Architecture for Financial Reporting (SAFR)                      
IP Asset Family Component ID 6949-17P                                         
Performance Engine (MVS) - Base Product                                       
Build PM 4.11.009                                                             
GVBMR84 - XML-to-VDP Converter                                                
(Rev. 00000000: 2012-05-10 22:04)                                             
Executed: 2012-09-12 10:58:26                                                 
                                                                              
Usage: GVBMR84 [-h] [-l [log-file]] [-i] [-c configuration-file]              
               [-o [output-VDP-file]] [-x XML-files-list] [-s XML-SchemaFile] 
               [-v]                                                           
                                                                              
Options/Arguments:                                                            
        -h                     Display command usage                          
        -l [log-file]          The output log file. Default is stdout         
        -i                     Log input XML                                  
        -c configuration-file  The XML converter configuration file.          
        -o [output-VDP-file]   The output view definition file. Default is    
                               out.vdp                                        
        -x XML-files-list      The input XML files, comma separated.          
        -s XML-SchemaFile      The XML schema file.                           
        -v                     Verbose logging    
```

|

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

The sample JCL below runs a job for the entire compile phase.

|```
//V9999BC  JOB (ACCT),'Convert XML to VDP',                             00010000
//          NOTIFY=&SYSUID.,                                            00020000
//          CLASS=A,                                                    00030000
//          MSGLEVEL=(1,1),                                             00040000
//          MSGCLASS=H                                                  00050000
//*                                                                     00060000
//JOBLIB   DD DISP=SHR,DSN=GEBT.PM4XX.BTCHLOAD                          00070001
//         DD DISP=SHR,DSN=DB2V910.xxx                                  00080001
//         DD DISP=SHR,DSN=DB2.xxx                                      00090001
//         DD DISP=SHR,DSN=GEBT.SCHEMA.XML.XXX                          00100001
//         DD DISP=SHR,DSN=xxxDLL                                       00110001
//*                                                                     00120000
// SET HISPN='USERNAME.DATA' INPUT SAFR PVT NON-VSAM                    00130001
// SET HISPV='USERNAME.DATA' INPUT SAFR PVT VSAM                        00140001
// SET HISSN='USERNAME.DATA' INPUT SAFR SHR NON-VSAM                    00150001
// SET HISSV='USERNAME.DATA' INPUT SAFR SHR VSAM                        00160001
// SET HIUPN='USERNAME.V9999' INPUT USER PVT NON-VSAM                   00170001
// SET HIUPV='USERNAME.V9999' INPUT USER PVT VSAM                       00180001
// SET HIUSN='USERNAME.V9999' INPUT USER SHR NON-VSAM                   00190001
// SET HIUSV='USERNAME.V9999' INPUT USER SHR VSAM                       00200001
// SET HOSPN='USERNAME.DATA' OUTPUT SAFR PVT NON-VSAM                   00210001
// SET HOSPV='USERNAME.DATA' OUTPUT SAFR PVT VSAM                       00220001
// SET HOSSN='USERNAME.DATA' OUTPUT SAFR SHR NON-VSAM                   00230001
// SET HOSSV='USERNAME.DATA' OUTPUT SAFR SHR VSAM                       00240001
// SET HOUPN='USERNAME.V9999' OUTPUT USER PVT NON-VSAM                  00250001
// SET HOUPV='USERNAME.V9999' OUTPUT USER PVT VSAM                      00260001
// SET HOUSN='USERNAME.V9999' OUTPUT USER SHR NON-VSAM                  00270001
// SET HOUSV='USERNAME.V9999' OUTPUT USER SHR VSAM                      00280001
// SET JOBLIB='USERNAME.AA.SAFR.JOB' JOB LIB                            00290001
// SET PARMLIB='USERNAME.AA.SAFR.PARM' PARM LIB                         00300001
// SET UNIT='SYSDA'  DASD POOL FOR PERM DATASETS                        00310000
//*                                                                     00320000
//*                                                                     00330000
//*                                                                     00340000
//**********************************************************************00350000
//* PSTEP100 - DELETE THE FILE(S) CREATED IN NEXT STEP                  00360000
//*                                                                     00370000
//* NORMAL RETURN CODE = 0                                              00380000
//*                                                                     00390000
//* IF THIS STEP ABENDS:                                                00400000
//* 1) CORRECT APPLICATION IF POSSIBLE                                  00410000
//* 2) RESTART THE JOB IN THIS STEP                                     00420000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00430000
//*                                                                     00440000
//**********************************************************************00450000
//*                                                                     00460000
//PSTEP100 EXEC PGM=IDCAMS                                              00470000
//*                                                                     00480000
//SYSPRINT DD SYSOUT=*                                                  00490000
//*                                                                     00500000
//SYSIN    DD *                                                         00510000
 DELETE  USERNAME.V9999.MR84.VDP PURGE                                  00520001
 IF LASTCC > 0  THEN        /* IF OPERATION FAILED,     */    -         00530000
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */              00540000
                                                                        00550000
//*                                                                     00560000
//********************************************************************* 00570000
//* PSTEP 110: PRINT CONFIG FILE                                        00580000
//*                                                                     00590000
//********************************************************************* 00600000
//*                                                                     00610000
//PSTEP110  EXEC PGM=IKJEFT1A,                                          00620000
// PARM='REPRO INFILE(INFILE) OUTFILE(CONFIGO)'                         00630000
//*                                                                     00640000
//*        <<< INPUT FILES >>>                                          00650000
//*                                                                     00660000
//SYSTSIN  DD DUMMY                                                     00670000
//*                                                                     00680000
//INFILE   DD DSN=&PARMLIB.(V9999M84),                                  00690000
//            DISP=SHR                                                  00700000
//*                                                                     00710000
//*        <<< OUTPUT FILES >>>                                         00720000
//*                                                                     00730000
//CONFIGO  DD SYSOUT=*                                                  00740000
//*                                                                     00750000
//SYSTSPRT DD SYSOUT=*                                                  00760000
//*                                                                     00770000
//********************************************************************* 00780000
//* IF THIS STEP ABENDS:                                                00790000
//* 1) FOLLOW RESTART GIVEN IN STEP PSTEP110                            00800000
//*                                                                     00810000
//********************************************************************* 00820000
//*                                                                     00830000
//PSTEP111 EXEC PGM=GVBUT99,                                            00840000
//            COND=(0,EQ,PSTEP110),                                     00850000
//            PARM='1099'                                               00860000
//*                                                                     00870000
//********************************************************************* 00880000
//* PSTEP120 - CREATE THE VIEW DEFINITION PARAMETERS (VDP) FILE         00890000
//*                                                                     00900000
//* IF THIS STEP ABENDS:                                                00910000
//* 1) CORRECT APPLICATION IF POSSIBLE                                  00920000
//* 2) RESTART THE JOB IN PSTEP100                                      00930000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00940000
//*                                                                     00950000
//********************************************************************* 00960000
//*                                                                     00970000
//PSTEP120 EXEC PGM=GVBMR84,REGION=256M,                                00980000
// PARM='-C DD:CONFIG'                                                  00990000
//*                                                                     01000000
//*                                                                     01010000
//*        <<< INPUT FILES >>>                                          01020000
//*                                                                     01030000
//CONFIG   DD DSN=&PARMLIB.(V9999M84),                                  01040000
//            DISP=SHR                                                  01050000
//XMLIN    DD DISP=SHR,DSN=&HOUPN..MR86.XML                             01060000
//SCHEMA   DD DISP=SHR,DSN=GEBT.PM413000.GVBXSD(GVBSVDP)                01070000
//*                                                                     01080000
//*                                                                     01090000
//*        <<< OUTPUT FILES >>>                                         01100000
//*                                                                     01110000
//VDPOUT   DD DSN=&HOUPN..MR84.VDP,                                     01120000
//            DISP=(NEW,CATLG,DELETE),                                  01130000
//            UNIT=SYSDA,                                               01140000
//            SPACE=(TRK,(100,100),RLSE),                               01150000
//            DCB=(DSORG=PS,RECFM=U,LRECL=0)                            01160000
//*                                                                     01170000
//MR84RPT  DD SYSOUT=*                                                  01180000
//*MR84RPT  DD DSN=&HOUPN..MR84RPT,                                     01190000
//*             DISP=(NEW,CATLG,DELETE),                                01200000
//*             UNIT=SYSDA,                                             01210000
//*             SPACE=(TRK,(1,1),RLSE),                                 01220000
//*             DCB=(DSORG=PS,RECFM=FB,LRECL=132)                       01230000
//SYSPRINT DD SYSOUT=*                                                  01240000
//SYSOUT   DD SYSOUT=*                                                  01250000
//CEEDUMP  DD SYSOUT=*                                                  01260000
//SYSABEND DD SYSOUT=*                                                  01270000
//*                                                                     01280000
//********************************************************************* 01290000
//* IF THIS STEP ABENDS:                                                01300000
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP PSTEP105                   01310000
//*                                                                     01320000
//********************************************************************* 01330000
//*                                                                     01340000
//*PSTEP121 EXEC PGM=GVBUT99,                                           01350000
//*            COND=(0,EQ,PSTEP120),                                    01360000
//*            PARM='1099'                                              01370000
//*                                                                     01380000
//*SYSMDUMP DD SYSOUT=*                                                 01390000
//*                                                                     01400000
//*******************************************************************   01410000
//* JSTEPNX1 - SUBMIT NEXT JOB                                          01420000
//*******************************************************************   01430000
//*                                                                     01440000
//*JSTEPNX1 EXEC PGM=IEBGENER                                           01450000
//*                                                                     01460000
//*SYSIN    DD DUMMY                                                    01470000
//*                                                                     01480000
//*SYSUT1   DD DSN=&JOBLIB.(V9999CL),                                   01490000
//*            DISP=SHR                                                 01500000
//*                                                                     01510000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        01520000
//*                                                                     01530000
//*SYSPRINT DD SYSOUT=*                                                 01540000
//*                                                                     01550000
//********************************************************************* 01560000
//* IF THIS STEP ABENDS:                                                01570000
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP JSTEPNX1                   01580000
//*                                                                     01590000
//********************************************************************* 01600000
//*                                                                     01610000
//*JSTEPNXX EXEC PGM=GVBUT99,                                           01620000
//*            COND=(0,EQ,JSTEPNX1),                                    01630000
//*            PARM='1099'                                              01640000
//*                                                                     01650000
//*SYSMDUMP DD SYSOUT=*                                                 01660000
//*                                                                     01670000
```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR84**". A link to that overviews is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

