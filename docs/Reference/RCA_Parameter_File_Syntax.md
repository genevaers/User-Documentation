# Run Control Analyser (RCA) Parameter File Syntax

### Format: RCAPARM file  
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

     ┌─COMPARE=N─┐                                                       
►────┼───────────┼──────────────────────────────────────────────────────────────► 
     └─COMPARE=Y─┘                                                       

</pre>
  
The Run Control Analyser (RCA) examines the JLT, XLT and VDP created by the Run Control Generator (RCG), and creates reports that are written to JLTRPT, XLTRPT and VDPRPT respectively.

Any combination of the parameters **JLT_REPORT**, **XLT_REPORT** and **VDP_REPORT** may be used to specify the reports you require.

Each report requested must have the corresponding DD statement defined for input (JLTNEW, XLTNEW, VDPNEW) and output (JLTRPT, XLTRPT, VDPRPT).

If the parameter **COMPARE** is set to **Y**, the RCA will compare and report on two sets of RCG files. In this case the corresponding DD statements for both inputs must be provided (JLTNEW, XLTNEW, VDPNEW, and JLTOLD, XLTOLD, VDPOLD).

Specify the report output format with **REPORT_FORMAT**.
