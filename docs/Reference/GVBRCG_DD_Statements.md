# GVBRCG DD Statements  
  
|Type|DD Name|Title|Required?|DSORG|RECFM|LRECL|  
|:-|:-|:-|:-|:-|:-|-:|
|Input|GRCGPARM|GVBRCG Parameter File|Yes|PS|FB|80|
||DBFLDRS|Database Folder List|If INPUT_TYPE=DB2 and a DBVIEWS DD statement does not exist|PS|FB|80|
||DBVIEWS|Database View List|If INPUT_TYPE=DB2 and a DBFLDRS DD statement does not exist|PS|FB|80|
||RUNVIEWS|Run View List|No|PS|FB|80|
||WBXMLI|Workbench XML Input Library|If INPUT_TYPE=WBXML|PO|VB|8192|
||VDPXMLI|VDP XML Input Library|If INPUT_TYPE=VDPXML|PO|VB|8192|
||VDPXSD|VDP XML Schema Definition|If INPUT_TYPE=VDPXML|PS|VB|259|
||DSNAOINI|DB2 ODBC Initialization File|If INPUT_TYPE=DB2|PS|FB|80|
|Output|VDP|VDP Output File||PS|VB|8192|
||JLT|Reference-Phase Logic Table||PS|VB|8192|
||XLT|Extract-Phase Logic Table||PS|VB|8192|
||GRCGRPT|GVBRCG Control Report|Yes|PS|VB|164|
||GRCGLOG|GVBRCG Log File|Yes|PS|VB|164|
