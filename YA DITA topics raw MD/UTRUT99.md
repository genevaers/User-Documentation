# Utility Runbook: UT99 User Abend {#UTRUT99 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 What UT99 does](UTRUT99.md#02)
-   [03 Sample Output](UTRUT99.md#03)
-   [04 Troubleshooting](UTRUT99.md#04)
-   [05 PARM options for UT99 step](UTRUT99.md#05)
-   [06 Sample JCL](UTRUT99.md#06)

## 02 What UT99 does {#02 .section}

See help topic "**UT99 User Abend overview**". A link to that overviews is under **Related concepts** below.

## 03 Sample Output {#03 .section}

To be completed.

## 04 Troubleshooting {#04 .section}

See help topic "**Troubleshooting UT99**". A link to that overviews is under **Related reference** below.

## 05 PARM options for UT99 step {#05 .section}

Examples of PARM options for the JCL step for UT99 are as follows:

|```
  PARM='1099'  
```

|

The complete PARM options are given below:

|PARM option|Notes|
|-----------|-----|
|To be completed|To be completed|
|To be completed|To be completed|
|To be completed|To be completed|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 06 Sample JCL {#06 .section}

This JCL runs a job for the entire extract phase.

|```
//V9999EE JOB (ACCT),'VIEW 9999 EXTRACT  ',                             00010000
//          NOTIFY=&SYSUID.,                                            00020000
//          CLASS=A,                                                    00030000
//          MSGLEVEL=(1,1),                                             00040000
//          MSGCLASS=H                                                  00050000
//*                                                                     00060000
//JOBLIB   DD DISP=SHR,DSN=SAFR.BTCHLOAD                                00070000
//         DD DISP=SHR,DSN=DB2.SDSNEXIT                                 00080000
//*                                                                     00090000
//********************************************************************* 00100000
//*                                                                     00110000
//*   EXTRACT EVENT DATA                                                00120000
//*                                                                     00130000
//********************************************************************* 00140000
//*                                                                     00150000
// SET HISPN='MYCO.DATA' INPUT SAFR PVT NON-VSAM                        00160000
// SET HISPV='MYCO.DATA' INPUT SAFR PVT VSAM                            00170000
// SET HISSN='MYCO.DATA' INPUT SAFR SHR NON-VSAM                        00180000
// SET HISSV='MYCO.DATA' INPUT SAFR SHR VSAM                            00190000
// SET HIUPN='USERNAME.V9999' INPUT USER PVT NON-VSAM                   00200000
// SET HIUPV='USERNAME.V9999' INPUT USER PVT VSAM                       00210000
// SET HIUSN='USERNAME.V9999' INPUT USER SHR NON-VSAM                   00220000
// SET HIUSV='USERNAME.V9999' INPUT USER SHR VSAM                       00230000
// SET HOSPN='MYCO.DATA' OUTPUT SAFR PVT NON-VSAM                       00240000
// SET HOSPV='MYCO.DATA' OUTPUT SAFR PVT VSAM                           00250000
// SET HOSSN='MYCO.DATA'  OUTPUT SAFR SHR NON-VSAM                      00260000
// SET HOSSV='MYCO.DATA'  OUTPUT SAFR SHR VSAM                          00270000
// SET HOUPN='USERNAME.V9999' OUTPUT USER PVT NON-VSAM                  00280000
// SET HOUPV='USERNAME.V9999' OUTPUT USER PVT VSAM                      00290000
// SET HOUSN='USERNAME.V9999' OUTPUT USER SHR NON-VSAM                  00300000
// SET HOUSV='USERNAME.V9999' OUTPUT USER SHR VSAM                      00310000
// SET JOBLIB='USERNAME.SAFR.JOB' JOB LIB                               00320000
// SET PARMLIB='USERNAME.SAFR.PARM' PARM LIB                            00330000
// SET UNIT='SYSDA'  DASD POOL FOR PERM DATASETS                        00340000
//*                                                                     00350000
//********************************************************************* 00360000
//* PSTEP500 - PRINT LOGIC TABLE REPORT                                 00370000
//*                                                                     00380000
//* NORMAL RETURN CODE = 0                                              00390000
//*                                                                     00400000
//* IF THIS STEP ABENDS:                                                00410000
//* 1) FIX APPLICATION IF POSSIBLE                                      00420000
//* 2) RESTART THE JOB IN THIS STEP                                     00430000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00440000
//*                                                                     00450000
//********************************************************************* 00460000
//*                                                                     00470000
//PSTEP500 EXEC PGM=GVBUT90,                                            00480000
//          PARM='A'                                                    00490000
//*                                                                     00500000
//GV4LT    DD DSN=&HISPN..MR76.XLT,                                     00510000
//            DISP=SHR                                                  00520000
//*                                                                     00530000
//SYSIN    DD DUMMY                                                     00540000
//*                                                                     00550000
//UT90RPT  DD SYSOUT=*                                                  00560000
//SYSOUT   DD SYSOUT=*                                                  00570000
//CEEDUMP  DD SYSOUT=*                                                  00580000
//SYSMDUMP DD SYSOUT=*                                                  00590000
//*                                                                     00600000
//********************************************************************* 00610000
//* IF THIS STEP ABENDS:                                                00620000
//* FOLLOW RESTART GIVEN IN STEP PSTEP500                               00630000
//*                                                                     00640000
//********************************************************************* 00650000
//*                                                                     00660000
//PSTEP501 EXEC PGM=GVBUT99,                                            00670000
//            COND=(0,EQ,PSTEP500),                                     00680000
//            PARM='1099'                                               00690000
//*                                                                     00700000
//SYSMDUMP DD SYSOUT=*                                                  00710000
//*                                                                     00720000
//**********************************************************************00730000
//* PSTEP520 - DELETE FILE(S) CREATED IN NEXT STEP                      00740000
//*                                                                     00750000
//* NORMAL RETURN CODE = 0                                              00760000
//*                                                                     00770000
//* IF THIS STEP ABENDS:                                                00780000
//* 1) FIX APPLICATION IF POSSIBLE                                      00790000
//* 2) RESTART THE JOB IN THIS STEP                                     00800000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00810000
//*                                                                     00820000
//**********************************************************************00830000
//*                                                                     00840000
//PSTEP520 EXEC PGM=IDCAMS                                              00850000
//*                                                                     00860000
//SYSPRINT DD SYSOUT=*                                                  00870000
//*                                                                     00880000
//SYSIN    DD *                                                     %%% 00890000
 /* USER-DEFINED DATA SETS: */                                          00900000
                                                                        00910000
 DELETE  ??.V9999.F0000000              PURGE                           00920000
 IF LASTCC > 0  THEN   /* IF FAILS,  */ -                               00930000
     SET MAXCC = 0     /* KEEP GOING */                                 00940000
                                                                        00950000
                                                                        00960000
 /* SAFR WORK DATA SETS */                                              00970000
                                                                        00980000
 DELETE  ??.V9999.EXT.BIL PURGE                                         00990000
 IF LASTCC > 0  THEN   /* IF FAILS,  */ -                               01000000
     SET MAXCC = 0     /* KEEP GOING */                                 01010000
                                                                        01020000
 DELETE  ??.V9999.EXTR001.EXT PURGE                                     01030000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01040000
     SET MAXCC = 0      /* KEEP GOING */                                01050000
                                                                        01060000
 DELETE  ??.V9999.EXTR002.EXT PURGE                                     01070000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01080000
     SET MAXCC = 0      /* KEEP GOING */                                01090000
                                                                        01100000
 DELETE  ??.V9999.EXTR003.EXT PURGE                                     01110000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01120000
     SET MAXCC = 0      /* KEEP GOING */                                01130000
                                                                        01140000
 DELETE  ??.V9999.EXTR004.EXT PURGE                                     01150000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01160000
     SET MAXCC = 0      /* KEEP GOING */                                01170000
                                                                        01180000
 DELETE  ??.V9999.EXTR005.EXT PURGE                                     01190000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01200000
     SET MAXCC = 0      /* KEEP GOING */                                01210000
                                                                        01220000
 DELETE  ??.V9999.EXTR006.EXT PURGE                                     01230000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01240000
     SET MAXCC = 0      /* KEEP GOING */                                01250000
                                                                        01260000
 DELETE  ??.V9999.EXTR001.SXT PURGE                                     01270000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01280000
     SET MAXCC = 0      /* KEEP GOING */                                01290000
                                                                        01300000
 DELETE  ??.V9999.EXTR002.SXT PURGE                                     01310000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01320000
     SET MAXCC = 0      /* KEEP GOING */                                01330000
                                                                        01340000
 DELETE  ??.V9999.EXTR003.SXT PURGE                                     01350000
 IF LASTCC > 0  THEN    /* IF FAILS,  */ -                              01360000
     SET MAXCC = 0      /* KEEP GOING */                                01370000
                                                                        01380000
 DELETE  ??.V9999.EXTR004.SXT PURGE                                     01390000
 IF LASTCC > 0  THEN    /* IF FAILS,   */ -                             01400000
     SET MAXCC = 0      /* KEEP GOING */                                01410000
                                                                        01420000
 DELETE  ??.V9999.EXTR005.SXT PURGE                                     01430000
 IF LASTCC > 0  THEN    /* IF FAILS,   */ -                             01440000
     SET MAXCC = 0      /* KEEP GOING */                                01450000
                                                                        01460000
 DELETE  ??.V9999.EXTR006.SXT PURGE                                     01470000
 IF LASTCC > 0  THEN    /* IF FAILS,   */ -                             01480000
     SET MAXCC = 0      /* KEEP GOING */                                01490000
                                                                        01500000
//*                                                                     01510000
//********************************************************************* 01520000
//* PSTEP540 - EXTRACT DATA FOR VIEWS                                   01530000
//*                                                                     01540000
//* NORMAL RETURN CODE = 0                                              01550000
//*                                                                     01560000
//* IF THIS STEP ABENDS:                                                01570000
//* 1) FIX APPLICATION IF POSSIBLE                                      01580000
//* 2) RESTART THE JOB IN PSTEP520                                      01590000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01600000
//*                                                                     01610000
//********************************************************************* 01620000
//*                                                                     01630000
//PSTEP540 EXEC PGM=GVBMR95,                                            01640000
// REGION=0M                                                            01650000
//*                                                                     01660000
//*            INPUT SAFR FILES                                         01670000
//*                                                                     01680000
//MR95PARM DD DSN=&PARMLIB.(V9999E95),                                  01690000
//            DISP=SHR                                                  01700000
//*                                                                     01710000
//MR95VDP  DD DSN=&HISPN..MR77.VDP,                                     01720000
//            DISP=SHR                                                  01730000
//*                                                                     01740000
//MR95LTBL DD DSN=&HISPN..MR76.XLT,                                     01750000
//            DISP=SHR                                                  01760000
//*                                                                     01770000
//MR95ENVV DD DSN=&PARMLIB.(EMPTY),                                     01780000
//            DISP=SHR                                                  01790000
//*                                                                     01800000
//MR95REH  DD DSN=&HISPN..REH,                                          01810000
//            DISP=SHR                                                  01820000
//*                                                                     01830000
//GREF003  DD DISP=SHR,DSN=&HISPN..FILE003.RED                          01840000
//GREF004  DD DISP=SHR,DSN=&HISPN..FILE004.RED                          01850000
//GREF005  DD DISP=SHR,DSN=&HISPN..FILE005.RED                          01860000
//GREF006  DD DISP=SHR,DSN=&HISPN..FILE006.RED                          01870000
//GREF007  DD DISP=SHR,DSN=&HISPN..FILE007.RED                          01880000
//GREF008  DD DISP=SHR,DSN=&HISPN..FILE008.RED                          01890000
//GREF009  DD DISP=SHR,DSN=&HISPN..FILE009.RED                          01900000
//GREF010  DD DISP=SHR,DSN=&HISPN..FILE010.RED                          01910000
//GREF011  DD DISP=SHR,DSN=&HISPN..FILE011.RED                          01920000
//GREF012  DD DISP=SHR,DSN=&HISPN..FILE012.RED                          01930000
//*                                                                     01940000
//*            INPUT EVENT FILES                                        01950000
//*                                                                 %%% 01960000
//* MASTER SALES FILES                                                  01970000
//CA000001 DD DISP=SHR,DSN=??.CA.CURR.YR                                01980000
//CO000001 DD DISP=SHR,DSN=??.CO.CURR.YR                                01990000
//IL000001 DD DISP=SHR,DSN=??.IL.CURR.YR                                02000000
//MO000001 DD DISP=SHR,DSN=??.MO.CURR.YR                                02010000
//OH000001 DD DISP=SHR,DSN=??.OH.CURR.YR                                02020000
//NJ000001 DD DISP=SHR,DSN=??.NJ.CURR.YR                                02030000
//NY000001 DD DISP=SHR,DSN=??.NY.CURR.YR                                02040000
//TX000001 DD DISP=SHR,DSN=??.TX.CURR.YR                                02050000
//VA000001 DD DISP=SHR,DSN=??.VA.CURR.YR                                02060000
//*                                                                     02070000
//* REFERENCE FILES AS EVENT FILES                                      02080000
//PROD0001 DD DISP=SHR,DSN=??.PRD                                       02090000
//PRODADV1 DD DISP=SHR,DSN=??.PRD.ADVANCED                              02100000
//PRODNUM1 DD DISP=SHR,DSN=??.PRD.NUMERIC.ERRORS                        02110000
//STE00001 DD DISP=SHR,DSN=??.STE                                       02120000
//CUST0001 DD DISP=SHR,DSN=??.CUS                                       02130000
//TYPE0001 DD DISP=SHR,DSN=??.TYP                                       02140000
//*                                                                     02150000
//*            OUTPUT SAFR FILES                                        02160000
//*                                                                     02170000
//MR95BILL DD DSN=&HOSPN..EXT.BIL,                                      02180000
//            DISP=(NEW,CATLG,DELETE),                                  02190000
//            UNIT=&UNIT.,                                              02200000
//            SPACE=(TRK,(1,15),RLSE),                                  02210000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02220000
//*                                                                     02230000
//EXTR001  DD DSN=&HOSPN..EXTR001.EXT,                                  02240000
//            DISP=(NEW,CATLG,DELETE),                                  02250000
//            UNIT=(&UNIT.,10),                                         02260000
//            SPACE=(TRK,(1,1000),RLSE),                                02270000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02280000
//*                                                                     02290000
//EXTR002  DD DSN=&HOSPN..EXTR002.EXT,                                  02300000
//            DISP=(NEW,CATLG,DELETE),                                  02310000
//            UNIT=(&UNIT.,10),                                         02320000
//            SPACE=(TRK,(1,1000),RLSE),                                02330000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02340000
//*                                                                     02350000
//EXTR003  DD DSN=&HOSPN..EXTR003.EXT,                                  02360000
//            DISP=(NEW,CATLG,DELETE),                                  02370000
//            UNIT=(&UNIT.,10),                                         02380000
//            SPACE=(TRK,(1,1000),RLSE),                                02390000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02400000
//*                                                                     02410000
//EXTR004  DD DSN=&HOSPN..EXTR004.EXT,                                  02420000
//            DISP=(NEW,CATLG,DELETE),                                  02430000
//            UNIT=(&UNIT.,10),                                         02440000
//            SPACE=(TRK,(1,1000),RLSE),                                02450000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02460000
//*                                                                     02470000
//EXTR005  DD DSN=&HOSPN..EXTR005.EXT,                                  02480000
//            DISP=(NEW,CATLG,DELETE),                                  02490000
//            UNIT=(&UNIT.,10),                                         02500000
//            SPACE=(TRK,(1,1000),RLSE),                                02510000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02520000
//*                                                                     02530000
//EXTR006  DD DSN=&HOSPN..EXTR006.EXT,                                  02540000
//            DISP=(NEW,CATLG,DELETE),                                  02550000
//            UNIT=(&UNIT.,10),                                         02560000
//            SPACE=(TRK,(1,1000),RLSE),                                02570000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=8192)                        02580000
//*                                                                     02590000
//SORT001  DD DSN=&HOSPN..EXTR001.SXT,                                  02600000
//            DISP=(NEW,CATLG,DELETE),                                  02610000
//            UNIT=&UNIT.,                                              02620000
//            SPACE=(TRK,(1,1),RLSE),                                   02630000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02640000
//*                                                                     02650000
//SORT002  DD DSN=&HOSPN..EXTR002.SXT,                                  02660000
//            DISP=(NEW,CATLG,DELETE),                                  02670000
//            UNIT=&UNIT.,                                              02680000
//            SPACE=(TRK,(1,1),RLSE),                                   02690000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02700000
//*                                                                     02710000
//SORT003  DD DSN=&HOSPN..EXTR003.SXT,                                  02720000
//            DISP=(NEW,CATLG,DELETE),                                  02730000
//            UNIT=&UNIT.,                                              02740000
//            SPACE=(TRK,(1,1),RLSE),                                   02750000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02760000
//*                                                                     02770000
//SORT004  DD DSN=&HOSPN..EXTR004.SXT,                                  02780000
//            DISP=(NEW,CATLG,DELETE),                                  02790000
//            UNIT=&UNIT.,                                              02800000
//            SPACE=(TRK,(1,1),RLSE),                                   02810000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02820000
//*                                                                     02830000
//SORT005  DD DSN=&HOSPN..EXTR005.SXT,                                  02840000
//            DISP=(NEW,CATLG,DELETE),                                  02850000
//            UNIT=&UNIT.,                                              02860000
//            SPACE=(TRK,(1,1),RLSE),                                   02870000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02880000
//*                                                                     02890000
//SORT006  DD DSN=&HOSPN..EXTR006.SXT,                                  02900000
//            DISP=(NEW,CATLG,DELETE),                                  02910000
//            UNIT=&UNIT.,                                              02920000
//            SPACE=(TRK,(1,1),RLSE),                                   02930000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80)                          02940000
//*                                                                     02950000
//MR95RPT  DD SYSOUT=*                                                  02960000
//MR95TRAC DD SYSOUT=*                                                  02970000
//SNAPDATA DD SYSOUT=*                                                  02980000
//SYSOUT   DD SYSOUT=*                                                  02990000
//CEEDUMP  DD SYSOUT=*                                                  03000000
//*                                                                     03010000
//SYSMDUMP DD SYSOUT=*                                                  03020000
//*                                                                     03030000
//*            OUTPUT VIEW FILES                                        03040000
//*                                                                 %%% 03050000
//F0000000 DD DSN=&HIUPV..F0000000,                                     03060000
//            DISP=(NEW,CATLG,DELETE),                                  03070000
//            UNIT=SYSDA,                                               03080000
//            SPACE=(TRK,(100,100),RLSE),                               03090000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=1)                           03100000
//*                                                                     03110000
//F0001111 DD SYSOUT=*,RECFM=FBA,LRECL=250                              03120000
//*                                                                     03130000
//********************************************************************* 03140000
//* IF THIS STEP ABENDS:                                                03150000
//* FOLLOW RESTART GIVEN IN STEP PSTEP540                               03160000
//*                                                                     03170000
//********************************************************************* 03180000
//*                                                                     03190000
//PSTEP541 EXEC PGM=GVBUT99,                                            03200000
//            COND=(1,GE,PSTEP540),                                     03210000
//            PARM='1099'                                               03220000
//*                                                                     03230000
//SYSMDUMP DD SYSOUT=*                                                  03240000
//*                                                                     03250000
//*******************************************************************   03260000
//* JSTEP560 - CREATE SWITCH FILE                                       03270000
//*******************************************************************   03280000
//*                                                                     03290000
//*JSTEP560 EXEC PGM=IDCAMS                                             03300000
//*                                                                     03310000
//*SYSIN    DD *                                                        03320000
//* DELETE -                                                            03330000
//*     (??.V9999.CLEANUP.SWT) PURGE                                    03340000
//* IF LASTCC > 0  THEN    /* IF FAILS,   */ -                          03350000
//*     SET MAXCC = 0      /* KEEP GOING */                             03360000
//*                                                                     03370000
//* DEFINE CLUSTER -                                                    03380000
//*     (NAME(??.V9999.CLEANUP.SWT) -                                   03390000
//*     STORAGECLASS(SCSTD) -                                           03400000
//*     NONINDEXED -                                                    03410000
//*     RECSZ(9999 9999) -                                              03420000
//*     SHR(2 3) -                                                      03430000
//*     SPEED -                                                         03440000
//*     ) -                                                             03450000
//* DATA -                                                              03460000
//*     (NAME(??.V9999.CLEANUP.SWT.DATA) -                              03470000
//*     CISZ(10240) -                                                   03480000
//*     TRK(1 1) -                                                      03490000
//*     )                                                               03500000
//*                                                                     03510000
//* IF LASTCC > 0 THEN    /* IF FAILS, */ -                             03520000
//*     SET MAXCC = 16    /* SKIP LATER STEPS  */                       03530000
//*                                                                     03540000
//* REPRO -                                                             03550000
//*     INFILE(INFILE) -                                                03560000
//*     OUTDATASET(??.V9999.CLEANUP.SWT)                                03570000
//*                                                                     03580000
//* IF LASTCC > 0 THEN    /* IF FAILS,   */ -                           03590000
//*     SET MAXCC = 16    /* SKIP LATER STEPS  */                       03600000
//*                                                                     03610000
//*                                                                     03620000
//*INFILE   DD DSN=&HIUPV..DUMMY.SWT,                                   03630000
//*            DISP=SHR                                                 03640000
//*                                                                     03650000
//*SYSPRINT DD SYSOUT=*                                                 03660000
//*                                                                     03670000
//********************************************************************* 03680000
//* IF THIS STEP ABENDS:                                                03690000
//* FOLLOW RESTART GIVEN IN STEP JSTEP560                               03700000
//*                                                                     03710000
//********************************************************************* 03720000
//*                                                                     03730000
//*JSTEP561 EXEC PGM=GVBUT99,                                           03740000
//*            COND=(0,EQ,JSTEP560),                                    03750000
//*            PARM='1099'                                              03760000
//*                                                                     03770000
//*SYSMDUMP DD SYSOUT=*                                                 03780000
//*                                                                     03790000
//*******************************************************************   03800000
//* JSTEPN10 - SUBMIT NEXT JOB                                          03810000
//*******************************************************************   03820000
//*                                                                     03830000
//*JSTEPN10 EXEC PGM=IEBGENER                                           03840000
//*                                                                     03850000
//*SYSIN    DD DUMMY                                                    03860000
//*                                                                     03870000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF1),                                  03880000
//*            DISP=SHR                                                 03890000
//*                                                                     03900000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        03910000
//*                                                                     03920000
//*SYSPRINT DD SYSOUT=*                                                 03930000
//*                                                                     03940000
//********************************************************************* 03950000
//* IF THIS STEP ABENDS:                                                03960000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN10                               03970000
//*                                                                     03980000
//********************************************************************* 03990000
//*                                                                     04000000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           04010000
//*            COND=(0,EQ,JSTEPN10),                                    04020000
//*            PARM='1099'                                              04030000
//*                                                                     04040000
//*SYSMDUMP DD SYSOUT=*                                                 04050000
//*                                                                     04060000
//*******************************************************************   04070000
//* JSTEPN20 - SUBMIT NEXT JOB                                          04080000
//*******************************************************************   04090000
//*                                                                     04100000
//*JSTEPN20 EXEC PGM=IEBGENER                                           04110000
//*                                                                     04120000
//*SYSIN    DD DUMMY                                                    04130000
//*                                                                     04140000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF2),                                  04150000
//*            DISP=SHR                                                 04160000
//*                                                                     04170000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04180000
//*                                                                     04190000
//*SYSPRINT DD SYSOUT=*                                                 04200000
//*                                                                     04210000
//********************************************************************* 04220000
//* IF THIS STEP ABENDS:                                                04230000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN20                               04240000
//*                                                                     04250000
//********************************************************************* 04260000
//*                                                                     04270000
//*JSTEPN21 EXEC PGM=GVBUT99,                                           04280000
//*            COND=(0,EQ,JSTEPN20),                                    04290000
//*            PARM='1099'                                              04300000
//*                                                                     04310000
//*SYSMDUMP DD SYSOUT=*                                                 04320000
//*                                                                     04330000
//*******************************************************************   04340000
//* JSTEPN30 - SUBMIT NEXT JOB                                          04350000
//*******************************************************************   04360000
//*                                                                     04370000
//*JSTEPN30 EXEC PGM=IEBGENER                                           04380000
//*                                                                     04390000
//*SYSIN    DD DUMMY                                                    04400000
//*                                                                     04410000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF3),                                  04420000
//*            DISP=SHR                                                 04430000
//*                                                                     04440000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04450000
//*                                                                     04460000
//*SYSPRINT DD SYSOUT=*                                                 04470000
//*                                                                     04480000
//********************************************************************* 04490000
//* IF THIS STEP ABENDS:                                                04500000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN30                               04510000
//*                                                                     04520000
//********************************************************************* 04530000
//*                                                                     04540000
//*JSTEPN31 EXEC PGM=GVBUT99,                                           04550000
//*            COND=(0,EQ,JSTEPN30),                                    04560000
//*            PARM='1099'                                              04570000
//*                                                                     04580000
//*SYSMDUMP DD SYSOUT=*                                                 04590000
//*                                                                     04600000
//*******************************************************************   04610000
//* JSTEPN40 - SUBMIT NEXT JOB                                          04620000
//*******************************************************************   04630000
//*                                                                     04640000
//*JSTEPN40 EXEC PGM=IEBGENER                                           04650000
//*                                                                     04660000
//*SYSIN    DD DUMMY                                                    04670000
//*                                                                     04680000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF4),                                  04690000
//*            DISP=SHR                                                 04700000
//*                                                                     04710000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04720000
//*                                                                     04730000
//*SYSPRINT DD SYSOUT=*                                                 04740000
//*                                                                     04750000
//********************************************************************* 04760000
//* IF THIS STEP ABENDS:                                                04770000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN40                               04780000
//*                                                                     04790000
//********************************************************************* 04800000
//*                                                                     04810000
//*JSTEPN41 EXEC PGM=GVBUT99,                                           04820000
//*            COND=(0,EQ,JSTEPN40),                                    04830000
//*            PARM='1099'                                              04840000
//*                                                                     04850000
//*SYSMDUMP DD SYSOUT=*                                                 04860000
//*                                                                     04870000
//*******************************************************************   04880000
//* JSTEPN50 - SUBMIT NEXT JOB                                          04890000
//*******************************************************************   04900000
//*                                                                     04910000
//*JSTEPN50 EXEC PGM=IEBGENER                                           04920000
//*                                                                     04930000
//*SYSIN    DD DUMMY                                                    04940000
//*                                                                     04950000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF5),                                  04960000
//*            DISP=SHR                                                 04970000
//*                                                                     04980000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04990000
//*                                                                     05000000
//*SYSPRINT DD SYSOUT=*                                                 05010000
//*                                                                     05020000
//********************************************************************* 05030000
//* IF THIS STEP ABENDS:                                                05040000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN50                               05050000
//*                                                                     05060000
//********************************************************************* 05070000
//*                                                                     05080000
//*JSTEPN51 EXEC PGM=GVBUT99,                                           05090000
//*            COND=(0,EQ,JSTEPN50),                                    05100000
//*            PARM='1099'                                              05110000
//*                                                                     05120000
//*SYSMDUMP DD SYSOUT=*                                                 05130000
//*                                                                     05140000
//*******************************************************************   05150000
//* JSTEPN60 - SUBMIT NEXT JOB                                          05160000
//*******************************************************************   05170000
//*                                                                     05180000
//*JSTEPN60 EXEC PGM=IEBGENER                                           05190000
//*                                                                     05200000
//*SYSIN    DD DUMMY                                                    05210000
//*                                                                     05220000
//*SYSUT1   DD DSN=&JOBLIB.(V9999FF1),                                  05230000
//*            DISP=SHR                                                 05240000
//*                                                                     05250000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        05260000
//*                                                                     05270000
//*SYSPRINT DD SYSOUT=*                                                 05280000
//*                                                                     05290000
//********************************************************************* 05300000
//* IF THIS STEP ABENDS:                                                05310000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN60                               05320000
//*                                                                     05330000
//********************************************************************* 05340000
//*                                                                     05350000
//*JSTEPN61 EXEC PGM=GVBUT99,                                           05360000
//*            COND=(0,EQ,JSTEPN60),                                    05370000
//*            PARM='1099'                                              05380000
//*                                                                     05390000
//*SYSMDUMP DD SYSOUT=*                                                 05400000
//*                                                                     05410000
//*                                                                     05420000
```

|

**Parent topic:**[PE Utilities Reference](../html/AAR540PMUtilsRef.md)

