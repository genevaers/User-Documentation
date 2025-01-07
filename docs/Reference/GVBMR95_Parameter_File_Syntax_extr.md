{: .no_toc}
# GVBMR95 Parameter File Syntax

# EXTRPARM file

## Standard Options Syntax

<pre>
     ┌─RUN_DATE=<i>current-date</i>─┐                                                    
►►───┼───────────────────────┼──────────────────────────────────────────────────►
     └─RUN_DATE=<i>run-date</i>─────┘                                                    
                                                                                  
     ┌─FISCAL_DATE_DEFAULT=<i>run-date</i>────┐                                                 
►────┼─────────────────────────────────┼────────────────────────────────────────►
     └─FISCAL_DATE_DEFAULT=<i>fiscal-date</i>─┘                                                    

     ┌─────────────────────────────────────────────────┐              
     ▼                                                 │        
►──────┬─────────────────────────────────────────────┬─┴────────────────────────► 
       └─FISCAL_DATE_OVERRIDE=<i>control-record-id:date</i>─┘ 
      
     ┌─IO_BUFFER_LEVEL=4───────────────┐        
►────┼─────────────────────────────────┼────────────────────────────────────────► 
     └─IO_BUFFER_LEVEL=<i>io-buffer-level</i>─┘
                                                                                  
     ┌─DISK_THREAD_LIMIT=9999──────────────┐        
►────┼─────────────────────────────────────┼────────────────────────────────────► 
     └─DISK_THREAD_LIMIT=<i>disk-thread-limit</i>─┘
                                                                                  
     ┌─TAPE_THREAD_LIMIT=9999──────────────┐        
►────┼─────────────────────────────────────┼────────────────────────────────────► 
     └─TAPE_THREAD_LIMIT=<i>tape-thread-limit</i>─┘
                                                                                  
     ┌─DB2_SQL_PLAN_NAME=GVBMRSQ───────────┐        
►────┼─────────────────────────────────────┼────────────────────────────────────► 
     └─DB2_SQL_PLAN_NAME=<i>db2-sql-plan-name</i>─┘
                                                                                  
     ┌─PAGE_FIX_IO_BUFFERS=N─┐ 
►────┼───────────────────────┼──────────────────────────────────────────────────► 
     └─PAGE_FIX_IO_BUFFERS=Y─┘
                                                                                  
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

## Descriptions

