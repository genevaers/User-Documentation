<!-- The syntax details of a WRITE statement in **Extract-Phase Record Logic** are shown below. -->

<pre>
           
►───<b>WRITE</b>(───┬──────────┬─,─┬───────────────┬─,─┬────────┬─)───────────────►◄ 
             └─<i><b>&lt;Source&gt;</b></i>─┘   └─<i><b>&lt;Destination&gt;</b></i>─┘   └─<i><b>&lt;Exit&gt;</b></i>─┘ 
</pre>

The source, destination and exit are all optional and can be specified in any order.  
If no source is specified, then it will default based on the output format selected on the View Properties tab.  
If no destination is specified, then it will default based on the output format selected on the View Properties tab.  
See [Default WRITE Statements.](#default-write-statements)  

<pre>

<i><b>&lt;Source&gt;</b></i>       ►─►<b>SOURCE</b>=──┬──<b>INPUT</b>──┬────────────────────────────────────────────►◄
                           ├──<b>DATA</b>───┤              
                           └──<b>VIEW</b>───┘

                                     ┌─<b>DEFAULT</b>──────────────────────────────────┐
<i><b>&lt;Destination&gt;</b></i> ►─┬─►<b>DEST</b>=────────┬────┼──<b>EXT</b>=───────┬─<i><b>&lt;Extract Work File Number&gt;</b></i>─┼─►◄
                └─►<b>DESTINATION</b>=─┘    └──<b>EXTRACT</b>=───┘    
                                     └──<b>FILE</b>= {<i><b>&lt;Logical file&gt;</b></i>,<i><b>&lt;Physical file&gt;</b></i>}──┘
                                      

<i><b>&lt;Exit&gt;</b></i>        ►─┬─►<b>PROC</b>=──────┬─────┬────{<i><b>&lt;Procedure&gt;</b></i>}────────────┬───────────────►◄
                └─►<b>PROCEDURE</b>=─┘     └──( {<i><b>&lt;Procedure&gt;</b></i>},<i><b>&lt;String&gt;</b></i>)──┘              
                └─►<b>USEREXIT</b>=────────┬──{<i><b>&lt;UserExit&gt;</b></i>}───────────────┬───────────────►◄       
                                    └──( {<i><b>&lt;UserExit&gt;</b></i>},<i><b>&lt;String&gt;</b></i>)───┘              
</pre>

**SOURCE** is related to the output format, specifically if complete records, or columns are being written, and if the output file is to be processed in the format phase. It will dictate which function code is generated in the XLT.  

**INPUT** means the source records are written (after filtering). This results in a WRIN generated in the XLT.  
**DATA** means write the column data up to this column. This results in a WRDT generated in the XLT.  
**VIEW** means write the column data, up to this column, to an extract file to be passed to the format phase. The extract file has additional information written at the start of each record, for example the sort key for use in the format phase. This results in a WRXT being generated in the XLT.  

The **DEFAULT** output destination for Extract-Phase only Views is the ddname **F*****nnnnnnn*** where ***nnnnnnn*** is the view ID. For example, if the view ID is **12183** the default ddname for Extract-Phase only Views is **F0012183**.  

***&lt;Extract Work File Number&gt;*** is a number between 0 and 999, referring to the the Work File Number in the DD name EXTRnnn. This will typically be specified with SOURCE=VIEW.  

***&lt;Logical file&gt;***, ***&lt;Physical file&gt;***, ***&lt;Procedure&gt;*** and ***&lt;UserExit&gt;*** are all the names of the components as defined in the Workbench. The Logical file and Physical file can refer to a Disk file, a Pipe or a Token.  

If a Procedure or UserExit is defined, the data (as defined by the SOURCE parameter) is passed a record at a time to the UserExit or Procedure for processing, then the result can be written to a file defined by FILE or EXTRACT. ***&lt;String&gt;*** is optional and is passed as a PARM to the Procedure or UserExit.
