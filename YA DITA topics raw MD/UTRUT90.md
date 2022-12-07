# Utility Runbook: UT90 Logic Table Report {#UTRUT90 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Diagrams](UTRUT90.md#02)
-   [03 What UT90 does](UTRUT90.md#03)
-   [04 Checklists for reference and extract phases](UTRUT90.md#04)
-   [05 PARM options for UT90 step](UTRUT90.md#05)
-   [07 DD GV4LT - JLT or XLT file](UTRUT90.md#07)
-   [08 DD UT90RPT - Logic Table Print](UTRUT90.md#08)
-   [10 Sample JCL - Reference phase](UTRUT90.md#10)
-   [11 Sample JCL - Extract phase](UTRUT90.md#11)
-   [15 Troubleshooting](UTRUT90.md#15)

## 02 Diagrams {#02 .section}

![](images/UT90_Action_01_Ref_JLT.gif)

![](images/UT90_Action_02_Ext_XLT.gif)

## 03 What UT90 does {#03 .section}

See help topic "**UT90 Logic Table Report overview**". A link to that overviews is under **Related concepts** below.

## 04 Checklists for reference and extract phases {#04 .section}

See help topics "**Checklist: Reference phase**" and "**Checklist: Extract phase**". Links to those topics are under **Related reference** below.

## 05 PARM options for UT90 step {#05 .section}

Examples of PARM options for the JCL step for UT90 are as follows:

|```
 PARM='A' 
```

|

The complete PARM options are given below:

|PARM option|Notes|
|-----------|-----|
|A|To be completed|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 07 DD GV4LT - JLT or XLT file {#07 .section}

DDNAME GV4LT is a logical table file - JLT or XLT. Both must be in EBCDIC format.

For more, see these overviews:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to the above overviews are under **Related concepts** below.

## 08 DD UT90RPT - Logic Table Print {#08 .section}

DDNAME UT90RPT is a report about the input logical table file. The following is an example of part of a report on an **XLT file**:

![](images/UT90RPT_01_XLT.gif)

For examples of full reports on JLT and XLT files, see these topics:

-   "**JLT file overview**"
-   "**XLT file overview**"

Links to these overviews are under **Related concepts** below.

## 10 Sample JCL - Reference phase {#10 .section}

This JCL runs a job for the entire Reference phase.

|```
//V9999DR JOB (ACCT),'VIEW 9999 REFERENCE ',                            00010000
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
//*   PREPARE REFERENCE DATA                                            00120000
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
//*                                                                     00350000
//********************************************************************* 00360000
//* PSTEP300 - PRINT JOIN LOGIC TABLE REPORT                            00370000
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
//PSTEP300 EXEC PGM=GVBUT90,                                            00480000
// PARM='A'                                                             00490000
//*                                                                     00500000
//GV4LT    DD DSN=&HIUPN..MR76.JLT,                                     00510000
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
//* FOLLOW RESTART GIVEN IN STEP PSTEP300                               00630000
//*                                                                     00640000
//********************************************************************* 00650000
//*                                                                     00660000
//PSTEP301 EXEC PGM=GVBUT99,                                            00670000
//            COND=(0,EQ,PSTEP300),                                     00680000
//            PARM='1099'                                               00690000
//*                                                                     00700000
//SYSMDUMP DD SYSOUT=*                                                  00710000
//*                                                                     00720000
//**********************************************************************00730000
//* PSTEP320 - DELETE FILE(S) CREATED IN NEXT STEP                      00740000
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
//PSTEP320 EXEC PGM=IDCAMS                                              00850000
//*                                                                     00860000
//SYSPRINT DD SYSOUT=*                                                  00870000
//*                                                                     00880000
//SYSIN    DD *                                                         00890000
 DELETE  ??.V9999.REF.BIL PURGE                                         00900000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           00910000
     SET MAXCC = 0          /* KEEP GOING */                            00920000
                                                                        00930000
 DELETE  ??.V9999.FILE003.RED PURGE                                     00940000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           00950000
     SET MAXCC = 0          /* KEEP GOING */                            00960000
                                                                        00970000
 DELETE  ??.V9999.FILE004.RED PURGE                                     00980000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           00990000
     SET MAXCC = 0          /* KEEP GOING */                            01000000
                                                                        01010000
 DELETE  ??.V9999.FILE005.RED PURGE                                     01020000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01030000
     SET MAXCC = 0          /* KEEP GOING */                            01040000
                                                                        01050000
 DELETE  ??.V9999.FILE006.RED PURGE                                     01060000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01070000
     SET MAXCC = 0          /* KEEP GOING */                            01080000
                                                                        01090000
 DELETE  ??.V9999.FILE007.RED PURGE                                     01100000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01110000
     SET MAXCC = 0          /* KEEP GOING */                            01120000
                                                                        01130000
 DELETE  ??.V9999.FILE008.RED PURGE                                     01140000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01150000
     SET MAXCC = 0          /* KEEP GOING */                            01160000
                                                                        01170000
 DELETE  ??.V9999.FILE009.RED PURGE                                     01180000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01190000
     SET MAXCC = 0          /* KEEP GOING */                            01200000
                                                                        01210000
 DELETE  ??.V9999.FILE010.RED PURGE                                     01220000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01230000
     SET MAXCC = 0          /* KEEP GOING */                            01240000
                                                                        01250000
 DELETE  ??.V9999.FILE011.RED PURGE                                     01260000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01270000
     SET MAXCC = 0          /* KEEP GOING */                            01280000
                                                                        01290000
 DELETE  ??.V9999.FILE012.RED PURGE                                     01300000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01310000
     SET MAXCC = 0          /* KEEP GOING */                            01320000
                                                                        01330000
 DELETE  ??.V9999.REH PURGE                                             01340000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01350000
     SET MAXCC = 0          /* KEEP GOING */                            01360000
                                                                        01370000
 DELETE  ??.V9999.RTH PURGE                                             01380000
 IF LASTCC > 0  THEN        /* IF FAILS, */ -                           01390000
     SET MAXCC = 0          /* KEEP GOING */                            01400000
                                                                        01410000
//*                                                                     01420000
//********************************************************************* 01430000
//* PSTEP340 - PREPARE REFERENCE DATA                                   01440000
//*                                                                     01450000
//* NORMAL RETURN CODE = 0                                              01460000
//*                                                                     01470000
//* IF THIS STEP ABENDS:                                                01480000
//* 1) FIX APPLICATION IF POSSIBLE                                      01490000
//* 2) RESTART THE JOB IN PSTEP320                                      01500000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01510000
//*                                                                     01520000
//********************************************************************* 01530000
//*                                                                     01540000
//PSTEP340 EXEC PGM=GVBMR95,                                            01550000
// REGION=0M                                                            01560000
//*                                                                     01570000
//*            INPUT SAFR FILES                                         01580001
//*                                                                     01590000
//MR95PARM DD DSN=&PARMLIB.(V9999R95),                                  01600000
//            DISP=SHR                                                  01610000
//*                                                                     01620000
//MR95VDP  DD DSN=&HIUPN..MR77.VDP,                                     01630000
//            DISP=SHR                                                  01640000
//*                                                                     01650000
//MR95LTBL DD DSN=&HIUPN..MR76.JLT,                                     01660000
//            DISP=SHR                                                  01670000
//*                                                                     01680000
//MR95ENVV DD DSN=&PARMLIB.(EMPTY),                                     01690000
//            DISP=SHR                                                  01700000
//*                                                                     01710000
//*                                                                     01730000
//MR95REH  DD DUMMY,DCB=(LRECL=1,BLKSIZE=1)                             01740000
//*                                                                     01750000
//*            INPUT REFERENCE FILES                                    01760001
//*                                                                 %%% 01770000
//PRC00001    DD DISP=SHR,DSN=??.PRC                                    01780000
//PROD0001    DD DISP=SHR,DSN=??.PRD                                    01790000
//PRODADV1    DD DISP=SHR,DSN=??.PRD.ADVANCED                           01800000
//PRODNUM1    DD DISP=SHR,DSN=??.PRD.NUMERIC.ERRORS                     01810000
//STOR0001    DD DISP=SHR,DSN=??.STR                                    01820000
//STE00001    DD DISP=SHR,DSN=??.STE                                    01830000
//CUST0001    DD DISP=SHR,DSN=??.CUS                                    01840000
//TYPE0001    DD DISP=SHR,DSN=??.TYP                                    01850000
//TYPEEFF1    DD DISP=SHR,DSN=??.TYP.EFFDATE                            01860000
//TYPEADV1    DD DISP=SHR,DSN=??.TYP.ADVANCED                           01870000
//*                                                                     01880000
//*            OUTPUT SAFR FILES                                        01890001
//*                                                                     01900000
//*                                                                     01960000
//GREFREH  DD DSN=&HOUPN..REH,                                          01970000
//            DISP=(NEW,CATLG,DELETE),                                  01980000
//            UNIT=&UNIT.,                                              01990000
//            SPACE=(TRK,(10,1),RLSE),                                  02000000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=100)                         02010000
//*                                                                     02020000
//GREFRTH  DD DSN=&HOUPN..RTH,                                          02030000
//            DISP=(NEW,CATLG,DELETE),                                  02040000
//            UNIT=&UNIT.,                                              02050000
//            SPACE=(TRK,(10,1),RLSE),                                  02060000
//            DCB=(DSORG=PS,RECFM=FB,LRECL=100)                         02070000
//*                                                                     02080000
//GREF003  DD DSN=&HIUPN..FILE003.RED,                                  02090000
//            DISP=(NEW,CATLG,DELETE),                                  02100000
//            UNIT=(&UNIT.,10),                                         02110000
//            SPACE=(TRK,(1,1000),RLSE),                                02120000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02130000
//*                                                                     02140000
//GREF004  DD DSN=&HIUPN..FILE004.RED,                                  02150000
//            DISP=(NEW,CATLG,DELETE),                                  02160000
//            UNIT=(&UNIT.,10),                                         02170000
//            SPACE=(TRK,(1,1000),RLSE),                                02180000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02190000
//*                                                                     02200000
//GREF005  DD DSN=&HIUPN..FILE005.RED,                                  02210000
//            DISP=(NEW,CATLG,DELETE),                                  02220000
//            UNIT=(&UNIT.,10),                                         02230000
//            SPACE=(TRK,(1,1000),RLSE),                                02240000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02250000
//*                                                                     02260000
//GREF006  DD DSN=&HIUPN..FILE006.RED,                                  02270000
//            DISP=(NEW,CATLG,DELETE),                                  02280000
//            UNIT=(&UNIT.,10),                                         02290000
//            SPACE=(TRK,(1,1000),RLSE),                                02300000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02310000
//*                                                                     02320000
//GREF007  DD DSN=&HIUPN..FILE007.RED,                                  02330000
//            DISP=(NEW,CATLG,DELETE),                                  02340000
//            UNIT=(&UNIT.,10),                                         02350000
//            SPACE=(TRK,(1,1000),RLSE),                                02360000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02370000
//*                                                                     02380000
//GREF008  DD DSN=&HIUPN..FILE008.RED,                                  02390000
//            DISP=(NEW,CATLG,DELETE),                                  02400000
//            UNIT=(&UNIT.,10),                                         02410000
//            SPACE=(TRK,(1,1000),RLSE),                                02420000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02430000
//*                                                                     02440000
//GREF009  DD DSN=&HIUPN..FILE009.RED,                                  02450000
//            DISP=(NEW,CATLG,DELETE),                                  02460000
//            UNIT=(&UNIT.,10),                                         02470000
//            SPACE=(TRK,(1,1000),RLSE),                                02480000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02490000
//*                                                                     02500000
//GREF010  DD DSN=&HIUPN..FILE010.RED,                                  02510000
//            DISP=(NEW,CATLG,DELETE),                                  02520000
//            UNIT=(&UNIT.,10),                                         02530000
//            SPACE=(TRK,(1,1000),RLSE),                                02540000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02550000
//*                                                                     02560000
//GREF011  DD DSN=&HIUPN..FILE011.RED,                                  02570000
//            DISP=(NEW,CATLG,DELETE),                                  02580000
//            UNIT=(&UNIT.,10),                                         02590000
//            SPACE=(TRK,(1,1000),RLSE),                                02600000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02610000
//*                                                                     02620000
//GREF012  DD DSN=&HIUPN..FILE012.RED,                                  02630000
//            DISP=(NEW,CATLG,DELETE),                                  02640000
//            UNIT=(&UNIT.,10),                                         02650000
//            SPACE=(TRK,(1,1000),RLSE),                                02660000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4144)                        02670000
//*                                                                     02680000
//SORT001  DD DUMMY                                                     02690000
//SORT002  DD DUMMY                                                     02700000
//SORT003  DD DUMMY                                                     02710000
//SORT004  DD DUMMY                                                     02720000
//SORT005  DD DUMMY                                                     02730000
//SORT006  DD DUMMY                                                     02740000
//SORT007  DD DUMMY                                                     02750000
//SORT008  DD DUMMY                                                     02760000
//SORT009  DD DUMMY                                                     02770000
//SORT010  DD DUMMY                                                     02780000
//SORT011  DD DUMMY                                                     02790000
//SORT012  DD DUMMY                                                     02800000
//*                                                                     02810000
//SORT001  DD DUMMY                                                     02820000
//*                                                                     02830000
//MR95RPT  DD SYSOUT=*                                                  02840000
//MR95TRAC DD SYSOUT=*                                                  02850000
//SNAPDATA DD SYSOUT=*                                                  02860000
//SYSOUT   DD SYSOUT=*                                                  02870000
//*                                                                     02880000
//SYSMDUMP DD SYSOUT=*                                                  02890000
//*                                                                     02900000
//********************************************************************* 02910000
//* IF THIS STEP ABENDS:                                                02920000
//* FOLLOW RESTART GIVEN IN STEP PSTEP340                               02930000
//*                                                                     02940000
//********************************************************************* 02950000
//*                                                                     02960000
//PSTEP341 EXEC PGM=GVBUT99,                                            02970000
//            COND=(1,GE,PSTEP340),                                     02980000
//            PARM='1099'                                               02990000
//*                                                                     03000000
//SYSMDUMP DD SYSOUT=*                                                  03010000
//*                                                                     03020000
//********************************************************************* 03030000
//* PSTEP360 - EXTRACT REF FILE CREATION CONTROL REPORT                 03040000
//*                                                                     03050000
//* NORMAL RETURN CODE = 0                                              03060000
//*                                                                     03070000
//* IF THIS STEP ABENDS:                                                03080000
//* 1) FIX APPLICATION IF POSSIBLE                                      03090000
//* 2) RESTART THE JOB IN THIS STEP                                     03100000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03110000
//*                                                                     03120000
//********************************************************************* 03130000
//*                                                                     03140000
//PSTEP360 EXEC PGM=GVBMR71,                                            03150000
//             PARM='REH'                                               03160000
//*                                                                     03170000
//*            INPUT FILES                                              03180001
//*                                                                     03190000
//MR71RH   DD DSN=&HIUPN..REH,                                          03200000
//            DISP=SHR                                                  03210000
//*                                                                     03220000
//MR71VDP  DD DSN=&HIUPN..MR77.VDP,                                     03230000
//            DISP=SHR                                                  03240000
//*                                                                     03250000
//*            OUTPUT FILES                                             03260001
//*                                                                     03270000
//MR71RPT  DD SYSOUT=*                                                  03280000
//SYSOUT   DD SYSOUT=*                                                  03290000
//CEEDUMP  DD SYSOUT=*                                                  03300000
//SYSMDUMP DD SYSOUT=*                                                  03310000
//*                                                                     03320000
//********************************************************************* 03330000
//* IF THIS STEP ABENDS:                                                03340000
//* FOLLOW RESTART GIVEN IN STEP PSTEP360                               03350000
//*                                                                     03360000
//********************************************************************* 03370000
//*                                                                     03380000
//PSTEP361 EXEC PGM=GVBUT99,                                            03390000
//            COND=(0,EQ,PSTEP360),                                     03400000
//            PARM='1099'                                               03410000
//*                                                                     03420000
//SYSMDUMP DD SYSOUT=*                                                  03430000
//*                                                                     03440000
//********************************************************************* 03450000
//* PSTEP380 - SORT TITLES REF FILE CREATION CONTROL REPORT             03460000
//*                                                                     03470000
//* NORMAL RETURN CODE = 0                                              03480000
//*                                                                     03490000
//* IF THIS STEP ABENDS:                                                03500000
//* 1) FIX APPLICATION IF POSSIBLE                                      03510000
//* 2) RESTART THE JOB IN THIS STEP                                     03520000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03530000
//*                                                                     03540000
//********************************************************************* 03550000
//*                                                                     03560000
//PSTEP380 EXEC PGM=GVBMR71,                                            03570000
//             PARM='RTH'                                               03580000
//*                                                                     03590000
//*            INPUT FILES                                              03600001
//*                                                                     03610000
//MR71RH   DD DSN=&HIUPN..RTH,                                          03620000
//            DISP=SHR                                                  03630000
//*                                                                     03640000
//MR71VDP  DD DSN=&HIUPN..MR77.VDP,                                     03650000
//            DISP=SHR                                                  03660000
//*                                                                     03670000
//*            OUTPUT FILES                                             03680001
//*                                                                     03690000
//MR71RPT  DD SYSOUT=*                                                  03700000
//SYSOUT   DD SYSOUT=*                                                  03710000
//CEEDUMP  DD SYSOUT=*                                                  03720000
//SYSMDUMP DD SYSOUT=*                                                  03730000
//*                                                                     03740000
//********************************************************************* 03750000
//* IF THIS STEP ABENDS:                                                03760000
//* FOLLOW RESTART GIVEN IN STEP PSTEP380                               03770000
//*                                                                     03780000
//********************************************************************* 03790000
//*                                                                     03800000
//PSTEP381 EXEC PGM=GVBUT99,                                            03810000
//            COND=(0,EQ,PSTEP380),                                     03820000
//            PARM='1099'                                               03830000
//*                                                                     03840000
//SYSMDUMP DD SYSOUT=*                                                  03850000
//*                                                                     03860000
//*******************************************************************   03870000
//* JSTEPN10 - SUBMIT NEXT JOB                                          03880000
//*******************************************************************   03890000
//*                                                                     03900000
//*JSTEPN10 EXEC PGM=IEBGENER                                           03910000
//*                                                                     03920000
//*SYSIN    DD DUMMY                                                    03930000
//*                                                                     03940000
//*SYSUT1   DD DSN=&JOBLIB.(V9999EE),                                   03950000
//*            DISP=SHR                                                 03960000
//*                                                                     03970000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        03980000
//*                                                                     03990000
//*SYSPRINT DD SYSOUT=*                                                 04000000
//*                                                                     04010000
//********************************************************************* 04020000
//* IF THIS STEP ABENDS:                                                04030000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN10                               04040000
//*                                                                     04050000
//********************************************************************* 04060000
//*                                                                     04070000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           04080000
//*            COND=(0,EQ,JSTEPN10),                                    04090000
//*            PARM='1099'                                              04100000
//*                                                                     04110000
//*SYSMDUMP DD SYSOUT=*                                                 04120000
//*                                                                     04130000
//*                                                                     04140000
//*                                                                     04150000
```

|

## 11 Sample JCL - Extract phase {#11 .section}

This JCL runs a job for the entire Extract phase.

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

## 15 Troubleshooting {#15 .section}

See help topic "**Troubleshooting UT90**". A link to that overviews is under **Related reference** below.

**Parent topic:**[PE Utilities Reference](../html/AAR540PMUtilsRef.md)

