# GVBMR95E DD Statements 	

## Input

<style>
table { font-size: 80% }
</style>

  
| ddname | Title | Required? | DSORG | RECFM | LRECL |
|:-|:-|:-|:-|:-|-:|
| EXTRPARM | GVBMR95E Parameter File | No | PS | FB | 80 |
| EXTRTPRM | Trace Parameter File | If TRACE=Y | PS | FB | 80 |
| EXTRENVV | Environment Variable File | No | PS | FB | 80 |
| RUNVIEWS | Run View List | No | PS | FB | 80 |
| MR95VDP  | View Definition Parameters File | Yes | PS | VB | 32756 |
| EXTRLTBL | Extract-Phase Logic Table | Yes | PS | VB | 32756 |
| EXTRREH  | Reference Extract Header File | Yes | PS | FB | 100 |
| REFR*nnn* | Reference-Phase Work File *nnn* | A file is required for every lookup table used in the current set of views | PS | VB | 4144 |
| *User-Defined* | Source Data Files | A file is required for every source file used in the current set of views | PS | *User-Defined* | *User-Defined* |

## Output
  
| ddname | Title | Required? | DSORG | RECFM | LRECL |
|:-|:-|:-|:-|:-|-:|
| EXTRRPT | GVBMR95E Control Report | Yes | PS | VB | 164 |
| EXTRLOG  | GVBMR95E Log File | Yes | PS | VB | 164 |
| EXTRTRAC | GVBMR95E Trace File | If TRACE=Y | PS | VB | 164 |
| EXTRDUMP | Logic Table Dump File | If DUMP_LT_AND_ GENERATED_CODE=Y | PS | VB | 164 |
| EXTR*nnn* | Extract-Phase Work File *nnn* | A file is required for every unique Extract-Phase Work File requested by the current set of views | PS | VB | 8192–32756 |
| SORT*nnn* | SORT Control Statement File *nnn* | A file is required for every unique Extract-Phase Work File requested by the current set of views | PS | VB | 8192–32756 |
| *User-Defined* | Extract-Phase View-Output Files | A file is required for every Extract-Phase View-Output File requested by the current set of views | PS | *User-Defined* | *User-Defined* |

