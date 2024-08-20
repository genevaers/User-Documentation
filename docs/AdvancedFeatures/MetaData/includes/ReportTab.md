### Report page layout 

Select the **View Properties** sub-tab **Report**.  

1. In the **Details** section you can configure the page size of the report. Note that the width you require will depend upon the tools that you use for displaying or printing; this is typically 80 to 255 characters.

- **Lines Per Page** The number of lines per page for the output report. An integer between 0 and 999999999. This field is 60 by default.  
- **Report Width** The width of the output report. This field is 132 by default and can be changed to any integer between 0 and 999999999.

2. In the **Header/Footer** section you can define fields to insert into the header and footer of the report pages. Report headings can be entered as a combination of text constants and variable values. The variable values, or functions, are predefined keywords. The most common keywords (Date, Time, Page Number, and View ID) are available as buttons, and many others are available in the drop-down list.  
   
To add a function to the header or footer:
- Click in the section where you want to add the function, for example, **Footer** > **Right Selection**
- Click the function button you require, for example, **Page** to insert the page number, or
- Select a function from the drop down list, then click the **Insert** button.

![Report tab example](../../images/CreateReportHdr2.png)  

Functions available:  
**&[CompanyName]** - This is taken from the Name field of the control record defined for the view.  
**&[FiscalDate]** - The date provided either by the FISCAL_DATE_DEFAULT or FISCAL_DATE_OVERRIDE parameters at Format Phase runtime. See [GVBMR88 parameters](../../../Reference/GVBMR88_Parameter_File_Syntax.html).  
**&[ProcessDate]** - The date the Format Phase job was executed.  
**&[ProcessTime]** - The time the Format Phase job was executed.  
**&[RunDate]** -  The date the VDP file was generated i.e. the date the RCG job was executed.

**&[SortKey*nn*Label]** - The label set for Sort Key number *nn* in the **Sort Key Properties** frame.  
**&[SortKey*nn*Title]** - The Sort Key Title defined for Sort Key number *nn*. See [Defining sort key titles](#defining-sort-key-titles)  
**&[SortKey*nn*Value]** - The Sort Key value for Sort Key number *nn*.  

These are valid for up to five sort keys (*nn* is 01 to 05).

You can use the SortKey functions to promote a sort field into the header or footer. Once this is done, the sort field becomes a page break field, and any change in value begins a new page that contains the sort value in the header. This overrides values set in the related Sort Key Properties frame, for example if the Sort Key Properties window has **Sort Key Header Option** set to **Print on Same Page**, this will be overridden if any of the SortKey Header/Footer functions are selected.