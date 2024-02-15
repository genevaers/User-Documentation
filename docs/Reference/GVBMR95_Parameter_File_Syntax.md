# GVBMR95 Parameter File Syntax 
  
## Format: EXTRPARM file

### Standard Options:
<pre>
     ┌─RUN_DATE=<i>current-date</i>─┐                                                    
►►───┼───────────────────────┼──────────────────────────────────────────────────►
     └─RUN_DATE=<i>ccyymmdd</i>─────┘                                                    
                                                                                  
     ┌─FISCAL_DATE_DEFAULT=<i>run-date</i>─┐                                                 
►────┼──────────────────────────────┼───────────────────────────────────────────►
     └─FISCAL_DATE_DEFAULT=<i>ccyymmdd</i>─┘                                                    

     ┌─────────────────────────────────────────────────────┐              
     ▼                                                     │        
►──────┬─────────────────────────────────────────────────┬─┴────────────────────► 
       └─FISCAL_DATE_OVERRIDE=<i>control-record-id:ccyymmdd</i>─┘ 
      
     ┌─IO_BUFFER_LEVEL=4───────────────┐        
►────┼─────────────────────────────────┼────────────────────────────────────────► 
     └─IO_BUFFER_LEVEL=<i>io-buffer-level</i>─┘
                                                                                  
     ┌─DISK_THREAD_LIMIT=9999──────────────┐        
►────┼─────────────────────────────────────┼────────────────────────────────────► 
     └─DISK_THREAD_LIMIT=<i>disk-thread-limit</i>─┘
                                                                                  
     ┌─TAPE_THREAD_LIMIT=9999──────────────┐        
►────┼─────────────────────────────────────┼────────────────────────────────────► 
     └─TAPE_THREAD_LIMIT=<i>tape-thread-limit</i>─┘
                                                                                  
     ┌─DB2_CATALOG_PLAN_NAME=GVBMRCT───────────────┐        
►────┼─────────────────────────────────────────────┼────────────────────────────► 
     └─DB2_CATALOG_PLAN_NAME=<i>db2-catalog-plan-name</i>─┘
                                                                                  
     ┌─DB2_SQL_PLAN_NAME=GVBMRSQ───────────┐        
►────┼─────────────────────────────────────┼────────────────────────────────────► 
     └─DB2_SQL_PLAN_NAME=<i>db2-sql-plan-name</i>─┘
                                                                                  
     ┌─DB2_VSAM_PLAN_NAME=GVBMRDV────────────┐        
►────┼───────────────────────────────────────┼──────────────────────────────────► 
     └─DB2_VSAM_PLAN_NAME=<i>db2-vsam-plan-name</i>─┘
                                                                                  
     ┌─DB2_VSAM_DATE_FORMAT=ISO─┐        
►────┼──────────────────────────┼───────────────────────────────────────────────► 
     ├─DB2_VSAM_DATE_FORMAT=USA─┤
     ├─DB2_VSAM_DATE_FORMAT=EUR─┤
     ├─DB2_VSAM_DATE_FORMAT=JIS─┤
     └─DB2_VSAM_DATE_FORMAT=DB2─┘
                                                                                  
     ┌─PAGE_FIX_IO_BUFFERS=Y─┐ 
►────┼───────────────────────┼──────────────────────────────────────────────────► 
     └─PAGE_FIX_IO_BUFFERS=N─┘
                                                                                  
     ┌─TREAT_MISSING_VIEW_OUTPUTS_AS_DUMMY=N─┐
►────┼───────────────────────────────────────┼──────────────────────────────────► 
     └─TREAT_MISSING_VIEW_OUTPUTS_AS_DUMMY=Y─┘
                                                                                  
     ┌─ABEND_ON_CALCULATION_OVERFLOW=Y─┐
►────┼─────────────────────────────────┼────────────────────────────────────────► 
     └─ABEND_ON_CALCULATION_OVERFLOW=N─┘
                                                                                  
     ┌─ABEND_ON_ERROR_CONDITION=N─┐
►────┼────────────────────────────┼─────────────────────────────────────────────► 
     └─ABEND_ON_ERROR_CONDITION=Y─┘
                                                                                  
     ┌─OPTIMIZE_PACKED_OUTPUT=Y─┐
►────┼──────────────────────────┼───────────────────────────────────────────────► 
     └─OPTIMIZE_PACKED_OUTPUT=N─┘
</pre>                                                                                 
    
### Debugging Options:
<pre>
     ┌─LOG_MESSAGE_LEVEL=STANDARD─┐                                                 
►────┼────────────────────────────┼─────────────────────────────────────────────► 
     └─LOG_MESSAGE_LEVEL=DEBUG────┘                                                    

     ┌─EXECUTE_IN_PARENT_THREAD=N─┐        
►────┼────────────────────────────┼─────────────────────────────────────────────► 
     ├─EXECUTE_IN_PARENT_THREAD=1─┤
     └─EXECUTE_IN_PARENT_THREAD=A─┘
                                                                                  
     ┌─TRACE=N─┐ 
