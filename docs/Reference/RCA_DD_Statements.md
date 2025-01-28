# Run-Control App (RCA) DD Statements  
## (when GENERATE_RC_FILES=Y)
  
|Type|DD Name|Title|When Required|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|RCAPARM|RCA Parameter File|Always|PS|FB|80|
||DBFLDRS|Database Folder List|When INPUT_TYPE=DB2 or POSTGRES and a DBVIEWS DD statement does not exist|PS|FB|80|
||DBVIEWS|Database View List|When INPUT_TYPE=DB2 or POSTGRES and a DBFLDRS DD statement does not exist|PS|FB|80|
||RUNVIEWS|Run View List|Optional|PS|FB|80|
||WBXMLI *(1)*|Workbench XML Input Library|When INPUT_TYPE=WBXML|PO|VB|8192|
||VDPXMLI *(2)*|VDP XML Input Library (deprecated format) |When INPUT_TYPE=VDPXML|PO|VB|8192|
||VDPOLD|VDP File|When VDP_REPORT=Y and COMPARE=Y|PS|VB|8192|
||XLTOLD|Extract-Phase Logic Table|When XLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
||JLTOLD|Reference-Phase Logic Table|When JLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
|Output|VDPNEW|VDP Output File|Always|PS|VB|8192|
||XLTNEW|Extract-Phase Logic Table|Always|PS|VB|8192|
||JLTNEW|Reference-Phase Logic Table|Always|PS|VB|8192|
||VDPRPT|VDP Report File|When VDP_REPORT=Y|PS|VB|8192|
||XLTRPT|Extract-Phase Logic Table Report|When XLT_REPORT=Y|PS|VB|8192|
||JLTRPT|Reference-Phase Logic Table Report|When JLT_REPORT=Y|PS|VB|8192|
||VDPXML *(3)*|VDP XML output (deprecated format) |When GENERATE_VDPXML=Y|PS|VB|8192|
||RCARPT|RCA Control Report|Always|PS|VB|164|
||RCALOG|RCA Log File|Always|PS|VB|164|

Notes:  
*(1)* RCA processes all members in the WBXMLI PDS.  
*(2)* RCA processes all members in the VDPXMLI PDS.  
*(3)* it is recommended that the VDLXML DD statement defines a member of a PDS. For example: 
```
//VDPXML DD DSN=VDPXML(MEMBER1),SPACE=(TRK,(100,5,5)),
//          DISP=(NEW,CATLG),
//          DCB=(DSORG=PS,RECFM=VB,LRECL=8192,BLKSIZE=0),---
```

## (when GENERATE_RC_FILES=N)
  
|Type|DD Name|Title|When Required|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|RCAPARM|RCA Parameter File|Always|PS|FB|80|
||VDPNEW|VDP File|When VDP_REPORT=Y|PS|VB|8192|
||XLTNEW|Extract-Phase Logic Table|When XLT_REPORT=Y|PS|VB|8192|
||JLTNEW|Reference-Phase Logic Table|When JLT_REPORT=Y|PS|VB|8192|
||VDPOLD|VDP File|When VDP_REPORT=Y and COMPARE=Y|PS|VB|8192|
||XLTOLD|Extract-Phase Logic Table|When XLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
||JLTOLD|Reference-Phase Logic Table|When JLT_REPORT=Y and COMPARE=Y|PS|VB|8192|
|Output|VDPRPT|VDP Report File|When VDP_REPORT=Y|PS|VB|8192|
||XLTRPT|Extract-Phase Logic Table Report|When XLT_REPORT=Y|PS|VB|8192|
||JLTRPT|Reference-Phase Logic Table Report|When JLT_REPORT=Y|PS|VB|8192|
||RCARPT|RCA Control Report|Always|PS|VB|164|
||RCALOG|RCA Log File|Always|PS|VB|164|
