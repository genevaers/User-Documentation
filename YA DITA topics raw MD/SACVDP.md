# VDP file overview {#SACVDP .concept}

## 01 Summary of this topic { .section}

The sections in this topic are as follows:

-   [10 What is the VDP?](SACVDP.md#10)
-   [12 Data differences between a view and a VDP](SACVDP.md#12)
-   [14 Data differences between a VDP and a VDP XML file](SACVDP.md#14)
-   [20 How is the VDP XML file created?](SACVDP.md#20)
-   [30 How is a VDP XML file updated before PE?](SACVDP.md#30)
-   [50 Processing for a VDP](SACVDP.md#50)
-   [60 VDP and VDP XML Dataset attributes](SACVDP.md#60)
-   [70 VDP Record Types and Codes](SACVDP.md#70)
-   [80 Sample VDP XML file](SACVDP.md#80)
-   [90 VDP XML file structure](SACVDP.md#90)
-   [100 Need more on this page?](SACVDP.md#100)

## 10 What is the VDP? {#10 .section}

VDP means **View Definition Parameters**.

The VDP is a mainframe dataset that drives PE to produce results for one or more selected views. The views must be stored in the SAFR Database using the SAFR Workbench WE.

The idea of a VDP is to take the information in one or more views and use that to produce results in PE.

A VDP can be stored in two ways:

-   As a "VDP" itself, which is the file that drives most of PE.
-   As a VDP XML file. This file is easy to manually inspect and update.

A VDP is normally processed as follows:

1.  MR86 creates a VDP XML file.
2.  MR84 converts the VDP XML file to a VDP.
3.  The remainder of PE updates and uses the VDP.

## 12 Data differences between a view and a VDP {#12 .section}

There can be small differences in information between a view and a VDP created from that view, as follows:

-   A VDP can contain information about more than one view.
-   A VDP can have a limit to the number of extract work files \(EXT files\), whereas a view does not contain such a limit. This means that the same view can be run with different limits by creating different VDP files for the same view.

    For more on EXT files, see topic "**EXT file overview**". A link to that overview is under **Related concepts** below.

-   A VDP has a run date, whereas a view does not specify a rundate. The run date for a VDP is set using these methods:
    -   Run the VDP in PE. This uses the date of that processing as the run date. This only occurs if no date was set using the methods below. Each method below overrides the previous methods given above.
    -   Set a RUNDATE parameter in the input configuration file to MR86. The given rundate parameter is stored in the MR86 output VDP XML file.

        For more, see topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

    -   Set a -R value in the PARM options for MR86. This overrides the RUNDATE parameter in the input configuration file. The PARM rundate is stored in the MR86 output VDP XML file.

        For more, see topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

    -   Set a RUNDATE parameter in the input configuration file to MR90. This overwrites any rundate supplied by MR86 above. The given rundate parameter is stored in the MR90 output VDP file.

        For more, see topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.

    -   Set a -R value in the PARM options for MR86. This overrides the RUNDATE parameter in the input configuration file. The PARM rundate is stored in the MR90 output VDP file.

        For more, see topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.

-   A VDP can impose a number of decimal places to the left and right of the decimal point for all numeric fields in all views in the VDP. These maximums override what is defined in the views in that VDP.

    For more, see the configuration file parameters DECIMALDIGITS and DECIMALPLACES for MR86 as given in topic "**Program Runbook: MR86 VDP Builder**". A link to that topic is under **Related reference** below.

-   A VDP can override the fiscal date information in the control records for views in the VDP. The VDP fiscal values apply to the views in that VDP only, and the fiscal date values in the relevant control record\(s\) are ignored.

    For more, see the configuration file section FISCAL DATES for MR90 as given in topic "**Program Runbook: MR90 Logic Table Generator**". A link to that topic is under **Related reference** below.


## 14 Data differences between a VDP and a VDP XML file {#14 .section}

There are differences in data between a VDP and a VDP XML file for the same view, as follows:

-   A VDP stores data in binary and other formats. A VDP XML file stores all data in display format.
-   A VDP stores data only. A VDP XML file stores tags with the data, for example:

    ```
    <Environment ID="1">                                              
        <Name>DEVELOPMENT</Name> 
    ```

-   A VDP stores default values where applicable. A VDP XML file does not have tags where default values apply.
-   A VDP includes snippets of logic text already compiled. A VDP XML file contains no snippets and no logic text.
-   A VDP includes record type codes in binary data. A VDP XML file does not contain the record type codes.

    For more, see section [70 VDP Record Types and Codes](SACVDP.md#70).


## 20 How is the VDP XML file created? {#20 .section}

The normal method to create a VDP XM: file is using Program **GVBMR86** or **MR86** in the **select** phase.

![](images/VDP_concept_01_XML.gif)

See also help topic "**MR86 VDP Builder overview**". A link to that overview is under **Related concepts** below.

An alternative method to create a VDP XML file is using a program written by your company.

![](images/VDP_XML_Create_01.gif)

## 30 How is a VDP XML file updated before PE? {#30 .section}

When a VDP XML file is created, it is possible to process that file immediately in PE. Optionally, the VDP XML file can have updates before proceeding with PE, for the following reasons:

-   To allow updates to the VDP data on a PC.
-   To create variations of a "base" VDP XML file, to vary the output of PE in a planned way.
-   So that the VDP XML file is a backup and audit trail of the input to PE.

The choices for updating a VDP XML file are:

-   Manual updates to a VDP XML file. This is appropriate if the change is very small and can be done on a PC.
-   Your company writes a program to update a VDP XML file. This is useful if your company wants to maintain a large number of VDP XML files that are very similar.

![](images/VDP_XML_Update_01.gif)

## 50 Processing for a VDP {#50 .section}

![](images/VDP_Phases_01.gif)

Processing of VDP files is as follows:

1.  The **VDP XML file** is created in program **MR86** in the **select** phase.

    As mentioned in section [20 How is the VDP XML file created?](SACVDP.md#20), program MR86 can be replaced by a program written by your company.

    For more on using MR86, see these topics:

    -   "**Select phase overview**"
    -   "**MR86 VDP Builder overview**"
    -   "**XML structure for VDP overview**"
    Links to these overviews are under **Related concepts** below.

2.  Updates to the **VDP XML file** are optional. These updates can be applied manually, or by a program written by your company.
3.  The **VDP XML file** is converted to a **VDP** by program **MR84** in the **compile** phase. MR84 also recompiles all logic text in the VDP.

    For more, see these topics:

    -   "**Compile phase overview**"
    -   "**MR84 VDP XML Converter overview**"
    -   "**XML structure for VDP overview**"
    Links to these overviews are under **Related concepts** below.

4.  The VDP file is updated when program **MR90** creates the XLT and JLT files in the **logic** phase. The JLT contains commands for any lookup paths in the view\(s\) selected for this run of PE. If the view\(s\) contain no lookup paths, then the JLT is empty.

    For more, see these topics:

    -   "**Logic phase overview**"
    -   "**MR90 Logic Table Generator overview**"
    Links to these overviews are under **Related concepts** below.

5.  The **VDP file** is converted into EBCDIC format in program **MR75** in the **logic** phase.

    For more, see these topics:

    -   "**Logic phase overview**"
    -   "**MR75 VDP to EBCDIC overview**"
    Links to these overviews are under **Related concepts** below.

6.  The **VDP file** is updated by program **MR77** in the **logic** phase. The updates add VSAM data to the VDP. This is the last update made to the VDP - all steps following this step use the VDP as input only.

    For more, see these topics:

    -   "**Logic phase overview**"
    -   "**MR77 VDP VSAM Update overview**"
    Links to these overviews are under **Related concepts** below.

7.  The VDP file is input to program **MR95** in the **reference** phase.

    For more, see these topics:

    -   "**Reference phase overview**"
    -   "**MR95 Reference and Extract overview**"
    Links to these overviews are under **Related concepts** below.

8.  The VDP file is input to program **MR71** to create a **Reference Report \(Extract\)** that can also be called the REH Report, because the report includes the contents of the REH file. MR71 runs in the **reference** phase.

    For more, see these topics:

    -   "**Reference phase overview**"
    -   "**REH file overview**"
    -   "**MR71 Reference Report overview**"
    Links to these overviews are under **Related concepts** below.

9.  The VDP file is input to program **MR71** to create a **Reference Report \(Sort Titles\)** that can also be called the RTH Report, because the report includes the contents of the RTH file. MR71 runs in the **reference** phase.

    For more, see these topics:

    -   "**Reference phase overview**"
    -   "**RTH file overview**"
    -   "**MR71 Reference Report overview**"
    Links to these overviews are under **Related concepts** below.

10. The VDP file is input to program **MR95** to execute the **extract** phase. 

    For more, see these topics:

    -   "**Extract phase overview**"
    -   "**MR95 Reference and Extract overview**"
    Links to these overviews are under **Related concepts** below.

11. The VDP file is input to program **MR88** to execute the **format** phase. 

    For more, see these topics:

    -   "**Format phase overview**"
    -   "**MR95 Reference and Extract overview**"
    Links to these overviews are under **Related concepts** below.


Links to the runbooks for the programs mentioned above are under "**Related Reference**" below.

## 60 VDP and VDP XML Dataset attributes {#60 .section}

For a **VDP** the attributes are as follows:

-   DSORG = PS \(Physical Sequential\)
-   RECFM = U \(undefined\)
-   LRECL = 0 \(undefined\)

For an **VDP XML file** the attributes are as follows:

-   DSORG = PS \(Physical Sequential\)
-   RECFM = VB \(Variable Blocked\)
-   LRECL = 32756

## 70 VDP Record Types and Codes {#70 .section}

Codes are stored in the VDP file itself, but are not included in the VDP XML file.

|Code|Record Type|
|----|-----------|
|1|VDPGENERATION|
|50|CONTROL|
|100|SERVER|
|200|FILE|
|210|PGMFILE|
|300|LR|
|400|LRFIELD|
|500|LRINDEX|
|600|JOINSTEPV10|
|601|JOINSTEP|
|700|CALLPARAM|
|800|EXTRACTOUTPUTFILE|
|1000|VIEW|
|1200|SUMMARYRECLOGIC|
|1210|SUMMARYRECLT|
|1300|TITLELINES|
|1400|FOOTERLINES|
|1600|SUMMARYOUTPUTFILE|
|2000|COLUMNRECORD|
|2200|SUMMARYCOLLOGIC|
|2210|SUMMARYCOLLT|
|2300|SORTKEYATTR|
|3000|VIEWLRFILE|
|3200|LRFILTERECLOGIC|
|3210|LRFILERECLT|
|4000|LRFILECOLUMN|
|4200|LRFILECOLLOGIC|
|4210|LRFILECOLLT|

Note that the following record types are obsolete:

-   1100 SUMMARYRECEXIT
-   2100 SUMMARYCOLEXIT
-   3100 LRFILERECEXIT
-   4100 LRFILECOLEXIT

## 80 Sample VDP XML file {#80 .section}

Ensure you have read section [14 Data differences between a VDP and a VDP XML file](SACVDP.md#14).

Fpr the XML file structure, see topic "**XML structure for VDP overview**". A link to that overview is under **Related concepts** below.

A sample VDP XML file is below:

|```
<?xml version="1.0"?>                                              
<SAFRVDP xmlns="http://www.ibm.com"                                
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"     
         xsi:schemaLocation=                                       
                   "http://www.ibm.com                             
                   SAFRVDP.xsd">                                   
  <CreatedDateTime>2012-07-30T11:26:12</CreatedDateTime>           
  <Program>VDP Builder 4.11.9   z/OS</Program>                     
  <JobInfo>                                                        
    <Database>                                                     
      <Type>IBMDB2</Type>                                          
      <Connection>DSN=DB2ConnectionString</Connection>                     
      <Schema>SAFRWDEV</Schema>                                    
      <WorkbenchUser>ADMIN</WorkbenchUser>                         
    </Database>                                                    
    <RunDate>2012-07-30</RunDate>                                  
    <RunNumber>259</RunNumber>                                     
    <MaxExtractFileNumber>1</MaxExtractFileNumber>                   
    <ExtractFile ID="1">                                             
          <Name>Auto-generated Name for Extract Phase Output</Name>  
          <ServerRef ID="1"/>                                        
          <CharacterSet>EBCDI</CharacterSet>                         
          <RecordType>VAREX</RecordType>                             
          <FieldDelimiter>FIXED</FieldDelimiter>                     
          <StringDelimiter>DBLQT</StringDelimiter>                   
          <ProcessInParallel>1</ProcessInParallel>                   
          <PosixDirectory>$extractdir</PosixDirectory>               
          <PosixFileName>$extractfile</PosixFileName>                
          <DSN>GEBT.RHNDS.EXT.@D.PASS01.EXTR</DSN>                   
          <DDNameExtract>EXTR</DDNameExtract>                        
          <DeviceType>SYSDA</DeviceType>                             
          <SpaceUnit>TRK</SpaceUnit>                                 
          <PrimaryQuantity>20</PrimaryQuantity>                      
          <SecondaryQuantity>200</SecondaryQuantity>                 
          <ReleaseUnused>1</ReleaseUnused>                           
          <LRECL>7168</LRECL>                                       
          <VSAMORG>KSDS</VSAMORG>                                   
          <RECFM>VB</RECFM>                                         
          <ExpirationDate>2012-07-30</ExpirationDate>               
    </ExtractFile>                                                  
  </JobInfo>                                                        
                                                                    
  <Users>                                                           
    <User ID="ADMIN">                                               
      <First>Administrator</First>                                  
      <CreatedTimestamp>2009-03-25T17:22:33</CreatedTimestamp>      
      <ModifiedTimestamp>2012-01-27T05:03:24</ModifiedTimestamp>    
      <ModifiedUserID>ADMIN</ModifiedUserID>                        
    </User>                                                         
    <User ID="USER123">                                              
      <First>USER123</First>                                         
      <CreatedTimestamp>2009-05-19T14:25:19</CreatedTimestamp>      
      <CreatedUserID>ADMIN</CreatedUserID>                          
      <ModifiedTimestamp>2010-12-09T19:47:33</ModifiedTimestamp>    
      <ModifiedUserID>USER123</ModifiedUserID>                       
    </User>                                                         
  </Users>                                                          
  <Environment ID="1">                                              
    <Name>DEVELOPMENT</Name>                                        
    <EffectiveDate>2009-01-29</EffectiveDate>                       
    <Comment>CREATED AUTOMATICALLY DURING INSTALL</Comment>         
    <CreatedTimestamp>2009-01-29T22:29:46</CreatedTimestamp>        
    <CreatedUserID>INSTALL</CreatedUserID>                          
    <Metadata>                                                      
      <ControlRecords>                                              
        <ControlRecord ID="1">                                      
          <Name>Default_Install</Name>                              
          <EffectiveDate>2009-04-08</EffectiveDate>                 
          <TerminationDate>2100-12-31</TerminationDate>             
          <MonthFirstPeriod>1</MonthFirstPeriod>                    
          <MinPeriod>1</MinPeriod>                                  
          <MaxPeriod>12</MaxPeriod>                                     
          <FiscalDate>2012-07-30</FiscalDate>                           
          <Comment>Created automatically during initialization</Comment>
          <CreatedTimestamp>2010-12-09T19:46:29</CreatedTimestamp>      
          <CreatedUserID>USER123</CreatedUserID>                         
        </ControlRecord>                                                
      </ControlRecords>                                                 
      <Servers>                                                         
        <Server ID="1">                                                 
          <Name>Local</Name>                                            
          <Comment>Created automatically during initialization</Comment>
          <CreatedTimestamp>2010-10-21T18:31:16</CreatedTimestamp>      
          <CreatedUserID>ADMIN</CreatedUserID>                          
        </Server>                                                       
      </Servers>                                                        
      <Partitions>                                                      
        <Partition ID="8449">                                           
          <Name>ZZ_DATA_PRODUCT</Name>                                  
          <ServerRef ID="1"/>                                         
          <RecordType>VAREX</RecordType>                              
          <FieldDelimiter>FIXED</FieldDelimiter>                      
          <StringDelimiter>DBLQT</StringDelimiter>                    
          <DDNameInput>PRODUCT</DDNameInput>                          
          <DDNameExtract>E0008449</DDNameExtract>                     
          <DDNameOutput>O0008449</DDNameOutput>                       
          <DeviceType>SYSDA</DeviceType>                              
          <SpaceUnit>TRK</SpaceUnit>                                  
          <RECFM>VB</RECFM>                                           
          <ExpirationDate>2012-07-30</ExpirationDate>                 
          <Comment>Testing for PE.</Comment>                          
          <CreatedTimestamp>2011-09-05T09:49:11</CreatedTimestamp>    
          <CreatedUserID>ADMIN</CreatedUserID>                        
          <ModifiedTimestamp>2011-09-05T09:51:02</ModifiedTimestamp>  
        </Partition>                                                  
        <Partition ID="8450">                                         
          <Name>ZZ_DATA_SALES</Name>                                  
          <ServerRef ID="1"/>                                        
          <RecordType>VAREX</RecordType>                             
          <FieldDelimiter>FIXED</FieldDelimiter>                     
          <StringDelimiter>DBLQT</StringDelimiter>                   
          <DDNameInput>SALES</DDNameInput>                           
          <DDNameExtract>E0008450</DDNameExtract>                    
          <DDNameOutput>O0008450</DDNameOutput>                      
          <DeviceType>SYSDA</DeviceType>                             
          <SpaceUnit>TRK</SpaceUnit>                                 
          <RECFM>VB</RECFM>                                          
          <ExpirationDate>2012-07-30</ExpirationDate>                
          <Comment>Testing for PE.</Comment>                         
          <CreatedTimestamp>2011-09-05T10:01:22</CreatedTimestamp>   
          <CreatedUserID>ADMIN</CreatedUserID>                       
          <ModifiedTimestamp>2011-09-05T10:01:45</ModifiedTimestamp> 
        </Partition>                                                 
      </Partitions>                                                  
      <LogicalFiles>                                                 
        <LogicalFile ID="1391">                                      
          <Name>ZZ_DATA_PRODUCT</Name>                               
          <PartitionRefs>                                            
            <PartitionRef seq="1" ID="8449">                         
              <XID>14444</XID>                                       
            </PartitionRef>                                          
          </PartitionRefs>                                           
          <Comment>Data for testing PE.</Comment>                    
          <CreatedTimestamp>2011-09-05T09:48:19</CreatedTimestamp>   
          <CreatedUserID>ADMIN</CreatedUserID>                       
          <ModifiedTimestamp>2011-09-05T09:52:14</ModifiedTimestamp> 
        </LogicalFile>                                               
        <LogicalFile ID="1392">                                      
          <Name>ZZ_DATA_SALES</Name>                                 
          <PartitionRefs>                                            
            <PartitionRef seq="1" ID="8450">                         
              <XID>14445</XID>                                       
            </PartitionRef>                                          
          </PartitionRefs>                                          
          <Comment>Testing for PE</Comment>                         
          <CreatedTimestamp>2011-09-05T10:02:44</CreatedTimestamp>  
          <CreatedUserID>ADMIN</CreatedUserID>                      
        </LogicalFile>                                              
      </LogicalFiles>                                               
      <LogicalRecords>                                              
        <LogicalRecord ID="1390">                                   
          <Name>ZZ_DATA_PRODUCT</Name>                              
          <LRType>FILE</LRType>                                     
          <LRStatus>ACTVE</LRStatus>                                
          <EffectiveDate>1900-01-01</EffectiveDate>                 
          <TerminationDate>2100-12-31</TerminationDate>             
          <Index ID="2938">                                         
            <Name>PrimaryKey</Name>                                 
            <IndexFieldRefs>                                        
              <IndexFieldRef seq="1" ID="78941">                    
                <XID>24023</XID>                                    
                <CreatedTimestamp>2011-09-05T10:12:31</CreatedTimestamp>
                <CreatedUserID>ADMIN</CreatedUserID>                    
              </IndexFieldRef>                                          
            </IndexFieldRefs>                                           
          </Index>                                                      
          <Fields>                                                      
            <Field ID="78941">                                          
              <Name>Product_Key</Name>                                  
              <DataType>ALNUM</DataType>                                
              <Length>10</Length>                                       
              <Ordinal>1</Ordinal>                                      
              <DatabaseColumn>Product_Key</DatabaseColumn>              
              <CreatedTimestamp>2011-09-05T09:46:38</CreatedTimestamp>  
              <CreatedUserID>ADMIN</CreatedUserID>                      
            </Field>                                                    
            <Field ID="78942">                                          
              <Name>Product_Desc</Name>                                 
              <DataType>ALNUM</DataType>                                
              <Length>50</Length>                                     
              <Position>11</Position>                                 
              <Ordinal>2</Ordinal>                                    
              <DatabaseColumn>Product_Desc</DatabaseColumn>           
              <CreatedTimestamp>2011-09-05T09:46:38</CreatedTimestamp>
              <CreatedUserID>ADMIN</CreatedUserID>                    
            </Field>                                                  
            <Field ID="78943">                                        
              <Name>Filler</Name>                                     
              <DataType>ALNUM</DataType>                              
              <Length>20</Length>                                     
              <Position>61</Position>                                 
              <Ordinal>3</Ordinal>                                    
              <DatabaseColumn>Filler</DatabaseColumn>                 
              <CreatedTimestamp>2011-09-05T09:46:38</CreatedTimestamp>
              <CreatedUserID>ADMIN</CreatedUserID>                    
            </Field>                                                  
          </Fields>                                                   
          <Comment>Test data for PE.  All alphanumeric fields.</Comment> 
          <CreatedTimestamp>2011-09-05T09:46:38</CreatedTimestamp>      
          <CreatedUserID>ADMIN</CreatedUserID>                          
          <ModifiedTimestamp>2011-09-05T10:12:30</ModifiedTimestamp>    
        </LogicalRecord>                                                
        <LogicalRecord ID="1391">                                       
          <Name>ZZ_DATA_SALES</Name>                                    
          <LRType>FILE</LRType>                                         
          <LRStatus>ACTVE</LRStatus>                                    
          <EffectiveDate>1900-01-01</EffectiveDate>                     
          <TerminationDate>2100-12-31</TerminationDate>                 
          <Fields>                                                      
            <Field ID="78944">                                          
              <Name>Sales_Product</Name>                                
              <DataType>ALNUM</DataType>                                
              <Length>10</Length>                                       
              <Ordinal>1</Ordinal>                                      
              <DatabaseColumn>Sales_Product</DatabaseColumn>            
              <CreatedTimestamp>2011-09-05T10:03:08</CreatedTimestamp>  
              <CreatedUserID>ADMIN</CreatedUserID>                      
            </Field>                                                    
            <Field ID="78945">                                          
              <Name>Sales_Num_Sold</Name>                               
              <DataType>ALNUM</DataType>                                
              <Length>3</Length>                                        
              <Position>11</Position>                                   
              <Ordinal>2</Ordinal>                                      
              <DatabaseColumn>Sales_Num_Sold</DatabaseColumn>           
              <CreatedTimestamp>2011-09-05T10:03:08</CreatedTimestamp>  
              <CreatedUserID>ADMIN</CreatedUserID>                      
            </Field>                                                    
            <Field ID="78946">                                          
              <Name>Filler</Name>                                       
              <DataType>ALNUM</DataType>                                
              <Length>67</Length>                                       
              <Position>14</Position>                                   
              <Ordinal>3</Ordinal>                                    
              <DatabaseColumn>Filler</DatabaseColumn>                 
              <CreatedTimestamp>2011-09-05T10:03:08</CreatedTimestamp>
              <CreatedUserID>ADMIN</CreatedUserID>                    
            </Field>                                                  
          </Fields>                                                   
          <Comment>Testing data for PE.</Comment>                     
          <CreatedTimestamp>2011-09-05T10:03:08</CreatedTimestamp>    
          <CreatedUserID>ADMIN</CreatedUserID>                        
          <ModifiedTimestamp>2011-09-05T10:12:49</ModifiedTimestamp>  
        </LogicalRecord>                                              
      </LogicalRecords>                                               
      <Lookups>                                                       
        <Lookup ID="2017">                                            
         <Name>ZZ_LP_PRODUCT_Desc</Name>                              
         <Steps>                                                      
          <Step Number="1">                                           
           <Source>                                                   
            <LogicalRecordRef ID="1391"/>                              
            <KeyFields>                                                
             <KeyField ID="22145" seq="1">                             
              <FieldRef ID="78944"/>                                   
              <DataType>ALNUM</DataType>                               
              <Length>10</Length>                                      
              <Ordinal>1</Ordinal>                                     
              <CreatedTimestamp>2011-09-05T10:18:03</CreatedTimestamp> 
              <CreatedUserID>ADMIN</CreatedUserID>                     
             </KeyField>                                               
            </KeyFields>                                               
           </Source>                                                   
           <Target>                                                    
             <LogicalRecordRef ID="1390"/>                             
             <LogicalFileRef ID="1391"/>                               
           </Target>                                                   
          </Step>                                                      
         </Steps>                                                      
        </Lookup>                                                    
      </Lookups>                                                     
      <Folders>                                                      
        <Folder ID="796">                                            
          <Description>USER456_PM_Test</Description>                  
          <Comment>Views for testing PE batch processing</Comment>   
          <CreatedTimestamp>2011-08-19T09:45:26</CreatedTimestamp>   
          <CreatedUserID>ADMIN</CreatedUserID>                       
          <ModifiedTimestamp>2011-11-11T09:10:59</ModifiedTimestamp> 
          <ModifiedUserID>USER123</ModifiedUserID>                   
        </Folder>                                                    
      </Folders>                                                     
    </Metadata>                                                      
    <Views>                                                          
      <View ID="8475">                                               
        <Name>PRODUCT_Lookup_and_Report</Name>                       
        <EffectiveDate>2011-09-05</EffectiveDate>                    
        <TerminationDate>2100-12-31</TerminationDate>                
        <Status>ACTVE</Status>                                         
        <Type>DETL</Type>                                              
        <OwnerUser>ADMIN</OwnerUser>                                   
        <FolderRefs>                                                   
          <FolderRef ID="796"/>                                        
        </FolderRefs>                                                  
        <Comment>Testing for PE.</Comment>                             
        <CreatedTimestamp>2011-09-05T10:08:39</CreatedTimestamp>       
        <CreatedUserID>ADMIN</CreatedUserID>                           
        <ModifiedTimestamp>2011-09-05T10:21:07</ModifiedTimestamp>     
        <Input>                                                        
          <ControlRecordRef ID="1"/>                                   
          <DataSources>                                                
            <DataSource ID="13350" seq="1">                            
              <LogicalFileRef ID="1392"/>                              
              <LogicalRecordRef ID="1391"/>                            
              <XID>2526</XID>                                          
              <CreatedTimestamp>2011-09-05T10:15:15</CreatedTimestamp> 
              <CreatedUserID>ADMIN</CreatedUserID>                      
              <ColumnAssignments>                                       
                <ColumnAssignment ID="256110">                          
                  <ColumnRef ID="199662"/>                              
                  <SourceType>3</SourceType>                            
                  <FieldRef ID="78944"/>                                
                  <CreatedTimestamp>2011-09-05T10:15:16</CreatedTimestamp>
                  <CreatedUserID>ADMIN</CreatedUserID>                  
                  <ModifiedTimestamp>2011-09-05T10:21:08</ModifiedTimestamp>
                  <Logics>                                              
                    <Logic seq="1">COLUMN = {Sales_Product}</Logic>     
                  </Logics>                                             
                </ColumnAssignment>                                     
                <ColumnAssignment ID="256111">                          
                  <ColumnRef ID="199663"/>                              
                  <SourceType>2</SourceType>                            
                  <FieldRef ID="78942"/>                                
                  <LookupRef ID="2017"/>                                
                  <CreatedTimestamp>2011-09-05T10:15:16</CreatedTimestamp>
                  <CreatedUserID>ADMIN</CreatedUserID>                  
                  <ModifiedTimestamp>2011-09-05T10:21:08</ModifiedTimestamp>
                  <Logics>                                              
                    <Logic seq="1">COLUMN = {ZZ_LP_PROD_Desc.Prod_Desc}</Logic> 
                  </Logics>                                             
                </ColumnAssignment>                                     
                <ColumnAssignment ID="256112">                          
                  <ColumnRef ID="199664"/>                              
                  <SourceType>3</SourceType>                            
                  <FieldRef ID="78945"/>                                
                  <CreatedTimestamp>2011-09-05T10:21:07</CreatedTimestamp>
                  <CreatedUserID>ADMIN</CreatedUserID>                  
                  <Logics>                                              
                    <Logic seq="1">COLUMN = {Sales_Num_Sold}</Logic>    
                  </Logics>                                             
                </ColumnAssignment>                                     
              </ColumnAssignments>                                      
            </DataSource>                                
          </DataSources>                                 
        </Input>                                         
        <Extract>                                        
          <FileNumber>1</FileNumber>                     
          <EnableAggregation>0</EnableAggregation>       
          <ExtractColumns>                               
            <ExtractColumn seq="1" ID="199662">          
              <Area>SORTK</Area>                         
              <DataType>ALNUM</DataType>                 
              <Length>10</Length>                        
            </ExtractColumn>                             
            <ExtractColumn seq="2" ID="199663">          
              <Area>AREDT</Area>                         
              <DataType>ALNUM</DataType>                 
              <Length>50</Length>                        
              <Ordinal>2</Ordinal>                       
            </ExtractColumn>                             
            <ExtractColumn seq="3" ID="199664">     
              <Area>AREDT</Area>                    
              <DataType>ALNUM</DataType>            
              <Length>3</Length>                    
              <Position>51</Position>               
              <Ordinal>3</Ordinal>                  
            </ExtractColumn>                        
          </ExtractColumns>                         
        </Extract>                                  
        <Sort>                                      
          <SortColumns>                             
            <SortColumn seq="1" ID="35123">         
              <ColumnRef ID="199662"/>              
              <Order>ASCND</Order>                  
              <BreakDisplay>                        
                <Break>1</Break>                    
                <Footer>1</Footer>                  
                <Prefix>Sales_Product</Prefix>      
              </BreakDisplay>                                           
              <CreatedTimestamp>2011-09-05T10:21:08</CreatedTimestamp>  
              <CreatedUserID>ADMIN</CreatedUserID>                      
            </SortColumn>                                               
          </SortColumns>                                                
        </Sort>                                                         
        <Output>                                                        
          <Media>HCOPY</Media>                                          
          <Partition ID="1">                                            
          <Name>Auto-generated Name for Format Phase Output</Name>      
          <ServerRef ID="1"/>                                           
          <CharacterSet>EBCDI</CharacterSet>                            
          <RecordType>VAREX</RecordType>                                
          <FieldDelimiter>FIXED</FieldDelimiter>                        
          <StringDelimiter>DBLQT</StringDelimiter>                      
          <ProcessInParallel>1</ProcessInParallel>                      
          <PosixDirectory>$summarydir</PosixDirectory>                  
          <PosixFileName>V8475_PROD_Lookup_Rept_P259_D20120730</PosixFileName> 
          <DSN>$HLQ.F0008475</DSN>                                      
          <DDNameOutput>F0008475</DDNameOutput>                         
          <DeviceType>SYSDA</DeviceType>                                
          <SpaceUnit>TRK</SpaceUnit>                                    
          <ReleaseUnused>1</ReleaseUnused>                              
          <LRECL>255</LRECL>                                            
          <VSAMORG>KSDS</VSAMORG>                                       
          <RECFM>VBA</RECFM>                                            
          <SYSOUT>*</SYSOUT>                                            
          <ExpirationDate>2012-07-30</ExpirationDate>                   
          </Partition>                                                  
          <PageLayout>                                                  
            <LinesPerPage>60</LinesPerPage>                             
            <MaxCharsPerLine>132</MaxCharsPerLine>                      
            <MaxColumnHeaderLines>1</MaxColumnHeaderLines>              
            <ErrorText>******************************************</ErrorText> 
            <TruncationText>####################################</TruncationText> 
            <Headers>                                                   
              <Header ID="1531">                                        
                <Line>1</Line>                                          
                <Position>1</Position>                                  
                <Alignment>CNTER</Alignment>                            
                <Function>TEXT</Function>                               
                <DateFormat>CYMD</DateFormat>                           
                <Text>Sales Products</Text>                             
                <CreatedTimestamp>2011-09-05T10:21:09</CreatedTimestamp>
                <CreatedUserID>ADMIN</CreatedUserID>                    
              </Header>                                                 
              <Header ID="1532">                                        
                <Line>1</Line>                                          
                <Position>2</Position>                                  
                <Alignment>RIGHT</Alignment>                            
                <Function>TEXT</Function>                               
                <DateFormat>CYMD</DateFormat>                           
                <Text>Date:</Text>                                      
                <CreatedTimestamp>2011-09-05T10:21:09</CreatedTimestamp>
                 <CreatedUserID>ADMIN</CreatedUserID>                    
               </Header>                                                 
               <Header ID="1533">                                        
                 <Line>1</Line>                                          
                 <Position>3</Position>                                  
                 <Alignment>RIGHT</Alignment>                            
                 <Function>DATE</Function>                               
                 <DateFormat>CYMD</DateFormat>                           
                 <CreatedTimestamp>2011-09-05T10:21:10</CreatedTimestamp>
                 <CreatedUserID>ADMIN</CreatedUserID>                    
               </Header>                                                 
             </Headers>                                                  
             <Footers>                                                   
               <Footer ID="1534">                                        
                 <Line>1</Line>                                          
                 <Position>1</Position>                                  
                 <Alignment>CNTER</Alignment>                            
                 <Function>TEXT</Function>                               
                <DateFormat>CYMD</DateFormat>                           
                <Text>PAGE</Text>                                       
                <CreatedTimestamp>2011-09-05T10:21:10</CreatedTimestamp>
                <CreatedUserID>ADMIN</CreatedUserID>                    
              </Footer>                                                 
              <Footer ID="1535">                                        
                <Line>1</Line>                                          
                <Position>2</Position>                                  
                <Alignment>CNTER</Alignment>                            
                <Function>PGNUM</Function>                              
                <DateFormat>CYMD</DateFormat>                           
                <CreatedTimestamp>2011-09-05T10:21:11</CreatedTimestamp>
                <CreatedUserID>ADMIN</CreatedUserID>                    
              </Footer>                                                 
            </Footers>                                                  
          </PageLayout>                                                 
          <FormatColumns>                                               
            <FormatColumn seq="1" ID="199662">                          
              <Name>Column Number 1</Name>                              
              <HeaderAlignment>CNTER</HeaderAlignment>                  
              <HeaderLine1>Sales_Product</HeaderLine1>                  
              <SpacesBeforeColumn>2</SpacesBeforeColumn>                
              <DataType>ALNUM</DataType>                                
              <Length>10</Length>                                       
              <Position>3</Position>                                    
              <Ordinal>1</Ordinal>                                      
              <AggregationPrefix>Subtotal,</AggregationPrefix>          
              <CreatedTimestamp>2011-09-05T10:15:15</CreatedTimestamp>  
              <CreatedUserID>ADMIN</CreatedUserID>                      
              <ModifiedTimestamp>2011-09-05T10:21:07</ModifiedTimestamp>
            </FormatColumn>                                             
            <FormatColumn seq="2" ID="199663">                          
              <Name>Column Number 2</Name>                              
              <HeaderAlignment>CNTER</HeaderAlignment>                  
              <HeaderLine1>Product_Desc</HeaderLine1>                   
              <SpacesBeforeColumn>2</SpacesBeforeColumn>                
              <DataType>ALNUM</DataType>                                
              <Length>50</Length>                                       
              <Position>15</Position>                                   
              <Ordinal>2</Ordinal>                                      
              <CreatedTimestamp>2011-09-05T10:15:15</CreatedTimestamp>  
              <CreatedUserID>ADMIN</CreatedUserID>                      
              <ModifiedTimestamp>2011-09-05T10:21:07</ModifiedTimestamp>
            </FormatColumn>                                             
            <FormatColumn seq="3" ID="199664">                          
              <Name>Column Number 3</Name>                              
              <HeaderAlignment>CNTER</HeaderAlignment>                  
              <HeaderLine1>Sales_Num_Sold</HeaderLine1>                 
              <SpacesBeforeColumn>2</SpacesBeforeColumn>                
              <DataType>ALNUM</DataType>                                
              <Length>3</Length>                                        
              <Position>67</Position>                                   
              <Ordinal>3</Ordinal>                                      
              <CreatedTimestamp>2011-09-05T10:21:07</CreatedTimestamp>  
               <CreatedUserID>ADMIN</CreatedUserID>     
             </FormatColumn>                            
           </FormatColumns>                             
         </Output>                                      
       </View>                                          
     </Views>                                           
   </Environment>                                       
 </SAFRVDP>                                             
                  
```

|

## 90 VDP XML file structure {#90 .section}

The VDP XML file is incompatible with the XML files used by the WE functions export and import.

See help topic "**XML structure for VDP overview**". A link to that overview is under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

