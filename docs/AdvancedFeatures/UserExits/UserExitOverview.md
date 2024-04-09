# Chapter -- Exits 

As we discussed in chapter "Sort User Exits", exits are a common concept
that allows software products to call custom coded programs at specific
points to perform functions the tool itself does not do.

SAFR has four major points which can invoke a user exit. The first three
are Extract Phase exits, and are used much more frequently than the
Format Phase exit. They are:

-   Read Exits, which present event file records to SAFR threads for
    processing. It is associated with an event LR and the RENX logic
    table function, and is called for each time the event LR records in
    the input buffer have been processed.

-   Lookup Exits, which accept join parameters and return looked up
    records in response to individual joins. These exits can also be
    used as simple function calls. It is associated with a lookup LR and
    a LUEX logic table function (rather than a LUSM which searches the
    RED data), and is called each time a join to that LR is required.

-   Write Exits, which accept extract records and can manipulate them
    before being written to extract files. It is associated with a view,
    since the view or a write statement within a view and the WREX logic
    table function (rather than WRIN, WRDT, or WRSU functions) and
    creates the extract record [^1]

-   Format Exits, the only GVBMR88 exit which accept summarized and
    formatted Format Phase output records prior to being written to
    files. It is associated with a view that is assigned to the Format
    Phase. Format exits are very similar to write exits, except that the
    record being dealt with is the final output record, rather than the
    extract record. Because of its infrequent use, we won't describe
    this exit in any more detail here.

### Read Exits {#read-exits .unnumbered}

The first read exit I wrote read the SAFR Field Definition file and
calculated the start position of each field based upon the lengths of
the prior fields in the file, a field not stored on the file. It would
detect a change in the logical record for the fields, and start the
running position over at 0. This allowed SAFR to produce reports of its
own metadata.

I wrote this exit because this isn't a function well suited to SAFR.
SAFR doesn't do many functions that carry values from one record to the
next. And it doesn't do *any* functions where the next record in the
file determines if the current record should be written. SAFR is built
for business event processing. It doesn't do what I would call "set
processes" very easily which require evaluating a set of records.

I created a logical record which matched the *output* from the read
exit. That output was the 20 fields or so on Field Definition file, plus
my one new field. SAFR knows nothing about the input to the read exit.
For all SAFR knew, my exit could have read 10 different files and
combined them all together to make an event file. It could have added 19
of the fields on to the field before passing it on to SAFR.

The read exit emulates an access method; in other words instead of SAFR
calling the system BSAM access method to get data from disk, it calls
the program name specified. This means that the program must return the
results that an access method would return. Remember that access methods
that read from disks don't know about the actual length of the data
records processed by the program. Rather their record lengths are
blocks.

My read exit read (using a the standard QSAM access method) and
manipulated one Field Definition record at a time. I could have definite
my file to SAFR as if the block size was the length of one of my field
definition records, perhaps 50 bytes in length. The block size would
equal the Logical Record Length (LRECL). However, this meant that SAFR
would be calling my exit each time a new record was needed. The overhead
for calling a subprogram is very high. SAFR has to save its register
values before calling, and then they have to be restored before going
back. This CPU time can really add up on a large file.

Thus a more efficient method is for the read exit to process many Field
Definition records as if they had come from disk as one block, and then
returning to SAFR. SAFR will parse the individual records according to
the Logical Record Length, and only return to the read exit when a new
"block" of data is needed.

This process can make a read exit quite complex.

### Look-up Exits {#look-up-exits .unnumbered}

Look-up exits are probably the easiest to create. This is because they
accept a set of parameters and return a record. The parameters passed to
the lookup exit are whatever values are placed in the fields of the join
key. These can be constants, fields from the event file, or fields from
another lookup, including calls to other exits. The output from the
lookup exit is a record that must match the LR for the "reference file"
record it is to return. Although it appears to a SAFR developer as if
SAFR has taken the keys and performed a search of a reference table to
find the appropriate record, the exit may have done no such thing. In
fact, it could do something as simple as reordering the fields passed to
it and returning the record.

I think the first lookup exit I wrote kept a copy of the key it had been
passed in the last call, and compared the key from the current call with
that key. If the keys were the same, then it returned a "not found"
condition. If they were different, it returned a "found" condition. I
then called this exit in multiple views, and coded the selection logic
to only include found records.

This allowed me to only select the event record once no matter what
views it qualified for. Lookup exits have been written to perform math
calculations that SAFR didn't do natively. In fact, before SAFR had
extract time calculations, a generalized user exit allowed passing two
numbers and an operator. The resulting record contained the results of
the math. Many SAFR functions have first appeared as user exits, and
were later folded into the main code base.

### Write Exits {#write-exits .unnumbered}

Extract exits are called whenever a view is to write an extract record.
The write exit is passed the extract record, and the event record. It
can evaluate these records and determine if it was to

-   Tell SAFR to write a record the exit specifies (could be any record)
    and continue with event file processing.

-   Tell SAFR to skip this extract record and go on

-   Tell SAFR to write a record the exit specifies (could be any record)
    and return to the exit to do more processing.

The exit can manipulate the exit record; substitute a new record, table
the extract record in some way and then dump the table at the end of
event file processing, or any other number of things. Note, though, that
unlike read exits which do open and actually read files, write exits
typically do not. They return records to SAFR to write to the extract
file. They could do their own IO, but there is typically no benefit to
doing so. SAFR's write routines are very efficient.

Write exits are in between read and lookup exits for complexity. This is
mainly because of the complexity of dealing with extract records. The
exit must know what the extract record will look like for a particular
view. This might be easiest to determine by actually writing the view,
and inspecting the extracted records to find positions and lengths. Any
changes in the views can create a new to update the write exit. Write
exits outputs have nothing to do with LRs.

Extract time summarization made its first appearance as a write exit.
The exit was called on each extract record. The exit allocated its own
memory space, and built a stack of summarized event records. Only if the
extract record cause the exit to overflow the stack did the exit tell
SAFR to write a record. When the thread has finished processing, on the
last call to the write exit, the write exit would loop through the stack
and instruct SAFR to write each record in the stake and return to it for
additional processing.

### Other Features {#other-features .unnumbered}

In addition to the above passed parameters, each exit receives a set of
static parameters that do not change throughout event file processing.
These can be used to further generalize an exit.

For example, I created the small lookup exit I described above accepted
a set of static parameters that described how long the passed key was
from the join. It would use this length to determine what length of data
to store and compare. In this way, this same exit could be used on
multiple a joins with different keys, from 5 bytes to 50 bytes,
regardless of whether the key was composed of 1 field or 50. This same
approach was used by the calculation exit so that it could work with
different sizes of numbers being passed to it.

Using this generalization approach has allowed the team to create a few
number of exits that can be used many different times.

Each exit is called once before event file processing begins so it can
initialize memory and set up shop. They are also called one time after
event file processing is complete to perform clean up. The purpose of
these calls are indicated to the exit through a status code.

The following picture shows all the logic table codes, including those
for exits, tokens, and extract time calculations.

![](media/image1.emf)

[^1]: Although technically not a SAFR user exit, one could write a sort
    read exit to manipulate the sort input file in extract file format,
    but the same data would be available to the write exit, so I can't
    conceive of a reason to do so other than the GVBSR01 and 2 sort
    exits already described.
