# How many SAFR passes will there be? {#SARFaq4SAFRPasses .reference}

## Detailed question { .section}

The "Advanced SAFR Training" slides say "SAFR extracts with high parallelism may use too many system resources". Keywords like DISKTHRDS and TAPETHRDS are also mentioned. Does this mean multiple SAFR passes, depending on the number and complexity of the user-created views?

## Answer { .section}

There is no theoretical limit to the number of MVS sub-tasks that SAFR can spawn to resolve the current query workload \(e.g. SAFR has executed 500 simultaneously before\), but at some point SAFR's work can tend to crowd out other work on the mainframe. Some SAFR customers solve this problem by assigning SAFR to a separate WLM service class which has a lower priority. SAFR will then take longer to execute, but at least then it would have no impact on online systems. In fact, depending on the service level requirements for a reporting application, having a low-priority SAFR process running in background may be a good way to use CPU cycles that otherwise may have gone to waste.

SAFR provides the DISKTHRDS and TAPETHRDS parameters as "governors" to prevent SAFR from spawning too many tasks in parallel. One SAFR customer sets DISKTHRDS to 40 so that their other workloads can complete in a reasonable amount of time. Additional sub-tasks in the SAFR job just queue up until the earlier sub-tasks are finished. If no governors are set either in SAFR or in WLM, SAFR will make good use of all available processors, I/O channels, and memory, to the exclusion of other processes. This may be appropriate when you have a very tight batch window and other processes are lower priority than the reporting workload SAFR is executing.

Applications can have multiple SAFR "passes" but usually this is due to limitations on the availability of application data, not on the complexity of the queries. Occasionally one SAFR pass performs some transformation \(such as a sort\) on data that is used for lookups in a subsequent SAFR pass. Over the years my IBM SAFR team has figured out several ways to avoid executing extra passes of the data.

**Parent topic:**[FAQ](../html/SARFaq0.md)

