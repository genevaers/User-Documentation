# Utility Runbook: MR48 VDP XML Importer {#PERMR48 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Diagram](PERMR48.md#02)
-   [03 What MR48 does](PERMR48.md#03)
-   [05 MR48 can run in "Development"](PERMR48.md#05)
-   [10 PARM options for MR48 step](PERMR48.md#10)
-   [20 Input file DSNAOINI](PERMR48.md#20)
-   [30 Input file CONFIG](PERMR48.md#30)
-   [60 Output Sample](PERMR48.md#60)
-   [80 JCL Sample](PERMR48.md#80)
-   [99 Troubleshooting](PERMR48.md#99)
-   [100 Need this page completed?](PERMR48.md#100)

## 02 Diagram {#02 .section}

To be completed.

## 03 What MR48 does {#03 .section}

See help topic "**MR48 VDP XML Importer overview**". A link to that overviews is under **Related concepts** below.

## 05 MR48 can run in "Development" {#05 .section}

Some programs in PE are easy to run in "**Development**" rather than "**Production**". See section "**PE split between Development and Production**" in topic "**Typical PE batch flow**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR48 step {#10 .section}

Examples of PARM options for the JCL step for MR48 are as follows:

|```

PARM='-C DD:CONFIG'
 
```

|

The complete PARM options are given below:

|PARM option|Notes|
|-----------|-----|
|To be completed|To be completed|
|To be completed|To be completed|
|To be completed|To be completed|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 20 Input file DSNAOINI {#20 .section}

This is DDNAME **DSNAOINI** in the job step for MR86. This file describes parameters for ODBC access to DB2. This is a typical TSO dataset of record length 80, and records are not numbered.

For contents of this file, see FAQ topic "**DB2 ODBC parameters**" A link to that topic is under **Related reference** below.

## 30 Input file CONFIG {#30 .section}

This is a typical TSO dataset of record length 80, and records are not numbered.

To be completed.

## 60 Output Sample {#60 .section}

To be completed.

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

|```
//RESTOREA JOB (ACCT),'RESTORE USING MR48',                             00010001
//          NOTIFY=&SYSUID.,                                            00020001
//          CLASS=A,                                                    00030001
//          MSGLEVEL=(1,1),                                             00040001
//          MSGCLASS=H                                                  00050001
//*                                                                     00060001
//JOBLIB   DD DISP=SHR,DSN=SAFR.PE.BTCHLOAD                             00070001
//         DD DISP=SHR,DSN=DB2.SDSNLOAD                                 00080001
//*                                                                     00090001
//********************************************************************* 00100001
//*                                                                     00110001
//*   RESTORE METADATA FROM XML VDP FILE                                00120001
//*                                                                     00130001
//********************************************************************* 00140001
//*                                                                     00150001
// SET HISPN='MYCO.DATA' INPUT SAFR PVT NON-VSAM                        00160001
// SET HISPV='MYCO.DATA' INPUT SAFR PVT VSAM                            00170001
// SET HISSN='MYCO.DATA' INPUT SAFR SHR NON-VSAM                        00180001
// SET HISSV='MYCO.DATA' INPUT SAFR SHR VSAM                            00190001
// SET HIUPN='USERNAME.V9999' INPUT USER PVT NON-VSAM                   00200001
// SET HIUPV='USERNAME.V9999' INPUT USER PVT VSAM                       00210001
// SET HIUSN='USERNAME.V9999' INPUT USER SHR NON-VSAM                   00220001
// SET HIUSV='USERNAME.V9999' INPUT USER SHR VSAM                       00230001
// SET HOSPN='MYCO.DATA' OUTPUT SAFR PVT NON-VSAM                       00240001
// SET HOSPV='MYCO.DATA' OUTPUT SAFR PVT VSAM                           00250001
// SET HOSSN='MYCO.DATA'  OUTPUT SAFR SHR NON-VSAM                      00260001
// SET HOSSV='MYCO.DATA'  OUTPUT SAFR SHR VSAM                          00270001
// SET HOUPN='USERNAME.V9999' OUTPUT USER PVT NON-VSAM                  00280001
// SET HOUPV='USERNAME.V9999' OUTPUT USER PVT VSAM                      00290001
// SET HOUSN='USERNAME.V9999' OUTPUT USER SHR NON-VSAM                  00300001
// SET HOUSV='USERNAME.V9999' OUTPUT USER SHR VSAM                      00310001
// SET JOBLIB='USERNAME.SAFR.JOB' JOB LIB                               00320001
// SET PARMLIB='USERNAME.SAFR.PARM' PARM LIB                            00330001
// SET UNIT='SYSDA'  DASD POOL FOR PERM DATASETS                        00340001
//*                                                                     00350001
//*                                                                     00360001
//**********************************************************************00370001
//* PSTEP050 - DELETE THE FILE(S) CREATED IN NEXT STEP                  00380001
//*                                                                     00390001
//* NORMAL RETURN CODE = 0                                              00400001
//*                                                                     00410001
//* IF THIS STEP ABENDS:                                                00420001
//* 1) CORRECT APPLICATION IF POSSIBLE                                  00430001
//* 2) RESTART THE JOB IN THIS STEP                                     00440001
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00450001
//*                                                                     00460001
//**********************************************************************00470001
//*                                                                     00480001
//PSTEP050 EXEC PGM=IDCAMS                                              00490001
//*                                                                     00500001
//SYSPRINT DD SYSOUT=*                                                  00510001
//*                                                                     00520001
//SYSIN    DD *                                                         00530001
 DELETE  MYCO.DATA.MR48.CFG PURGE                                       00540001
 IF LASTCC > 0  THEN        /* IF OPERATION FAILED,     */    -         00550001
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */              00560001
                                                                        00570001
//*                                                                     00580001
//********************************************************************* 00590001
//* PSTEP055 - BUILD THE MR48 CONFIGURATION FILE                        00600001
//*                                                                     00610001
//* IF THIS STEP ABENDS:                                                00620001
//* 1) CORRECT APPLICATION IF POSSIBLE                                  00630001
//* 2) RESTART THE JOB IN THIS STEP                                     00640001
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00650001
//*                                                                     00660001
//********************************************************************* 00670001
//*                                                                     00680001
//PSTEP055 EXEC PGM=IDCAMS                                              00690001
//*                                                                     00700001
//*            INPUT FILES                                              00710001
//*                                                                     00720001
//SYSIN    DD *                                                         00730001
 REPRO INFILE(INFILE) OUTFILE(OUTFILE)                                  00740001
//*                                                                     00750001
//INFILE   DD *                                                         00760001
;********************************************************************** 00770001
;    MR48 CONFIGURATION PARAMETERS                                      00780001
;********************************************************************** 00790001
[XML]                                                                   00800001
FILE=DD:XMLIN                                                           00810001
SCHEMA=DD:SCHEMA                                                        00820001
LOGXML=1                                                                00830001
                                                                        00840001
[LOG]                                                                   00850001
FILE=DD:MR48RPT                                                         00860001
                                                                        00870001
[DATABASE]                                                              00880001
TYPE=IBMDB2                                                             00890001
CONNECTION=DSN=ZZ                                                       00900001
ENVIRONMENTID=ZZ                                                        00910001
SCHEMA=ZZ                                                               00920001
USERID=ZZ                                                               00930001
PASSWORD=ZZ                                                             00940001
                                                                        00950001
//*                                                                     00960001
//*            OUTPUT FILES                                             00970001
//*                                                                     00980001
//OUTFILE  DD DSN=&HISPN.MR48.CFG,                                      00990001
//            DISP=(NEW,CATLG,DELETE),                                  01000001
//            UNIT=SYSDA,                                               01010001
//            SPACE=(TRK,(1,15),RLSE),                                  01020001
//            DCB=(DSORG=PS,RECFM=VB,LRECL=1000)                        01030001
//*                                                                     01040001
//SYSPRINT DD SYSOUT=*                                                  01050001
//*                                                                     01060001
//*                                                                     01070001
//********************************************************************* 01080001
//* IF THIS STEP ABENDS:                                                01090001
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP PSTEP055                   01100001
//*                                                                     01110001
//********************************************************************* 01120001
//*                                                                     01130001
//*                                                                     01140001
//PSTEP056 EXEC PGM=GVBUT99,                                            01150001
//            COND=(0,EQ,PSTEP055),                                     01160001
//            PARM='1099'                                               01170001
//*                                                                     01180001
//SYSMDUMP DD SYSOUT=*                                                  01190001
//*                                                                     01200001
//**********************************************************************01210001
//* PSTEP060 - DELETE THE FILE(S) CREATED IN NEXT STEP                  01220001
//*                                                                     01230001
//* NORMAL RETURN CODE = 0                                              01240001
//*                                                                     01250001
//* IF THIS STEP ABENDS:                                                01260001
//* 1) FIX APPLICATION IF POSSIBLE                                      01270001
//* 2) RESTART THE JOB IN THIS STEP                                     01280001
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01290001
//*                                                                     01300001
//**********************************************************************01310001
//*                                                                     01320001
//PSTEP060 EXEC PGM=IDCAMS                                              01330001
//*                                                                     01340001
//SYSPRINT DD SYSOUT=*                                                  01350001
//*                                                                     01360001
//SYSIN    DD *                                                         01370001
 DELETE  MYCO.DATA.MR48.ODBC PURGE                                      01380001
 IF LASTCC > 0  THEN        /* IF OPERATION FAILED,     */    -         01390001
     SET MAXCC = 0          /* PROCEED AS NORMAL ANYWAY */              01400001
                                                                        01410001
//*                                                                     01420001
//********************************************************************* 01430001
//* PSTEP065 - COPY DB2 ODBC INITIALIZATION FILE                        01440001
//*                                                                     01450001
//* NORMAL RETURN CODE = 0                                              01460001
//*                                                                     01470001
//* IF THIS STEP ABENDS:                                                01480001
//* 1) CORRECT APPLICATION IF POSSIBLE                                  01490001
//* 2) RESTART THE JOB IN THIS STEP                                     01500001
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01510001
//*                                                                     01520001
//********************************************************************* 01530001
//*                                                                     01540001
//PSTEP065  EXEC PGM=IDCAMS                                             01550001
//*                                                                     01560001
//*            INPUT FILES                                              01570001
//*                                                                     01580001
//SYSIN    DD *                                                         01590001
 REPRO INFILE(INFILE) OUTFILE(OUTFILE)                                  01600001
//*                                                                     01610001
//INFILE   DD *                                                         01620001
;********************************************************************** 01630001
;    DB2 ODBC INITIALIZATION PARAMETERS                                 01640001
;********************************************************************** 01650001
                                                                        01660001
[COMMON]                                                                01670001
MVSDEFAULTSSID=ZZ                                                       01680001
APPLTRACEFILENAME="DD:ODBCTRAC"                                         01690001
APPLTRACE=0                                                             01700001
                                                                        01710001
[SUBSYSTEMNAME]                                                         01720001
                                                                        01730001
[DATASOURCENAME]                                                        01740001
CURRENTSQLID=ZZ                                                         01750001
CURRENTSCHEMA=ZZ                                                        01760001
UNDERSCORE=0                                                            01770001
                                                                        01780001
/*                                                                      01790001
//*            OUTPUT FILES                                             01800001
//*                                                                     01810001
//OUTFILE  DD DSN=&HISPN.MR48.ODBC,                                     01820001
//            DISP=(NEW,CATLG,DELETE),                                  01830001
//            UNIT=SYSDA,                                               01840001
//            SPACE=(TRK,(1,1),RLSE),                                   01850001
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          01860001
//*                                                                     01870001
//SYSPRINT DD SYSOUT=*                                                  01880001
//*                                                                     01890001
//********************************************************************* 01900001
//* IF THIS STEP ABENDS:                                                01910001
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP PSTEP065                   01920001
//*                                                                     01930001
//********************************************************************* 01940001
//*                                                                     01950001
//PSTEP066 EXEC PGM=GVBUT99,                                            01960001
//            COND=(0,EQ,PSTEP065),                                     01970001
//            PARM='1099'                                               01980001
//*                                                                     01990001
//SYSMDUMP DD SYSOUT=*                                                  02000001
//*                                                                     02010001
//********************************************************************* 02020001
//* PSTEP075 - PRINT DB2 ODBC INITIALIZATION FILE                       02030001
//*                                                                     02040001
//* NORMAL RETURN CODE = 0                                              02050001
//*                                                                     02060001
//* IF THIS STEP ABENDS:                                                02070001
//* 1) CORRECT APPLICATION IF POSSIBLE                                  02080001
//* 2) RESTART THE JOB IN THIS STEP                                     02090001
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02100001
//*                                                                     02110001
//********************************************************************* 02120001
//*                                                                     02130001
//PSTEP075  EXEC PGM=IKJEFT1A,                                          02140001
// PARM='REPRO INFILE(INFILE) OUTFILE(ODBCINI)'                         02150001
//*                                                                     02160001
//*            INPUT FILES                                              02170001
//*                                                                     02180001
//SYSTSIN  DD DUMMY                                                     02190001
//*                                                                     02200001
//INFILE   DD DSN=&HISPN.MR48.ODBC,                                     02210001
//            DISP=SHR                                                  02220001
//*                                                                     02230001
//*            OUTPUT FILES                                             02240001
//*                                                                     02250001
//ODBCINI  DD SYSOUT=*                                                  02260001
//*                                                                     02270001
//SYSTSPRT DD SYSOUT=*                                                  02280001
//*                                                                     02290001
//********************************************************************* 02300001
//* IF THIS STEP ABENDS:                                                02310001
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP PSTEP075                   02320001
//*                                                                     02330001
//********************************************************************* 02340001
//*                                                                     02350001
//PSTEP076 EXEC PGM=GVBUT99,                                            02360001
//            COND=(0,EQ,PSTEP075),                                     02370001
//            PARM='1099'                                               02380001
//*                                                                     02390001
//SYSMDUMP DD SYSOUT=*                                                  02400001
//*                                                                     02410001
//********************************************************************* 02420001
//* PSTEP105 - RESTORE METADATA FROM XML VDP FILE                       02430001
//*                                                                     02440001
//* IF THIS STEP ABENDS:                                                02450001
//* 1) CORRECT APPLICATION IF POSSIBLE                                  02460001
//* 2) RESTART THE JOB IN THIS STEP                                     02470001
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02480001
//*                                                                     02490001
//********************************************************************* 02500001
//*                                                                     02510001
//PSTEP105 EXEC PGM=GVBMR48,REGION=1024M,                               02520001
// PARM='-C DD:CONFIG'                                                  02530001
//*                                                                     02540001
//DSNAOINI DD DSN=&HISPN.MR48.ODBC,                                     02550001
//            DISP=SHR                                                  02560001
//*                                                                     02570001
//*            INPUT FILES                                              02580001
//*                                                                     02590001
//CONFIG   DD DSN=&HISPN.MR48.CFG,                                      02600001
//            DISP=SHR                                                  02610001
/*                                                                      02620001
//XMLIN    DD DSN=&HOUPN.MR86.XML,                                      02630001
//            DISP=SHR                                                  02640001
/*                                                                      02650001
//SCHEMA   DD DISP=SHR,DSN=MYCO.DATA.SCHEMA(SAFRVDP)                    02660001
//*                                                                     02670001
//*                                                                     02680001
//*            OUTPUT FILES                                             02690001
//*                                                                     02700001
//MR48RPT  DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           02710001
//SYSPRINT DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           02720001
//SYSOUT   DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           02730001
//ODBCTRAC DD SYSOUT=*                                                  02740001
//CEEDUMP  DD SYSOUT=*                                                  02750001
//SYSMDUMP DD SYSOUT=*                                                  02760001

```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR48**". A link to that overviews is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

