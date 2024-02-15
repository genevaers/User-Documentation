# GVBMR88 Parameter File Syntax 
  
### Format: MR88PARM file
<pre>
     ┌─SORT_EXTRACT_FILE=Y─┐                                                    
►►───┼─────────────────────┼────────────────────────────────────────────────────►
     └─SORT_EXTRACT_FILE=N─┘
  
     ┌─PROCESS_HEADER_RECORDS=Y─┐ 
►────┼──────────────────────────┼───────────────────────────────────────────────►
     └─PROCESS_HEADER_RECORDS=N─┘       
  
     ┌─ABEND_ON_CALCULATION_OVERFLOW=Y─┐ 
►────┼─────────────────────────────────┼────────────────────────────────────────►
     └─ABEND_ON_CALCULATION_OVERFLOW=N─┘              

     ┌─ABEND_ON_DIVISION_BY_ZERO=Y─┐                                                          
►────┼─────────────────────────────┼────────────────────────────────────────────►
     └─ABEND_ON_DIVISION_BY_ZERO=N─┘            

     ┌─RUN_DATE=<i>current-date</i>─┐                                                    
►────┼───────────────────────┼──────────────────────────────────────────────────► 
     └─RUN_DATE=<i>ccyymmdd</i>─────┘ 

     ┌─FISCAL_DATE_DEFAULT=<i>run-date</i>─┐ 
►────┼──────────────────────────────┼───────────────────────────────────────────► 
     └─FISCAL_DATE_DEFAULT=<i>ccyymmdd</i>─┘ 

     ┌─────────────────────────────────────────────────────┐ 
     ▼                                                     │ 
►──────┬─────────────────────────────────────────────────┬─┴───────────────────►◄ 
       └─FISCAL_DATE_OVERRIDE=<i>control-record-id:ccyymmdd</i>─┘
</pre>            