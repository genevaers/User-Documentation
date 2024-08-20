{: .no_toc}
# Create Summary View

TABLE OF CONTENTS 
1. TOC
{:toc}  

## Create a summary view - Fixed-Width Field output, no aggregation

### Add new view definition

1. Select **Administration** > **New** > **View** from the menu.  

{% include ViewToggle.md %}

The first screen presented is the View Properties screen, which contains the sub-tab **General**.

1. In the **Name** field  type a descriptive name.
2. In the **Control Record** field select the control record.
3. Select the **Default Output Format** required. This will affect the other sub-tabs available to you. For this case, a summary view with column defined output, select **Format-Phase Output** > **Fixed-Width Fields**.
4. You can select an output LR to pre-define columns by using **Create View based on Output Logical Record**.  This option is only available before the first save. It could be useful if the output of this view is to become the source of another view via a pipe or a token.  
![View Properties General Tab](../../images/CreateViewSumNoAggr.png)  
5. Select the **View Properties** sub-tab **Format Phase**, and click   
**Format-Phase Record Aggregation (FRA)** > **Do not aggregate records**.  
Note: This is the default setting.
6. Save the view **File** > **Save**  
When you save a new view, the view ID is assigned by the Workbench and is not editable.

![View Properties Format Phase tab.](../../images/CreateViewFormatTab.png)  

Other options on the Format Phase tab and the Extract Phase tab are described in sections below.

<!-- View Source specification description -->

{% include_relative includes/AddViewSource.md %}  

<!-- COLUMN specification description -->
{% include_relative includes/AddColumns.md %}  

<!-- Format-Phase Column Logic -->
{% include_relative includes/FormatColumnLogic.md %}  

<!-- Sort key specification description -->
{% include_relative includes/AddSortKeys.md %}  

![View Editor add sort key](../../images/CreateViewFormatCols.png)

<!-- Output destinations description -->
{% include_relative includes/AddFormatDest.md %}  

<!-- Define filters links -->
{% include_relative includes/AddFilters.md %}  

### Extract Phase tab options

Select the **View Properties** sub-tab **Extract Phase**.  

1) You have the option to limit the number of output records written with the **Extract-Phase Output Limit**.  
- Select **Write all eligible records** to ensure that all eligible records are output. This button is selected by default.  
- Select **Stop Extract-Phase processing for this view after *n* records are written** to stop the processing of this view after *n* records are written. The *n* value is a positive integer up to 9 digits. The default for the *n* value is 100.

2) **File Number** is used to manage the intermediate extract file name. See [Output destinations](#output-destinations) for more details. The default is 0.

### Additional Format Phase tab options

Select the **View Properties** sub-tab **Format Phase**.  

![Format Phase sub-tab](../../images/CreateViewFormatTab2.png)  

The **Output File** option is described in [Output destinations](#output-destinations) above.

You have the option to specify a **User-Exit routine** to be called during the format phase:
- Select **Format User-Exit Routine** > **Name**  
Select a User-Exit Routine from the drop down list. All the routines
are of type Format. Sort the list by clicking on "id" or "name" in the header of the list. Reverse the sort order by clicking again on "id" or "name" in the header. 
- Select **Parameters** to specify input data for the user-exit routine. This can be up to 32 characters.

You have the option to limit the number of output records written with the **Format-Phase Output Limit**.
- Select **Write all eligible records** to ensure that all eligible records are output. This button is selected by default.  
- Select **Stop Format-Phase processing for this view after *n* records are written** to stop the processing of this view after *n* records are written. The *n* value is a positive integer up to 9 digits. The default for the *n* value is 100.

The **Format-Phase Record Filter** option is described in [Define filters](#define-filters) above.

To avoid output of records with zero in all numeric fields, tick the **Zero-value Record Suppression** box.

<!-- Activate view description -->
{% include_relative includes/ViewActivation.md %}  
