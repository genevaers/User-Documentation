# Tokens overview {#SACTokens .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is a token?](SACTokens.md#10)
-   [20 Example: Token](SACTokens.md#20)
-   [30 What are the components of a token?](SACTokens.md#30)
-   [40 Strengths and weaknesses](SACTokens.md#40)
-   [100 Need this page completed?](SACTokens.md#100)

## 10 What is a token? {#10 .section}

A token is a named memory area. The name is the logical file id number and the logical record id number. The name is used for communication between two or more views.

Tokens save unnecessary input and output. Token reading views are called immediately after the token data is written. If View 1 outputs a disk file and View 2 reads that file, then time is wasted for output from View 1 and input to View 2. If there is token placed between View 1 and View 2, then the records stay in memory, and so there is no time wasted.

![](images/Tokens_Concept_01.gif)

An advantage is that multiple views can read from the same token. Token reader views are called one at a time in the sequence number of the view id number. For example, if View 1 does complex denormalization lookups and writes the results to the token, then all token reader views save the time to perform those lookups. Another advantage is that once the token data is written, the reader views get access immediately, without waiting for a block to be finished.

![](images/Tokens_Multi_Reader_01.gif)

A limitation of tokens is that there is no parallelism - all views run in the same thread. If the reader views need only the data in the token logical record, then consider using a pipe - see topic "**Pipes overview**".

A link to that overview is under **Related concepts** below.

## 20 Example: Token {#20 .section}

This section describes a complex reporting problem, and how a technique called a "token" can provide a solution.

SCENARIO: a hospital want many reports involving patient, diagnosis and treatment records. The data fields in the reports may change at any time in an unpredictable way, depending on the medical issues at the time. The input files and the minimum lookups are shown below.

![](images/PMExtFmt_Token_01.gif)

The solution is a **token**, which is a special type of logical file. The complex lookups required are performed, and relevant data is written in records to the token. Once the token record is written, the reports immediately process that record.

Below are the processing steps for this complex reporting.

![](images/PMExtFmt_Token_02.gif)

## 30 What are the components of a token? {#30 .section}

A token is configured by a physical file of file type **Token**. There is one logical file and at least one logical record associated with that. There must be at least two views: one as a writer view and the other\(s\) as reader view\(s\) for that logical file \(token\).

![](images/Tokens_Components_01.gif)

There can be more than one token in a thread, because the writer view may write more than one type of record. The situation of the writer view creating only one type of token record is called a **Mutually Exclusive Token**. If the writer view can write more than one type of token, this is called a **Non-mutually exclusive token**.

## 40 Strengths and weaknesses {#40 .section}

The strengths of tokens are:

-   Avoid unnecessary output and input of token data.
-   Allows multiple token reader views to benefit from work done by the token writer view.
-   Avoids the overhead of subroutine calls \(which are necessary for common key buffers\).
-   Once token data is written, the reader views gain access immediately \(one reader view at a time\). There is no waiting for a block to be finished.
-   Suits requirement for different logical records to be written to a common format for later processing.
-   Allows all token reader views to access the same set of source file\(s\) as the writer view, which may need be necessary in unusual cases.
-   Maintenance is easier since writer view changes are only made once.

The weakness of tokens are:

-   There is no parallelism - all token reader views run in the same thread.
-   Is less practical when there is a complex relationship between a group of different logical records.

Overall, tokens are best used when the token reader views need access to the same set of source files that the writer view has access to. Tokens may be used in combination with Common Key Buffers.

See also topics "**Common Key Buffer overview**", "**Pipes overview**" and "**Parallelism overview**".

Links to these overviews are under **Related concepts** below.

## 100 Need this page completed? {#100 .section}

The task of completing this page has not yet been scheduled. If you wish to raise its priority, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

