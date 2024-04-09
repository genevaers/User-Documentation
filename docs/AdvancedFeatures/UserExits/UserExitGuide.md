Document ID: HSBC-000

Document Owner: TM COE

***Version Number**: **1.0***

**Application Information Document**

**SAFR Environment Information and Call Parameters**

**S**calable **A**rchitecture for **F**inancial **R**eporting

Version

**Document Control Section**

**Authors**

  ----------------- -------------------------------------- ---------------
  **Name**          **Title/ Role**                        **Date**

  Girish Koppikar   SAFR Support Assembler Resource        Aug 18, 2012
  ----------------- -------------------------------------- ---------------

**Reviewers**

This document requires following Reviews. Reviewers list should include
key stakeholders from IBM and the client.

  ----------------- -------------------------------------- ---------------
  **Name**          **Title/ Role**                        **Date of
                                                           Review**

  Jeffrie Horner    SAFR Support Assembler Resource        Aug 20, 2012
  ----------------- -------------------------------------- ---------------

**Approvals**

This document requires following Approval

  ----------------- -------------------------------------- ---------------
  **Name**          **Title/ Role**                        **Date of
                                                           Approval**

                    GSS SME                                
  ----------------- -------------------------------------- ---------------

**Document Location**

TBD

**\
**

**\
**