<!-- [RUN_DATE](#run_date)  
[FISCAL_DATE_DEFAULT](#fiscal_date_default)  
[FISCAL_DATE_OVERRIDE](#fiscal_date_override)  
[IO_BUFFER_LEVEL](#io_buffer_level)  
[DISK_THREAD_LIMIT](#disk_thread_limit)  
[TAPE_THREAD_LIMIT](#tape_thread_limit)  
[DB2_SQL_PLAN_NAME](#db2_sql_plan_name)  
[PAGE_FIX_IO_BUFFERS](#page_fix_io_buffers)  
[TREAT_MISSING_VIEW_OUTPUTS_AS_DUMMY](#treat_missing_view_outputs_as_dummy)  
[ABEND_ON_CALCULATION_OVERFLOW](#abend_on_calculation_overflow)  
[ABEND_ON_ERROR_CONDITION](#abend_on_error_condition)  
[OPTIMIZE_PACKED_OUTPUT](#optimize_packed_output)  
-->

### RUN_DATE
Used to make the extract-phase job appear to run on a different date. The functions RUNDAY, RUNMONTH and RUNYEAR use this parameter value to calculate their values.  

***run-date*** is in the format CCYYMMDD.  

The default run date is the current date.

### FISCAL_DATE_DEFAULT
Sets the fiscal date used by all the views in the extract job. The functions FISCALDAY, FISCALMONTH and FISCALYEAR use this parameter value to calculate their values.  
To override the fiscal date at the view level use the FISCAL_DATE_OVERRIDE parameter in conjunction with control records.  

***fiscal-date*** is in the format CCYYMMDD.  

The default FISCAL_DATE_DEFAULT is the job run date, either the current date or the date set by RUN_DATE.

### FISCAL_DATE_OVERRIDE
Sets the fiscal date for a control record.
You can use this to set the fiscal date for individual views that are run in one job, by associating the control record with a view.  

***control-record-id*** is the ID of a control record as defined in the Workbench, a positive integer up to 10 digits. This control record is the one defined in the view you wish to set the fiscal date for.  

***date*** is the fiscal date in the format CCYYMMDD.  

### IO_BUFFER_LEVEL
Used to calculate an optimal number of buffers for each data set based on properties such as blocks per track and, for extended-format data sets, number of stripes.  

***io-buffer-level*** is a positive integer. It is proportional to the number of read or write buffers allocated to each input or output data set. Higher values use more storage but reduce elapsed times. Recommended values: 4 - 10.  

For example, if you set IO_BUFFER_LEVEL=4, the number of blocks that will fit on a track, multiplied by 4, will be calculated. For extended format data sets the number of stripes is also used in the calculation.

### DISK_THREAD_LIMIT
Limits the number of threads allocated for source disk files. Typically one thread is used per source file. If there are more disk files than the specified *disk-thread-limit*, then threads are reused as they become free. 

***disk-thread-limit*** is an integer between 1 and 9999.  

### TAPE_THREAD_LIMIT
Limits the number of threads allocated for source tape files. Typically one thread is used per source file.  If there are more tape files than the specified *tape-thread-limit*, then threads are reused as they become free.

***tape-thread-limit*** is an integer between 1 and 9999. 

### DB2_SQL_PLAN_NAME
If GenevaERS is required to read source files from DB2 then a bind job must be run.  

***db2-sql-plan-name*** is the plan name used in this bind job. See JCL example [link tbd]().

### PAGE_FIX_IO_BUFFERS
Sets page fixing for the I/O buffers used to read the source files, and to write to the extract files. If set to Y the buffers are made resident in central (real) storage and ineligible for page-out while the requesting task's address space is swapped into central storage. This may improve performance of the extract-phase job, reducing CPU time and elapse time.

This requires the extract-phase job to be running with APF-authorization.

### TREAT_MISSING_VIEW_OUTPUTS_AS_DUMMY
When set to Y, tells the extract-phase job to treat missing DD statements as if they they were specified as DD DUMMY. This applies to extract-phase only view outputs, not to the work files that go on to be input for the format-phase.  

This feature can be useful when testing.

### ABEND_ON_CALCULATION_OVERFLOW
When set to Y, and RECOVER_FROM_ABEND is set to Y, a decimal overflow, or a fixed-point overflow will result in an abend.  
A decimal overflow will result in SYSTEM COMPLETION CODE=0CA, and a fixed-point overflow will result in SYSTEM COMPLETION CODE=0C8.

### ABEND_ON_ERROR_CONDITION
When set to Y, the user Abend 999 will be issued, if the return code from GVBMR95 is greater than 4.

### OPTIMIZE_PACKED_OUTPUT
When set to Y, source fields defined as Packed (also Zoned Decimal) in the LR field, are not forced to reflect the defined sign attribute.

For example, if an LR field is specified as Unsigned Packed, we expect the data to end with a hex 'F' character. Similarly, if an LR field is specified as being Signed Packed, we expect the data to end with a hex 'C' or 'D' character.

By setting this parameter to Y you are telling GenevaERS that you trust that the source data matches the sign attribute on the LR field. 

This optimizes processing in the case where the source and column data type is Packed or Zoned Decimal, the column length is the same as the LR field length, and the sign attribute for the column is the same as the LR sign attribute. In this case a straight move is executed with no sign processing.  

This is more efficient than forcing the sign to reflect the column sign attribute.

However, if the user has not entered the correct sign attribute on the LR field, our output may not always reflect the column sign attribute. 

If ensuring the sign reflects the LR field definition is important, set this parameter to N.
    
## Debugging Options:
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
  
## Descriptions

### LOG_MESSAGE_LEVEL
Specifying **DEBUG** will write detailed information to EXTRLOG, the log file. Details such as the status of initialization processing, reference table information, internal logic table details for each function, and lookup buffer details.

### EXECUTE_IN_PARENT_THREAD
Specifying **A** will execute all work in the main task, bypassing attaching any subtasks. All source data sets will be processed in series.  
Specifying **1** will execute only the first source data set in the main task. No subtasks will be attached.  
Specifying **N** will allow sources to be processed in multiple subtasks, or threads.  

Setting EXECUTE_IN_PARENT_THREAD to A or 1 will cause unpredictable results when pipe files are included.

### TRACE
Specifying **Y** will open the trace file EXTRTRAC and write information on the data and functions processed by GenevaERS. Trace parameters can be set to filter which views, functions or data is to be traced. See [trace parameters](./GVBMR95_Parameter_File_Syntax_trace_extr.md).  

TRACE = Y requires the DD EXTRTRAC to be defined in the JCL.

### DUMP_LT_AND_GENERATED_CODE
Specifying **Y** will take a snap dump of the logic table, the generated machine code and the literal pool, and write it to EXTRDUMP. 

Requires the DD EXTRDUMP to be in the JCL.

### SOURCE_RECORD_LIMIT
Specifies the maximum number of records to be read per source file.  For example, if there are two source files and *source-record-limit* is set to 100, then 200 records will be read and processed.  
***source-record-limit*** is an integer up to 13 digits.  

### INCLUDE_REF_TABLES_IN_SYSTEM_DUMP  
Reference tables can be large, so this provides an option to exclude them from dumps.  
Specifying **N** will allocate the 64-bit memory used for reference tables with the option to not include it in a system dump.

**Note: Not implemented in V4**

### RECOVER_FROM_ABEND
Specifying **Y** will call set up a recovery routine to be called when an abend occurs.  
Note that this option affects the parameter [ABEND_ON_CALCULATION_OVERFLOW](#abend_on_calculation_overflow).  

### ABEND_ON_LOGIC_TABLE_ROW_NBR

You can create a dump (0C1 abend) for debug purposes when GenevaERS processes a specified logic table row. The logic table row numbers can be found by running a report on the JLT or XLT.

Note: This parameter requires **TRACE=Y**

### ABEND_ON_MESSAGE_NBR

You can create a dump (0C1 abend) for debug purposes when GenevaERS receives an error message.  
For example, if you received the following message, and required a dump, set *message-number* to 16, and re-run the job.

** GVB00016S GVBMR95  - Unable to LOAD user read exit: EXIT51  

*message-number* is a valid error message number between 1 and 999.
