# Program Runbook: MR90 Logic Table Generator {#PERMR90 .reference}

## 01 Summary of this topic {#01 .section}

For **MR90 parameters**, see Section [20 DD \(from PARM\) - Configuration file](PERMR90.md#20).

The sections in this topic are as follows:

-   [02 Diagram](PERMR90.md#02)
-   [03 What MR90 does](PERMR90.md#03)
-   [05 Checklist for logic phase](PERMR90.md#05)
-   [10 PARM options for MR90 step](PERMR90.md#10)
-   [20 DD \(from PARM\) - Configuration file](PERMR90.md#20)
-   [25 DD \(from PARM\) - JLT file](PERMR90.md#25)
-   [30 DD \(from PARM\) - Logic Table Generator Report](PERMR90.md#30)
-   [35 DD \(from PARM\) - Sort Card files](PERMR90.md#35)
-   [40 DD \(from PARM\) - Sort Mapping file](PERMR90.md#40)
-   [45 DD \(from PARM\) - VDP file \(Input - ASCII\)](PERMR90.md#45)
-   [50 DD \(from PARM\) - VDP file \(Output - ASCII\)](PERMR90.md#50)
-   [55 DD \(from PARM\) - XLT file](PERMR90.md#55)
-   [60 DD SYSOUT](PERMR90.md#60)
-   [75 Output: PARM -H option](PERMR90.md#75)
-   [80 JCL Sample](PERMR90.md#80)
-   [99 Troubleshooting](PERMR90.md#99)
-   [100 Need this page completed?](PERMR90.md#100)

## 02 Diagram {#02 .section}

![](images/MR90_Action_01.gif)

## 03 What MR90 does {#03 .section}

See these overviews:

-   "**MR90 Logic Table Generator overview**"
-   "**Logic phase overview**"
-   "**Logic tables and codes overview**"
-   "**JLT file overview**"
-   "**XLT file overview**"
-   "**VDP file overview**"

Links to the above overviews are under **Related concepts** below.

## 05 Checklist for logic phase {#05 .section}

See help topic "**Checklist: Logic phase**". A link to that topic is under **Related reference** below.

## 10 PARM options for MR90 step {#10 .section}

Examples of PARM options for the JCL step for MR90 are as follows:

|```
 PARM='-I DD:VDPIN -O DD:VDPOUT -X DD:XLT -J DD:JLT -L DD:MR90RPT    X
             -S DD:SORTC -C DD:CONFIG -M DD:SRTPRM -V'   
```

|

The complete PARM options are given below:

|PARM option|Notes|
|-----------|-----|
|**-C DD:ddname**|\(Optional.\) The value "ddname" is a DDNAME for the input configuration file in the MR90 job step. This allows use of the input configuration file as shown in section [20 DD \(from PARM\) - Configuration file](PERMR90.md#20).

|
|**-H**|\(Optional.\) Displays help in SYSOUT describing the PARM options.For details, see section [75 Output: PARM -H option](PERMR90.md#75).

|
|**-I DD:ddname**|**\(Required.\)** The value "ddname" is a DDNAME for the input VDP file in the MR90 job step - see section [45 DD \(from PARM\) - VDP file \(Input - ASCII\)](PERMR90.md#45).|
|**-J DD:ddname**|**\(Required.\)** The value "ddname" is a DDNAME for the output JLT file in the MR90 job step - see section [25 DD \(from PARM\) - JLT file](PERMR90.md#25).|
|**-L DD:ddname**|\(Optional.\) The value "ddname" is a DDNAME for the MR90 report file - see section [30 DD \(from PARM\) - Logic Table Generator Report](PERMR90.md#30). This file is often called the "log" file.|
|**-M DD:ddname**|\(Optional.\) The value "ddname" is a DDNAME for the output Sort Mapping file - see section [40 DD \(from PARM\) - Sort Mapping file](PERMR90.md#40).|
|**-O DD:ddname**|**\(Required.\)** The value "ddname" is a DDNAME for the output VDP file in the MR90 job step - see section [50 DD \(from PARM\) - VDP file \(Output - ASCII\)](PERMR90.md#50).|
|**-R rundate**|\(Optional.\) The value "rundate" overrides the RUNDATE parameter given in the \[VIEW SELECTION\] section of the input configuration file for MR90. For more on the RUNDATE parameter see section [20 DD \(from PARM\) - Configuration file](PERMR90.md#20).|
|**-S DD:ddname**|**\(Required.\)** The value "ddname" is five characters of a DDNAME for the output sort card files. SAFR adds three digits to create the actual DDNAMEs. used. For example, coding **-S DD:SORTC** results in DDNAMEs such as SORTC003, SORTC004, up to SORTC012.

See section [35 DD \(from PARM\) - Sort Card files](PERMR90.md#35). If these sort card files are not required, this option is still required and the DDNAMEs in the MR90 job step are set to DUMMY.

|
|**-V**|\(Optional.\) This option makes the MR90 report contain more information. This can be called the "verbose" option.For details, see section [30 DD \(from PARM\) - Logic Table Generator Report](PERMR90.md#30).

|
|**-X DD:ddname**|**\(Required.\)** The value "ddname" is a DDNAME for the output XLT file in the MR90 job step - see section [55 DD \(from PARM\) - XLT file](PERMR90.md#55).|

For JCL syntax, see section "**PARM keyword in EXEC statement**" in FAQ topic "**JCL Reference and User's Guide**". A link to that topic is under **Related reference** below.

## 20 DD \(from PARM\) - Configuration file {#20 .section}

The DDNAME for this file is given by the PARM -c value: see section [05 Checklist for logic phase](PERMR90.md#05).

**Example configuration file:**

|```
[FISCAL DATES]        
3=20120101         

[VIEWS TO RUN]        
* VIEWID=987  
* FOLDERID=123     
RUNDATE=20120202      

```

|

The **configuration file** is coded as follows:

-   Case matters for values, so ensure CAPS OFF for this file.
-   Section headings are given in square brackets **\[ \]**. Sections can be in any order. Parameters in sections can also be in any order.
-   Comments are marked with a colon "**;**" or asterisk "**\***" at the start of the line.
-   Set a value using format "**PARAM=value**" where
    -   "**PARAM**" is a choice in the "**Configuration Parameter**" column below, and
    -   "**value**" is described in the corresponding "**Notes**" column below.

|Configuration Parameter|Notes|
|-----------------------|-----|
|**\[FISCAL DATES\]**|This section contains parameters that modify FISCAL functions in logic text|
|ID number of control record|Code this parameter as follows: **RRR=CCYYMMDD** where:-   **RRR** is the ID number of a control record used for one or more of the views in this VDP. The number of digits is not limited.
-   **CCYYMMDD** is a valid date. This date supplies an override for the related values of the FISCALDAY, FISCALMONTH, FISCALPERIOD, FISCALQUARTER and FISCALYEAR functions in logic text. This override applies to views in this VDP that use the control record given by RRR.

For more, see these topics:

-   "**Control records overview**"

See link under **Related concepts** below.

-   "**Syntax: functions**". This gives access to the FISCALDAY, FISCALMONTH, FISCALPERIOD, FISCALQUARTER and FISCALYEAR functions.

For topic "Syntax: functions", see link under **Related reference** below.


.

|
|**\[SORT KEY PERMUTATIONS\]**|To be Completed.|
|PPPP|PPPP is a permutation name. To be completed.|
|**\[VIEWS TO RUN\]**|This section contains parameters about the views to select for processing by MR90. The VDP already has a set of views as specified by MR86. This section allows a subset of those to be processed in MR90.|
|FREQUENCYCODE|This is an obsolete parameter - do not code. If this parameter is coded, then MR90 may select no views for the output VDP.|
|FOLDERID|\(Optional.\) The input VDP file already has a set of views selected by MR86. If no VIEWID or FOLDERID parameters are coded, then the entire set of views already in the input VDP file is included in the MR90 output VDP.If a FOLDERID parameter\(s\) is coded, the output VDP only includes the views in the given FOLDERIDs, in addition to any views selected by the VIEWID parameter\(s\). Examples of how to code this parameter are as follows

-   "**FOLDERID=987**"
-   "**FOLDERID=987,123**"
-   "**FOLDERID=987,123,555**"

where "987", "123" and "555" are valid ID numbers for view folders that store views selected in the input VDP file. If the FOLDERID lists only view folder ID numbers that are not already part of the input VDP, then no views are selected. If the VIEWID parameter also does not select any views, then MR90 produces output files that are not useful.

Folder ID numbers can be listed in any order, separated by a comma. The number of digits in a view ID number is not restricted. If required, code multiple FOLDERID parameters, each on a separate line.

|
|PASSNUMBER|This is an obsolete parameter - do not code. If this parameter is coded, then MR90 may select no views for the output VDP.|
|RUNDATE|\(Optional.\) The value of this parameter is the rundate for all views included in the MR90 output VDP. Code this parameter as follows "**RUNDATE=CCYYMMDD**", where CCYYMMDD is a valid date. The value of this RUNDATE parameter can be overridden by the -R value in the PARM options - see section [05 Checklist for logic phase](PERMR90.md#05).

The value of the RUNDATE parameter can also be overridden in the logic text functions of RUNDAY, RUNMONTH, RUNPERIOD, RUNQUARTER and RUNYEAR.

For details of logic text functions such as of RUNDAY, see topic "**Syntax: functions**" - a link is under **Related reference** below.

|
|VIEWID|\(Optional.\) The input VDP file already has a set of views selected by MR86. If no VIEWID or FOLDERID parameters are coded, then the entire set of views already in the input VDP file is included in the MR90 output VDP.If a VIEWID parameter\(s\) is coded, the output VDP only includes the views selected, in addition to any views selected by the FOLDERID parameter. Examples of how to code this parameter are as follows

-   "**VIEWID=987**"
-   "**VIEWID=987,123**"
-   "**VIEWID=987,123,555**"

where "987", "123" and "555" are valid ID numbers for views already part of the input VDP. If the VIEWID lists only view ID numbers that are not already part of the input VDP, then no views are selected. If the FOLDERID parameter also does not select any views, then MR90 produces output files that are not useful.

Views can be listed in any order, separated by a comma. The number of digits in a view ID number is not restricted. If required, code multiple VIEWID parameters, each on a separate line.

|

## 25 DD \(from PARM\) - JLT file {#25 .section}

The JLT file drives the reference phase to create the files necessary for the extract and format phases.

See help topic "**JLT file overview**". A link to that overview is under **Related concepts** below.

## 30 DD \(from PARM\) - Logic Table Generator Report {#30 .section}

If a report DDNAME is provided, MR86 produces a report file giving information about the data processed.

The report DDNAME is given in the -L value of the PARM options - see section [05 Checklist for logic phase](PERMR90.md#05).

The MR90 report can have the **PARM -V value set or not set**, as shown in section [05 Checklist for logic phase](PERMR90.md#05).

An example of **PARM -V value not set** is below:

|```
IBM Scalable Architecture for Financial Reporting (SAFR)   
IP Asset Family Component ID 6949-17P                      
Performance Engine (MVS) - Base Product                    
Build PM 4.11.009                                          
                                                           
GVBMR90 - Logic Table Generator                            
(Rev. 04000038: 2012-05-10 22:04)                          
                                                           
Executed: 2012-09-24 10:20:57                              
                                                           
INFO: Partitions used by a logical file                    
      File ID:   757   Partition ID:  6411                 
      File ID:   758   Partition ID:  6412                 
INFO: No new logical files were created                    
INFO: Out of 4 LR fields defined, 3 are used               
INFO: mr90 has written 24 extract logic table records      
                                                           
INFO: mr90 has written 27 join logic table records         
INFO: An updated VDP file has been written to DD:VOT       

```

|

An example of **PARM -V value set** is below:

|```
IBM Scalable Architecture for Financial Reporting (SAFR)        
IP Asset Family Component ID 6949-17P                           
Performance Engine (MVS) - Base Product                         
Build PM 4.11.009                                               
                                                                
GVBMR90 - Logic Table Generator                                 
(Rev. 04000038: 2012-05-10 22:04)                               
                                                                
Executed: 2012-09-25 14:38:14                                   
                                                                
INFO: Loading view definition file 'DD:VDPIN'...                
INFO: All views defined in the view definition file are eligible to be run
INFO: Partitions used by a logical file                         
      File ID:   757   Partition ID:  6411                      
      File ID:   758   Partition ID:  6412                      
INFO: All initial logical files and views used by a partition   
       Partition ID:  6411                                      
           File IDs:   757                                               
           View IDs:  8451                                               
       Partition ID:  6412 (not read by any views)                       
 INFO: Scanning for similar partitions                                   
       No similar partitions found                                       
 INFO: No new logical files were created                                 
 INFO: Now using logical file ID 757                                     
 INFO: Now using view ID 8451 in logical file ID 757                     
 INFO: No record selection (general select) found for view ID 8451,      
       source reference ID 13337                                         
 INFO: Now using column 1, col ID 199612, extract area position 1        
       This column is a sort key                                         
 INFO: Inserting column selection for view ID 8451,                      
       col ID 199612, map ID 256047                                      
  COLUMN = {DEF_3113.CUST_ID}                                            
 INFO: End of column select logic text                                   
 INFO: Now using column 2, col ID 199613, extract area position 1        
       This column is in the DT Area                                     
 INFO: Inserting column selection for view ID 8451,                      
       col ID 199613, map ID 256048                                      
  COLUMN = {DEF_3113.CUST_ADDRESS}                                       
 INFO: End of column select logic text                                   
 INFO: Now using column 3, col ID 199614, extract area position 7        
       This column is in the DT Area                                     
 INFO: Inserting column selection for view ID 8451,                      
       col ID 199614, map ID 256049                                      
  COLUMN = {DEF_3113.CUST_ID}                                            
 INFO: End of column select logic text                                   
 INFO: Now adjusting all symbolic goto row values                        
 INFO: Re-mapping lookup path IDs                                        
  Row Number  Old ID   New ID                                            
  ----------  ------   ------                                            
          4      931        1                                            
         10      931        1                                            
         16      931        1                                            
INFO: Out of 4 LR fields defined, 3 are used                            
INFO: mr90 has written 24 extract logic table records                   
                                                                        
INFO: Now creating join logic table in 'DD:JLT'                         
INFO: Now using file ID 758, LR ID 925, index ID 2494                   
INFO: Now using field ID 62638                                          
INFO: Now using field ID 62639                                          
INFO: mr90 has written 27 join logic table records                      
                                                                        
INFO: The following is the join logic table                             
                                                                        
  Row      Seq             Func            Field 1 (Source) Attributes  
  Num      Num   View ID   Sub   File ID /  LRID  /FieldID   Pos   Len  
------------------------------------------------------------------------
       1      0  00000000  HD    Generated on 9/25/2012 at 14:38:14     
       2      1  00000000  DIM4  Declare lRecordCount                   
                 //                                                     
                 //   Beginning of read loop for logical file ID 758    
                  //                                                     
        3      0  00000000  RENX  00000758                               
        4      0  00008453  NV    ExtOnly /00000925/SKA=0, STA=0, DTA=32,
        5      2  00008453  DTE   00000758/00000925/00062638     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
        6      3  00008453  DTE   00000758/00000925/00062638     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
        7      4  00008453  DTE   00000758/00000925/00062639     4     6 
                                  Unsigned/  Left  /rnd=0000     2     0 
                  //                                                     
                  //   Move a constant into the DT area          |-------
                  //                                             V       
        8      5  00008453  DTC   00000758/00000000/00000000    29     4 
                                  Unsigned/  Left  /rnd=0000     0     0 
        9      3  00008453  WRDT  Dest=File, Partition ID=0, Prog ID=0, P
       10      1  00000001  ADDC  lRecordCount  += "1"                   
       11      0  00000000  ES    00000758                               
       12      0  00008452  NV    ExtOnly /00000000/SKA=0, STA=0, DTA=40,
       13      1  00008452  DTC   00000758/00000000/00000000     1     4 
                                  Unsigned/  Left  /rnd=0000     0     0 
       14      2  00008452  DTC   00000758/00000000/00000000     5     4 
                                  Unsigned/  Left  /rnd=0000     0     0 
       15      3  00008452  DTA   00000758/00000000/00000000     9     4 
              lRecordCount        Unsigned/  Left  /rnd=0000     0     0 
       16      4  00008452  DTC   00000758/00000000/00000000    13     2 
                                  Unsigned/  Left  /rnd=0000     0     0 
       17      5  00008452  DTC   00000758/00000000/00000000    15     2 
                                  Unsigned/  Left  /rnd=0000     0     0 
       18      6  00008452  DTC   00000758/00000000/00000000    17     2 
                                  Unsigned/  Left  /rnd=0000     0     0 
       19      7  00008452  DTC   00000758/00000000/00000000    19     2 
                                  Unsigned/  Left  /rnd=0000     0     0 
       20      8  00008452  DTC   00000758/00000000/00000000    21     1 
                                  Unsigned/  Left  /rnd=0000     0     0 
       21      9  00008452  DTC   00000758/00000000/00000000    22     1 
                                  Unsigned/  Left  /rnd=0000     0     0 
       22     10  00008452  DTC   00000758/00000000/00000000    23     1 
                                  Unsigned/  Left  /rnd=0000     0     0 
       23     11  00008452  DTC   00000758/00000000/00000000    24     1 
                                  Unsigned/  Left  /rnd=0000     0     0 
       24     12  00008452  DTC   00000758/00000000/00000000    25    16 
                                  Unsigned/  Left  /rnd=0000     0     0 
       25      1  00008452  WRDT  Dest=File, Partition ID=6413, Prog ID=0
       26      0  00000000  ES    00000758                               
       27      0  00000000  EN                                           
 INFO: An updated VDP file has been written to DD:VDPOUT                 
                                                                         
 INFO: The following is the extract logic table                          
                                                                         
   Row      Seq             Func            Field 1 (Source) Attributes  
   Num      Num   View ID   Sub   File ID /  LRID  /FieldID   Pos   Len  
 ------------------------------------------------------------------------
        1      0  00000000  HD    Generated on 9/25/2012 at 14:38:14     
                  //                                                     
                  //   Beginning of read loop for logical file ID 757    
                  //                                                     
        2      0  00000000  RENX  00000757                               
        3      0  00008451  NV    Detail  /00000924/SKA=3, STA=0, DTA=7, 
        4      1  00008451  JOIN  00000758/00000925/00002494     1     0 
                                  Unsigned/  Left  /rnd=0000     0     0 
        5      1  00008451  LKE   00000757/00000924/00062636     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
        6      1  00008451  LUSM   .  .  .  .  .  .  .  .  .  .  .  .  . 
        7      1  00008451  SKL   00000758/00000925/00062638     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
        8      1  00008451  GOTO   .  .  .  .  .  .  .  .  .  .  .  .  . 
                  //                                                     
                  //   Move a constant into the SK area          |-------
                  //                                             V       
        9      1  00008451  SKC   00000757/00000924/00000000     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
       10      2  00008451  JOIN  00000758/00000925/00002494     1     0 
                                  Unsigned/  Left  /rnd=0000     0     0 
       11      2  00008451  LKE   00000757/00000924/00062636     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
       12      2  00008451  LUSM   .  .  .  .  .  .  .  .  .  .  .  .  . 
       13      2  00008451  DTL   00000758/00000925/00062639     4     6 
                                  Unsigned/  Left  /rnd=0000     2     0 
       14      2  00008451  GOTO   .  .  .  .  .  .  .  .  .  .  .  .  . 
       15      2  00008451  DTC   00000757/00000924/00000000     1     6 
                                  Unsigned/  Left  /rnd=0000     2     0 
       16      3  00008451  JOIN  00000758/00000925/00002494     1     0 
                                  Unsigned/  Left  /rnd=0000     0     0 
       17      3  00008451  LKE   00000757/00000924/00062636     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
       18      3  00008451  LUSM   .  .  .  .  .  .  .  .  .  .  .  .  . 
       19      3  00008451  DTL   00000758/00000925/00062638     1     3 
                                  Unsigned/  Left  /rnd=0000     1     0 
       20      3  00008451  GOTO   .  .  .  .  .  .  .  .  .  .  .  .  . 
       21      3  00008451  DTC   00000757/00000924/00000000     7     1 
                                  Unsigned/  Left  /rnd=0000     3     0 
       22      1  00008451  WRXT  Dest=Extract, Partition ID=0, Prog ID=0
       23      0  00000000  ES    00000757                               
       24      0  00000000  EN                                           
       
```

|

## 35 DD \(from PARM\) - Sort Card files {#35 .section}

To be completed.

## 40 DD \(from PARM\) - Sort Mapping file {#40 .section}

To be completed.

## 45 DD \(from PARM\) - VDP file \(Input - ASCII\) {#45 .section}

The input VDP file is still in ASCII format, as created by MR86 and updated by MR84. There are possibly multiple views and some may use the same data sources. MR90 may select a subset of these views to process, and may provide a RUNDATE for those views. How these views are implemented in the reference, extract and format phases is not yet known. There may also be unused fields mentioned in the VDP.

For details of the MR90 processing, see help topic "**MR90 Logic Table Generator overview**". A link to that overview is under **Related concepts** below.

See also help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 50 DD \(from PARM\) - VDP file \(Output - ASCII\) {#50 .section}

The output VDP file is still in ASCII format. The output VDP may include only a subset of the views selected in the input VDP file. The output VDP may use a different RUNDATE to the input VDP. The unused fields in the input VDP may be removed in the output VDP. The XLT and JLT files are now created to ensure that the reference and extract phases implement the views selected in the VDP.

For details of the MR90 processing, see help topic "**MR90 Logic Table Generator overview**". A link to that overview is under **Related concepts** below.

See also help topic "**VDP file overview**". A link to that overview is under **Related concepts** below.

## 55 DD \(from PARM\) - XLT file {#55 .section}

The XLT file drives the extract phase. Most of the features of SAFR are in the extract phase and are hence implemented in the XLT file.

See help topic "**XLT file overview**". A link to that overview is under **Related concepts** below.

## 60 DD SYSOUT {#60 .section}

This type of output is always produced by MR90.

|```
/STABLE                                                    
/INFILE      /                                             
                                                           
                                                           
                                                           
                            /     /    %                   
                                  003_1 FIXED 32           
/FIELDS sortkey 17 CHAR 3 ASCII                            
/KEYS sortkey                                              
/STATISTICS                                                
/OUTFILE      /                                            
                                                           
                                                           
                                                           
                             /DD:VIN_3.ref OVERWRITE       
/END                                                       
                                                           
IBM Scalable Architecture for Financial Reporting (SAFR)  
IP Asset Family Component ID 6949-17P                     
Performance Engine (MVS) - Base Product                   
Build PM 4.11.009                                         
                                                          
GVBMR90 - Logic Table Generator                           
(Rev. 04000038: 2012-05-10 22:04)                         
                                                          
Executed: 2012-09-25 13:52:09                        
```

|

MR90 can also produce extra output when the PARM-H option is used - see section [75 Output: PARM -H option](PERMR90.md#75).

## 75 Output: PARM -H option {#75 .section}

This is one of the PARM options from section [05 Checklist for logic phase](PERMR90.md#05).

This option writes the following to SYSOUT:

|```
 Usage: GVBMR90 [-v] [-h] [-l log-file] [-r override-rundate]                  
               [-i input-VDP-file] [-o output-VDP-file] [-x extract-logic-file]
               [-j join-logic-file] [-s sort-card-file-dir]                    
               [-c configuration-file] [-m mapping-file]                       
                                                                               
Options/Arguments:                                                             
        -v                     display informational messages                  
        -h                     display command usage                           
        -l log-file            log file. Default is stdout                     
        -r override-rundate    Must be in CCYYMMDD format                      
        -i input-VDP-file      input view definition file. Default is mr90.vdp 
        -o output-VDP-file     output view definition file.                    
        -x extract-logic-file  output extract logic table file. Default is     
                               mr90.xlt                                        
        -j join-logic-file     output join logic table file. Default is        
                               mr90.jlt                                        
        -s sort-card-file-dir  directory to write sort control card files.     
                               Default is derived from path of output VDP file 
                               name                                            
        -c configuration-file  fiscal date, sort key permutation, and view     
                               selection configuration file                    
        -m mapping-file        output mapping of sort key permutations file.   
                               Default is mr90.map                                         
```

|

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
//*PSTEP220 EXEC PGM=IDCAMS                                             01930000
//*                                                                     01940000
//*SYSPRINT DD SYSOUT=*                                                 01950000
//*                                                                     01960000
//*SYSIN    DD *                                                        01970000
//*   DELETE  USERNAME.V9999.MR75.VDP PURGE                             01980001
//*   IF LASTCC > 0  THEN        /* IF FAILS,  */ -                     01990000
//*     SET MAXCC = 0          /* KEEP GOING */                         02000000
//*                                                                     02010000
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
//*PSTEP230 EXEC PGM=GVBMR75                                            02130000
//*                                                                     02140000
//*            INPUT FILES                                              02150000
//*                                                                     02160000
//*VDPIN    DD DSN=&HOUPN..MR90.VDP,                                    02170000
//*            DISP=SHR                                                 02180000
//*                                                                     02190000
//*            OUTPUT FILES                                             02200000
//*                                                                     02210000
//*VDPOUT   DD DSN=&HOUPN..MR75.VDP,                                    02220000
//*            DISP=(NEW,CATLG,DELETE),                                 02230000
//*            UNIT=&UNIT.,                                             02240000
//*            SPACE=(TRK,(10,10),RLSE),                                02250000
//*            DCB=(DSORG=PS,RECFM=VB,LRECL=32756,                      02260000
//*            BLKSIZE=32760)                                           02270000
//*                                                                     02280000
//*MR75RPT  DD SYSOUT=*                                                 02290000
//*SYSOUT   DD SYSOUT=*                                                 02300000
//*CEEDUMP  DD SYSOUT=*                                                 02310000
//*SYSMDUMP DD SYSOUT=*                                                 02320000
//*                                                                     02330000
//********************************************************************* 02340000
//* IF THIS STEP ABENDS:                                                02350000
//* FOLLOW RESTART GIVEN IN STEP PSTEP230                               02360000
//*                                                                     02370000
//********************************************************************* 02380000
//*                                                                     02390000
//*PSTEP231 EXEC PGM=GVBUT99,                                           02400000
//*            COND=(0,EQ,PSTEP230),                                    02410000
//*            PARM='1099'                                              02420000
//*                                                                     02430000
//*SYSMDUMP DD SYSOUT=*                                                 02440000
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

See help topic "**Troubleshooting MR90**". A link to that overviews is under **Related reference** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[PE Programs Reference](../html/AAR530PMProgRef.md)

