# GVBRCA Parameter File Syntax

### Format: GRCAPARM file  
<pre>

     ┌─JLT_REPORT=N─┐                                                     
►►───┼──────────────┼───────────────────────────────────────────────────────────► 
     └─JLT_REPORT=Y─┘                                                     

     ┌─XLT_REPORT=N─┐                                                     
►────┼──────────────┼───────────────────────────────────────────────────────────► 
     └─XLT_REPORT=Y─┘                                                     

     ┌─VDP_REPORT=N─┐                                                     
►────┼──────────────┼───────────────────────────────────────────────────────────► 
     └─VDP_REPORT=Y─┘                                                     

     ┌─REPORT_FORMAT=TEXT──┐                                                     
►────┼─────────────────────┼────────────────────────────────────────────────────► 
     ├─REPORT_FORMAT=CSV───┤    
     └─REPORT_FORMAT=HTML──┘  

     ┌─LOG_LEVEL=STANDARD─┐                                                       
►────┼────────────────────┼─────────────────────────────────────────────────────► 
     └─LOG_LEVEL=DEBUG────┘                                                       

     ┌─RCA_REPORT=N─┐                                                       
►────┼──────────────┼───────────────────────────────────────────────────────────► 
     └─RCA_REPORT=Y─┘                                                       

</pre>
  
The Run Control Analyser (RCA) examines the JLT, XLT and VDP created by the Run Control Generator (RCG), and creates reports that are written to JLTRPT, XLTRPT and VDPRPT respectively.

Any combination of the paramters **JLT_REPORT**, **XLT_REPORT** and **VDP_REPORT** may be used to specify the reports you require. Each report requested must have the corresponding DD statement defined for input (JLT, XLT, VDP) and output (JLTRPT, XLTRPT, VDPRPT).

Specify the report output format with **REPORT_FORMAT**.

**RCA_REPORT**=Y is not valid when running GVBRCA on z/OS.
