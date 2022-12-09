# Program Runbook: MR71 Reference Report {#PERMR71 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Diagrams](PERMR71.md#02)
-   [03 What MR71 does](PERMR71.md#03)
-   [05 Checklist for reference phase](PERMR71.md#05)
-   [10 PARM options for MR71 step](PERMR71.md#10)
-   [20 DD MR71RH - an REH or RTH file](PERMR71.md#20)
-   [30 DD MR71RPT - Lookup File Report Process](PERMR71.md#30)
-   [40 DD MR71VDP - VDP file](PERMR71.md#40)
-   [80 JCL Sample](PERMR71.md#80)
-   [99 Troubleshooting](PERMR71.md#99)
-   [100 Need more on this page?](PERMR71.md#100)

## 02 Diagrams {#02 .section}

![](images/MR71_Action_01_REH.gif)

![](images/MR71_Action_02_RTH.gif)

## 03 What MR71 does {#03 .section}

See help topic "**MR71 Reference Report overview**". A link to that overview is under **Related concepts** below.

## 05 Checklist for reference phase {#05 .section}

See help topic "**Checklist: Reference phase**". A link to that overview is under **Related reference** below.

## 10 PARM options for MR71 step {#10 .section}

Examples of the PARM options for the JCL step for MR71 are as follows:

|```
 PARM='REH'
 PARM='RTH'
```

|

The complete PARM options are given below:

|PARM option|Notes|
|-----------|-----|
|REH|This indicates input DDNAME MR71RH is an REH file. This results in the word "Extract" in the heading of the MR71 Report.|
|RTH|This indicates input DDNAME MR71RH is an RTH file. This results in the word "Format" in the heading of the MR71 Report.|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 20 DD MR71RH - an REH or RTH file {#20 .section}

DDNAME MR71RH is for an REH or RTH file.

An REH file specifies the RED files for lookups in the extract phase.

For more, see help topic "**REH file overview**". A link to that overview is under **Related concepts** below.

An RTH file specifies the RED files for lookups in the format phase. Lookup in the format phase are lookups in Sort Key Titles.

For more, see help topic "**RTH file overview**". A link to that overview is under **Related concepts** below.

## 30 DD MR71RPT - Lookup File Report Process {#30 .section}

The reports for an REH file and RTH file are identical in format, except the **REH** file has "**Extract**" in the heading and the **RTH** file as "**Format**" in the heading.

An example of an MR71 Report for an **REH** file is below:

![](images/MR71RPT_REH_02.GIF)

## 40 DD MR71VDP - VDP file {#40 .section}

The VDP file comes from MR77. If MR77 was not required, then the VDP comes from MR75.

For more, see help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

The sample JCL below runs a job for the entire reference phase.

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
//*SYSUT1   DD DSN=&JOBLIB.(V9999EE),                                  03950000
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

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR71**". A link to that overviews is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

