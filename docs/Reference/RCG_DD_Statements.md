# Run Control Generator (RCG) DD Statements  
  
|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|RCGPARM|RCG Parameter File|Yes|PS|FB|80|
||DBFLDRS|Database Folder List|If INPUT_TYPE=DB2 and a DBVIEWS DD statement does not exist|PS|FB|80|
||DBVIEWS|Database View List|If INPUT_TYPE=DB2 and a DBFLDRS DD statement does not exist|PS|FB|80|
||RUNVIEWS|Run View List|No|PS|FB|80|
||WBXMLI|Workbench XML Input Library|If INPUT_TYPE=WBXML|PO|VB|8192|
||VDPXMLI|VDP XML Input Library|If INPUT_TYPE=VDPXML|PO|VB|8192|
||VDPXSD|VDP XML Schema Definition|If INPUT_TYPE=VDPXML|PS|VB|259|
||DSNAOINI|DB2 ODBC Initialization File|If INPUT_TYPE=DB2|PS|FB|80|
|Output|VDPNEW|VDP Output File||PS|VB|8192|
||JLTNEW|Reference-Phase Logic Table||PS|VB|8192|
||XLTNEW|Extract-Phase Logic Table||PS|VB|8192|
||RCGRPT|RCG Control Report|Yes|PS|VB|164|
||RCGLOG|RCG Log File|Yes|PS|VB|164|
