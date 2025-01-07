
You can trace all views, or specific views by view number. You can specify ranges based on Logic Table numbers, ranges based on source file record numbers, or trace records based on a value within the source record.

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
  
## global-trace set:

A global trace set applies to all views. Only one global trace set can be defined. 
<pre>
├────DISPLAYSOURCE=<i>source-file</i>──────────────────────────────────────────────────► 
►────┤ trace-output-filter options ├────────────────────────────────────────────┤
</pre>
  
## view-trace set:

View trace sets apply to the view specified. Multiple view trace sets can be defined.  
<pre>
├────VIEW=<i>view-id</i>───────────────────────────────────────────────────────────────► 
►────DISPLAYSOURCE=<i>source-file</i>──────────────────────────────────────────────────► 
►────┤ trace-output-filter options ├────────────────────────────────────────────┤
</pre>
  
## trace-output-filter options:
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
  
## source-record range: 
<pre>
├────┬───────────────────────────────────────┬──────────────────────────────────► 
     └─FROMREC=<i>number-of-first-source-record</i>─┘

►────┬──────────────────────────────────────┬───────────────────────────────────┤ 
     └─THRUREC=<i>number-of-last-source-record</i>─┘ 
</pre>
  
## logic-table-row range:     
<pre>
 ├────┬───────────────────────────────────────────┬──────────────────────────────► 
      └─FROMLTROW=<i>number-of-first-logic-table-row</i>─┘

 ►────┬──────────────────────────────────────────┬───────────────────────────────┤ 
      └─THRULTROW=<i>number-of-last-logic-table-row</i>─┘    
</pre>
  
## view-column range: 
<pre>
 ├────┬─────────────────────────────────────┬────────────────────────────────────► 
      └─FROMCOL=<i>number-of-first-view-column</i>─┘

 ►────┬────────────────────────────────────┬─────────────────────────────────────┤ 
      └─THRUCOL=<i>number-of-last-view-column</i>─┘
</pre>

## Descriptions

### DISPLAYSOURCE

Specifying this parameter with a valid source file ddname will include a copy of the original source record in the trace.  

*source-file*: DDNAME of source file to be traced, Max 8 characters.

### VIEW

The parameters following VIEW=*view-id* make up a 'trace set', and apply to that view number.  
*view-id*: the view number to be traced, integer in the range 1 - 2147483647.  

### DDNAME

Limits the trace to function calls that process this source ddname.  
*source-file*: ddname of source file to be selected, Max 8 characters.

### REC

Limits the trace to function calls that process this record number.
*number-of-source-record* Source record number, integer in the range 1 - 2<sup>63</sup> 

### FROMREC, THRUREC

Limits the trace to function calls that process records in this record range.

*number-of-source-record* Source record number, integer in the range 1 - 2<sup>63</sup>  

If only one of these parameters is specified, then the other will take a default value.  
The default for FROMREC is 0.
The default for THRUREC is 9999999999999.

### LTROW

Limits the trace to function calls from a specific logic table row. The logic table row numbers can be found by running a RCA report on the JLT or XLT.  

*number-of-logic-table-row*: Logic table row number to trace.

### FROMLTROW, THRULTROW

Limits the trace to function calls from a specific range in the logic table. The logic table row numbers can be found by running a RCA report on the JLT or XLT.  

*number-of-first-logic-table-row*: Logic table row number to start tracing from.
*number-of-last-logic-table-row*: Logic table row number to end tracing at.

### COL

Limits the trace to function calls relating to a specific view column.
Note that in the trace output the column number is referred to as 'SEQ NUM'.

*number-of-view-column*: The column number, an integer in the range 1 - 32767.

### FROMCOL, THRUCOL

Limits the trace to function calls relating to view columns in the range specified.
Note that in the trace output the column number is referred to as 'SEQ NUM'.

*number-of-first-view-column*: The column number where the trace starts, an integer in the range 1 - 32767.
*number-of-last-view-column*: The column number where the trace ends, an integer in the range 1 - 32767.

### LTFUNC

Limits the trace to a named function code.
You can specify partial function codes, for example, LTFUNC=DT will select all DTE, DTL, DTC, DTP and DTX functions for tracing.
*logic-table-function-code*: Logic table function code to be traced, Max 4 characters.

### VPOS, VLEN, VALUE

Limits the trace to function calls of source records containing a specific value.  
All of these parameters must be specified together.

*value-position*: Position of the value in the source record (offset +1)
*value-length*: Length of the value in the source record
*value*: The value can be alphanumeric e.g. VALUE=1234 (max 16 characters), or hex e.g. VALUE=x'F1F2F3F4' (max 32 digits)


## Example trace sets

1.	A global trace set
```
* Trace the logic table rows 5 to 15 for all source records.
FROMLTROW=5,THRULTROW=15
```
2.	VIEW trace sets
```
* For view number 10269 trace all write functions for the first 5 source records only.  
* For view number 10271 trace all functions where the source record
*  contains 'ILLINOIS' starting in position 8.
VIEW=10269,LTFUNC=WR, FROMREC=1,THRUREC=5
VIEW=10271, VPOS=8, VLEN=8, VALUE=ILLINOIS
```
