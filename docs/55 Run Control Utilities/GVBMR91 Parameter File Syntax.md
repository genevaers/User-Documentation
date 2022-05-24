---
layout: default
title: "GVBMR91 Parameter File Syntax"
parent: 55 Run Control Utilities
nav_order: 5
---

# GVBMR91 Parameter File Syntax

### Format: MR91PARM file  
<pre>
►►───┬─INPUT_TYPE=WBXML─────────────────────┬───────────────────────────────────►  
     ├─INPUT_TYPE=VDPXML────────────────────┤    
     └─INPUT_TYPE=DB2────┤ db2 parameters ├─┘  
       
     ┌─OUTPUT_WB_XML_FILES=N─┐                                                  
►────┴───────────────────────┴──────────────────────────────────────────────────►   
  
     ┌─OUTPUT_VDP_XML_FILE=N─┐                                                     
►────┴───────────────────────┴──────────────────────────────────────────────────►  
  
     ┌─OUTPUT_RUN_CONTROL_FILES=N─┐                                              
►────┴────────────────────────────┴─────────────────────────────────────────────►  
         
     ┌────────────────────────────┐                                             
     ▼                            │                                             
►──────┤ selected output-option ├─┴─────────────────────────────────────────────►  
    
►────┤ general options ├───────────────────────────────────────────────────────►◄ 
</pre>

### db2 parameters:
<pre>
├────DB2_SUBSYSTEM=<i>db2-subsystem</i>────────────────────────────────────────────────►  
    
►────DB2_SCHEMA=<i>db2-schema</i>──────────────────────────────────────────────────────►  
   
►────DB2_ENVIRONMENT_ID=<i>db2-environment-id</i>──────────────────────────────────────┤  
</pre>

  
### selected output-option:
<pre>
├────┬─OUTPUT_WB_XML_FILES=Y──────┬─────────────────────────────────────────────┤  
     ├─OUTPUT_VDP_XML_FILE=Y──────┤  
     └─OUTPUT_RUN_CONTROL_FILES=Y─┘  
</pre>
  
### general options:
<pre>
     ┌─NUMBER_MODE=STANDARD─┐                                                     
►────┼──────────────────────┼───────────────────────────────────────────────────► 
     └─NUMBER_MODE=LARGE────┘                                                     
                                       
     ┌─TRACE=N─┐                                                        
►────┼─────────┼────────────────────────────────────────────────────────────────► 
     └─TRACE=Y─┘                                                        
</pre>
  
### Format: WBXMLS file  
<pre>
<i>►►───┬─────────────────┬───────────────────────────────────────────────────────►◄</i> 
<i>     │ ┌─────────────┐ │                                                        </i>
<i>     │ ▼             │ │                                                        </i>
<i>     └───member-name─┴─┘ </i>
</pre>
Note: If the WBXMLS file is empty, all members are selected.    

### Format: VDPXMLS file
<pre>
<i>►►───┬─────────────────┬───────────────────────────────────────────────────────►◄</i>
<i>     │ ┌─────────────┐ │                                                        </i>
<i>     │ ▼             │ │                                                        </i>
<i>     └───member-name─┴─┘ </i>
</pre>
Note: If the VDPXMLS file is empty, all members are selected.   
    
### Format: DBFLDRS file
<pre>
<i>►►───┬───────────────┬─────────────────────────────────────────────────────────►◄</i> 
<i>     │ ┌───────────┐ │                                                        </i>
<i>     │ ▼           │ │                                                        </i>
<i>     └───folder-id─┴─┘ </i>
</pre>
  
### Format: DBVIEWS file
<pre>
<i>►►───┬─────────────┬───────────────────────────────────────────────────────────►◄</i> 
<i>     │ ┌─────────┐ │                                                        </i>
<i>     │ ▼         │ │                                                        </i>
<i>     └───view-id─┴─┘ </i>
</pre>
Note: If INPUT_TYPE=DB2, then the DBVIEWS file is checked.  If it is empty or missing, then the DBFLDRS file is checked.  If it is empty or missing, then an error is displayed.   
    
### Format: RUNVIEWS file
<pre>
<i>►►───┬─────────────┬───────────────────────────────────────────────────────────►◄</i>
<i>     │ ┌─────────┐ │                                                        </i>
<i>     │ ▼         │ │                                                        </i>
<i>     └───view-id─┴─┘ </i>
</pre>
Note: If the RUNVIEWS file is empty, all views are selected.  


*`db2-subsystem`*    
This is the name of the Db2 subsystem where your metadata resides.  (For example, DM12.)
  
*`db2-schema`*    
This is the name of the Db2 schema where your metadata resides.  (For example, GENDEV.)
  
*`db2-environment-id`*    
This is the environment ID (such as 15) of the location of the GenevaERS views to be selected.  
    
