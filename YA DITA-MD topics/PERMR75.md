# Program Runbook: MR75 VDP to EBCDIC {#PERMR75 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Diagram](PERMR75.md#02)
-   [03 What MR75 does](PERMR75.md#03)
-   [05 Checklist for logic phase](PERMR75.md#05)
-   [10 PARM options for MR75 step](PERMR75.md#10)
-   [20 DD MR75RPT - VDP Conversion Process Report](PERMR75.md#20)
-   [30 DD VDPIN - VDP file](PERMR75.md#30)
-   [40 DD VDPOUT - VDP file](PERMR75.md#40)
-   [80 JCL Sample](PERMR75.md#80)
-   [99 Troubleshooting](PERMR75.md#99)
-   [100 Need more on this page?](PERMR75.md#100)

## 02 Diagram {#02 .section}

![](images/MR75_Action_01.gif)

## 03 What MR75 does {#03 .section}

MR75 translates the VDP from ASCII to EBCDIC format.

See these overviews:

-   "**MR75 VDP to EBCDIC overview**"
-   "**Logic phase overview**"
-   "**VDP file overview**"

Links to the above overviews are under **Related concepts** below.

## 05 Checklist for logic phase {#05 .section}

See help topic "**Checklist: Logic phase**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR75 step {#10 .section}

No PARM options.

## 20 DD MR75RPT - VDP Conversion Process Report {#20 .section}

DDNAME MR75RPT is for a report on MR75 processing. A sample is below:

|```
IBM Scalable Architecture for Financial Reporting (SAFR)         
IP Asset Family Component ID 6949-17P                            
Performance Engine (MVS) - Base Product                          
Build PM 4.11.009                                                
                                                                 
GVBMR75 - VDP Conversion Process                                 
(Rev. 00000000: 2012-05-10 22:03)                                
                                                                 
Executed: 2012-10-03 09:40:54                                    
                                                                 
GVBMR75 - RECORDS WRITTEN......0000000000000046 REQUIRED RECORDS 
GVBMR75 - RECORDS SKIPPED......0000000000000006 UNNEEDED RECORDS 
```

|

## 30 DD VDPIN - VDP file {#30 .section}

DDNAME VDPIN is for a VDP from MR90 is in **ASCII** format .

See also help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 40 DD VDPOUT - VDP file {#40 .section}

DDNAME VDPOUT is in **EBCDIC** format for processing by the later PE programs \(which are Assembler programs\).

See also help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

The sample JCL below runs a job for the entire logic phase.

|```
//V9999CL JOB (ACCT),'View 9999 Logic',                                 00010000
//          NOTIFY=&SYSUID.,                                            00020000
//          CLASS=A,                                                    00030000
//          MSGLEVEL=(1,1),                                             00040000
//          MSGCLASS=H                                                  00050000
//*                                                                     00060000
//JOBLIB   DD DISP=SHR,DSN=GEBT.PM411009.BTCHLOAD                       00070000
//         DD DISP=SHR,DSN=CEE.SCEERUN                                  00080000
//         DD DISP=SHR,DSN=CEE.SCEERUN2                                 00090000
//         DD DISP=SHR,DSN=CBC.SCLBDLL                                  00100000
//*                                                                     00110000
//********************************************************************* 00120000
//*                                                                     00130000
//*   CREATE SAFR LOGIC TABLES                                          00140000
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
//**********************************************************************00380000
//* PSTEP100 - DELETE FILE(S) CREATED IN NEXT STEP                      00390000
//*                                                                     00400000
//* NORMAL RETURN CODE = 0                                              00410000
//*                                                                     00420000
//* IF THIS STEP ABENDS:                                                00430000
//* 1) FIX APPLICATION IF POSSIBLE                                      00440000
//* 2) RESTART THE JOB IN THIS STEP                                     00450000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00460000
//*                                                                     00470000
//**********************************************************************00480000
//*                                                                     00490000
//PSTEP100 EXEC PGM=IDCAMS                                              00500000
//*                                                                     00510000
//SYSPRINT DD SYSOUT=*                                                  00520000
//*                                                                     00530000
//SYSIN    DD *                                                         00540000
 DELETE  USERNAME.V9999.MR90.JLT PURGE                                  00550001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          00560000
     SET MAXCC = 0          /* KEEP GOING */                            00570000
                                                                        00580000
 /* DELETE  USERNAME.V9999.SRTPRM PURGE */                              00590001
 /* IF LASTCC > 0  THEN  */    /* IF FAILS,  */ -                       00600000
 /*     SET MAXCC = 0    */    /* KEEP GOING */                         00610000
                                                                        00620000
 DELETE  USERNAME.V9999.MR90.VDP PURGE                                  00630001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          00640000
     SET MAXCC = 0          /* KEEP GOING */                            00650000
                                                                        00660000
 DELETE  USERNAME.V9999.MR90.XLT PURGE                                  00670001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          00680000
     SET MAXCC = 0          /* KEEP GOING */                            00690000
                                                                        00700000
//*                                                                     00710000
//********************************************************************* 00720000
//* PSTEP 110: PRINT CONFIG FILE                                        00730000
//*                                                                     00740000
//********************************************************************* 00750000
//*                                                                     00760000
//PSTEP110  EXEC PGM=IKJEFT1A,                                          00770000
// PARM='REPRO INFILE(INFILE) OUTFILE(CONFIGO)'                         00780000
//*                                                                     00790000
//*        <<< INPUT FILES >>>                                          00800000
//*                                                                     00810000
//SYSTSIN  DD DUMMY                                                     00820000
//*                                                                     00830000
//INFILE   DD DSN=&PARMLIB.(V9999M90),                                  00840000
//            DISP=SHR                                                  00850000
//*                                                                     00860000
//*        <<< OUTPUT FILES >>>                                         00870000
//*                                                                     00880000
//CONFIGO  DD SYSOUT=*                                                  00890000
//*                                                                     00900000
//SYSTSPRT DD SYSOUT=*                                                  00910000
//*                                                                     00920000
//********************************************************************* 00930000
//* IF THIS STEP ABENDS:                                                00940000
//* 1) FOLLOW RESTART GIVEN IN STEP PSTEP110                            00950000
//*                                                                     00960000
//********************************************************************* 00970000
//*                                                                     00980000
//PSTEP111 EXEC PGM=GVBUT99,                                            00990000
//            COND=(0,EQ,PSTEP110),                                     01000000
//            PARM='1099'                                               01010000
//*                                                                     01020000
//********************************************************************* 01030000
//* PSTEP140 - CREATE THE LOGIC TABLE FILES                             01040000
//*                                                                     01050000
//* IF THIS STEP ABENDS:                                                01060000
//* 1) FIX APPLICATION IF POSSIBLE                                      01070000
//* 2) RESTART THE JOB IN PSTEP200                                      01080000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01090000
//*                                                                     01100000
//********************************************************************* 01110000
//*                                                                     01120000
//PSTEP140 EXEC PGM=GVBMR90,                                            01130000
// PARM='-I DD:VDPIN -O DD:VDPOUT -X DD:XLT -J DD:JLT -L DD:MR90RPT    X01140000
//             -S DD:SORTC -C DD:CONFIG -M DD:SRTPRM -V'                01150000
//*                                                                     01160000
//*            INPUT FILES                                              01170000
//*                                                                     01180000
//VDPIN    DD DSN=&HOUPN..MR84.VDP,                                     01190000
//            DISP=SHR                                                  01200000
//*                                                                     01210000
//CONFIG   DD DSN=&PARMLIB.(V9999M90),                                  01220000
//            DISP=SHR                                                  01230000
//*                                                                     01240000
//*            OUTPUT FILES                                             01250000
//*                                                                     01260000
//VDPOUT   DD DSN=&HOUPN..MR90.VDP,                                     01270000
//            DISP=(NEW,CATLG,DELETE),                                  01280000
//            UNIT=&UNIT.,                                              01290000
//            SPACE=(TRK,(10,10),RLSE),                                 01300000
//            DCB=(DSORG=PS,RECFM=U,LRECL=0,                            01310000
//            BLKSIZE=32760)                                            01320000
//*                                                                     01330000
//JLT      DD DSN=&HOUPN..MR90.JLT,                                     01340000
//            DISP=(NEW,CATLG,DELETE),                                  01350000
//            UNIT=&UNIT.,                                              01360000
//            SPACE=(TRK,(10,10),RLSE),                                 01370000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4004,BLKSIZE=32036)          01380000
//*                                                                     01390000
//XLT      DD DSN=&HOUPN..MR90.XLT,                                     01400000
//            DISP=(NEW,CATLG,DELETE),                                  01410000
//            UNIT=&UNIT.,                                              01420000
//            SPACE=(TRK,(10,10),RLSE),                                 01430000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4004,BLKSIZE=32036)          01440000
//*                                                                     01450000
//SRTPRM   DD DUMMY                                                     01460000
//*                                                                     01470000
//MR90RPT  DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01480000
//*MR90RPT  DD DSN=&HOUPN..MR90RPT,                                      01490000
//*             DISP=(NEW,CATLG,DELETE),                                 01500000
//*             UNIT=SYSDA,                                              01510000
//*             SPACE=(TRK,(1,1),RLSE),                                  01520000
//*             DCB=(DSORG=PS,RECFM=FB,LRECL=132)                        01530000
//SORTC003 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01540000
//SORTC004 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01550000
//SORTC005 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01560000
//SORTC006 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01570000
//SORTC007 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01580000
//SORTC008 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01590000
//SORTC009 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01600000
//SORTC010 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01610000
//SORTC011 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01620000
//SORTC012 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01630000
//SYSPRINT DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01640000
//SYSOUT   DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01650000
//CEEDUMP  DD SYSOUT=*                                                  01660000
//SYSMDUMP DD SYSOUT=*                                                  01670000
//*                                                                     01680000
//********************************************************************* 01690000
//* IF THIS STEP ABENDS:                                                01700000
//* FOLLOW RESTART GIVEN IN STEP PSTEP210                               01710000
//*                                                                     01720000
//********************************************************************* 01730000
//*                                                                     01740000
//PSTEP141 EXEC PGM=GVBUT99,                                            01750000
//            COND=(0,EQ,PSTEP140),                                     01760000
//            PARM='1099'                                               01770000
//*                                                                     01780000
//SYSMDUMP DD SYSOUT=*                                                  01790000
//*                                                                     01800000
//**********************************************************************01810000
//* PSTEP220 - DELETE FILE(S) CREATED IN NEXT STEP                      01820000
//*                                                                     01830000
//* NORMAL RETURN CODE = 0                                              01840000
//*                                                                     01850000
//* IF THIS STEP ABENDS:                                                01860000
//* 1) FIX APPLICATION IF POSSIBLE                                      01870000
//* 2) RESTART THE JOB IN THIS STEP                                     01880000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01890000
//*                                                                     01900000
//**********************************************************************01910000
//*                                                                     01920000
//PSTEP220 EXEC PGM=IDCAMS                                              01930000
//*                                                                     01940000
//SYSPRINT DD SYSOUT=*                                                  01950000
                                                                        01960000
   SYSIN    DD *                                                        01970000
      DELETE  USERNAME.V9999.MR75.VDP PURGE                             01980001
      IF LASTCC > 0  THEN        /* IF FAILS,  */ -                     01990000
        SET MAXCC = 0          /* KEEP GOING */                         02000000
                                                                        02010000
//*                                                                     02020000
//********************************************************************* 02030000
//* PSTEP230 - CONVERT ASCII VDP FILE TO EBCDIC                         02040000
//*                                                                     02050000
//* IF THIS STEP ABENDS:                                                02060000
//* 1) FIX APPLICATION IF POSSIBLE                                      02070000
//* 2) RESTART THE JOB IN PSTEP220                                      02080000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02090000
//*                                                                     02100000
//********************************************************************* 02110000
//*                                                                     02120000
//PSTEP230 EXEC PGM=GVBMR75                                             02130000
//*                                                                     02140000
//*            INPUT FILES                                              02150000
//*                                                                     02160000
//VDPIN    DD DSN=&HOUPN..MR90.VDP,                                     02170000
//            DISP=SHR                                                  02180000
//*                                                                     02190000
//*            OUTPUT FILES                                             02200000
//*                                                                     02210000
//VDPOUT   DD DSN=&HOUPN..MR75.VDP,                                     02220000
//            DISP=(NEW,CATLG,DELETE),                                  02230000
//            UNIT=&UNIT.,                                              02240000
//            SPACE=(TRK,(10,10),RLSE),                                 02250000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=32756,                       02260000
//            BLKSIZE=32760)                                            02270000
//*                                                                     02280000
//MR75RPT  DD SYSOUT=*                                                  02290000
//SYSOUT   DD SYSOUT=*                                                  02300000
//CEEDUMP  DD SYSOUT=*                                                  02310000
//SYSMDUMP DD SYSOUT=*                                                  02320000
//*                                                                     02330000
//********************************************************************* 02340000
//* IF THIS STEP ABENDS:                                                02350000
//* FOLLOW RESTART GIVEN IN STEP PSTEP230                               02360000
//*                                                                     02370000
//********************************************************************* 02380000
//*                                                                     02390000
//PSTEP231 EXEC PGM=GVBUT99,                                            02400000
//            COND=(0,EQ,PSTEP230),                                     02410000
//            PARM='1099'                                               02420000
//*                                                                     02430000
//SYSMDUMP DD SYSOUT=*                                                  02440000
//*                                                                     02450000
//**********************************************************************02460000
//* PSTEP240 - DELETE FILE(S) CREATED IN NEXT STEP                      02470000
//*                                                                     02480000
//* NORMAL RETURN CODE = 0                                              02490000
//*                                                                     02500000
//* IF THIS STEP ABENDS:                                                02510000
//* 1) FIX APPLICATION IF POSSIBLE                                      02520000
//* 2) RESTART THE JOB IN THIS STEP                                     02530000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02540000
//*                                                                     02550000
//**********************************************************************02560000
//*                                                                     02570000
//*PSTEP240 EXEC PGM=IDCAMS                                             02580000
//*                                                                     02590000
//*SYSPRINT DD SYSOUT=*                                                 02600000
//*                                                                     02610000
//*SYSIN    DD *                                                        02620000
//* DELETE  USERNAME.V9999.MR76.JLT PURGE                               02630001
//* IF LASTCC > 0  THEN        /* IF FAILS,  */ -                       02640000
//*     SET MAXCC = 0          /* KEEP GOING */                         02650000
//*                                                                     02660000
//*                                                                     02670000
//********************************************************************* 02680000
//* PSTEP250 - CONVERT ASCII JLT FILE TO EBCDIC                         02690000
//*                                                                     02700000
//* IF THIS STEP ABENDS:                                                02710000
//* 1) FIX APPLICATION IF POSSIBLE                                      02720000
//* 2) RESTART THE JOB IN PSTEP240                                      02730000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02740000
//*                                                                     02750000
//********************************************************************* 02760000
//*                                                                     02770000
//*PSTEP250 EXEC PGM=GVBMR76                                            02780000
//*                                                                     02790000
//*            INPUT FILES                                              02800000
//*                                                                     02810000
//*LTIN     DD DSN=&HOUPN..MR90.JLT,                                    02820000
//*            DISP=SHR                                                 02830000
//*                                                                     02840000
//*            OUTPUT FILES                                             02850000
//*                                                                     02860000
//*LTOUT    DD DSN=&HOUPN..MR76.JLT,                                    02870000
//*            DISP=(NEW,CATLG,DELETE),                                 02880000
//*            UNIT=&UNIT.,                                             02890000
//*            SPACE=(TRK,(10,10),RLSE),                                02900000
//*            DCB=(DSORG=PS,RECFM=VB,LRECL=820)                        02910000
//*                                                                     02920000
//*MR76RPT  DD SYSOUT=*                                                 02930000
//*SYSOUT   DD SYSOUT=*                                                 02940000
//*CEEDUMP  DD SYSOUT=*                                                 02950000
//*SYSMDUMP DD SYSOUT=*                                                 02960000
//*                                                                     02970000
//********************************************************************* 02980000
//* IF THIS STEP ABENDS:                                                02990000
//* FOLLOW RESTART GIVEN IN STEP PSTEP250                               03000000
//*                                                                     03010000
//********************************************************************* 03020000
//*                                                                     03030000
//*PSTEP251 EXEC PGM=GVBUT99,                                           03040000
//*            COND=(0,EQ,PSTEP250),                                    03050000
//*            PARM='1099'                                              03060000
//*                                                                     03070000
//*SYSMDUMP DD SYSOUT=*                                                 03080000
//*                                                                     03090000
//**********************************************************************03100000
//* PSTEP260 - DELETE FILE(S) CREATED IN NEXT STEP                      03110000
//*                                                                     03120000
//* NORMAL RETURN CODE = 0                                              03130000
//*                                                                     03140000
//* IF THIS STEP ABENDS:                                                03150000
//* 1) FIX APPLICATION IF POSSIBLE                                      03160000
//* 2) RESTART THE JOB IN THIS STEP                                     03170000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03180000
//*                                                                     03190000
//**********************************************************************03200000
//*                                                                     03210000
//*PSTEP260 EXEC PGM=IDCAMS                                             03220000
//*                                                                     03230000
//*SYSPRINT DD SYSOUT=*                                                 03240000
//*                                                                     03250000
//*SYSIN    DD *                                                        03260000
//* DELETE  USERNAME.V9999.MR76.XLT PURGE                               03270001
//* IF LASTCC > 0  THEN        /* IF FAILS,  */ -                       03280000
//*     SET MAXCC = 0          /* KEEP GOING */                         03290000
//*                                                                     03300000
//*                                                                     03310000
//********************************************************************* 03320000
//* PSTEP270 - CONVERT ASCII XLT FILE TO EBCDIC                         03330000
//*                                                                     03340000
//* IF THIS STEP ABENDS:                                                03350000
//* 1) FIX APPLICATION IF POSSIBLE                                      03360000
//* 2) RESTART THE JOB IN PSTEP260                                      03370000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03380000
//*                                                                     03390000
//********************************************************************* 03400000
//*                                                                     03410000
//*PSTEP270 EXEC PGM=GVBMR76                                            03420000
//*                                                                     03430000
//*            INPUT FILES                                              03440000
//*                                                                     03450000
//*LTIN     DD DSN=&HOUPN..MR90.XLT,                                    03460000
//*            DISP=SHR                                                 03470000
//*                                                                     03480000
//*            OUTPUT FILES                                             03490000
//*                                                                     03500000
//*LTOUT    DD DSN=&HOUPN..MR76.XLT,                                    03510000
//*            DISP=(NEW,CATLG,DELETE),                                 03520000
//*            UNIT=&UNIT.,                                             03530000
//*            SPACE=(TRK,(10,10),RLSE),                                03540000
//*            DCB=(DSORG=PS,RECFM=VB,LRECL=820)                        03550000
//*                                                                     03560000
//*MR76RPT  DD SYSOUT=*                                                 03570000
//*SYSOUT   DD SYSOUT=*                                                 03580000
//*CEEDUMP  DD SYSOUT=*                                                 03590000
//*SYSMDUMP DD SYSOUT=*                                                 03600000
//*                                                                     03610000
//********************************************************************* 03620000
//* IF THIS STEP ABENDS:                                                03630000
//* FOLLOW RESTART GIVEN IN STEP PSTEP270                               03640000
//*                                                                     03650000
//********************************************************************* 03660000
//*                                                                     03670000
//*PSTEP271 EXEC PGM=GVBUT99,                                           03680000
//*            COND=(0,EQ,PSTEP270),                                    03690000
//*            PARM='1099'                                              03700000
//*                                                                     03710000
//*SYSMDUMP DD SYSOUT=*                                                 03720000
//*                                                                     03730000
//**********************************************************************03740000
//* PSTEP280 - DELETE FILE(S) CREATED IN NEXT STEP                      03750000
//*                                                                     03760000
//* NORMAL RETURN CODE = 0                                              03770000
//*                                                                     03780000
//* IF THIS STEP ABENDS:                                                03790000
//* 1) FIX APPLICATION IF POSSIBLE                                      03800000
//* 2) RESTART THE JOB IN THIS STEP                                     03810000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03820000
//*                                                                     03830000
//**********************************************************************03840000
//*                                                                     03850000
//*PSTEP280 EXEC PGM=IDCAMS                                             03860000
//*                                                                     03870000
//*SYSPRINT DD SYSOUT=*                                                 03880000
//*                                                                     03890000
//*SYSIN    DD *                                                        03900000
//* DELETE  USERNAME.V9999.MR77.VDP PURGE                               03910001
//* IF LASTCC > 0  THEN        /* IF FAILS,  */ -                       03920000
//*     SET MAXCC = 0          /* KEEP GOING */                         03930000
//*                                                                     03940000
//*                                                                     03950000
//********************************************************************* 03960000
//* PSTEP290 - ADD DB2 VSAM FILES TO VDP TABLE                          03970000
//*                                                                     03980000
//* IF THIS STEP ABENDS:                                                03990000
//* 1) FIX APPLICATION IF POSSIBLE                                      04000000
//* 2) RESTART THE JOB IN PSTEP280                                      04010000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 04020000
//*                                                                     04030000
//********************************************************************* 04040000
//*                                                                     04050000
//*PSTEP290 EXEC PGM=GVBMR77                                            04060000
//*                                                                     04070000
//*            INPUT FILES                                              04080000
//*                                                                     04090000
//*VDPIN    DD DSN=&HOUPN..MR75.VDP,                                    04100000
//*            DISP=SHR                                                 04110000
//*                                                                     04120000
//*MR77ENVV DD DSN=&PARMLIB.(V9999M77),                                 04130000
//*            DISP=SHR                                                 04140000
//*                                                                     04150000
//*            OUTPUT FILES                                             04160000
//*                                                                     04170000
//*VDPOUT   DD DSN=&HOUPN..MR77.VDP,                                    04180000
//*            DISP=(NEW,CATLG,DELETE),                                 04190000
//*            UNIT=&UNIT.,                                             04200000
//*            SPACE=(TRK,(10,10),RLSE),                                04210000
//*            DCB=(DSORG=PS,RECFM=VB,LRECL=32756,                      04220000
//*            BLKSIZE=32760)                                           04230000
//*                                                                     04240000
//*MR77RPT  DD SYSOUT=*                                                 04250000
//*SYSOUT   DD SYSOUT=*                                                 04260000
//*CEEDUMP  DD SYSOUT=*                                                 04270000
//*SYSMDUMP DD SYSOUT=*                                                 04280000
//*                                                                     04290000
//********************************************************************* 04300000
//* IF THIS STEP ABENDS:                                                04310000
//* FOLLOW RESTART GIVEN IN STEP PSTEP290                               04320000
//*                                                                     04330000
//********************************************************************* 04340000
//*                                                                     04350000
//*PSTEP291 EXEC PGM=GVBUT99,                                           04360000
//*            COND=(0,EQ,PSTEP290),                                    04370000
//*            PARM='1099'                                              04380000
//*                                                                     04390000
//*SYSMDUMP DD SYSOUT=*                                                 04400000
//*                                                                     04410000
//*******************************************************************   04420000
//* JSTEPN10 - SUBMIT NEXT JOB                                          04430000
//*                                                                     04440000
//* IF THIS STEP ABENDS:                                                04450000
//* SUBMIT JOB SPECIFIED IN SYSUT1 MANUALLY                             04460000
//*******************************************************************   04470000
//*                                                                     04480000
//*JSTEPN10 EXEC PGM=IEBGENER                                           04490000
//*                                                                     04500000
//*SYSIN    DD DUMMY                                                    04510000
//*                                                                     04520000
//*SYSUT1   DD DSN=&JOBLIB.(V9999DR),                                   04530000
//*            DISP=SHR                                                 04540000
//*                                                                     04550000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04560000
//*                                                                     04570000
//*SYSPRINT DD SYSOUT=*                                                 04580000
//*                                                                     04590000
//********************************************************************* 04600000
//* IF THIS STEP ABENDS:                                                04610000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN10                               04620000
//*                                                                     04630000
//********************************************************************* 04640000
//*                                                                     04650000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           04660000
//*            COND=(0,EQ,JSTEPN10),                                    04670000
//*            PARM='1099'                                              04680000
//*                                                                     04690000
//*SYSMDUMP DD SYSOUT=*                                                 04700000
//*                                                                     04710000
//*                                                                     04720000
//*                                                                     04730000
```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR75**". A link to that overviews is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

