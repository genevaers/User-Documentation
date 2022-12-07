# Program Runbook: MR77 VDP VSAM Update {#PERMR77 .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [02 Diagram](PERMR77.md#02)
-   [03 What MR77 does](PERMR77.md#03)
-   [05 Checklist for logic phase](PERMR77.md#05)
-   [10 PARM options for MR77 step](PERMR77.md#10)
-   [20 DD MR77ENVV - Environment variables](PERMR77.md#20)
-   [30 DD MR77RPT - VDP Explosion Process Report](PERMR77.md#30)
-   [40 DD VDPIN - VDP file](PERMR77.md#40)
-   [50 DD VDPOUT - VDP file updated with DB2 VSAM files](PERMR77.md#50)
-   [80 JCL Sample](PERMR77.md#80)
-   [99 Troubleshooting](PERMR77.md#99)
-   [100 Need more on this page?](PERMR77.md#100)

## 02 Diagram {#02 .section}

![](images/MR77_Action_01.gif)

## 03 What MR77 does {#03 .section}

See these overviews:

-   "**MR77 VDP VSAM Update overview**"
-   "**VDP file overview**"

Links to the above overviews are under **Related concepts** below.

## 05 Checklist for logic phase {#05 .section}

See help topic "**Checklist: Logic phase**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR77 step {#10 .section}

No PARM options.

## 20 DD MR77ENVV - Environment variables {#20 .section}

DDNAME MR77ENVV is for a file of environment variables. This is a typical TSO dataset of record length 80, and records are not numbered.

The environment variables refer to potential coding of fields in the metadata of the SAFR Workbench. A field in a metadata item may have coding such as the following:

|```
$SUBSYS.FILENAME 
```

|

In the above example, "**$SUBSYS**" is an environment variable. To set a value for this variable, use one the following coding lines in DD MR77ENVV:

|```
$SUBSYS="PROD"
$SUBSYS="DEV"
```

|

Depending on your choice of coding line, the metadata field has value "**PROD.FILENAME**" or "**DEV.FILENAME**":.

DDNAME MR77ENVV is optionally available for such coding. If there are no environment variables used, then this can be DUMMY.

## 30 DD MR77RPT - VDP Explosion Process Report {#30 .section}

DDNAME MR77RPT is for a report about MR77 processing. A sample is below:

|```
IBM Scalable Architecture for Financial Reporting (SAFR)
IP Asset Family Component ID 6949-17P                   
Performance Engine (MVS) - Base Product                 
Build PM 4.11.009                                       
                                                        
GVBMR77 - VDP Explosion Process                         
(Rev. 00000000: 2012-05-10 22:03)                       
                                                        
Executed: 2012-10-03 09:40:56                           
------------------------------------------------------------------------------
 INPUT  INPUT                           CREATED EXPANDED        
 DDNAME DATA SET NAME (FIRST 44 BYTES)  DDNAME  DATA SET NAME (FIRST 60 BYTES)
------------------------------------------------------------------------------
 MR77ENV                                              
 *ERROR*  COULD NOT OPEN ENV VARIABLES FILE; STATUS:   90                       
```

|

## 40 DD VDPIN - VDP file {#40 .section}

DDNAME VDPIN is the input VDP file from MR75 is in **EBCDIC** format .

See also help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 50 DD VDPOUT - VDP file updated with DB2 VSAM files {#50 .section}

DDNAME VDPOUT is the output VDP that contains details of VSAM files relevant to any DB2 databases accessed by the selected views in that run of PE.

See also help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 80 JCL Sample {#80 .section}

See also FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

The sample JCL below runs a job for the entire logic phase.

|```
//V9999CL JOB (ACCT),'VIEW 9999 LOGIC ',                                00010001
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
//*   CREATE SAFR LOGIC TABLES                                          00120000
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
//**********************************************************************00360000
//* PSTEP200 - DELETE FILE(S) CREATED IN NEXT STEP                      00370000
//*                                                                     00380000
//* NORMAL RETURN CODE = 0                                              00390000
//*                                                                     00400000
//* IF THIS STEP ABENDS:                                                00410000
//* 1) FIX APPLICATION IF POSSIBLE                                      00420000
//* 2) RESTART THE JOB IN THIS STEP                                     00430000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00440000
//*                                                                     00450000
//**********************************************************************00460000
//*                                                                     00470000
//PSTEP200 EXEC PGM=IDCAMS                                              00480000
//*                                                                     00490000
//SYSPRINT DD SYSOUT=*                                                  00500000
//*                                                                     00510000
//SYSIN    DD *                                                         00520000
 DELETE  USERNAME.V9999.MR90.JLT PURGE                                  00530001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          00540000
     SET MAXCC = 0          /* KEEP GOING */                            00550000
                                                                        00560000
 /* DELETE  USERNAME.V9999.SRTPRM PURGE */                              00570001
 /* IF LASTCC > 0  THEN  */    /* IF FAILS,  */ -                       00580000
 /*     SET MAXCC = 0    */    /* KEEP GOING */                         00590000
                                                                        00600000
 DELETE  USERNAME.V9999.MR90.VDP PURGE                                  00610001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          00620000
     SET MAXCC = 0          /* KEEP GOING */                            00630000
                                                                        00640000
 DELETE  USERNAME.V9999.MR90.XLT PURGE                                  00650001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          00660000
     SET MAXCC = 0          /* KEEP GOING */                            00670000
                                                                        00680000
//*                                                                     00690000
//********************************************************************* 00700000
//* PSTEP210 - CREATE THE LOGIC TABLE FILES                             00710000
//*                                                                     00720000
//* IF THIS STEP ABENDS:                                                00730000
//* 1) FIX APPLICATION IF POSSIBLE                                      00740000
//* 2) RESTART THE JOB IN PSTEP200                                      00750000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 00760000
//*                                                                     00770000
//********************************************************************* 00780000
//*                                                                     00790000
//PSTEP210 EXEC PGM=GVBMR90,                                            00800000
// PARM='-I DD:VDPIN -O DD:VDPOUT -X DD:XLT -J DD:JLT -L DD:MR90RPT    X00810000
//             -S DD:SORTC -C DD:CFL -M DD:SRTPRM -V'                   00820000
//*                                                                     00830000
//*            INPUT FILES                                              00840001
//*                                                                     00850000
//VDPIN    DD DSN=&HOUPN..MR84.VDP,                                     00860000
//            DISP=SHR                                                  00870000
//*                                                                     00880000
//CFL      DD DSN=&PARMLIB.(EMPTY),                                     00890000
//            DISP=SHR                                                  00900000
//*                                                                     00910000
//*            OUTPUT FILES                                             00920001
//*                                                                     00930000
//VDPOUT   DD DSN=&HOUPN..MR90.VDP,                                     00940000
//            DISP=(NEW,CATLG,DELETE),                                  00950000
//            UNIT=&UNIT.,                                              00960000
//            SPACE=(TRK,(10,10),RLSE),                                 00970000
//            DCB=(DSORG=PS,RECFM=U,LRECL=0,                            00980000
//            BLKSIZE=32760)                                            00990000
//*                                                                     01000000
//JLT      DD DSN=&HOUPN..MR90.JLT,                                     01010000
//            DISP=(NEW,CATLG,DELETE),                                  01020000
//            UNIT=&UNIT.,                                              01030000
//            SPACE=(TRK,(10,10),RLSE),                                 01040000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4004,BLKSIZE=32036)          01050000
//*                                                                     01060000
//XLT      DD DSN=&HOUPN..MR90.XLT,                                     01070000
//            DISP=(NEW,CATLG,DELETE),                                  01080000
//            UNIT=&UNIT.,                                              01090000
//            SPACE=(TRK,(10,10),RLSE),                                 01100000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=4004,BLKSIZE=32036)          01110000
//*                                                                     01120000
//SRTPRM   DD DUMMY                                                     01130000
//*                                                                     01140000
//MR90RPT  DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01150000
//SORTC003 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01160000
//SORTC004 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01170000
//SORTC005 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01180000
//SORTC006 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01190000
//SORTC007 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01200000
//SORTC008 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01210000
//SORTC009 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01220000
//SORTC010 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01230000
//SORTC011 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01240000
//SORTC012 DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01250000
//SYSPRINT DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01260000
//SYSOUT   DD SYSOUT=*,DCB=(RECFM=VB,LRECL=255,BLKSIZE=32760)           01270000
//CEEDUMP  DD SYSOUT=*                                                  01280000
//SYSMDUMP DD SYSOUT=*                                                  01290000
//*                                                                     01300000
//********************************************************************* 01310000
//* IF THIS STEP ABENDS:                                                01320000
//* FOLLOW RESTART GIVEN IN STEP PSTEP210                               01330000
//*                                                                     01340000
//********************************************************************* 01350000
//*                                                                     01360000
//PSTEP211 EXEC PGM=GVBUT99,                                            01370000
//            COND=(0,EQ,PSTEP210),                                     01380000
//            PARM='1099'                                               01390000
//*                                                                     01400000
//SYSMDUMP DD SYSOUT=*                                                  01410000
//*                                                                     01420000
//**********************************************************************01430000
//* PSTEP220 - DELETE FILE(S) CREATED IN NEXT STEP                      01440000
//*                                                                     01450000
//* NORMAL RETURN CODE = 0                                              01460000
//*                                                                     01470000
//* IF THIS STEP ABENDS:                                                01480000
//* 1) FIX APPLICATION IF POSSIBLE                                      01490000
//* 2) RESTART THE JOB IN THIS STEP                                     01500000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01510000
//*                                                                     01520000
//**********************************************************************01530000
//*                                                                     01540000
//PSTEP220 EXEC PGM=IDCAMS                                              01550000
//*                                                                     01560000
//SYSPRINT DD SYSOUT=*                                                  01570000
//*                                                                     01580000
//SYSIN    DD *                                                         01590000
 DELETE  USERNAME.V9999.MR75.VDP PURGE                                  01600001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          01610000
     SET MAXCC = 0          /* KEEP GOING */                            01620000
                                                                        01630000
//*                                                                     01640000
//********************************************************************* 01650000
//* PSTEP230 - CONVERT ASCII VDP FILE TO EBCDIC                         01660000
//*                                                                     01670000
//* IF THIS STEP ABENDS:                                                01680000
//* 1) FIX APPLICATION IF POSSIBLE                                      01690000
//* 2) RESTART THE JOB IN PSTEP220                                      01700000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 01710000
//*                                                                     01720000
//********************************************************************* 01730000
//*                                                                     01740000
//PSTEP230 EXEC PGM=GVBMR75                                             01750000
//*                                                                     01760000
//*            INPUT FILES                                              01770001
//*                                                                     01780000
//VDPIN    DD DSN=&HOUPN..MR90.VDP,                                     01790000
//            DISP=SHR                                                  01800000
//*                                                                     01810000
//*            OUTPUT FILES                                             01820001
//*                                                                     01830000
//VDPOUT   DD DSN=&HOUPN..MR75.VDP,                                     01840000
//            DISP=(NEW,CATLG,DELETE),                                  01850000
//            UNIT=&UNIT.,                                              01860000
//            SPACE=(TRK,(10,10),RLSE),                                 01870000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=32756,                       01880000
//            BLKSIZE=32760)                                            01890000
//*                                                                     01900000
//MR75RPT  DD SYSOUT=*                                                  01910000
//SYSOUT   DD SYSOUT=*                                                  01920000
//CEEDUMP  DD SYSOUT=*                                                  01930000
//SYSMDUMP DD SYSOUT=*                                                  01940000
//*                                                                     01950000
//********************************************************************* 01960000
//* IF THIS STEP ABENDS:                                                01970000
//* FOLLOW RESTART GIVEN IN STEP PSTEP230                               01980000
//*                                                                     01990000
//********************************************************************* 02000000
//*                                                                     02010000
//PSTEP231 EXEC PGM=GVBUT99,                                            02020000
//            COND=(0,EQ,PSTEP230),                                     02030000
//            PARM='1099'                                               02040000
//*                                                                     02050000
//SYSMDUMP DD SYSOUT=*                                                  02060000
//*                                                                     02070000
//**********************************************************************02080000
//* PSTEP240 - DELETE FILE(S) CREATED IN NEXT STEP                      02090000
//*                                                                     02100000
//* NORMAL RETURN CODE = 0                                              02110000
//*                                                                     02120000
//* IF THIS STEP ABENDS:                                                02130000
//* 1) FIX APPLICATION IF POSSIBLE                                      02140000
//* 2) RESTART THE JOB IN THIS STEP                                     02150000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02160000
//*                                                                     02170000
//**********************************************************************02180000
//*                                                                     02190000
//PSTEP240 EXEC PGM=IDCAMS                                              02200000
//*                                                                     02210000
//SYSPRINT DD SYSOUT=*                                                  02220000
//*                                                                     02230000
//SYSIN    DD *                                                         02240000
 DELETE  USERNAME.V9999.MR76.JLT PURGE                                  02250001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          02260000
     SET MAXCC = 0          /* KEEP GOING */                            02270000
                                                                        02280000
//*                                                                     02290000
//********************************************************************* 02300000
//* PSTEP250 - CONVERT ASCII JLT FILE TO EBCDIC                         02310000
//*                                                                     02320000
//* IF THIS STEP ABENDS:                                                02330000
//* 1) FIX APPLICATION IF POSSIBLE                                      02340000
//* 2) RESTART THE JOB IN PSTEP240                                      02350000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02360000
//*                                                                     02370000
//********************************************************************* 02380000
//*                                                                     02390000
//PSTEP250 EXEC PGM=GVBMR76                                             02400000
//*                                                                     02410000
//*            INPUT FILES                                              02420001
//*                                                                     02430000
//LTIN     DD DSN=&HOUPN..MR90.JLT,                                     02440000
//            DISP=SHR                                                  02450000
//*                                                                     02460000
//*            OUTPUT FILES                                             02470000
//*                                                                     02480000
//LTOUT    DD DSN=&HOUPN..MR76.JLT,                                     02490000
//            DISP=(NEW,CATLG,DELETE),                                  02500000
//            UNIT=&UNIT.,                                              02510000
//            SPACE=(TRK,(10,10),RLSE),                                 02520000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=820)                         02530000
//*                                                                     02540000
//MR76RPT  DD SYSOUT=*                                                  02550000
//SYSOUT   DD SYSOUT=*                                                  02560000
//CEEDUMP  DD SYSOUT=*                                                  02570000
//SYSMDUMP DD SYSOUT=*                                                  02580000
//*                                                                     02590000
//********************************************************************* 02600000
//* IF THIS STEP ABENDS:                                                02610000
//* FOLLOW RESTART GIVEN IN STEP PSTEP250                               02620000
//*                                                                     02630000
//********************************************************************* 02640000
//*                                                                     02650000
//PSTEP251 EXEC PGM=GVBUT99,                                            02660000
//            COND=(0,EQ,PSTEP250),                                     02670000
//            PARM='1099'                                               02680000
//*                                                                     02690000
//SYSMDUMP DD SYSOUT=*                                                  02700000
//*                                                                     02710000
//**********************************************************************02720000
//* PSTEP260 - DELETE FILE(S) CREATED IN NEXT STEP                      02730000
//*                                                                     02740000
//* NORMAL RETURN CODE = 0                                              02750000
//*                                                                     02760000
//* IF THIS STEP ABENDS:                                                02770000
//* 1) FIX APPLICATION IF POSSIBLE                                      02780000
//* 2) RESTART THE JOB IN THIS STEP                                     02790000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 02800000
//*                                                                     02810000
//**********************************************************************02820000
//*                                                                     02830000
//PSTEP260 EXEC PGM=IDCAMS                                              02840000
//*                                                                     02850000
//SYSPRINT DD SYSOUT=*                                                  02860000
//*                                                                     02870000
//SYSIN    DD *                                                         02880000
 DELETE  USERNAME.V9999.MR76.XLT PURGE                                  02890001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          02900000
     SET MAXCC = 0          /* KEEP GOING */                            02910000
                                                                        02920000
//*                                                                     02930000
//********************************************************************* 02940000
//* PSTEP270 - CONVERT ASCII XLT FILE TO EBCDIC                         02950000
//*                                                                     02960000
//* IF THIS STEP ABENDS:                                                02970000
//* 1) FIX APPLICATION IF POSSIBLE                                      02980000
//* 2) RESTART THE JOB IN PSTEP260                                      02990000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03000000
//*                                                                     03010000
//********************************************************************* 03020000
//*                                                                     03030000
//PSTEP270 EXEC PGM=GVBMR76                                             03040000
//*                                                                     03050000
//*            INPUT FILES                                              03060001
//*                                                                     03070000
//LTIN     DD DSN=&HOUPN..MR90.XLT,                                     03080000
//            DISP=SHR                                                  03090000
//*                                                                     03100000
//*            OUTPUT FILES                                             03110001
//*                                                                     03120000
//LTOUT    DD DSN=&HOUPN..MR76.XLT,                                     03130000
//            DISP=(NEW,CATLG,DELETE),                                  03140000
//            UNIT=&UNIT.,                                              03150000
//            SPACE=(TRK,(10,10),RLSE),                                 03160000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=820)                         03170000
//*                                                                     03180000
//MR76RPT  DD SYSOUT=*                                                  03190000
//SYSOUT   DD SYSOUT=*                                                  03200000
//CEEDUMP  DD SYSOUT=*                                                  03210000
//SYSMDUMP DD SYSOUT=*                                                  03220000
//*                                                                     03230000
//********************************************************************* 03240000
//* IF THIS STEP ABENDS:                                                03250000
//* FOLLOW RESTART GIVEN IN STEP PSTEP270                               03260000
//*                                                                     03270000
//********************************************************************* 03280000
//*                                                                     03290000
//PSTEP271 EXEC PGM=GVBUT99,                                            03300000
//            COND=(0,EQ,PSTEP270),                                     03310000
//            PARM='1099'                                               03320000
//*                                                                     03330000
//SYSMDUMP DD SYSOUT=*                                                  03340000
//*                                                                     03350000
//**********************************************************************03360000
//* PSTEP280 - DELETE FILE(S) CREATED IN NEXT STEP                      03370000
//*                                                                     03380000
//* NORMAL RETURN CODE = 0                                              03390000
//*                                                                     03400000
//* IF THIS STEP ABENDS:                                                03410000
//* 1) FIX APPLICATION IF POSSIBLE                                      03420000
//* 2) RESTART THE JOB IN THIS STEP                                     03430000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03440000
//*                                                                     03450000
//**********************************************************************03460000
//*                                                                     03470000
//PSTEP280 EXEC PGM=IDCAMS                                              03480000
//*                                                                     03490000
//SYSPRINT DD SYSOUT=*                                                  03500000
//*                                                                     03510000
//SYSIN    DD *                                                         03520000
 DELETE  USERNAME.V9999.MR77.VDP PURGE                                  03530001
 IF LASTCC > 0  THEN        /* IF FAILS,  */ -                          03540000
     SET MAXCC = 0          /* KEEP GOING */                            03550000
                                                                        03560000
//*                                                                     03570000
//********************************************************************* 03580000
//* PSTEP290 - ADD DB2 VSAM FILES TO VDP TABLE                          03590000
//*                                                                     03600000
//* IF THIS STEP ABENDS:                                                03610000
//* 1) FIX APPLICATION IF POSSIBLE                                      03620000
//* 2) RESTART THE JOB IN PSTEP280                                      03630000
//* 3) IF FIX NOT POSSIBLE, CONTACT APPLICATION SUPPORT                 03640000
//*                                                                     03650000
//********************************************************************* 03660000
//*                                                                     03670000
//PSTEP290 EXEC PGM=GVBMR77                                             03680000
//*                                                                     03690000
//*            INPUT FILES                                              03700001
//*                                                                     03710000
//VDPIN    DD DSN=&HOUPN..MR75.VDP,                                     03720000
//            DISP=SHR                                                  03730000
//*                                                                     03740000
//MR77ENVV DD DSN=&PARMLIB.(V9999M77),                                  03750001
//            DISP=SHR                                                  03760000
//*                                                                     03770000
//*            OUTPUT FILES                                             03780001
//*                                                                     03790000
//VDPOUT   DD DSN=&HOUPN..MR77.VDP,                                     03800000
//            DISP=(NEW,CATLG,DELETE),                                  03810000
//            UNIT=&UNIT.,                                              03820000
//            SPACE=(TRK,(10,10),RLSE),                                 03830000
//            DCB=(DSORG=PS,RECFM=VB,LRECL=32756,                       03840000
//            BLKSIZE=32760)                                            03850000
//*                                                                     03860000
//MR77RPT  DD SYSOUT=*                                                  03870000
//SYSOUT   DD SYSOUT=*                                                  03880000
//CEEDUMP  DD SYSOUT=*                                                  03890000
//SYSMDUMP DD SYSOUT=*                                                  03900000
//*                                                                     03910000
//********************************************************************* 03920000
//* IF THIS STEP ABENDS:                                                03930000
//* FOLLOW RESTART GIVEN IN STEP PSTEP290                               03940000
//*                                                                     03950000
//********************************************************************* 03960000
//*                                                                     03970000
//PSTEP291 EXEC PGM=GVBUT99,                                            03980000
//            COND=(0,EQ,PSTEP290),                                     03990000
//            PARM='1099'                                               04000000
//*                                                                     04010000
//SYSMDUMP DD SYSOUT=*                                                  04020000
//*                                                                     04030000
//*******************************************************************   04040000
//* JSTEPN10 - SUBMIT NEXT JOB                                          04050000
//*                                                                     04060000
//* IF THIS STEP ABENDS:                                                04070000
//* SUBMIT JOB SPECIFIED IN SYSUT1 MANUALLY                             04080000
//*******************************************************************   04090000
//*                                                                     04100000
//*JSTEPN10 EXEC PGM=IEBGENER                                           04110000
//*                                                                     04120000
//*SYSIN    DD DUMMY                                                    04130000
//*                                                                     04140000
//*SYSUT1   DD DSN=&JOBLIB.(V9999DR),                                  04150001
//*            DISP=SHR                                                 04160000
//*                                                                     04170000
//*SYSUT2   DD SYSOUT=(*,INTRDR)                                        04180000
//*                                                                     04190000
//*SYSPRINT DD SYSOUT=*                                                 04200000
//*                                                                     04210000
//********************************************************************* 04220000
//* IF THIS STEP ABENDS:                                                04230000
//* FOLLOW RESTART GIVEN IN STEP JSTEPN10                               04240000
//*                                                                     04250000
//********************************************************************* 04260000
//*                                                                     04270000
//*JSTEPN11 EXEC PGM=GVBUT99,                                           04280000
//*            COND=(0,EQ,JSTEPN10),                                    04290000
//*            PARM='1099'                                              04300000
//*                                                                     04310000
//*SYSMDUMP DD SYSOUT=*                                                 04320000
//*                                                                     04330000
//*                                                                     04340000
//*                                                                     04350000

```

|

## 99 Troubleshooting {#99 .section}

See help topic "**Troubleshooting MR77**". A link to that overviews is under **Related reference** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

