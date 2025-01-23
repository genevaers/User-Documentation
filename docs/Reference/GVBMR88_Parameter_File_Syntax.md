 {: .no_toc}

# GVBMR88 Parameter File Syntax

# MR88PARM file

<pre>
     ┌─SORT_EXTRACT_FILE=Y─┐                                                    
►►───┼─────────────────────┼────────────────────────────────────────────────────►
     └─SORT_EXTRACT_FILE=N─┘
  
     ┌─RUN_DATE=<i>current-date</i>─┐                                                    
►────┼───────────────────────┼──────────────────────────────────────────────────► 
     └─RUN_DATE=<i>ccyymmdd</i>─────┘ 

     ┌─FISCAL_DATE_DEFAULT=<i>run-date</i>─┐ 
►────┼──────────────────────────────┼───────────────────────────────────────────► 
     └─FISCAL_DATE_DEFAULT=<i>ccyymmdd</i>─┘ 

     ┌─────────────────────────────────────────────────────┐ 
     ▼                                                     │ 
►──────┬─────────────────────────────────────────────────┬─┴────────────────────►
       └─FISCAL_DATE_OVERRIDE=<i>control-record-id:ccyymmdd</i>─┘

►────┬─────────────────────────────────────┬───────────────────────────────────►◄ 
     └─ABEND_ON_MESSAGE_NBR=<i>message-number</i>─┘

</pre>            

## Descriptions

### SORT_EXTRACT_FILE

You can avoid invoking the SORT utility if the extract files are already sorted.   
SORT_EXTRACT_FILE = N will read the extract file from DD name MR88HXE.  
SORT_EXTRACT_FILE = Y will invoke the SORT utility, and the extract file DD name must be SORTIN, and SYSIN must point to the generated sort control file.  

### RUN_DATE

Used to make the format-phase job appear to run on a different date. The functions RUNDAY, RUNMONTH and RUNYEAR use this parameter value to calculate their values.  

***run-date*** is in the format CCYYMMDD.  

The default run date is the current date.

### FISCAL_DATE_DEFAULT

Sets the fiscal date used by all the views in the format job. The functions FISCALDAY, FISCALMONTH and FISCALYEAR use this parameter value to calculate their values.  
To override the fiscal date at the view level use the FISCAL_DATE_OVERRIDE parameter in conjunction with control records.  

***fiscal-date*** is in the format CCYYMMDD.  

The default FISCAL_DATE_DEFAULT is the job run date, either the current date or the date set by RUN_DATE.

### FISCAL_DATE_OVERRIDE

Sets the fiscal date for a control record.
You can use this to set the fiscal date for individual views that are run in one job, by associating the control record with a view.  

***control-record-id*** is the ID of a control record as defined in the Workbench, a positive integer up to 10 digits. This control record is the one defined in the view you wish to set the fiscal date for.  

***date*** is the fiscal date in the format CCYYMMDD.  

### ABEND_ON_MESSAGE_NBR 

You can create a dump (0C1 abend) for debug purposes when GenevaERS receives an error message.  
For example, if you received the following message, and required a dump, set *message-number* to 412 (from GVB00412S below), and re-run the job.

** GVB00412U GVBMR88  - Unable to open sort SYSIN control file     

*message-number* is a valid error message number between 1 and 999.  