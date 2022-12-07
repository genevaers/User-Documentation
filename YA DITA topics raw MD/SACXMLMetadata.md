# XML structure for metadata overview {#SACXMLMetadata .concept}

## 01 Summary of this topic { .section}

The sections in this topic are as follows:

-   [02 Knowledge you need first](SACXMLMetadata.md#02)
-   [10 Relationships between metadata](SACXMLMetadata.md#10)
-   [20 Records in XML files](SACXMLMetadata.md#20)
-   [30 Server record in XML file](SACXMLMetadata.md#30)
-   [40 XML records for an exported physical file](SACXMLMetadata.md#40)
-   [45 XML records for an exported logical file](SACXMLMetadata.md#45)
-   [50 XML records for an exported logical record](SACXMLMetadata.md#50)
-   [55 XML records for an exported lookup path](SACXMLMetadata.md#55)
-   [60 XML records for an exported view](SACXMLMetadata.md#60)
-   [80 How to create and use an XML file for a metadata item](SACXMLMetadata.md#80)
-   [100 Need more on this page?](SACXMLMetadata.md#100)

## 02 Knowledge you need first {#02 .section}

This topic assumes you are familiar with these topics:

-   "**Export metadata overview**",
-   "**Import metadata overview**".

Links to these overviews are under **Related concepts** below.

## 10 Relationships between metadata {#10 .section}

This topic shows the records inside an XML file containing exported metadata.

The "main" metadata types in an XML file must be one of:

-   Physical file,
-   Logical file,
-   Logical record,
-   Lookup path,
-   View.

The table below shows the possible "associated" items:

|"Main" item|Possible "associated" items|
|-----------|---------------------------|
|Physical file|User-exit routine|
|Logical file|Physical file, user-exit routine|
|Logical record|Logical file, physical file, user-exit routine|
|Lookup path|Logical record, logical file, physical file, user-exit routine|
|View|Control record, lookup path, logical record, logical file, physical file, user-exit routine|

## 20 Records in XML files {#20 .section}

The possible record names in an XML file are shown in the table below.

|Main item|Possible record names in XML file|
|---------|---------------------------------|
|Physical file|PhysicalFile, Procedure, Server|
|Logical file|LogicalFile, File-Partition, PhysicalFile, Procedure, Server|
|Logical record|LogicalRecord, LRField, LR-Field-Attributes, LR-Index, LR-IndexFields, LR-File, LogicalFile, File-Partition, PhysicalFile, Procedure, Server|
|Lookup path|Join, Join-Source, Join-Target, LogicalRecord, LRField, LR-Field-Attributes, LR-Index, LR-IndexFields, LR-File, LogicalFile, File-Partition, PhysicalFile, Procedure, Server|
|View|View, View-Columns, View-Sources, View-SourceFields, View-SortKeys, View-LogicText, Join, Join-Source, Join-Target, LogicalRecord, LRField, LR-Field-Attributes, LR-Index, LR-IndexFields, LR-File, LogicalFile, File-Partition, PhysicalFile, Procedure, Server, ControlRecord|

Notice that a **control record** metadata item cannot be a "main" item for export, but a control record can be an "associated" item for export of a view. To copy a control record for one environment to another, you must copy a view that contains that control record.

## 30 Server record in XML file {#30 .section}

The **Server** record is **never** imported. The Server record is created during the export process that creates the XML file.

## 40 XML records for an exported physical file {#40 .section}

The table below shows the record names possible in an XML file for an exported physical file.

|Record name|Metadata items involved|Notes|
|-----------|-----------------------|-----|
|PhysicalFile|Physical file|The physical file metadata item.|
|Procedure|User-exit routine|A read user-exit routine associated with the physical file.|
|Server|Environment|See section [30 Server record in XML file](SACXMLMetadata.md#30)|

The XML file contains one **PhysicalFile** record.

The XML file contains zero or one **Procedure** record. A **Procedure** record is present when a read user-exit routine is associated with the physical file.

The XML file contains one **Server** record.

## 45 XML records for an exported logical file {#45 .section}

The table below shows the record names possible in an XML file for an exported logical file.

|Record name|Metadata items involved|Notes|
|-----------|-----------------------|-----|
|LogicalFile|Logical file|The logical file metadata item.|
|File-Partition|Logical file, physical file|A record associating a logical file and a physical file.|
|PhysicalFile|Physical file|A physical file associated with the logical file.|
|Procedure|User-exit routine|A read user-exit routine associated with the physical file.|
|Server|Environment|See section [30 Server record in XML file](SACXMLMetadata.md#30)|

The XML file contains one **LogicalFile** record.

The XML file contains one or many **File-Partition** records, and the same number of **PhysicalFile** records.

The XML file contains zero or one or many **Procedure** records. A **Procedure** record is present when a read user-exit routine is associated with a physical file.

The XML file contains one **Server** record.

## 50 XML records for an exported logical record {#50 .section}

The table below shows the record names possible in an XML file for an exported logical record.

|Record name|Metadata items involved|Notes|
|-----------|-----------------------|-----|
|LogicalRecord|Logical record|The logical record metadata item.|
|LRField|Logical record|A field in a logical record \(some data\).|
|LR-Field-Attributes|Logical record|A field in a logical record \(more data\).|
|LR-Index|Logical record|A field in the logical record sort key \(some data\).|
|LR-IndexFields|Logical record|A field in the logical record sort key \(more data\).|
|LR-File|Logical record, logical file|A record associating a logical record and a logical file.|
|LogicalFile|Logical file|A logical file associated with the logical record.|
|File-Partition|Logical file, physical file|A record associating a logical file and a physical file.|
|PhysicalFile|Physical file|A physical file associated with the logical file.|
|Procedure|User-exit routine|A read user-exit routine associated with the physical file.|
|Server|Environment|See section [30 Server record in XML file](SACXMLMetadata.md#30)|

The XML file contains one **LogicalRecord** record.

The XML file contains one or many **LRField** records, and the same number of **LR-Field-Attributes** records.

The XML file contains zero or one or many **LR-Index** records, and the same number of **LR-IndexFields** records.

The XML file contains one or many **LR-File** records.

The XML file contains one or many **LogicalFile** records.

The XML file contains one or many **File-Partition** records, and the same number of **PhysicalFile** records.

The XML file contains zero or one or many **Procedure** records. A **Procedure** record is present when a read user-exit routine is associated with a physical file.

The XML file contains one **Server** record.

## 55 XML records for an exported lookup path {#55 .section}

The table below shows the record names possible in an XML file for an exported lookup path.

|Record name|Metadata items involved|Notes|
|-----------|-----------------------|-----|
|Join|Lookup path|The lookup path metadata item.|
|Join-Source|Lookup path, logical record|A source logical record in the lookup path.|
|Join-Target|Lookup path, logical record|A target logical record in the lookup path.|
|LogicalRecord|Logical record|A logical record used in the lookup path.|
|LRField|Logical record|A field in a logical record \(some data\).|
|LR-Field-Attributes|Logical record|A field in a logical record \(more data\).|
|LR-Index|Logical record|A field in the logical record sort key \(some data\).|
|LR-IndexFields|Logical record|A field in the logical record sort key \(more data\).|
|LR-File|Logical record, logical file|A record associating a logical record and a logical file.|
|LogicalFile|Logical file|A logical file associated with the logical record.|
|File-Partition|Logical file, physical file|A record associating a logical file and a physical file.|
|PhysicalFile|Physical file|A physical file associated with the logical file.|
|Procedure|User-exit routine|A read user-exit routine associated with the physical file.|
|Server|Environment|See section [30 Server record in XML file](SACXMLMetadata.md#30)|

The XML file contains one **Join** record.

The XML file contains at least one **Join-Source** record.

The XML file contains at least one **Join-Target** record.

The XML file contains at least two **LogicalRecord** records.

The XML file contains one or many **LRField** records, and the same number of **LR-Field-Attributes** records.

The XML file contains zero or one or many **LR-Index** records, and the same number of **LR-IndexFields** records.

The XML file contains one or many **LR-File** records.

The XML file contains one or many **LogicalFile** records.

The XML file contains one or many **File-Partition** records, and the same number of **PhysicalFile** records.

The XML file contains zero or one or many **Procedure** records. A **Procedure** record is present when a read user-exit routine is associated with a physical file.

The XML file contains one **Server** record.

## 60 XML records for an exported view {#60 .section}

The table below shows the record names possible in an XML file for an exported view.

|Record name|Metadata items involved|Notes|
|-----------|-----------------------|-----|
|View|View|The view metadata item.|
|View-Columns|View|A column defined in the view editor.|
|View-Sources|View, logical file|A source logical file used in the view.|
|View-SourceFields|View|A field in the logical record of a source logical file used in the view.|
|View-SortKeys|View|A sort key field in the view editor.|
|View-LogicText|View|Logic text defined in the view.|
|Join|Lookup path|A lookup path used in the view.|
|Join-Source|Lookup path, logical record|A source logical record in the lookup path.|
|Join-Target|Lookup path, logical record|A target logical record in the lookup path.|
|LogicalRecord|Logical record|A logical record used in the lookup path.|
|LRField|Logical record|A field in a logical record \(some data\).|
|LR-Field-Attributes|Logical record|A field in a logical record \(more data\).|
|LR-Index|Logical record|A field in the logical record sort key \(some data\).|
|LR-IndexFields|Logical record|A field in the logical record sort key \(more data\).|
|LR-File|Logical record, logical file|A record associating a logical record and a logical file.|
|LogicalFile|Logical file|A logical file associated with the logical record.|
|File-Partition|Logical file, physical file|A record associating a logical file and a physical file.|
|PhysicalFile|Physical file|A physical file associated with the logical file.|
|Procedure|User-exit routine|A read user-exit routine associated with a physical file, or associated with the view.|
|Server|Environment|See section [30 Server record in XML file](SACXMLMetadata.md#30)|
|ControlRecord|Control record|The control record associated with the view.|

The XML file contains one **View** record.

The XML file contains zero or one or many **View-Columns** records.

The XML file contains zero or one or many **View-Sources** records.

The XML file contains zero or one or many **View-SourceFields** records.

The XML file contains zero or one or many **View-SortKeys** records.

The XML file contains zero or one or many **View-LogicText** records.

The XML file contains zero or one or many **Join** records.

The XML file contains zero or one or many **Join-Source** records.

The XML file contains zero or one or many **Join-Target** records.

The XML file contains zero or one or many **LogicalRecord** record.

The XML file contains zero or one or many **LRField** records, and the same number of **LR-Field-Attributes** records.

The XML file contains zero or one or many **LR-Index** records, and the same number of **LR-IndexFields** records.

The XML file contains zero or one or many **LR-File** records.

The XML file contains zero or one or many **LogicalFile** records.

The XML file contains zero or one or many **File-Partition** records, and the same number of **PhysicalFile** records.

The XML file contains zero or one or many **Procedure** records. A **Procedure** record is present when a read user-exit routine is associated with a physical file. There can also be user-exit routines for other parts of a view.

The XML file contains zero or one **Server** record.

The XML file contains one **ControlRecord** record.

## 80 How to create and use an XML file for a metadata item {#80 .section}

For more, see these topics:

-   "**Exporting metadata**",
-   "**Importing metadata**",

Links to these tasks are under **Related tasks** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

