## Examples: IF with WRITE in Extract Column Logic

|Example logic text&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|Meaning|
|------------------|-------|
|**WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;DEST={output_file_LF.output_file_PF1})**|Write data defined by the columns, up to this column, to physical file output_file_PF1 in logical file output_file_LF.|
**WRITE(SOURCE=VIEW,DEST=EXT=001)**|Write column data, up to the current column, to extract file 001. This includes the extract file record prefix required for format-phase processing.|
|**IF (ISNOTNULL({field3}) THEN <br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE  SOURCE=INPUT, &nbsp;DEST=FILE= {LogicalFile3,PhysicalFile1}) <br>ENDIF**|If field3 is not nulls then write the record to PhysicalFile1 in  LogicalFile3. In this case the the source record is written, and not the view column data.|
|**IF {Field_Code} = "01" THEN <br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;&nbsp;&nbsp;DESTINATION=FILE={output_file_LF.output_file_PF_1})<br>ELSE IF {Field_Code} = "02" THEN <br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;&nbsp;&nbsp;DESTINATION=FILE={output_file_LF.output_file_PF_2})<br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;&nbsp;&nbsp;DESTINATION=FILE={output_file_LF.output_file_PF_3})<br>ENDIF<br>ENDIF<br>**|Write data defined by the columns, up to the current column, to different physical files depending on the code in 'Field_Code'.|
|**WRITE(SOURCE=INPUT,<br>&nbsp;&nbsp;USEREXIT={write-Exit1},<br>&nbsp;&nbsp;DEST=FILE={output_file_LF.output_file_PF1})**|Pass a source record to user exit 'write-Exit1', then write the result to output_file_PF1.|
