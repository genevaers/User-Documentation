# Run-Control App (RCA) Overview 

The Run-Control App (RCA) can generate and examine GenevaERS run-control files: 
- Reference-Phase Logic Table (JLT)
- Extract-Phase Logic Table (XLT)
- View Definition Parameters (VDP)

When in Generate mode (that is, when the **GENERATE** parameter is set to Y), the Run-Control App reads views (and all their associated metadata) that have been defined in the GenevaERS Workbench, then converts them into files for the Performance Engine to process. The RCA contains the logic to optimize a group of views for a single pass of the source data.

The input can be from:
- Workbench XML (WBXML), as exported from the Workbench, 
- Directly from the database used by the Workbench, or 
- View Definition Parameters XML (VDPXML) (a deprecated format). 

For WBXML input, XML files are supplied in members of the PDS WBXMLI. For database (DB2 or Postgres) input, database parameters must be supplied, along with the GenevaERS environment ID and a list of either view numbers or view folder numbers. The view numbers are supplied in the file DBVIEWS, and the view folder numbers are supplied in the file DBFLDRS.

The file RUNVIEWS is used to select a subset of views. This may be useful when the input is from WBXML or VDPXML.

The output is put in files JLTNEW (input to GVBMR95R, if there are any lookups defined in the views), XLTNEW (input to GVBMR95E) and VDPNEW (input to all Performance Engine jobs). 

Whether or not the Run-Control App is in Generate mode, it can examine the JLT, XLT and VDP and create reports, which are written to JLTRPT, XLTRPT, and VDPRPT respectively.

Any combination of the parameters **JLT_REPORT**, **XLT_REPORT**, and **VDP_REPORT** may be used to specify the reports you require.

Each report requested must have the corresponding DD statement defined for input (JLTNEW, XLTNEW, VDPNEW) and output (JLTRPT, XLTRPT, VDPRPT).

If the parameter **COMPARE** is set to **Y**, the RCA will compare and report on two sets of run-control files. In this case the corresponding DD statements for both inputs must be provided (JLTNEW, XLTNEW, VDPNEW, and JLTOLD, XLTOLD, VDPOLD).

Specify the report output format with **REPORT_FORMAT**.

