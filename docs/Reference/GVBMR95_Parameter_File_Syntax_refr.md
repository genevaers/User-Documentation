{: .no_toc}
# GVBMR95 Parameter File Syntax

# REFRPARM file

## Standard Options Syntax

<pre>
     ┌─IO_BUFFER_LEVEL=4───────────────┐        
►►───┼─────────────────────────────────┼────────────────────────────────────────► 
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
                                                                                  
     ┌─ABEND_ON_ERROR_CONDITION=N─┐
►────┼────────────────────────────┼─────────────────────────────────────────────► 
     └─ABEND_ON_ERROR_CONDITION=Y─┘
                                                                                  
</pre>                                                                                 

## Descriptions

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

### ABEND_ON_ERROR_CONDITION
When set to Y, the user Abend 999 will be issued, if the return code from GVBMR95 is greater than 4.

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
Specifying **DEBUG** will write detailed information to REFRLOG, the log file. Details such as the status of initialization processing, reference table information, internal logic table details for each function, and lookup buffer details.

### EXECUTE_IN_PARENT_THREAD
Specifying **A** will execute all work in the main task, bypassing attaching any subtasks. All source data sets will be processed in series.  
Specifying **1** will execute only the first source data set in the main task. No subtasks will be attached.  
Specifying **N** will allow sources to be processed in multiple subtasks, or threads.  

Setting EXECUTE_IN_PARENT_THREAD to A or 1 will cause unpredictable results when pipe files are included.

### TRACE
Specifying **Y** will open the trace file REFRTRAC and write information on the data and functions processed by GenevaERS. Trace parameters can be set to filter which views, functions or data is to be traced. See [trace parameters](./GVBMR95_Parameter_File_Syntax_trace_refr.md).  

TRACE = Y requires the DD REFRTRAC to be defined in the JCL.

### DUMP_LT_AND_GENERATED_CODE
Specifying **Y** will take a snap dump of the logic table, the generated machine code and the literal pool, and write it to REFRDUMP. 

Requires the DD REFRDUMP to be in the JCL.

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

# RUNVIEWS file  
<pre>
     ┌─────────────┐
     ▼             │
►►─────┬─────────┬─┴───────────────────────────────────────────────────────────►◄ 
       └─<i>view-id</i>─┘                      
</pre>
  
