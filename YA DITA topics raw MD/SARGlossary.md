# Glossary {#SARGlossary .reference}

|Term|Meaning|
|----|-------|
| | |
|Administrator|A user of the SAFR Workbench who normally prepares metadata \(see this term\) so that general users \(see this term\) can do their job. There are two types: a system administrator and an environment administrator \(see these terms\).|
| | |
|CEC|**Central Electronic Complex** in a mainframe. This is an alternative way of describing a CPC \(see this term\).|
| | |
|Control record|A record that describes financial reporting parameters, such as the first fiscal month. Every environment in the SAFR Workbench requires at least one control record.|
| | |
|Common Key Buffer|A technique to speed SAFR when two or more logical files \(see this term\) share the same primary key or part of a primary key.|
| | |
|CP|**Central Processor** in a mainframe. A CP is a computer chip that performs instructions. Also called a CPU \(see this term\). A CP is an example of a PU \(see this term\). Modern mainframes normally contain many CPs which are part of a CPC \(see this term\).|
| | |
|CPC|**Central Processor Complex** in a mainframe. A CPC is a collection of hardware that includes many PUs, main storage, timers and channels \(see these terms\). All mainframe processing occurs somewhere in the CPC. In rare cases, a CPC can also be called a CEC \(see this term\).|
| | |
|CPU|**Central Processing Unit** in a mainframe. A CPU is a computer chip that performs instructions. Also called a CP \(see this term\). A CPU is an example of a PU \(see this term\). Modern mainframes normally contain many CPUs which are part of a CPC \(see this term\).|
| | |
|CSV|**Comma-Separated Values** or **Character-Separated Values**. A CSV file is a text file of a list of values. Each line of the text file is one item in the list. Each item consists of field values. Fields are separated by a comma \(for CSV files from the SAFR Workbench\).|
| | |
|DB2|**DataBase 2**. DB2 is relational database software developed by IBM. DB2 and runs on many operating systems, including zOS. The word "relational" means data is stored in tables where each row is a record and each column is a field in that record. DB2 data can be accessed using SQL \(see this term\). DB2 is implemented using VSAM files \(see this term\). See also terms "DB2 Key Range Partitions" and "DB2 via VSAM Access".|
| | |
|DB2 Key Range Partitions|A technique for speeding SAFR mainframe processing where different key ranges are stored in different files. See also term DB2.|
| | |
|DB2 via VSAM Access|A technique for speeding SAFR mainframe processing for sequential access to a table. This technique accesses the VSAM files \(see this term\) that underly all DB2 tables. See also term DB2.|
| | |
|DSNAOINI|DB2 Subsystem Name Application ODBC INItialization. This is an input config file for programs that access DB2 using ODBC \(see this term\).|
| | |
|Environment|A logical collection of data within the SAFR Workbench.|
| | |
|Environment Administrator|An environment administrator is a general user that is a member of a group that has administrator access to an environment. This means that the environment administrator has access to all the metadata \(see this term\) in that environment, with the exceptions that the environment administrator cannot create, modify or delete users and groups, and has limited rights to group permissions and the environment records.|
| | |
|ESDS|**Entry Sequenced Data Set**. In an ESDS file, records are accessed in the order they were written. An ESDS file is an example of a VSAM file \(see this term\).|
| | |
|Extract Column Assignment|Optional logic text added to a view that describes columns in a view and possibly write operations \(that write an entire record to an extract file\) to be processed during the Extract phase.|
| | |
|Extract phase|The fourth phase of the SAFR Performance Engine. This phase reads each input logical file only once. Records are selected during the read. A record can be written to one or more extract files. New columns can be created in reports or intended output files.|
| | |
|Extract Record Filter|Optional logic text added to a view to specify what input records are to be selected or skipped during extract phase processing.|
| | |
|Format Column Calculation|Optional logic text added to a view that defines columns based on numeric calculations to be output during format phase processing.|
| | |
|Format phase|The fifth \(and optional\) phase of the SAFR Performance Engine. This phase produces the output for the views selected for this run of the Performance Engine. Column calculations are possible for numeric data. It is possible to select on certain records for output.|
| | |
|Format Record Filter|Optional text added to a view that describes what output records to select or skip for a view.|
| | |
|General Users|A user of the SAFR Workbench that produces the main results from SAFR. A general user receives information from a system administrator about login to SAFR and the metadata \(see this term\) available in the Workbench. A general user creates and activates both lookup paths and views. The views produce the results from SAFR when run in the SAFR Performance Engine.|
| | |
|Global field|A field that can be used in logical records or views in an environment in the SAFR Workbench.|
| | |
|Group|A collection of users in the SAFR Workbench.|
| | |
|IFL|**Integrated Facility for Linux**. This is a mainframe computer chip that performs instructions. An IFL is an example of a PU \(see this term\). An IFL is a cheaper way to run Linux compared to running Linux on a CP \(see this term\).|
| | |
|Java|Java is an object-oriented programming language. Java is designed so that Java programs can run on almost any computer with minimal adjustments to that system.|
| | |
|KSDS|**Key Sequenced Data Set**. In a KSDS file, records can be accessed directly by using a unique key for each record. A KSDS file also support sequential access. A KSDS file consists of two parts: a data part and the index part. Together they are called a cluster. A KSDS file is an example of a VSAM file \(see this term\).|
| | |
|LDS|**Linear Data Set**. An LDS is a sequence of pages in virtual memory and has no record structure. An LDS allows mapping memory to a segment of a file or similar resource. An LDS file is an example of a VSAM file \(see this term\).|
| | |
|Logic phase|The second phase of the SAFR Performance Engine. This phase translates the selected views into logical tables for this run of the Performance Engine.|
| | |
|Logic text|Optional conditions specified in a view that change the results of the view. The types of logic text in order of processing are \(1\) Extract Record Filter, \(2\) Extract Column Assignment, \(3\) Format Column Assignment, \(4\) Format Record Filter. See these terms for more. Logic text is not to be confused with a logic table \(see this term\).|
| | |
|Logical file|A collection of physical files with the same record layout \(which means the same logical record\).|
| | |
|Logical record|There are two meanings. Firstly, a logical record is a record format for one or more logical files. Secondly, a logical record is a format of columns in a report in one or more views in the SAFR Workbench.|
| | |
|Lookup path|A method to use one logical file to lookup a record in another logical file.|
| | |
|Metadata|The items defined inside the SAFR Workbench that enable SAFR to produce results. See the terms below which are all examples:-   Control Records
-   Environments
-   General Users and Administrators
-   Global Fields
-   Groups
-   Logical Files
-   Logical Records
-   Lookup Paths
-   Physical Files
-   User-Exit Routines
-   View Folders
-   Views