[]{#_Toc337561347 .anchor}**Revision History**

  ----------- ---------------------------------------- -------------------
  **Version   **Description of Changes**               **Issue Date**
  \#**                                                 

  1.0t        First Draft                              

  1.1         Updated draft                            

                                                       

                                                       

                                                       

                                                       
  ----------- ---------------------------------------- -------------------

**Note:**

Issue Date: This date is the document delivery date after all review.

Version number: This number is document identification Number. Initial
number starts with 1.0. Version number is incremented by 1 whenever the
revision in the document is to be reviewed and concurred by the impacted
groups.

Last Update in title sheet is automatically generated date.

**Table of Contents**

[Revision History [4](#_Toc337561347)](#_Toc337561347)

[SAFR ENVIRONMENT INFORMATION (STANDARD EXIT PARAMETERS)
[6](#safr-environment-information-standard-exit-parameters)](#safr-environment-information-standard-exit-parameters)

[COBOL VERSION GVBX95PC
[6](#cobol-version-gvbx95pc)](#cobol-version-gvbx95pc)

[X95PARM1-ENV-DATA. [6](#x95parm1-env-data.)](#x95parm1-env-data.)

[X95PARM2-EVENT-FILE-DATA.
[7](#x95parm2-event-file-data.)](#x95parm2-event-file-data.)

[X95PARM3-STARTUP-DATA
[8](#x95parm3-startup-data)](#x95parm3-startup-data)

[X95PARM4-EVENT-REC [8](#x95parm4-event-rec)](#x95parm4-event-rec)

[X95PARM5-EXTRACT-REC [9](#x95parm5-extract-rec)](#x95parm5-extract-rec)

[X95PARM6-LOOKUP-KEY [9](#x95parm6-lookup-key)](#x95parm6-lookup-key)

[X95PARM7-WORK-AREA-ANCHOR
[10](#x95parm7-work-area-anchor)](#x95parm7-work-area-anchor)

[X95PARM8-RETURN-CODE
[10](#x95parm8-return-code)](#x95parm8-return-code)

[X95PARM9-RESULT-PTR [11](#x95parm9-result-ptr)](#x95parm9-result-ptr)

[X95PARMA-RESULT-BLOCK-SIZE
[11](#x95parma-result-block-size)](#x95parma-result-block-size)

[ASSEMBLER VERSION GVBX95PA
[12](#assembler-version-gvbx95pa)](#assembler-version-gvbx95pa)

# SAFR ENVIRONMENT INFORMATION (STANDARD EXIT PARAMETERS)

The SAFR View Extract processor (MR95) uses a standard Call Parameter
list when invoking USER exits. This structure is passed to USER exits by
MR95 and XRCK and EXITS have to pass data (where applicable) and return
codes back to MR95 via this structure.

Below are the COBOL and Assembler versions of the Structures (copybooks)
with explanations of the individual fields above the corresponding
field.

## COBOL VERSION GVBX95PC

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*#VB

\* SAFR \*

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*#VE

\* LICENSED MATERIALS - PROPERTY OF IBM #CB

\* \*

\* \"RESTRICTED MATERIALS OF IBM\" \*

\* \*

\* 6949-17P \*

\* \*

\* (C) COPYRIGHT IBM CORP. 2008 ALL RIGHTS RESERVED. \*

\* \*

\* US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION OR\*

\* DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE CONTRACT WITH \*

\* IBM CORP. \*

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*#CE

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

\* **GVBX95RL - EXTRACT READ/WRITE/LOOKUP PARAMETERS** \*

\* \*

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

\* CHANGE CONTROL LOG \*

\* EFF DT PROGRAMMER SR# CHANGE \*

\* ======== ========== ====== ==================================\*

\* 03/01/04 RANDY NESS SR INITIAL DEVELOPMENT \*

\* 27/03/09 QUINN LUI CQ3849 CHANGE LOOKUP KEY TO 256 \*

\* 10/14/10 D KUNKEL CQ8741 ADDED ERROR MESSAGE FIELDS \*

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

### X95PARM1-ENV-DATA.

The Value Of X95PARM1-ENV-DATA Is Passed From GVBMR95. During The Open
Phase, Read Exits Should Return The First Event Record.

**01 X95PARM1-ENV-DATA.**

05 X95PARM1-THREAD-NBR PIC S9(04) COMP.

05 X95PARM1-PHASE-CODE PIC X(02).

88 X95PARM1-OPEN-PHASE VALUE \'OP\'.

88 X95PARM1-READ-PHASE VALUE \'RD\'.

88 X95PARM1-CLOSE-PHASE VALUE \'CL\'.

05 X95PARM1-CURRENT-VIEW-ID PIC S9(09) COMP.

05 X95PARM1-ENV-VAR-TABLE-PTR POINTER.

05 X95PARM1-JOIN-STEP-COUNT PIC S9(09) COMP.

05 X95PARM1-JOIN-STACK-PTR POINTER.

05 X95PARM1-PROCESS-DATE-TIME.

10 X95PARM1-PROCESS-DATE PIC X(08).

10 X95PARM1-PROCESS-TIME PIC X(08).

05 X95PARM1-ERROR-REASON PIC S9(08) COMP.

05 X95PARM1-ERROR-BUFFER-PTR POINTER.

05 X95PARM1-ERROR-BUFFER-LEN PIC S9(08) COMP.

**END X95PARM1-ENV-DATA.**

### X95PARM2-EVENT-FILE-DATA.

01 X95PARM2-EVENT-FILE-DATA.

The Value Of X95PARM2-EVENT-DDNAME Is Passed From GVBMR95.

05 X95PARM2-EVENT-DDNAME PIC X(08).

The Value Of X95PARM2-EVENT-REC-NBR Is Passed From GVBMR95.

05 X95PARM2-EVENT-REC-NBR PIC S9(11) COMP-3.

Read Exits Set The Value Of X95PARM2-EVENT-REC-FMT In The Open Phase And
Pass It To GVBMR95. GVBMR95 Passes The Value To Lookup Exits And Write
Exits.

05 X95PARM2-EVENT-REC-FMT PIC X(01).

88 X95PARM2-FIXED-LENGTH VALUE \'F\'.

88 X95PARM2-VARIABLE-LENGTH VALUE \'V\'.

88 X95PARM2-DELIMITED VALUE \'D\'.

Read Exits Set The Value Of X95PARM2-REC-FLD-DELIM In The Open Phase And
Pass It To GVBMR95. GVBMR95 Passes The Value To Lookup Exits And Write
Exits.

05 X95PARM2-REC-FLD-DELIM PIC X(01).

Read Exits Set The Value Of X95PARM2-Event-Rec-Len On Every Execution
And Pass It To GVBMR95. GVBMR95 Passes The Value To Lookup Exits And
Write Exits.

05 X95PARM2-EVENT-REC-LEN PIC S9(09) COMP.

Read Exits Set The Value Of X95PARM2-Max-Rec-Len In The Open Phase And
Pass It To GVBMR95. GVBMR95 Passes The Value To Lookup Exits And Write
Exits.

05 X95PARM2-MAX-REC-LEN PIC S9(09) COMP.

Read Exits Set The Value Of X95PARM2-Max-Block-Size In The Open Phase
And Pass It To GVBMR95. GVBMR95 Passes The Value To Lookup Exits And
Write Exits.

05 X95PARM2-MAX-BLOCK-SIZE PIC S9(09) COMP.

**END X95PARM2-EVENT-FILE-DATA.**

### X95PARM3-STARTUP-DATA

The Layout Of X95PARM3-Startup-Data Is User-Defined. For Read Exits, The
Value Is Set In The Physical File Entity. For Lookup Exits, The Value Is
Set In Logical Record Entity. For Write Exits, The Value Is Set In The
View Properties Or On The Write Verb In The View Logic Text. This Value
Is Passed To The Exit Program From GVBMR95.

To Point X95PARM3-Startup-Data To Your Own Structure (For Example,
Ls-Startup-Parms), Execute The Statement:

Set Address Of Ls-Startup-Parms To Address Of X95PARM3-Startup-Data

The First Time This Program Is Given Control.

**01 X95PARM3-STARTUP-DATA PIC X(32).**

**END X95PARM3-STARTUP-DATA**

### X95PARM4-EVENT-REC

X95PARM4-Event-Rec Is Not Applicable To Read Exits. For Lookup And Write
Exits, This Parameter Points To The The Current Record From The Event
File.

To Point X95PARM4-Event-Rec To Your Own Structure (For Example,
Ls-Event-Rec), Execute The Statement:

Set Address Of Ls-Event-Rec To Address Of X95PARM4-Event-Rec

Whenever This Program Is Given Control.

**01 X95PARM4-EVENT-REC PIC X(01).**

**END X95PARM4-EVENT-REC**

### X95PARM5-EXTRACT-REC

X95PARM5-Extract-Rec Is Not Applicable To Read Exits. For Lookup And
Write Exits, This Parameter Points To The The Current Extract Record.
The Layout Of The Beginning Of Each Extract Record Is Fixed, But The
Layout Of The Rest Of The Record Is Determined By The View.

To Point X95PARM5-Var-Len-Area To Your Own Structure (For Example,
Ls-Extract-Data), Execute The Statement:

Set Address Of Ls-Extract-Rec To Address Of
X95PARM5-Extract-Var-Len-Area

Whenever This Program Is Given Control.

**01 X95PARM5-EXTRACT-REC.**

05 X95PARM5-EXTRACT-RDW.

10 X95PARM5-EXT-REC-LENGTH PIC S9(04) COMP.

10 FILLER PIC S9(04) COMP.

05 X95PARM5-EXTRACT-PREFIX.

10 X95PARM5-SORT-KEY-LENGTH PIC S9(04) COMP.

10 X95PARM5-TITLE-KEY-LENGTH PIC S9(04) COMP.

10 X95PARM5-DATA-AREA-LENGTH PIC S9(04) COMP.

10 X95PARM5-NBR-CT-COLS PIC S9(04) COMP.

10 X95PARM5-VIEW-ID PIC S9(09) COMP.

05 X95PARM5-EXTRACT-VAR-LEN-AREA PIC X(01).

**END X95PARM5-EXTRACT-REC**

### X95PARM6-LOOKUP-KEY

The Layout Of X95PARM6-Lookup-Key Is User-Defined. For Read And Write
Exits, This Parameter Is Not Applicable. For Lookup Exits, The Value Is
Set In The View Logic Text Or In Join Step Parameters. This Value Is
Passed To The Exit Program From GVBMR95.

To Point X95PARM6-Lookup-Key To Your Own Structure(For Example,
Ls-Lookup-Parms), Execute The Statement:

Set Address Of Ls-Lookup-Parms To Address Of X95PARM6-Lookup-Key

Whenever This Program Is Given Control.

**01 X95PARM6-LOOKUP-KEY PIC X(256).**

**END X95PARM6-LOOKUP-KEY**

### X95PARM7-WORK-AREA-ANCHOR

GVBMR95 Does Not Guarantee That Working Storage In A Cobol Program Will
Be Remain In The Same State On Subsequent Calls To The Program, So Any
Data Items Which Need To Be Retained Between Calls Should Be Placed In A
Dynamically Allocated Area.

During The Open Phase, The Safr Routine Gvbur05 Should Be Called To
Allocate A Work Area And X95PARM7-Work-Area-Anchor Should Be Set To
Point To It. For Example:

Move Length Of Ls-Work-Area To Ws-Work-Area-Length

Call GVBUR05 Using X95PARM7-Work-Area-Anchor Ws-Work-Area-Length

Set Address Of Ls-Work-Area To X95PARM7-Work-Area-Anchor

On Subsequent Calls, X95PARM7-Work-Area-Anchor Retains Its Value And May
Be Pointed To The Structure Again. For Example:

Set Address Of Ls-Work-Area To X95PARM7-Work-Area-Anchor

**01 X95PARM7-WORK-AREA-ANCHOR POINTER.**

**END X95PARM7-WORK-AREA-ANCHOR**

### X95PARM8-RETURN-CODE

X95PARM8-Return-Code Should Be Set In The Exit Program To The Numeric
Code To Be Returned To GVBMR95.

01 X95PARM8-RETURN-CODE PIC S9(09) COMP.

\* All Exits:

88 X95PARM8-SUCCESSFUL VALUE +0.

\* Lookup Exits Only:

88 X95PARM8-NOT-FOUND VALUE +4.

\* Write Exits Only:

88 X95PARM8-WRITE-AND-REPEAT-CALL VALUE +4.

\* READ EXITS ONLY:

88 X95PARM8-END-OF-FILE VALUE +8.

\* LOOKUP EXITS ONLY:

88 X95PARM8-SKIP-EVENT-REC VALUE +8.

\* WRITE EXITS ONLY:

88 X95PARM8-SKIP-EXTRACT-REC VALUE +8.

\* ALL EXITS:

88 X95PARM8-DISABLE-CURRENT-VIEW VALUE +12.

88 X95PARM8-ABORT-RUN VALUE +16.

**END X95PARM8-RETURN-CODE**

### X95PARM9-RESULT-PTR

X95PARM9-Result-Ptr Should Be Set In The Exit Program To The Address Of
The Structure To Be Returned To GVBMR95.

To Point X95PARM9-Result-Ptr To Your Own Structure(For Example,
Ws-Result), Execute The Statement:

Set X95PARM9-Result-Ptr To Address Of Ws-Result

Whenever This Program Is Given Control.

**01 X95PARM9-RESULT-PTR POINTER.**

Lookup Exits Only: Though Optional, It Is A Good Exit Programming
Practice To Move -1 To X95PARM9-Result-Ptr-Numeric When The Lookup
Result Is \"Not Found\". This Guarantees That The Pointer Is No Longer
Pointing To Valid Data.

**01 X95PARM9-RESULT-PTR-NUMERIC REDEFINES**

X95PARM9-RESULT-PTR PIC S9(09) COMP.

**END X95PARM9-RESULT-PTR**

### X95PARMA-RESULT-BLOCK-SIZE

Read Exits Only: Read Exits Should Set The Value Of
X95PARMa-Result-Block-Size To The Length Of The Block Pointed To By
X95PARM9-Result-Ptr.

**01 X95PARMA-RESULT-BLOCK-SIZE PIC S9(09) COMP.**

**END X95PARMA-RESULT-BLOCK-SIZE**

## ASSEMBLER VERSION GVBX95PA

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*#VB

\* SAFR \*

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*#VE

\* LICENSED MATERIALS - PROPERTY OF IBM #CB

\* \*

\* \"RESTRICTED MATERIALS OF IBM\" \*

\* \*

\* 6949-17P \*

\* \*

\* (C) COPYRIGHT IBM CORP. 2008 ALL RIGHTS RESERVED. \*

\* \*

\* US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION OR \*

\* DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE CONTRACT WITH \*

\* IBM CORP. \*

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*#CE

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Safr Provided Parameter List \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENPARM DSECT SAFR PARAMETER LIST

\*

GPENVA DS AL04 ENVIRONMENT INFO ADDR

GPFILEA DS AL04 FILE INFO ADDR

GPSTARTA DS AL04 STARTUP DATA ADDR

GPEVENTA DS AL04 EVENT RECORD ADDR (N/A)

GPEXTRA DS AL04 EXTRACT RECORD ADDR (N/A)

GPKEYA DS AL04 LOOK-UP KEY ADDR (N/A)

GPWORKA DS AL04 WORK AREA POINTER ADDR

\*

GPRTNCA DS AL04 RETURN CODE ADDR

GPBLOCKA DS AL04 OUTPUT BLOCK PTR ADDR

GPBLKSIZ DS AL04 OUTPUT BLOCK SIZE ADDR

SPACE 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Environment Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENENV DSECT ENVIRONMENT INFORMATION

\*

GPTHRDNO DS HL02 CURRENT THREAD NUMBER

GPPHASE DS CL02 CURRENT EXECUTION PHASE

GPVIEW# DS FL04 CURRENT EXECUTING VIEW

GPENVVA DS AL04 ENV VARIABLE TABLE (\"MR95ENVV\") ADDR

GPJSTPCT DS FL04 JOIN STEP COUNT

GPJSTKA DS AL04 JOIN STACK ADDRESS

GP_PROCESS_DATE_TIME DS 0XL16 Process Date and time

GP_PROCESS_DATE DS XL8 Date

GP_PROCESS_TIME DS XL8 Time

GP_ERROR_REASON DS FL04 Error reason code

GP_ERROR_BUFFER_PTR DS AL04 -\> error text

GP_ERROR_BUFFER_LEN DS FL04 To exit - set to length of buffer

\* from exit - set to text length

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* File Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENFILE DSECT EVENT FILE INFORMATION

\*

GPDDNAME DS CL08 EVENT FILE DDNAME

GPRECCNT DS PL06 EVENT FILE RECORD COUNT

GPRECFMT DS CL01 RECORD FORMAT (F,V,D)

GPRECDEL DS CL01 RECORD DELIMITER

GPRECLEN DS FL04 RECORD LEN CURRENT

GPRECMAX DS FL04 RECORD LEN MAXIMUM

GPBLKMAX DS FL04 BLOCK SIZE MAXIMUM

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Startup Data Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENSTART DSECT

\*

GP_STARTUP_DATA DS CL32

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Event Record Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENEVENT DSECT

\*

GP_EVENT_REC DS C

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Extract Record Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENEXTR DSECT

\*

GP_EXTRACT_REC DS 0CL17

GP_EXTRACT_RDW DS 0XL4

GP_EXT_REC_LENGTH DS XL2

DS XL2

GP_EXTRACT_PREFIX DS 0CL12

GP_SORT_KEY_LENGTH DS XL2

GP_TITLE_KEY_LENGTH DS XL2

GP_DATA_AREA_LENGTH DS XL2

GP_NBR_CT_COLS DS XL2

GP_VIEW_ID DS XL4

GP_EXTRACT_VAR_LEN_AREA DS C

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Look-Up Key Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENKEY DSECT

\*

GP_LOOKUP_KEY DS CL128

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Work Area Ptr Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENWORK DSECT

\*

GP_WORK_AREA_ANCHOR DS A

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Return Code Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENRTNC DSECT

\*

GP_RETURN_CODE DS A

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Output Block Ptr Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENBLOCK DSECT

\*

GP_RESULT_PTR DS A

\*

Space 3

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\* \*

\* Output Block Size Information \*

\* \*

\* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \* \*
\* \* \* \* \* \* \* \* \* \* \* \*

\*

GENBLKSZ DSECT

\*

GP_RESULT_BLK_SIZE DS F

\*
