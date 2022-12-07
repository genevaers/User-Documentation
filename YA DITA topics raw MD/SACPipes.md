# Pipes overview {#SACPipes .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a pipe?](SACPipes.md#10)
-   [20 Example of a Pipe](SACPipes.md#20)
-   [30 What are the components of a pipe?](SACPipes.md#30)
-   [40 Strengths and weaknesses](SACPipes.md#40)
-   [100 Need more on this page?](SACPipes.md#100)

## 10 What is a pipe? {#10 .section}

A pipe is a virtual file passed in memory between two or more views. A pipe is defined as a Physical File of type **Pipe** in the SAFR Workbench.

Pipes save unnecessary input and output. If View 1 outputs a disk file and View 2 reads that file, then time is wasted for output from View 1 and input to View 2. If there is a pipe placed between View 1 and View 2, then the records stay in memory, and no time is wasted. The pipe consists of blocks, which group records together.

![](images/Pipes_Concept_01.gif)

Another advantage of pipes is that View 2 runs in parallel to View 1. After View 1 has finished writing block 1 of records to the pipe, View 2 can process block 1 at the same time that View 1 is preparing block 2. This advantage is part of parallelism, which improves SAFR performance. Without this, View 2 would have to wait until all of View 1 is complete.

Another way of describing this parallelism is that View 1 is in a different thread to View 2.

![](images/Pipes_Parallel_01.gif)

Another advantage is that multiple views can read from the same pipe at the same time. All the reader views can read block 1 once the writer view has finished writing all records to block 1. Hence, if View 1 does a complex lookup and writes the results to the pipe, then all the reader views save the time to perform that lookup. All the reader views are in the same thread \(shown as Thread 2 below\), which is different form the thread of the writer view \(shown as Thread 1 below\). This is the parallelism advantage discussed above.

The parallelism advantage is the reason pipes are encouraged to improve SAFR performance.

![](images/Pipes_Multi_Reader_01.gif)

A limitation of pipes is that the only data the reader views can see is in the pipe. The reader views do not \(automatically\) have access to the source files of View 1. If the reader views require this access, then consider using a token - see topic "**Tokens overview**".

A link to that overview is under **Related concepts** below.

## 20 Example of a Pipe {#20 .section}

SCENARIO: one sales file produces at least six reports, and the reports require data from other files. The Sales file has only ID numbers for products and customers for example, and the actual product names, product category names, customer names and customer category names are required.

![](images/PMExtFmt_Pipe_01.gif)

The solution is a **pipe**, which is a special type of logical file that has a single physical file. The complex lookups required are performed, and relevant data is written in records to the pipe. The reports read the pipe records, and generate the reports while new pipe records are still being written.

Below are the processing steps for this complex reporting.

![](images/PMExtFmt_Pipe_02.gif)

## 30 What are the components of a pipe? {#30 .section}

A pipe is configured by a physical file of file type **Pipe**. There is one logical file and at least one logical record associated with that. There must be one writer view. There may be zero or one or more reader view\(s\) for that logical file \(pipe\).

![](images/Pipes_Components_01.gif)

Pipes should be tested initially by using a disk file. Check the disk file after the views have run to verify the writer has produced the correct data. Only after the writer and reader views are tested thoroughly using a disk file should a pipe be used.

## 40 Strengths and weaknesses {#40 .section}

The strengths of pipes are:

-   Avoid unnecessary output and input of pipe data.
-   Allows multiple reader views to run in parallel to writer view - which is an example of parallelism.
-   Avoids the overhead of subroutine calls \(which are necessary for common key buffers\).
-   Suits requirement for different logical records to be written to a common format for later processing.
-   Creates an environment similar to many software applications: the writer view is a "driver" and the reader views respond to data received.
-   Maintenance is easier since writer view changes are only made once.

The weakness of pipes are:

-   Reader views can only see the pipe data, not any original source files used by the writer view.
-   Requires that reader views are independent \(asynchronous\) compared to the writer view.
-   Is less practical when there is a complex relationship between a group of different logical records.

Overall, pipes are encouraged when performance is critical and it is possible to use pipes. Pipes may be used in combination with Common Key Buffers.

See also topics "**Common Key Buffer overview**" and "**Tokens overview**" and "**Parallelism overview**".

Links to these overviews are under **Related concepts** below.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