|
| | |
|ODBC|Open Database Connectivity. This is open source middleware software written in C that allows an application program to access a database regardless of the operating system hosting the database and the specific database software involved.|
| | |
|Parallelism|A collection of techniques to speed SAFR mainframe processing by allowing SAFR to run multiple processes in parallel. The techniques are Physical File Partitions, DB2 Key Range Partitions, DB2 via VSAM Access, and Pipes. See these terms for more.|
| | |
|Performance Engine|See SAFR Performance Engine.|
| | |
|Physical files|A disk file or tape file or area of memory on your mainframe computers. When a physical file is a disk file or tape file, this is normally referred to as a dataset on IBM mainframes. A physical file can also be a pipe or a token \(see these terms\).|
| | |
|Physical File Partitions|A technique to speed SAFR mainframe processing where one logical file is split into many physical files. Each physical file can be processed in parallel, giving a speed advantage.|
| | |
|Pipes|Piping is a technique to speed SAFR mainframe processing. A pipe is a virtual file passed in memory between two or more views.|
| | |
|PU|**Processing Unit** in a mainframe. A PU is a computer chip that performs instructions. Examples of a PU are a CP, IFL, SAP, zAAP, or zIIP \(see these terms\).|
| | |
|Reference phase|The third phase of the SAFR Performance Engine. This phase consolidates the logic tables for this run of the Performance Engine.|
| | |
|RRDS|**Relative Record Data Set**. In an RRDS file, records do not have a unique key. The records have position in the sequence of records called the Relative Record Number \(RRN\). If a program knows the correct RRN, this allows direct access to that record. An RRDS also support sequential access. An RRDS file consists of two parts: a data part and the index part. Together they are called a cluster. An RRDS file is an example of a VSAM file \(see this term\).|
| | |
|RRN|**Relative Record Number**. This is part of an RRDS \(see this term\).|
| | |
|SAFR|**Scalable Architecture for Financial Reporting**. This software consists of two parts: the SAFR Workbench and the SAFR Performance Engine \(see these terms\).|
| | |
|SAFR Performance Engine|The part of SAFR that produces the results on your mainframe computers. The Performance Engine consists of batch processes run using JCL. The Performance Engine can be run when your SAFR Workbench data is complete.|
| | |
|SAFR phase|A part of the processing done in the SAFR Performance Engine. The phases, in the order they are processed, are \(1\) Select phase, \(2\) Logic phase, \(3\) Reference phase, \(4\) Extract phase, \(5\) Format phase. See these terms for more.|
| | |
|SAFR Workbench|The part of SAFR that runs on a PC. The SAFR Workbench configures data called metadata that tells the SAFR Performance Engine what needs to be produced.|
| | |
|SAP|There are three meanings. -   **System Assistance Processor**. This is a type of PU \(see this term\) in a mainframe. Every mainframe has at least one SAP. SAPs control the Input / Output \(I/O\) processing. The operating systems and applications cannot detect SAPs, and SAPs do not use any "normal" memory.
-   A commercial software product with full name **Systems, Applications and Products Enterprise Resource Planning** \(SAP ERP\).
-   The global company started in Germany that makes SAP ERP. The company is called **SAP AG**.

