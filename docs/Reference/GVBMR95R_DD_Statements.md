# GVBMR95R DD Statements 		
  
## Input

<style>
table { font-size: 80% }
</style>

| ddname | Title | Required? | DSORG | RECFM | LRECL |
|:-|:-|:-|:-|:-|-:|
| REFRPARM | GVBMR95R Parameter File | No | PS | FB | 80 |
| REFRTPRM | Trace Parameter File | If TRACE=Y | PS | FB | 80 |
| REFRENVV | Environment Variable File | No | PS | FB | 80 |
| MR95VDP  | View Definition Parameters File | Yes | PS | VB | 32756 |
| REFRLTBL | Reference-Phase Logic Table | Yes | PS | VB | 32756 |
| *User-Defined* | Reference Data Files | A file is required for every lookup table used in the current set of views | PS | *User-Defined* | *User-Defined* |
  
## Output

| ddname | Title | Required? | DSORG | RECFM | LRECL |
|:-|:-|:-|:-|:-|-:|
| REFRRPT | GVBMR95R Control Report | Yes | PS | VB | 164 |
| REFRLOG  | GVBMR95R Log File | Yes | PS | VB | 164 |
| REFRTRAC | GVBMR95R Trace File | If TRACE=Y | PS | VB | 164 |
| REFRDUMP | Logic Table Dump File | If DUMP_LT_AND_ GENERATED_CODE=Y | PS | VB | 164 |
| REFRREH  | Reference Extract Header File | Yes | PS | FB | 100 |
| REFRRTH  | Reference Title Header File | Yes | PS | FB | 100 |
| REFR*nnn* | Reference-Phase Work File *nnn* | A file is required for every lookup table used in the current set of views | PS | VB | 4144 |

