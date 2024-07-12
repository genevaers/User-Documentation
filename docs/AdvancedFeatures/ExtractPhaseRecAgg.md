# Extract-Phase Record Aggregation  

To create summarized outputs the GenevaERS format-phase must be used. Except for producing the Extract File formatted records, the extract-phase typically plays no role in summarization. The one exception is Extract-Phase Record Aggregation or ERA. With ERA, some level of summarization occurs at extract time.

This can have significant benefits if the final summarized output file is relatively small, but the number of event records required to produce it is very large. This reduces the IO required to write all the detailed extract records, and then for the sort utility to read all those records again. This is a common problem where high level summaries are required for initial analysis of results, before investigating greater detail.

Similar to the Format Phase, ERA aggregates numeric column data for records with the same Sort Key values. However, unlike Format Phase processing with multiple column calculations possible, ETS only performs summarization. Multiplication and division of values is not possible in ETS. Also similar to Format Phase processing, resulting alphanumeric columns can be unpredictable.

Use of ERA is specified in the **View Properties** sub-tab **Extract Phase**,**Extract-Phase Record Aggregation** parameter. The view developer specifies the use of ERA. They also specify how many summarized sort keys the Performance Engine should hold in memory during extract time. Only the sort keys for records held in this buffer at any one time are eligible for summarization. When the memory buffer is full records are written to the extract file, hence ERA will not perform full summarization.

Specifying a large number of records may result in greater summarization during the extract phase. However the Performance Engine allocates memory equal to the number of records multiplied by the number of bytes in each extract record multiplied by the number of input partitions (physical files) the view reads. If large buffers are specified, or many views use ERA, the Performance Engine may require substantial amounts of memory.

ERA collapses some records, depending on the buffer size, but complete record sorting and aggregation is assured in the format phase.

Consider the following when setting the ERA buffer size:

- The total number of summarized keys in the output file. ERA is often used for thousands and even tens of thousands of rows. However it is not typically used for hundreds of thousands of rows or more.
- The sort order of the input file. If the sort fields for the view are the same as the sort order of the input Event File, then a buffer size of 1 will result in no duplicates in the extract file. This is because once a row is dumped to the extract file the same key will not appear again in the input file.
- The Extract Phase memory available which will be impacted by
  - The number of views executing in this extract phase
  - The memory required for reference tables by these views
  - ERA Buffer sizes specified in other views
  - Other items, such as the size of the logic table, buffer sizes for input and output files and Common Key Buffering, etc.
