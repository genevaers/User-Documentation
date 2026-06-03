## Examples: IF with WRITE in Extract Record Logic

|Example logic text&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|Meaning|
|------------------|-------|
|**WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;DEST={output_file_LF.output_file_PF1})**|Write data defined by the columns, to physical file output_file_PF1.|
|**IF {Field_Code} = "01" THEN <br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;&nbsp;&nbsp;DESTINATION=FILE={output_file_LF.output_file_PF_1})<br>ELSE IF {Field_Code} = "02" THEN <br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;&nbsp;&nbsp;DESTINATION=FILE={output_file_LF.output_file_PF_2})<br>ELSE<br>&nbsp;&nbsp;&nbsp;&nbsp;WRITE(SOURCE=DATA,<br>&nbsp;&nbsp;&nbsp;&nbsp;DESTINATION=FILE={output_file_LF.output_file_PF_3})<br>ENDIF<br>ENDIF<br>**|Write data defined by the columns to different physical files depending on the code in 'Field_Code'.|
|**WRITE(SOURCE=VIEW,DEST=EXT=001)**|Write column data, including extract file record prefix, to extract file 001.|
|**WRITE(SOURCE=INPUT,<br>&nbsp;&nbsp;USEREXIT={write-Exit1},<br>&nbsp;&nbsp;DEST=FILE={output_file_LF.output_file_PF1})**|Pass a source record to user exit 'write-Exit1', then write the result to output_file_PF1.|
