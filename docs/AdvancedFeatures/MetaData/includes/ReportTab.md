### Report page layout 

Select the **View Properties** sub-tab **Report**.  

1) In the **Details** section you can configure the page size of the report. Note that the width depends upon the tools that will be used for display or printing; this is typically 80 to 255 characters.

- **Lines Per Page** The number of lines per page for the output report. An integer between 0 and 999999999. This field is 60 by default.  
- **Report Width** The width of the output report. This field is 132 by default and can be changed to any integer between 0 and 999999999.

2) In the **Header/Footer** section you can define fields to insert into the header and footer of the report pages. Report headings can be entered as a combination of text constants and variable values. The variable values, or functions, are predefined keywords. The most common keywords (Date, Time, Page Number, and View ID) are available as buttons, and many others are available in the drop-down list.  
   
To add a function to the header or footer:
- Click in the section where you want to add the function, for example, **Footer** > **Right Selection**
- Click the function button you require, for example, **Page** to insert the page number, or
- Select a function from the drop down list, then click the **Insert** button.

![Report tab example](../../images/CreateReportHdr2.png)  


&Company name - taken from control record

&ProcessDate - VDP date ??

&RunDate - Date job run

Sort key label / title / value - for up to 5 sort keys