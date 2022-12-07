# Utility Runbook: MR93 Job Scheduler {#UTRMR93 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Diagram](UTRMR93.md#02)
-   [03 What MR93 does](UTRMR93.md#03)
-   [10 PARM options for MR93 step](UTRMR93.md#10)
-   [80 JCL Sample](UTRMR93.md#80)
-   [99 Troubleshooting](UTRMR93.md#99)
-   [100 Need this page completed?](UTRMR93.md#100)

## 02 Diagram {#02 .section}

To be completed.

## 03 What MR93 does {#03 .section}

See help topic "**MR93 Job Scheduler overview**". A link to that overviews is under **Related concepts** below.

## 10 PARM options for MR93 step {#10 .section}

Examples of PARM options for the JCL step for MR93 are as follows:

|```
 PARM='00060001'
```

|

The complete PARM options are given below:

|PARM option|Notes|
|-----------|-----|
|To be completed|To be completed|
|To be completed|To be completed|
|To be completed|To be completed|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

The sample JCL below runs a job for the entire format phase.

|```
//V9999FF1 JOB (ACCT),'VIEW 9999 FORMAT 1',                             00010000
//          NOTIFY=&SYSUID.,                                            00020000
//          CLASS=A,                                                    00030000
//          MSGLEVEL=(1,1),                                             00040000
//          MSGCLASS=H                                                  00050000
//*                                                                     00060000
//JOBLIB   DD DISP=SHR,DSN=SAFR.BTCHLOAD                                00070001
//         DD DISP=SHR,DSN=DB2.SDSNEXIT                                 00080001
//*                                                                     00090000
//********************************************************************* 00100000
//*                                                                     00110000
//*   SORT, SUMMARIZE, AND FORMAT VIEWS                                 00120000
//*                                                                     00130000
//********************************************************************* 00140000
//*                                                                     00150000
// SET HISPN='MYCO.DATA' INPUT SAFR PVT NON-VSAM                        00160000
// SET HISPV='MYCO.DATA' INPUT SAFR PVT VSAM                            00170000
// SET HISSN='MYCO.DATA' INPUT SAFR SHR NON-VSAM                        00180000
// SET HISSV='MYCO.DATA' INPUT SAFR SHR VSAM                            00190000
// SET HIUPN='USERNAME.V9999' INPUT USER PVT NON-VSAM                   00200001
// SET HIUPV='USERNAME.V9999' INPUT USER PVT VSAM                       00210001
// SET HIUSN='USERNAME.V9999' INPUT USER SHR NON-VSAM                   00220001
// SET HIUSV='USERNAME.V9999' INPUT USER SHR VSAM                       00230001
// SET HOSPN='MYCO.DATA' OUTPUT SAFR PVT NON-VSAM                       00240000
// SET HOSPV='MYCO.DATA' OUTPUT SAFR PVT VSAM                           00250000
// SET HOSSN='MYCO.DATA'  OUTPUT SAFR SHR NON-VSAM                      00260000
// SET HOSSV='MYCO.DATA'  OUTPUT SAFR SHR VSAM                          00270000
// SET HOUPN='USERNAME.V9999' OUTPUT USER PVT NON-VSAM                  00280001
// SET HOUPV='USERNAME.V9999' OUTPUT USER PVT VSAM                      00290001
// SET HOUSN='USERNAME.V9999' OUTPUT USER SHR NON-VSAM                  00300001
// SET HOUSV='USERNAME.V9999' OUTPUT USER SHR VSAM                      00310001
// SET JOBLIB='USERNAME.SAFR.JOB' JOB LIB                               00320001
// SET PARMLIB='USERNAME.SAFR.PARM' PARM LIB                            00330001
// SET UNIT='SYSDA'  DASD POOL FOR PERM DATASETS                        00340000
// SET PRNTIND='N'           PRINT VIEW OUTPUT? (Y/N)                   00350000
// SET SRTEXIT='S'           COMBINE SORT AND FORMAT? (S/N)             00360000
// SET HDROPT='N'            IGNORE EXTRACT FILE HEADER? (Y/N)          00370000
// SET DISPXIDT='N'          DISPLAY DATA ON XI SUBTOTAL LINES? (Y/N)   00380000
// SET IGNROVFL='Y'          IGNORE CALCULATION OVERFLOW? (Y/N)         00390000
// SET ABNDDIV0='N'          ABEND ON DIVISION BY ZERO? (Y/N)           00400000
// SET EXTKEYL='000'         EXTRACT REC SORT KEY LENGTH (NOT USED)     00410000
// SET COLTBLMX='010000'     COLUMN DEFINITION   TABLE MAXIMUM          00420000
// SET SRTTBLMX='002000'     SORT KEY DEFINITION TABLE MAXIMUM          00430000
// SET CLCTBLMX='005000'     COLUMN CALCULATION  TABLE MAXIMUM          00440000
// SET VDPTBLMX='001000'          MISC VDP RECORD     TABLE MAXIMUM     00450000
//*                                                                     00460000
//**********************************************************************00470000
//* PSTEP600 - DELETE FILE(S) CREATED IN NEXT STEP                      00480000
//*                                                                     00490000
//* NORMAL RETURN CODE = 0                                              00500000
//*                                                                     00510000
//* IF THIS STEP ABENDS:                                                00520000
//* 1) FIX APPLICATION IF POSSIBLE                                      00530000
//* 2) RESTART THE JOB IN THIS STEP                                     00540000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00550000
//*                                                                     00560000
//**********************************************************************00570000
//*                                                                     00580000
//PSTEP600 EXEC PGM=IDCAMS                                              00590000
//*                                                                     00600000
//SYSPRINT DD SYSOUT=*                                                  00610000
//*                                                                     00620000
//SYSIN    DD *                                                     %%% 00630000
 /* USER-DEFINED DATA SETS: */                                          00640000
                                                                        00650000
 DELETE  ??.V9999.F0009999  PURGE                                       00660000
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          00670000
     SET MAXCC = 0          /* KEEP GOING */                            00680000
                                                                        00690000
                                                                        00700000
 /* SAFR WORK DATA SETS */                                              00710000
                                                                        00720000
//*                                                                     00730000
//********************************************************************* 00740000
//* PSTEP620 - SUMMARIZE AND FORMAT VIEWS                               00750000
//*                                                                     00760000
//* NORMAL RETURN CODES:                                                00770000
//*                                                                     00780000
//*    0 = SUCCESSFUL, MARGINAL (HXM) FILE LOADED                       00790000
//*    1 = SUCCESSFUL, MARGINAL (HXM) FILE EMPTY                        00800000
//*                                                                     00810000
//* IF THIS STEP ABENDS:                                                00820000
//* 1) FIX APPLICATION IF POSSIBLE                                      00830000
//* 2) RESTART THE JOB IN PSTEP600                                      00840000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00850000
//*                                                                     00860000
//********************************************************************* 00870000
//*                                                                     00880000
//PSTEP620 EXEC PGM=GVBMR88,                                            00890000
// REGION=0M,                                                           00900000
//       PARM='&PRNTIND.&SRTEXIT.&HDROPT.&DISPXIDT.&IGNROVFL.&ABNDDIV0.X00910000
//             &EXTKEYL.&COLTBLMX.&SRTTBLMX.&CLCTBLMX.&VDPTBLMX.'       00920000
//*                                                                     00930000
//*            INPUT SAFR FILES                                         00940001
//*                                                                     00950000
//MR88VDP  DD DSN=&HISPN..MR77.VDP,                                     00960000
//            DISP=SHR                                                  00970000
//*                                                                     00980000
//SYSIN    DD DSN=&HISPN..EXTR001.SXT,                                  00990000
//            DISP=SHR                                                  01000000
//*                                                                     01010000
//SORTCNTL DD DSN=&PARMLIB.(V9999S88),                                  01020000
//            DISP=SHR                                                  01030000
//*                                                                     01040000
//SORTIN   DD DSN=&HISPN..EXTR001.EXT,                                  01050000
//            DISP=SHR                                                  01060000
//*                                                                     01070000
//MR88MSTR DD DUMMY,BLKSIZE=2408                                        01080000
//*                                                                     01090000
//MR88RTH  DD DSN=&HISPN..RTH,                                          01100000
//            DISP=SHR                                                  01110000
//*                                                                     01120000
//GREF003  DD DISP=SHR,DSN=&HISPN..FILE003.RED                          01130000
//GREF004  DD DISP=SHR,DSN=&HISPN..FILE004.RED                          01140000
//GREF005  DD DISP=SHR,DSN=&HISPN..FILE005.RED                          01150000
//GREF006  DD DISP=SHR,DSN=&HISPN..FILE006.RED                          01160000
//GREF007  DD DISP=SHR,DSN=&HISPN..FILE007.RED                          01170000
//GREF008  DD DISP=SHR,DSN=&HISPN..FILE008.RED                          01180000
//GREF009  DD DISP=SHR,DSN=&HISPN..FILE009.RED                          01190000
//GREF010  DD DISP=SHR,DSN=&HISPN..FILE010.RED                          01200000
//GREF011  DD DISP=SHR,DSN=&HISPN..FILE011.RED                          01210000
//GREF012  DD DISP=SHR,DSN=&HISPN..FILE012.RED                          01220000
//*                                                                     01230000
//*            OUTPUT SAFR FILES                                        01240001
//*                                                                     01250000
//MR88HXM  DD DUMMY,BLKSIZE=27998                                       01260000
//*                                                                     01270000
//MR88HXD  DD DUMMY,BLKSIZE=2458                                        01280000
//*                                                                     01290000
//MR88OSI  DD DUMMY,BLKSIZE=3000                                        01300000
//*                                                                     01310000
//MR88OSR  DD DUMMY,BLKSIZE=1870                                        01320000
//*                                                                     01330000
//MR88CSB  DD DUMMY,BLKSIZE=440                                         01340000
//*                                                                     01350000
//MR88CRR  DD DUMMY,AMP=AMORG                                           01360000
//*                                                                     01370000
//MR88XIH  DD DUMMY,BLKSIZE=5120                                        01380000
//*                                                                     01390000
//MR88XID  DD DUMMY,BLKSIZE=2052                                        01400000
//*                                                                     01410000
//MR88XI00 DD DUMMY,BLKSIZE=2052                                        01420000
//MR88XI01 DD DUMMY,BLKSIZE=2052                                        01430000
//MR88XI02 DD DUMMY,BLKSIZE=2052                                        01440000
//MR88XI03 DD DUMMY,BLKSIZE=2052                                        01450000
//MR88XI04 DD DUMMY,BLKSIZE=2052                                        01460000
//MR88XI05 DD DUMMY,BLKSIZE=2052                                        01470000
//MR88XI06 DD DUMMY,BLKSIZE=2052                                        01480000
//MR88XI07 DD DUMMY,BLKSIZE=2052                                        01490000
//MR88XI08 DD DUMMY,BLKSIZE=2052                                        01500000
//MR88XI09 DD DUMMY,BLKSIZE=2052                                        01510000
//MR88XI10 DD DUMMY,BLKSIZE=2052                                        01520000
//MR88XI11 DD DUMMY,BLKSIZE=2052                                        01530000
//MR88XI12 DD DUMMY,BLKSIZE=2052                                        01540000
//MR88XI13 DD DUMMY,BLKSIZE=2052                                        01550000
//MR88XI14 DD DUMMY,BLKSIZE=2052                                        01560000
//MR88XI15 DD DUMMY,BLKSIZE=2052                                        01570000
//MR88XI16 DD DUMMY,BLKSIZE=2052                                        01580000
//MR88XI17 DD DUMMY,BLKSIZE=2052                                        01590000
//MR88XI18 DD DUMMY,BLKSIZE=2052                                        01600000
//MR88XI19 DD DUMMY,BLKSIZE=2052                                        01610000
//MR88XI20 DD DUMMY,BLKSIZE=2052                                        01620000
//*                                                                     01630000
//SYSOUT   DD SYSOUT=*                                                  01640000
//*                                                                     01650000
//SORTDIAG DD SYSOUT=*                                                  01660000
//*                                                                     01670000
//MR88RPT  DD SYSOUT=*                                                  01680000
//MR88PARM DD SYSOUT=*                                                  01690000
//MR88PRNT DD SYSOUT=*                                                  01700000
//SYSOUT   DD SYSOUT=*                                                  01710000
//SYSMDUMP DD SYSOUT=*                                                  01720000
//*                                                                     01730000
//*            OUTPUT VIEW FILES                                        01740001
//*                                                                 %%% 01750000
//F0009999 DD DSN=??.V9999.F0009999,                                    01760000
//            DISP=(NEW,CATLG,DELETE),                                  01770000
//            UNIT=SYSDA,                                               01780000
//            SPACE=(TRK,(100,100),RLSE),                               01790000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=1)                           01800000
//*                                                                     01810000
//********************************************************************* 01820000
//* IF THIS STEP ABENDS:                                                01830000
//* FOLLOW RESTART GIVEN IN STEP PSTEP620                               01840000
//*                                                                     01850000
//********************************************************************* 01860000
//*                                                                     01870000
//PSTEP621 EXEC PGM=GVBUT99,                                            01880000
//            COND=(1,GE,PSTEP620),                                     01890000
//            PARM='1099'                                               01900000
//*                                                                     01910000
//SYSMDUMP DD SYSOUT=*                                                  01920000
//*                                                                     01930000
//**********************************************************************01940000
//* JSTEP640 - SET AND COMPARE SWITCHES                                 01950000
//**********************************************************************01960000
//* STEP RESTARTABLE: NO                                                01970000
//* SUBMIT APPROPRIATE JOB BASED ON JOB LOGIC                           01980000
//**********************************************************************01990000
//*                                                                     02000000
//*JSTEP640 EXEC PGM=GVBMR93,                                           02010000
//*            PARM='00060001'                                          02020000
//*                                                                     02030000
//*SWT      DD DSN=??.V9999.CLEANUP.SWT,                                02040000
//*            DISP=SHR                                                 02050000
//*                                                                     02060000
//*SYSOUT   DD SYSOUT=*                                                 02070000
//*                                                                     02080000
//*******************************************************************   02090000
//* JSTEPN10 - SUBMIT NEXT JOB                                          02100000
//*******************************************************************   02110000
//*                                                                     02120000
//*JSTEPN10 EXEC PGM=IEBGENER,                                          02130000
//*          COND=(0,NE,JSTEP640)                                       02140000
//*                                                                     02150000
//*SYSIN    DD DUMMY                                                    02160000
//*                                                                     02170000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF2),                                  02180000
//*            DISP=SHR                                                 02190000
//*                                                                     02200000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        02210000
//*                                                                     02220000
//*SYSPRINT DD SYSOUT=*                                                 02230000
//*                                                                     02240000
//********************************************************************* 02250000
//* IF THIS STEP ABENDS:                                                02260000
//* 1) FOLLOW RESTART INSTRUCTIONS FROM STEP JSTEPN10                   02270000
//*                                                                     02280000
//********************************************************************* 02290000
//*                                                                     02300000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           02310000
//*            COND=((0,NE,JSTEP640),(0,EQ,JSTEPN10)),                  02320000
//*            PARM='1099'                                              02330000
//*                                                                     02340000
//*SYSMDUMP DD SYSOUT=*                                                 02350000
//*                                                                     02360000
//*                                                                     02370000
//*                                                                     02380000 
```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR93**". A link to that overviews is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Utilities Reference](../html/AAR540PMUtilsRef.md)

