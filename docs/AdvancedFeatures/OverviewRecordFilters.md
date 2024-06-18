{: .no_toc}
# Record Filters

TABLE OF CONTENTS 
1. TOC
{:toc}  


Record filters can be used to filter input records at extract-phase time, and output records at format-phase time, using functions like SELECTIF() and SKIPIF(). Record filters are optional. 

## Extract-Phase Record Filter

The function of the Extract-Phase Record Filter is to include or exclude source records, based upon specific criteria. The criteria is specified using logic text.

Specifically, this logic text changes the **records selected for processing** in the extract phase of the Performance Engine. The records selected during this phase are the **input records** for processing the view(s) in that run of the Performance Engine.

Extract-Phase Record Filter logic text is performed at the start of the extract phase processing for each view.

### Statements for selecting input files

The overall idea is that your logic text describes how to select or skip, but not both.

|Choice for logic text|Notes|
|---------------------|-----|
|One SELECTIF statement|A SELECTIF statement gives a condition for selecting input records. Skip any records that do no meet the condition.|
|One SKIPIF statement|A SKIPIF statement gives a condition for skipping input records. Select any records that do not meet the condition.|
|One IF statement using only SELECT statements|One IF statement can contain a SELECT statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SELECT statements or IF statements, and the whole thing still counts as one IF statement. Skip any records that do not qualify for a SELECT somewhere in the IF statement. No actual SKIP statements are allowed.|
|One IF statement using only SKIP statements|One IF statement can contain a SKIP statement for the THEN or ELSE cases. Alternatively, the THEN or ELSE cases might contain other IF statements that also has SKIP statements or IF statements, and the whole thing still counts as one IF statement. Select any records that do not qualify for a SKIP somewhere in the IF statement. No actual SELECT statements are allowed.|

### Logic text syntax and examples

How to create logic text for an Extract-Phase Record Filter is described in [Create record filters.](./MetaData/CreateRecordFilters.md)

The syntax of this logic text and examples are described in the Reference section [Workbench Logic Text - Extract-Phase Record Filter](../Reference/Workbench/LogicTextERFStatements.md)


## Format-Phase Record Filter

The function of the Format-Phase Record Filter is to select or skip output records for a view.

Specifically, this logic text changes the **records selected for output** in the format phase of the Performance Engine. The format phase is optional, because the extract phase may be sufficient to produce the results of that view.

The format phase performs record filtering as the last step before writing to the output file. It works against aggregated records if the view summarizes records. Otherwise it works against detailed records.

### Logic text syntax and examples

How to create logic text for a Format-Phase Record Filter is described in [Create record filters.](./MetaData/CreateRecordFilters.md)

The syntax of this logic text and examples are described in the Reference section [Workbench Logic Text - Format-Phase Record Filter](../Reference/Workbench/LogicTextFRFStatements.md)
