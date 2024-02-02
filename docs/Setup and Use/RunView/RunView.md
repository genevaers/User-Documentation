## Running the view

If you haven't installed the Demo, then it is highly recommended you do. Go [here](https://genevaers.github.io/Demo/)

Sample JCL is contained in 
< *your-tso-prefix* >.GVBDEMO.JCL

< *your-tso-prefix* >.GVBDEMO.JCL(GENDATA) generates the test data for the Demo.

< *your-tso-prefix* >.GVBDEMO.JCL(RUNPASS1) runs all four of the Performance Engine Phases in one job.

**This is to be completed and reviewed when we have added some sample JCL**

(Gill note : Perhaps move this to the Basic Concepts for PE .... have on separate page as a link or include)

### Compile Phase 

The program GVBMR91 reads the view definitions and creates
 -  View Definition Parameters (VDP file),
 -  Join Logic Table (JLT file), and 
 -  Extract Logic Table (XLT file)  
for use by the Reference and Extract phases. 

### Reference Phase

The program GVBMR95R produces reference data for use in the extract phase. It reads the VDP file the JLT file created by GVBMR91. It then produces a Reference Extract Header (REH) that describes the format of the reference data being processed, and one Reference Extract Detail (RED) file for each Reference Data file read. These files contain only the data required to perform joins/lookups in the Extract phase.

### Extract Phase

The program GVBMR95E executes the extract phase. GVBMR95E reads the VDP file, the XLT file, and the REH, and RED files created by earlier steps, along with source data for the process.

GVBMR95E executes various transformations and, depending on specifications in the selected views, produces one or more view output files. It may also produce one or more Extract Work files, which are temporary files processed by the Format phase. 

### Specifying the Source Files in the JCL

Make sure that DD statements for any required input files are included in the JCL. For example DD statements for the data to be scanned and extracted according to the view requirements. The DD names (such as CUSTOMER or ORDER001) must match those in the Workbench physical files referenced by the views being run.

### Specifying the View Output Files

Similarly, you also must ensure that DD statements for any required output files are included. These DD names are determined by view parameters in the Workbench.

### Reports and Logs

All phases produce reports, which presents summary statistics for the processes.

Any Errors will be reported in the phases log.