|
| | |
|Select phase|The first phase of the SAFR Performance Engine. This phase selects the views for this run of the Performance Engine.|
| | |
|SQL|**Structured Query Language** or **System Query Language**. SQL is a programming language for accessing a relational database, for example: DB2 \(see this term\).|
| | |
|System Administrator|A system administrator has access to all parts of the SAFR Workbench, including all users, groups, environments \(see this term\) and all metadata \(see this term\).|
| | |
|Symbol|A symbol used in a step in a lookup path is a variable part of a primary key to a logical record. Logic text can change the value of a symbol in a call to a lookup path.|
| | |
|Token|A named memory area in your mainframe used for communication between two or more views.|
| | |
|Users|Users of the SAFR Workbench are either a system administrator, an environment administrator or a general user \(see these terms\). Users of the Performance Engine are those mainframe users in your company that have access to run the JCL required.|
| | |
|User-exit routine|A program written by your company \(or by IBM\) that performs some unique processing tasks for your company. There are four types:

-   **Read** - for special processing during read of logical files
-   **Lookup** - for special processing during a lookup path.
-   **Write** - for special processing during a write to a file.
-   **Format** - for special processing during output of reports.

|
| | |
|Utility|There are two meanings in SAFR. Firstly, a utility is a optional batch program that can be run as part of the Performance Engine. For example, UT90 is a utility to print a Join Logic Table report or an Extract Logic Table report. Secondly, a utility is a function inside the SAFR Workbench. Examples of these utility functions are Batch Activate Lookup Paths, Batch Activate Views.|
| | |
|VDP|**View Definition Parameters**. The VDP is a mainframe dataset that contains the majority of the information needed to run views in the SAFR Performance Engine \(see this term\). The VDP is created and used in the SAFR Performance Engine.|
| | |
|View|There are two meanings. Firstly, a view is a screen area in the SAFR Workbench - for example the Navigator or the Metadata List. Secondly, the more common use of the term when discussing SAFR, a view is how you describe the results you require from SAFR. A view is defined in the SAFR Workbench, and the view data tells the SAFR Performance Engine what needs to be performed to create output such as flat files and reports.|
| | |
|VSAM|**Virtual Storage Access Method**. VSAM is a method to access disk storage in a mainframe. The advantages of VSAM files are that records can be of fixed or variable length, and high speed access to data. DB2 \(see this term\) is implemented using VSAM files. There are four types of VSAM file:-   **KSDS** - Key Sequenced Data Set \(see this term\). A KSDS provides direct access to a record using a unique key for that record.
-   **RRDS** - Relative Record Data Set \(see this term\). An RRDS has no key but supports the records being in a particular order.
-   **ESDS** - Entry Sequenced Data Set \(see this term\). An ESDS provides records sequentially only.
-   **LDS** - Linear Data Set \(see this term\). An LDS stores pages instead of records.

|
| | |
|View folder|A folder \(directory\) that stores views in the SAFR Workbench. Each view describes results you require from SAFR.|
| | |
|WE|**Workbench Eclipse.** This is another term for the SAFR Workbench \(see this term\). **Eclipse** refers to a programming platform that was invented by IBM and is now free and open source software. WE is the most recent SAFR Workbench, replacing the older WW \(see this term\).|
| | |
|Workbench|See SAFR Workbench.|
| | |
|WW|**Windows Workbench**. This is older SAFR Workbench, now replaced by WE \(see this term\).|
| | |
|XML|**Extensible Markup Language**. XML is an open standard for encoding documents, especially for software and for use on the internet. XML files are text data files. SAFR uses XML files in two places: to export and import metadata in the SAFR Workbench, and as a method of storing a VDP file \(see this term\). -   The SAFR Workbench - exporting and importing **metadata** \(see this term\). An XML file can be used, for example, as a backup.
-   The SAFR Performance Engine - a method to store a **VDP file** \(see this term\).

|
| | |
|zAAP|**System z Application Assist Processor**. This is a type of PU \(see this term\) in a mainframe. A zIIP is designed to relieve one or more CPs \(see this term\) of Java or XML processing loads \(see these terms\).|
| | |
|zIIP|**System z Integrated Information Processor**. This is a type of PU \(see this term\) in a mainframe. A zIIP is designed to relieve one or more CPs \(see this term\) of DB2 processing loads \(see this term\).|

