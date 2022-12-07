# How many processes per address space? {#SARFaq5Processes .reference}

Typically, SAFR executes everything in one address space, no matter how many processes, tables, or lookups. Usually, the more processes SAFR has, the better the economies of scale and the cheaper each output becomes. Because each process \(MVS sub-task\) is associated with a separate partition of source data, the more processes that can make use of the shared tables in memory, the better. And the more queries you have, the cheaper each query becomes. Once you've taken the hit for preprocessing the lookup data, the difference between 40 and 41 queries is negligible.

**Parent topic:**[FAQ](../html/SARFaq0.md)

