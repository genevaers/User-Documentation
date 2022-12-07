# XML structure for VDP overview {#SACXMLVDP .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Knowledge you need first](SACXMLVDP.md#10)
-   [20 XML structure for VDP](SACXMLVDP.md#20)
-   [100 Need more on this page?](SACXMLVDP.md#100)

## 10 Knowledge you need first {#10 .section}

This topic assumes you are familiar with these topics:

-   "**VDP file overview**",
-   "**MR84 XML Converter overview**",

Links to these overviews are under **Related concepts** below.

## 20 XML structure for VDP {#20 .section}

See the schema below.

|```

<?xml version="1.0" encoding="ibm-1047" ?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        targetNamespace="http://www.ibm.com"
        xmlns="http://www.ibm.com"
        elementFormDefault="qualified">

  <xsd:annotation>
    <xsd:documentation xml:lang="en">
      The XML schema defintion for a file
      created by the  IBM Scalable Architecture
      for Financial Reporting VDP Builder.
      Created by:  Alan Sung    Date: 18-Jan-2008
      Modified by: Alan Sung    Date: 07-Feb-2008
            - DataSource now has the XID for
              x_lrfiletbl/xlrfileid
            - IndexFieldRef now has XID for
              x_lrindexfldtbl/xlrindexfldid
              plus audit info.
            Alan Sung        Date: 13-Feb-2008
            - Added FrequencyPass to View
            - Added stxlrfldid to SortTitleKey
              plus audit info.
            Alan Sung        Date: 19-Mar-2008
            - Added MemberName, SpaceUnit,
              VolumeSerialNumber,
              VolumeSequenceNumber,
              VolumeCount to Partition
            - Put collections into a plural grouping
            - Changed Comments to Comment,
              MaxRecords to MaxRecord
            Alan Sung        Date: 16-Jul-2008
            - Added PageLayout/ShowDetailLines and
              FormatColumn/HeaderAlignment
            Ian Cunningham   Date: 16-Feb-2009
            - Merged in the CodeValues File and
              changed the ContentCode to 'M'
              for Months
            Alan Sung        Date: 07-Aug-2009
            - Change MaxColumnHeaderLines from
              xsd:postiveInteger to xsd:unsignedInt
    </xsd:documentation>
  </xsd:annotation>

  <xsd:simpleType name="AccessMethod">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="SEQIN"/>
      <xsd:enumeration value="VSAM"/>
      <xsd:enumeration value="KSDS"/>
      <xsd:enumeration value="IMS"/>
      <xsd:enumeration value="IMSFP"/>
      <xsd:enumeration value="DB2SQ"/>
      <xsd:enumeration value="DB2VS"/>
      <xsd:enumeration value="EXCP"/>
      <xsd:enumeration value="SEQEX"/>
      <xsd:enumeration value="ORACL"/>
      <xsd:enumeration value="SYBAS"/>
      <xsd:enumeration value="SQLSV"/>
      <xsd:enumeration value="INFIB"/>
      <xsd:enumeration value="XML"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="CharacterSet">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="EBCDI"/>
      <xsd:enumeration value="ASCII"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="DataType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="ALNUM"/>
      <xsd:enumeration value="ALPHA"/>
      <xsd:enumeration value="NUMER"/>
      <xsd:enumeration value="PACKD"/>
      <xsd:enumeration value="PSORT"/>
      <xsd:enumeration value="BINRY"/>
      <xsd:enumeration value="BSORT"/>
      <xsd:enumeration value="BCD"/>
      <xsd:enumeration value="MSKNM"/>
      <xsd:enumeration value="EDNUM"/>
      <xsd:enumeration value="FLOAT"/>
      <xsd:enumeration value="GNUM"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="DatabaseRowFormat">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="SQL"/>
      <xsd:enumeration value="DB2"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="DSORG">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="PS"/>
      <xsd:enumeration value="DA"/>
      <xsd:enumeration value="VSAM"/>
      <xsd:enumeration value="PO"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="EffDateKey">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="RDATE"/>
      <xsd:enumeration value="BDATE"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="Endian">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="BIG"/>
      <xsd:enumeration value="LITLE"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ExitType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="READ"/>
      <xsd:enumeration value="WRITE"/>
      <xsd:enumeration value="LKUP"/>
      <xsd:enumeration value="FORMT"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ExtractArea">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="SORTK"/>
      <xsd:enumeration value="STTLK"/>
      <xsd:enumeration value="AREDT"/>
      <xsd:enumeration value="ARECT"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="FileType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="STDEX"/>
      <xsd:enumeration value="DISK"/>
      <xsd:enumeration value="TAPE"/>
      <xsd:enumeration value="PIPE"/>
      <xsd:enumeration value="TOKEN"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ContentCode">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="NONE"/>
      <xsd:enumeration value="YMD"/>
      <xsd:enumeration value="Y/M/D"/>
      <xsd:enumeration value="CYMD"/>
      <xsd:enumeration value="CY/MD"/>
      <xsd:enumeration value="DMY"/>
      <xsd:enumeration value="D/M/Y"/>
      <xsd:enumeration value="DMCY"/>
      <xsd:enumeration value="D/MCY"/>
      <xsd:enumeration value="YYDDD"/>
      <xsd:enumeration value="Y/DDD"/>
      <xsd:enumeration value="CYDDD"/>
      <xsd:enumeration value="CY/DD"/>
      <xsd:enumeration value="MMDD"/>
      <xsd:enumeration value="MM/DD"/>
      <xsd:enumeration value="DD/MM"/>
      <xsd:enumeration value="M"/>
      <xsd:enumeration value="DD"/>
      <xsd:enumeration value="DDDDD"/>
      <xsd:enumeration value="HMST"/>
      <xsd:enumeration value="H:MST"/>
      <xsd:enumeration value="HMS"/>
      <xsd:enumeration value="H:M:S"/>
      <xsd:enumeration value="HHMM"/>
      <xsd:enumeration value="HH:MM"/>
      <xsd:enumeration value="CYMDH"/>
      <xsd:enumeration value="SSSSS"/>
      <xsd:enumeration value="LOWER"/>
      <xsd:enumeration value="UPPER"/>
      <xsd:enumeration value="DBCS"/>
      <xsd:enumeration value="CYM"/>
      <xsd:enumeration value="CCYY"/>
      <xsd:enumeration value="YY"/>
      <xsd:enumeration value="CYAP"/>
      <xsd:enumeration value="POSIX"/>
      <xsd:enumeration value="MDY"/>
      <xsd:enumeration value="MDCY"/>
      <xsd:enumeration value="MD/CY"/>
      <xsd:enumeration value="CY-DD"/>
      <xsd:enumeration value="CY-M"/>
      <xsd:enumeration value="C-M-D"/>
      <xsd:enumeration value="CY/M"/>
      <xsd:enumeration value="POS2"/>
      <xsd:enumeration value="D-M"/>
      <xsd:enumeration value="D-M-C"/>
      <xsd:enumeration value="D-M-Y"/>
      <xsd:enumeration value="M-D"/>
      <xsd:enumeration value="M-D-C"/>
      <xsd:enumeration value="Y-DD"/>
      <xsd:enumeration value="Y-M-D"/>
      <xsd:enumeration value="USDAT"/>
      <xsd:enumeration value="EUDAT"/>
      <xsd:enumeration value="DMOCY"/>
      <xsd:enumeration value="MMMMY"/>
      <xsd:enumeration value="CYMDT"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="FieldDelimiter">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="COMMA"/>
      <xsd:enumeration value="TAB"/>
      <xsd:enumeration value="PIPE"/>
      <xsd:enumeration value="CTRLA"/>
      <xsd:enumeration value="FIXED"/>
      <xsd:enumeration value="SLASH"/>
      <xsd:enumeration value="BLASH"/>
      <xsd:enumeration value="COLON"/>
      <xsd:enumeration value="SCOLN"/>
      <xsd:enumeration value="TILDE"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="HeaderFunction">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="DATE"/>
      <xsd:enumeration value="TIME"/>
      <xsd:enumeration value="PGNUM"/>
      <xsd:enumeration value="VWID"/>
      <xsd:enumeration value="TEXT"/>
      <xsd:enumeration value="CONAM"/>
      <xsd:enumeration value="VWNAM"/>
      <xsd:enumeration value="VWOWN"/>
      <xsd:enumeration value="S01LB"/>
      <xsd:enumeration value="S01VL"/>
      <xsd:enumeration value="S01TT"/>
      <xsd:enumeration value="S02LB"/>
      <xsd:enumeration value="S02VL"/>
      <xsd:enumeration value="S02TT"/>
      <xsd:enumeration value="S03LB"/>
      <xsd:enumeration value="S03VL"/>
      <xsd:enumeration value="S03TT"/>
      <xsd:enumeration value="S04LB"/>
      <xsd:enumeration value="S04VL"/>
      <xsd:enumeration value="S04TT"/>
      <xsd:enumeration value="S05LB"/>
      <xsd:enumeration value="S05VL"/>
      <xsd:enumeration value="S05TT"/>
      <xsd:enumeration value="RUN#"/>
      <xsd:enumeration value="RDATE"/>
      <xsd:enumeration value="FDATE"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="Alignment">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="LEFT"/>
      <xsd:enumeration value="CNTER"/>
      <xsd:enumeration value="RIGHT"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="LRStatus">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="ACTVE"/>
      <xsd:enumeration value="INACT"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="LRType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="FILE"/>
      <xsd:enumeration value="VIEW"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="OutputMedia">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="HCOPY"/>
      <xsd:enumeration value="ONLIN"/>
      <xsd:enumeration value="FILE"/>
      <xsd:enumeration value="EXEIF"/>
      <xsd:enumeration value="EXCEL"/>
      <xsd:enumeration value="LOTUS"/>
      <xsd:enumeration value="DELIM"/>
      <xsd:enumeration value="EXEIC"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="PageBreak">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="SAMEP"/>
      <xsd:enumeration value="NEWP"/>
      <xsd:enumeration value="SUPRS"/>
      <xsd:enumeration value="TTLN1"/>
      <xsd:enumeration value="TTLN2"/>
      <xsd:enumeration value="TTLN3"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ProgramType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="LECOB"/>
      <xsd:enumeration value="COB2"/>
      <xsd:enumeration value="C"/>
      <xsd:enumeration value="C++"/>
      <xsd:enumeration value="Java"/>
      <xsd:enumeration value="ASMLR"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="TextRecordDelimiter">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="CR"/>
      <xsd:enumeration value="LF"/>
      <xsd:enumeration value="CRLF"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="RecordDelimiter">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="DELIM"/>
      <xsd:enumeration value="VARIN"/>
      <xsd:enumeration value="VAREX"/>
      <xsd:enumeration value="FIXED"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="READDISP">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="SHR"/>
      <xsd:enumeration value="OLD"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="RECFM">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="FB"/>
      <xsd:enumeration value="VB"/>
      <xsd:enumeration value="FBA"/>
      <xsd:enumeration value="VBA"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="RegenerationOption">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="ALWYS"/>
      <xsd:enumeration value="MRGIN"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="RelPeriod">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="CDATE"/>
      <xsd:enumeration value="EDATE"/>
      <xsd:enumeration value="SPECD"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ServerType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="MAINF"/>
      <xsd:enumeration value="WIN64"/>
      <xsd:enumeration value="WIN2K"/>
      <xsd:enumeration value="SUNOS"/>
      <xsd:enumeration value="LOCAL"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="SortBreak">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="NOBRK"/>
      <xsd:enumeration value="BRK"/>
      <xsd:enumeration value="SUPRS"/>
      <xsd:enumeration value="LABEL"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="SortKeyDisplayOption">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="CAT"/>
      <xsd:enumeration value="ASDTA"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="SortSequence">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="ASCND"/>
      <xsd:enumeration value="DSCND"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="SpaceUnit">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="CYL"/>
      <xsd:enumeration value="TRK"/>
      <xsd:enumeration value="BLK"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="StandardExitParameter">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="ETREC"/>
      <xsd:enumeration value="EXTRT"/>
      <xsd:enumeration value="LKUPK"/>
      <xsd:enumeration value="ETDDN"/>
      <xsd:enumeration value="THDNO"/>
      <xsd:enumeration value="ANCHR"/>
      <xsd:enumeration value="RTCOD"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="StringDelimiter">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="NONE"/>
      <xsd:enumeration value="SNGLQ"/>
      <xsd:enumeration value="DBLQT"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="AggregationType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="NONE"/>
      <xsd:enumeration value="SUM"/>
      <xsd:enumeration value="MAX"/>
      <xsd:enumeration value="MIN"/>
      <xsd:enumeration value="FIRST"/>
      <xsd:enumeration value="LAST"/>
      <xsd:enumeration value="DCALC"/>
      <xsd:enumeration value="BCALC"/>
      <xsd:enumeration value="RCALC"/>
      <xsd:enumeration value="DMAX"/>
      <xsd:enumeration value="DMIN"/>
      <xsd:enumeration value="MNNMN"/>
      <xsd:enumeration value="MXNMX"/>
      <xsd:enumeration value="SUNMN"/>
      <xsd:enumeration value="SUNMX"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ViewFrequency">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="D"/>
      <xsd:enumeration value="W"/>
      <xsd:enumeration value="M"/>
      <xsd:enumeration value="A"/>
      <xsd:enumeration value="Q"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ViewStatus">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="ACTVE"/>
      <xsd:enumeration value="INACT"/>
      <xsd:enumeration value="ONETM"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ViewOutputType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="SUMRY"/>
      <xsd:enumeration value="DETL"/>
      <xsd:enumeration value="DTMRG"/>
      <xsd:enumeration value="COPY"/>
      <xsd:enumeration value="EXTR"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ExtractControlRecord">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="NONE"/>
      <xsd:enumeration value="SKIP"/>
      <xsd:enumeration value="VERFY"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="VSAMORG">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="KSDS"/>
      <xsd:enumeration value="ESDS"/>
      <xsd:enumeration value="RRDS"/>
      <xsd:enumeration value="LSDS"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="WRITEDISP">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="NDD"/>
      <xsd:enumeration value="NCD"/>
      <xsd:enumeration value="NCC"/>
      <xsd:enumeration value="MDD"/>
      <xsd:enumeration value="MCD"/>
      <xsd:enumeration value="MCC"/>
      <xsd:enumeration value="ODD"/>
      <xsd:enumeration value="OCD"/>
      <xsd:enumeration value="OCC"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="FormatMask">
    <xsd:restriction base="xsd:string">
      <xsd:pattern
       value="[PULBAR]([NY]|[1-9])(N|\d)(A|\d)[NYR]"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="DatabaseType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="IBMDB2"/>
      <xsd:enumeration value="Oracle"/>
      <xsd:enumeration value="MSSQLServer"/>
      <xsd:enumeration value="Sybase"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:element name="SAFRVDP">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="CreatedDateTime"
                     type="xsd:dateTime"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Program"
                     type="xsd:string"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref="JobInfo"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref="Users"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref="Environment"
                     minOccurs="1"
                     maxOccurs="1"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Environment">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="MediumString"
                     default="Imported Environment"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Editable"
                     type="xsd:boolean"
                     default="1"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Archived"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="EffectiveTermination"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
        <xsd:element ref ="Metadata"/>
        <xsd:element ref ="Views"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Metadata">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ControlRecords"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Servers"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Partitions"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="LogicalFiles"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="LogicalRecords"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Lookups"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Exits"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Folders"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Views">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="View"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="JobInfo">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        This section is what is specified on the
        command line and the configuration file
        for the VDP Builder. In order to 
        reproduce the same exact XML file a
        configuration file should be rebuilt.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:all>
        <xsd:element name="Database">
          <xsd:complexType>
            <xsd:all>
              <xsd:element name="Type"
                           type="DatabaseType"
                           default="IBMDB2"
                           minOccurs="0"
                           maxOccurs="1"/>
              <xsd:element name="Connection"
                           type="xsd:string"/>
              <xsd:element name="Schema"
                           type="xsd:string"
                           minOccurs="0"
                           maxOccurs="1"/>
              <xsd:element name="WorkbenchUser"
                           type="UserName"
                           minOccurs="0"
                           maxOccurs="1"/>
              <xsd:element name="WorkbenchPassword"
                           type="xsd:string"
                           minOccurs="0"
                           maxOccurs="1"/>
            </xsd:all>
          </xsd:complexType>
        </xsd:element>
        <xsd:element name="RunDate"
                     type="xsd:date"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RunNumber"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MaxExtractFileNumber"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DecimalDataDigits"
                     type="xsd:unsignedByte"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DecimalDataPlaces"
                     type="xsd:unsignedByte"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="ExtractFile"/>
      </xsd:all>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ControlRecords">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ControlRecord"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ControlRecord">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A control record represents an entry
        in c_controlrec
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="MediumString"/>
        <xsd:group   ref ="EffectiveTermination"/>
        <xsd:element name="MonthFirstPeriod"
                     type="xsd:unsignedInt"/>
        <xsd:element name="MinPeriod"
                     type="LowPeriod"/>
        <xsd:element name="MaxPeriod"
                     type="xsd:positiveInteger"/>
        <xsd:element name="FiscalDate"
                     type="xsd:date"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ControlRecordRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Servers">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Server"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Server">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A server represents an entry in e_servertbl
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="LongString"/>
        <xsd:element name="ServerType"
                     type="ServerType"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Description"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Database"
                     type="MediumString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ServerRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Partitions">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Partition"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Partition">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A partition represents an entry
        in e_partitiontbl
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"/>
        <xsd:element name="PartitionType"
                     type="FileType"
                     default="DISK"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="ServerRef"/>
        <xsd:group   ref ="EffectiveTermination"/>
        <xsd:element name="AccessMethod"
                     type="AccessMethod"
                     default="SEQIN"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="CharacterSet"
                     type="CharacterSet"
                     default="ASCII"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Endian"
                     type="Endian"
                     default="BIG"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DynamicAllocation"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MinRecordLength"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MaxRecordLength"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MaxRecord"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RecordType"
                     type="RecordDelimiter"
                     default="DELIM"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RecordDelimiter"
                     type="TextRecordDelimiter"
                     default="LF"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="FieldDelimiter"
                     type="FieldDelimiter"
                     default="COMMA"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="StringDelimiter"
                     type="StringDelimiter"
                     default="NONE"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="FileIsRoot"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ProcessInParallel"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="PosixDirectory"
                     type="xsd:string"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="PosixFileName"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Database"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DSN"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DDNameInput"
                     type="UserName"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DDNameExtract"
                     type="UserName"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DDNameOutput"
                     type="UserName"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ReadDisposition"
                     type="READDISP"
                     default="SHR"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="WriteDisposition"
                     type="WRITEDISP"
                     default="NCD"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MemberName"
                     type="UserName"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="VolumeSerialNumber"
                     type="UserName"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="VolumeSequenceNumber"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="VolumeCount"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DeviceType"
                     type="UserName"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SpaceUnit"
                     type="SpaceUnit"
                     default="BLK"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="PrimaryQuantity"
                     type="xsd:unsignedShort"
                     default="1"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SecondaryQuantity"
                     type="xsd:unsignedShort"
                     default="1"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ReleaseUnused"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="LRECL"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="BLKSIZE"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="KeyLength"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="KeyPosition"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DSORG"
                     type="DSORG"
                     default="PS"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="VSAMORG"
                     type="VSAMORG"
                     default="KSDS"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RECFM"
                     type="RECFM"
                     default="FB"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="OPTCODE"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SYSOUT"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SYSOUTCopies"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SYSOUTLimit"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SYSOUTHold"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ModelDSCB"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RetentionPeriod"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ExpirationDate"
                     type="xsd:date"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="ExitRefs"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="StartAtRecord"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="StopAtRecord"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ExtractFile"
               substitutionGroup="Partition">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
      An extract file does not exist in the database.
      Properties of the extract file come from the
      VDP Builder configuration file.
      When recreating that file, make sure to add
      this information.  An extract file is just
      synonym for a partition.
      </xsd:documentation>
    </xsd:annotation>
  </xsd:element>

  <xsd:element name="PartitionRefs">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="PartitionRef"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="PartitionRef">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="XID"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1">
          <xsd:annotation>
            <xsd:documentation xml:lang="en">
             Maps to x_filepartitiontbl /
                     xfilepartitionid
            </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Database">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        Database is a sub-section of a partition.
        These correspond to the database fields
        'dbmsconnstring','dbmsdatabase','dbmstable',
        'dbmsrowfmtcd','dbmsinclnullsind','dbmssql'
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Connection"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Name"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Table"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RowFormat"
                     type="DatabaseRowFormat"
                     default="SQL"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="IncludeNulls"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Query"
                     type="LogicString"
                     minOccurs="0"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="LogicalFiles">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="LogicalFile"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="LogicalFile">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A logical file represents an entry in
        e_filetbl and consists of a series of
        partition references
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"/>
        <xsd:group   ref ="EffectiveTermination"/>
        <xsd:element ref ="PartitionRefs"
                     minOccurs="1"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="LogicalRecords">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="LogicalRecord"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="LogicalRecord">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"/>
        <xsd:element name="LRType"
                     type="LRType"
                     default="FILE"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="LRStatus"
                     type="LRStatus"
                     default="ACTVE"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="EffectiveTermination"/>
        <xsd:element ref ="Index"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Fields"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="LogicalRecordRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="LogicalFileRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Index">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        An index represents an entry in e_lrindextbl
        and consists of a series of field references.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"/>
        <xsd:element ref ="IndexFieldRefs"
                     minOccurs="1"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="IndexFieldRefs">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="IndexFieldRef"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="IndexFieldRef">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="XID"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1">
          <xsd:annotation>
            <xsd:documentation xml:lang="en">
             Maps to x_lrindexfldtbl / xlrindexfldid
             Note that no XID value exists for entries
             where any one of the following 3 boolean
             values is set to true.
            </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
        <xsd:element name="StartEffectiveDate"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="EndEffectiveDate"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="HighRange"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Fields">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Field"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Field">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        An field represents a combination of values
        from x_lrfldtbl and xov_lrfldattr
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"/>
        <xsd:group   ref ="FormatInfo"/>
        <xsd:element name="Mask"
                     type="FormatMask"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="DatabaseColumn"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Lookups">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Lookup"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Lookup">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A lookup represents an entry in e_jointbl
        and consists of a series of steps.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"/>
        <xsd:element ref ="Steps"
                     minOccurs="1"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Steps">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Step"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Step">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A step represents an entry in
        x_jointargetlrtbl.
        The target logical record and logical file 
        are listed, but the destxlrfileid value
        is not available.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Source">
          <xsd:complexType>
            <xsd:sequence>
              <xsd:element ref ="LogicalRecordRef"/>
              <xsd:element ref ="LogicalFileRef"
                           minOccurs="0"
                           maxOccurs="1"/>
              <xsd:element ref ="KeyFields"
                           minOccurs="1"
                           maxOccurs="1"/>
            </xsd:sequence>
          </xsd:complexType>
        </xsd:element>
        <xsd:element name="Target">
          <xsd:complexType>
            <xsd:sequence>
              <xsd:element ref ="LogicalRecordRef"/>
              <xsd:element ref ="LogicalFileRef"/>
              <xsd:element ref ="ExitRefs"
                           minOccurs="0"
                           maxOccurs="1">
                <xsd:annotation>
                  <xsd:documentation xml:lang="en">
                    This is actually e_lrtbl / 
                    lookupexit for the specified
                    logical record.
                  </xsd:documentation>
                </xsd:annotation>
              </xsd:element>
            </xsd:sequence>
          </xsd:complexType>
        </xsd:element>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attribute name="Number"
                     type="xsd:positiveInteger"
                     use="required"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="KeyFields">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="KeyField"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="KeyField">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A key field represents an entry in
        e_joinsourcekeytbl.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="FieldRef"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SymbolicName"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:choice minOccurs="0"
                    maxOccurs="1">
          <xsd:element name="SymbolicDefault"
                       type="LongString"/>
          <xsd:element name="Constant"
                       type="LongString">
            <xsd:annotation>
              <xsd:documentation xml:lang="en">
                Either one of these are mapped
                to srcvalue.
            </xsd:documentation>
            </xsd:annotation>
          </xsd:element>
        </xsd:choice>
        <xsd:group   ref ="FormatInfo"/>
        <xsd:element name="Mask"
                     type="FormatMask"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Exits">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Exit" 
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Exit">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        An exit represents an entry in e_programtbl.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Program"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Module"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Type"
                     type="ExitType"/>
        <xsd:element name="ProgramType"
                     type="ProgramType"/>
        <xsd:element name="Optimize"
                     type="xsd:boolean"
                     default="1"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="PosixDirectory"
                     type="xsd:string"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="PosixFileName"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Folders">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Folder
               "     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Folder">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A folder represents an entry in c_viewfolders.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Description"
                     type="ShortString"
                     default="Imported Folder"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="PosixDirectory"
                     type="xsd:string"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="FolderRefs"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Users">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A user represents an entry in c_usertbl.
        This section gives all the user IDs
        referenced.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="User"
                     minOccurs="0"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="User">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="First"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Middle"
                     type="SingleChar"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Last"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="EffectiveTermination"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref= "CreatedModified"/>
      </xsd:sequence>
      <xsd:attribute name="ID"
                     type="UserName"
                     use="required"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="FolderRefs">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="FolderRef"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="FolderRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="FieldRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="LookupRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="TitleFieldRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="TitleLookupRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ExitRefs">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ExitRef"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

 <xsd:element name="ExitRef">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Parameter"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
      <xsd:attribute name="Type"
                     type="ExitType"
                     use="required"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="View">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A view represents an entry in e_viewtbl
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"/>
        <xsd:group   ref ="EffectiveTermination"/>
        <xsd:element name="Status"
                     type="ViewStatus"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Type"
                     type="ViewOutputType"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="OwnerUser"
                     type="UserName"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="FrequencyCode"
                     type="ShortString"
                     default="D"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="FolderRefs"
                     minOccurs="1"
                     maxOccurs="1"/>
        <xsd:element name="Comment"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="CreatedModified"/>
        <xsd:element ref ="Input"
                     minOccurs="1"
                     maxOccurs="1"/>
        <xsd:element ref ="Extract"
                     minOccurs="1"
                     maxOccurs="1"/>
        <xsd:element ref ="Sort"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Output"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Extract">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        Extract is a sub-section of a view.
        The file number came either from
        'extractfilepartnbr' if specified or
        it was assigned using the round
        robin assignment. The other fields
        correspond 'extractmaxreccnt',
        'extractsummaryind','extractsummarybuf'
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="FileNumber"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MaxRecord"
                     type="xsd:unsignedInt"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="EnableAggregation"
                     type="xsd:boolean"/>
        <xsd:element name="AggregationRecords"
                     type="xsd:unsignedInt"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="ExtractColumns"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Input">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ControlRecordRef"/>
        <xsd:element ref ="DataSources"
                     minOccurs="1"
                     maxOccurs="1"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="DataSources">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="DataSource"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="DataSource">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A data source represents an entry in
        x_viewsrclrfiletbl combined with x_lrfiletbl
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="LogicalFileRef"/>
        <xsd:element ref ="LogicalRecordRef"/>
        <xsd:element name="XID"
                     type="xsd:positiveInteger"
                     minOccurs="0"
                     maxOccurs="1">
          <xsd:annotation>
            <xsd:documentation xml:lang="en">
            Maps to x_lrfiletbl / xlrfileid
           </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
        <xsd:element ref ="Filters"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="CreatedModified"/>
        <xsd:element ref ="ColumnAssignments"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Filters">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Filter"
                     type="LogicString"
                     minOccurs="0"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Logics">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Logic"
                     type="LogicString"
                     minOccurs="0"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ColumnAssignments">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ColumnAssignment"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ColumnAssignment">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A column assignment represents an entry in
        x_viewlrfld_lrfld
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ColumnRef"/>
        <xsd:element name="SourceType"
                     type="SourceType"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="FieldRef"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="LookupRef"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Value"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="TitleFieldRef"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="TitleLookupRef"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="EffDateType"
                     type="RelPeriod"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="EffDateValue"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="CreatedModified"/>
        <xsd:element ref ="Logics"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Output">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        Output is a sub-section of a view.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Media"
                     type="OutputMedia"/>
        <xsd:element name="MaxRecord"
                     type="xsd:unsignedInt"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ZeroSuppresion"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RegenerateMaster"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="RegenerateOption"
                     type="RegenerationOption"
                     default="ALWYS"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:choice minOccurs="1"
                    maxOccurs="1">
          <xsd:element ref ="Partition"/>
          <xsd:element ref ="PartitionRef">
            <xsd:annotation>
              <xsd:documentation xml:lang="en">
               PartitionRef ID is
               x_filepartitiontbl/childpartitionid
               when e_viewtbl/xfilepartition
               is not zero.
               Partition is used when the output
               partition is dynamically generated
             </xsd:documentation>
            </xsd:annotation>
          </xsd:element>
        </xsd:choice>
        <xsd:element ref ="ExitRefs"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="PageLayout"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Filters"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="FormatColumns"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="PageLayout">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Landscape"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="LinesPerPage"
                     type="xsd:positiveInteger"
                     default="66"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MaxCharsPerLine"
                     type="xsd:positiveInteger"
                     default="250"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="MaxColumnHeaderLines"
                     type="xsd:unsignedInt"
                     default="3"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ErrorText"
                     type="MediumString"
                     default="**********"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="TruncationText"
                     type="MediumString"
                     default="##########"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ShowDetailLines"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="LogicalRecordRef"
                     minOccurs="0"
                     maxOccurs="1">
          <xsd:annotation>
            <xsd:documentation xml:lang="en">
              e_viewtbl/outputlrid
            </xsd:documentation>
          </xsd:annotation>
        </xsd:element>
        <xsd:element ref ="Headers"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="Footers"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:group name="HeaderFooter">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A header/footer represents an entry in
        e_viewheaderfooter
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="Line"
                   type="xsd:positiveInteger"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Position"
                   type="xsd:positiveInteger"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Alignment"
                   type="Alignment"/>
      <xsd:element name="Function"
                   type="HeaderFunction"/>
      <xsd:element name="DateFormat"
                   type="ContentCode"/>
      <xsd:element name="Mask"
                   type="FormatMask"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Text"
                   type="LongString"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:group   ref ="CreatedModified"/>
    </xsd:sequence>
  </xsd:group>

  <xsd:element name="Headers">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Header"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Header">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:group   ref ="HeaderFooter"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Footers">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="Footer"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Footer">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:group   ref ="HeaderFooter"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ExtractColumns">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ExtractColumn"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ExtractColumn">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        This format info block here goes into the
        fields of X_VIEWSORTKEYTBL beginning with SK.
        It represents what we are actually sorting on.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Area"
                     type="ExtractArea"/>
        <xsd:group   ref ="FormatInfo"/>
        <xsd:element name="Mask"
                     type="FormatMask"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ExcelMask"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element ref ="SortTitleKey"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="SortTitleKey">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        This format info block here goes into the
        fields of X_VIEWSORTKEYTBL beginning with ST.
        This is the format of the sort title key
        and is only present if SortTitleKey is true.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:group   ref ="FormatInfo"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Sort">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="SortColumns"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="SortColumns">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="SortColumn"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="SortColumn">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A sort column represents an entry in 
        x_viewsortkeytbl.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="ColumnRef"/>
        <xsd:element name="Order"
                     type="SortSequence"/>
        <xsd:element ref ="BreakDisplay"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="CreatedModified"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="BreakDisplay">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        The format info block here goes into the
        fields of x_viewsortkeytbl beginning with
        'desc'. It represents what the looked up
        sort title field should be converted to
        before display.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Break"
                     type="xsd:boolean"/>
        <xsd:element name="Footer"
                     type="xsd:boolean"/>
        <xsd:element name="Header"
                     type="PageBreak"
                     default="SAMEP"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="AggregationCount"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Prefix"
                     type="ShortString"/>
        <xsd:element name="Hardcopy"
                     type="SortKeyDisplayOption"
                     default="CAT"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="FormatInfo"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="FormatColumns">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element ref ="FormatColumn"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="FormatColumn">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        A format column represents an entry in
         xov_viewlrfldattr
      </xsd:documentation>
    </xsd:annotation>
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Name"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="HeaderAlignment"
                     type="Alignment"
                     default="LEFT"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="HeaderLine1"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="HeaderLine2"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="HeaderLine3"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Hidden"
                     type="xsd:boolean"
                     default="0"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Aggregation"
                     type="AggregationType"
                     default="NONE"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="SpacesBeforeColumn"
                     type="xsd:unsignedShort"
                     default="2"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:group   ref ="ColFormatInfo"/>
        <xsd:group   ref ="CreatedModified"/>
        <xsd:element ref ="Calculations"
                     minOccurs="0"
                     maxOccurs="1"/>
      </xsd:sequence>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="Calculations">
    <xsd:complexType>
      <xsd:sequence>
        <xsd:element name="Calculation"
                     type="LogicString"
                     minOccurs="1"
                     maxOccurs="unbounded"/>
      </xsd:sequence>
    </xsd:complexType>
  </xsd:element>

  <xsd:element name="ColumnRef">
    <xsd:complexType>
      <xsd:attributeGroup ref="RecordID"/>
    </xsd:complexType>
  </xsd:element>

  <xsd:attributeGroup name="RecordID">
    <xsd:attribute name="ID" use="required"
                   type="xsd:positiveInteger"/>
    <xsd:attribute name="seq" default="1"
                   type="xsd:positiveInteger"/>
  </xsd:attributeGroup>

  <xsd:simpleType name="SingleChar">
    <xsd:restriction base="xsd:string">
      <xsd:maxLength value="1"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="UserName">
    <xsd:restriction base="xsd:string">
      <xsd:minLength value="1"/>
      <xsd:maxLength value="8"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="ShortString">
    <xsd:restriction base="xsd:string">
      <xsd:maxLength value="48"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="MediumString">
    <xsd:restriction base="xsd:string">
      <xsd:maxLength value="64"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="LongString">
    <xsd:restriction base="xsd:string">
      <xsd:maxLength value="254"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="LogicChunk">
    <xsd:restriction base="xsd:string">
      <xsd:maxLength value="256"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:complexType name="LogicString">
    <xsd:simpleContent>
      <xsd:extension base="LogicChunk">
         <xsd:attribute name="seq"
                        default="1"
                        type="xsd:positiveInteger"/>
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>

  <xsd:simpleType name="SourceType">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
         0 = None
         1 = Constant
         2 = Lookup
         3 = Data Source Field
         4 = LogicText or Formula
      </xsd:documentation>
    </xsd:annotation>
    <xsd:restriction base="xsd:unsignedInt">
      <xsd:minInclusive value="0"/>
      <xsd:maxInclusive value="4"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:group name="EffectiveTermination">
    <xsd:sequence>
      <xsd:element name="EffectiveDate"
                   type="xsd:date"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="TerminationDate"
                   type="xsd:date"
                   minOccurs="0"
                   maxOccurs="1"/>
    </xsd:sequence>
  </xsd:group>

  <xsd:group name="CreatedModified">
    <xsd:annotation>
      <xsd:documentation xml:lang="en">
        If the modified timestamp is missing, then
        it is the same as the created timestamp.
        If the modified user ID is missing, then
        it is the same as the created user ID.
        If either the created timestamp or
        the created user ID is missing, then
        it was not specified in the DB.
      </xsd:documentation>
    </xsd:annotation>
    <xsd:sequence>
      <xsd:element name="CreatedTimestamp"
                   type="xsd:dateTime"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="CreatedUserID"
                   type="UserName"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="ModifiedTimestamp"
                   type="xsd:dateTime"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="ModifiedUserID"
                   type="UserName"
                   minOccurs="0"
                   maxOccurs="1"/>
    </xsd:sequence>
  </xsd:group>

  <xsd:group name="FormatInfo">
    <xsd:sequence>
      <xsd:element name="DataType"
                   type="DataType"
                   default="ALNUM"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="DateFormat"
                   type="ContentCode"
                   default="NONE"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Length"
                   type="xsd:positiveInteger"
                   default="1"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Position"
                   type="xsd:positiveInteger"
                   default="1"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Alignment"
                   type="Alignment"
                   default="LEFT"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="SignedData"
                   type="xsd:boolean"
                   default="0"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Ordinal"
                   type="xsd:positiveInteger"
                   default="1"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="Offset"
                   type="xsd:unsignedShort"
                   default="0"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="DecimalPlaces"
                   type="xsd:unsignedShort"
                   default="0"
                   minOccurs="0"
                   maxOccurs="1"/>
      <xsd:element name="ScaleFactor"
                   type="xsd:short"
                   default="0"
                   minOccurs="0"
                   maxOccurs="1"/>
    </xsd:sequence>
  </xsd:group>

  <xsd:group name="ColFormatInfo">
    <xsd:sequence>
        <xsd:group ref ="FormatInfo"
                   minOccurs="0"
                   maxOccurs="1"/>
        <xsd:element name="DefaultValue"
                     type="LongString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="Mask"
                     type="FormatMask"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="ExcelMask"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="NumberPrefix"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
        <xsd:element name="AggregationPrefix"
                     type="ShortString"
                     minOccurs="0"
                     maxOccurs="1"/>
    </xsd:sequence>
  </xsd:group>

  <xsd:simpleType name="LowPeriod">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="0|1"/>
    </xsd:restriction>
  </xsd:simpleType>

</xsd:schema>


```

|

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

