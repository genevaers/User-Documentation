# GVBMR88 DD Statements  
  
## Input

<style>
table { font-size: 80% }
</style>

| ddname         | Title                             | Required?              | DSORG | RECFM | LRECL |
| :-             | :-                                | :-                     | :-    | :-    | -:    | 
| MR88PARM       | GVBMR88 Parameter File            | No                     | PS    | FB    | 80    |
| MR88VDP        | View Definition Parameters File   | Yes                    | PS    | VB    | 32756 |
| SORTIN         | Extract-Phase Work File *(1)* | If SORT_EXTRACT_FILE=Y | PS    | VB    | 8192-32756 |
| SYSIN          | SORT Control Statement File *(2)* | If SORT_EXTRACT_FILE=Y | PS    | FB    | 80    |
| MR88HXE        | Extract-Phase Work File           | If SORT_EXTRACT_FILE=N | PS    | VB    | 8192-32756 |
| REFRRTH        | Reference Title Header File       | Yes                    | PS    | FB    | 100     |
| REFR*nnn*      | Reference-Phase Work File *nnn*   | A file is required for every work file created in the Reference Phase.           | PS    | VB    | 4144       |

Notes:  
*(1)*: The Extract-Phase Work Files are written by GVBMR95E to ddname EXTR*nnn*  
*(2)*: The control statements are written by GVBMR95E to ddname SORT*nnn* 

## Output

| ddname         | Title                             | Required?              | DSORG | RECFM | LRECL |
| :-             | :-                                | :-                     | :-    | :-    | -:    | 
| MR88RPT        | GVBMR88 Control Report            | Yes                    | PS    | VB    | 164    |
| MR88LOG        | GVBMR88 Log File                  | Yes                    | PS    | VB    | 164 |
| SYSOUT         | SORT Message File                 | If SORT_EXTRACT_FILE=Y | PS    | VB    | 164 |
| *User-Defined* | Format-Phase View-Output files    | A file is required for every view in the Extract-Phase Work File.           | PS    | *User-Defined* | *User-Defined* |
  