►────┼─────────┼────────────────────────────────────────────────────────────────► 
     └─TRACE=Y─┘
                                                                                  
     ┌─DUMP_LT_AND_GENERATED_CODE=N─┐ 
►────┼──────────────────────────────┼───────────────────────────────────────────► 
     └─DUMP_LT_AND_GENERATED_CODE=Y─┘
                                                                                  
►────┬─────────────────────────────────────────┬────────────────────────────────► 
     └─SOURCE_RECORD_LIMIT=<i>source-record-limit</i>─┘

     ┌─INCLUDE_REF_TABLES_IN_SYSTEM_DUMP=Y─┐
►────┼─────────────────────────────────────┼────────────────────────────────────► 
     └─INCLUDE_REF_TABLES_IN_SYSTEM_DUMP=N─┘
                                                                                   
     ┌─RECOVER_FROM_ABEND=Y─┐
►────┼──────────────────────┼───────────────────────────────────────────────────► 
     └─RECOVER_FROM_ABEND=N─┘
                                                                                  
►────┬─────────────────────────────────────────────────────┬────────────────────► 
     └─ABEND_ON_LOGIC_TABLE_ROW_NBR=<i>logic-table-row-number</i>─┘
                                                                                   
►────┬─────────────────────────────────────┬───────────────────────────────────►◄ 
     └─ABEND_ON_MESSAGE_NBR=<i>message-number</i>─┘
</pre>
  
## Format: RUNVIEWS file  
<pre>
     ┌─────────────┐
     ▼             │
►►─────┬─────────┬─┴───────────────────────────────────────────────────────────►◄ 
       └─<i>view-id</i>─┘                      
</pre>
  
## Format: EXTRTPRM file  
<pre>
►►───┬────────────────────────┬────────────────────────────────────────────────►◄ 
     ├─┤ global-trace set ├───┤       
     │                        │
     │ ┌────────────────────┐ │                                                       
     │ ▼                    │ │                   
     └───┤ view-trace set ├─┴─┘       
</pre>
  
Note 1:  A global trace set, if entered, must precede any view trace sets.

Note 2:  TRACE options may be entered on separate lines.  They may also be entered, separated by commas, on the same line.  
  
### global-trace set:
<pre>
├────DISPLAYSOURCE=<i>ddname-of-source-file</i>────────────────────────────────────────► 
►────┤ trace-output-filter options ├────────────────────────────────────────────┤
</pre>
  
### view-trace set:
<pre>
├────VIEW=<i>view-id</i>───────────────────────────────────────────────────────────────► 
►────DISPLAYSOURCE=<i>ddname-of-source-file</i>────────────────────────────────────────► 
►────┤ trace-output-filter options ├────────────────────────────────────────────┤
</pre>
  
### trace-output-filter options:
<pre>
├────┬──────────────────────────────┬───────────────────────────────────────────► 
     └─DDNAME=<i>ddname-of-source-file</i>─┘

►────┬─────────────────────────────┬────────────────────────────────────────────► 
     ├─REC=<i>number-of-source-record</i>─┤ 
     └─┤ source-record range ├─────┘                                                  
                                                            
►────┬─────────────────────────────────┬────────────────────────────────────────► 
     ├─LTROW=<i>number-of-logic-table-row</i>─┤  
     └─┤ logic-table-row range ├───────┘                                                        

►────┬───────────────────────────┬──────────────────────────────────────────────► 
     ├─COL=<i>number-of-view-column</i>─┤  
     └─┤ view-column range ├─────┘  

►────┬──────────────────────────────────┬───────────────────────────────────────► 
     └─LTFUNC=<i>logic-table-function-code</i>─┘  
                                                                                              
►────┬───────────────────────────────────────────────────┬──────────────────────┤ 
     └─VPOS=<i>value-position</i>,VLEN=<i>value-length</i>,VALUE=<i>value</i>─┘
</pre>
  
### source-record range: 
<pre>
├────┬───────────────────────────────────────┬──────────────────────────────────► 
     └─FROMREC=<i>number-of-first-source-record</i>─┘

►────┬──────────────────────────────────────┬───────────────────────────────────┤ 
     └─THRUREC=<i>number-of-last-source-record</i>─┘ 
</pre>
  
### logic-table-row range:     
<pre>
 ├────┬───────────────────────────────────────────┬──────────────────────────────► 
      └─FROMLTROW=<i>number-of-first-logic-table-row</i>─┘

 ►────┬──────────────────────────────────────────┬───────────────────────────────┤ 
      └─THRULTROW=<i>number-of-last-logic-table-row</i>─┘    
</pre>
  
### view-column range: 
<pre>
 ├────┬─────────────────────────────────────┬────────────────────────────────────► 
      └─FROMCOL=<i>number-of-first-view-column</i>─┘

 ►────┬────────────────────────────────────┬─────────────────────────────────────┤ 
      └─THRUCOL=<i>number-of-last-view-column</i>─┘
</pre>