# Run Control Generator (RCG) Parameter File Syntax

## Format: RCGPARM file  
<pre>
►►───┬─INPUT_TYPE=WBXML───────────────────────┬─────────────────────────────────►  
     ├─INPUT_TYPE=VDPXML──────────────────────┤    
     ├─INPUT_TYPE=DB2───────┤ db parameters ├─┤  
     └─INPUT_TYPE=POSTGRES──┤ db parameters ├─┘       
       
   
►────┤ general options ├───────────────────────────────────────────────────────►◄ 
</pre>

### database parameters:

<pre>
├────DB_SERVER=<i>server</i>──────────────────────────────────────────────────────────►  

►────DB_PORT=<i>port</i>──────────────────────────────────────────────────────────────►  
<!--├────DB_SUBSYSTEM=<i>db2-subsystem</i>────────────────────────────────────────────────►  -->
►────DB_DATABASE=<i>database-name</i>─────────────────────────────────────────────────►  
    
►────DB_SCHEMA=<i>db-schema</i>──────────────────────────────────────────────────────►  
   
►────ENVIRONMENT_ID=<i>GenevaERS-environment-id</i>───────────────────────────────────┤  
</pre>

### general options:
<pre>
     ┌─NUMBER_MODE=STANDARD─┐                                                     
►────┼──────────────────────┼───────────────────────────────────────────────────► 
     └─NUMBER_MODE=LARGE────┘                                                     
                                       
     ┌─LOG_LEVEL=STANDARD─┐                                                       
►────┼────────────────────┼─────────────────────────────────────────────────────► 
     └─LOG_LEVEL=DEBUG────┘                                                        
</pre>
  
*`server`*
The IP address or domain name of the database host system.

*`port`*
The port number identifying the database.

<!-- *`db2-subsystem`*    
This is the name of the Db2 subsystem where your metadata resides. -->

*`database-name`*  
This is the name of the Db2 database or Postgres database where your metadata resides.  
For Postgres, this is the name set in the dbname parameter at database creation e.g. dbname=genevaers.
  
*`db-schema`*    
This is the name of the database schema where your metadata resides. (For example, GENDEV.)  
For Postgres, this is the name set in schemaV at database creation e.g. schemaV=gendev.  
  
*`environment-id`*    
This is the GenevaERS environment ID where the GenevaERS views to be selected reside.
    

## Format: DBFLDRS file
<pre>
<i>►►───┬───────────────┬─────────────────────────────────────────────────────────►◄</i> 
<i>     │ ┌───────────┐ │                                                        </i>
<i>     │ ▼           │ │                                                        </i>
<i>     └───folder-id─┴─┘ </i>
</pre>
  
## Format: DBVIEWS file
<pre>
<i>►►───┬─────────────┬───────────────────────────────────────────────────────────►◄</i> 
<i>     │ ┌─────────┐ │                                                        </i>
<i>     │ ▼         │ │                                                        </i>
<i>     └───view-id─┴─┘ </i>
</pre>
Note: If INPUT_TYPE=DB2, then both the DBVIEWS file and the DBFLDRS file are read. A list of view numbers to process is then derived from the union of the two files. If both files are either empty or missing, then an error is returned.    

## Format: RUNVIEWS file
<pre>
<i>►►───┬─────────────┬───────────────────────────────────────────────────────────►◄</i>
<i>     │ ┌─────────┐ │                                                        </i>
<i>     │ ▼         │ │                                                        </i>
<i>     └───view-id─┴─┘ </i>
</pre>
Note: If the RUNVIEWS file is empty, all views are selected.  


The **Run Control Generator** (RCG) reads views (and all their associated metadata) that have been defined in the GenevaERS workbench, then converts them into files for the Performance Engine to process. The RCG contains the logic to create the single pass optimisation. 

The input can be from workbench XML (WBXML) as exported from the workbench, directly from the database used by the workbench, or VDPXML (a depricated format). For WBXML input XML files are supplied in members of the PDS WBXMLI. For DB2 input, database parameters must be supplied, and the GenevaERS environmentID, and a list of either view numbers, or view folder numbers. The view numbers are supplied in the file DBVIEWS, and the view folder numbers are supplied in the file DBFLDRS.

The file RUNVIEWS is used to select a subset of views. This may be useful when the input is from WBXML or VDPXML.

The output is put in files JLTNEW (input to GVBMR95R if there are any lookups defined in the views), XLTNEW (input to GVBMR95E) and VDPNEW (input to all Performance Engine jobs). 
