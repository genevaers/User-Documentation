---
layout: default
title: "GVBVDPNL Parameter File Syntax"
parent: 55 Run Control Utilities
nav_order: 7
---

# GVBVDPNL Parameter File Syntax 
  
### Format: VDPNPARM file
<pre>
     ┌─COMPARE=N─┐
►►───┼───────────┼──────────────────────────────────────────────────────────────► 
     └─COMPARE=Y─┘
  
     ┌─FM_TEMPLATES=N─┐ 
►────┼────────────────┼─────────────────────────────────────────────────────────► 
     └─FM_TEMPLATES=Y─┘

►────┤ metadata-filtering options ├─────────────────────────────────────────────►
   
     ┌────────────────────────────┐ 
     ▼                            │ 
►──────┤ field-inclusion option ├─┴────────────────────────────────────────────►◄ 
</pre>
### metadata-filtering options:
<pre>
     ┌─VIEW_IDS=ALL──────────┐                                                    
├────┼───────────────────────┼──────────────────────────────────────────────────► 
     │           ┌─,───────┐ │                                                    
     │           ▼         │ │                                                    
     └─VIEW_IDS=───<i>view-id</i>─┴─┘                                                    
                                                                                   
     ┌─LR_IDS=ALL────────┐                                                        
►────┼───────────────────┼──────────────────────────────────────────────────────► 
     │         ┌─,─────┐ │                                                        
     │         ▼       │ │                                                        
     └─LR_IDS=───<i>lr-id</i>─┴─┘                                                        
                                                                                   
     ┌─LP_IDS=ALL────────┐                                                        
►────┼───────────────────┼──────────────────────────────────────────────────────► 
     │         ┌─,─────┐ │                                                        
     │         ▼       │ │                                                        
     └─LP_IDS=───<i>lp-id</i>─┴─┘                                                        
                                                                                   
     ┌─LF_IDS=ALL────────┐                                                        
►────┼───────────────────┼──────────────────────────────────────────────────────► 
     │         ┌─,─────┐ │                                                        
     │         ▼       │ │                                                        
     └─LF_IDS=───<i>lf-id</i>─┴─┘                                                        
                                                                                   
     ┌─PF_IDS=ALL────────┐                                                        
►────┼───────────────────┼──────────────────────────────────────────────────────► 
     │         ┌─,─────┐ │                                                        
     │         ▼       │ │                                                        
     └─PF_IDS=───<i>pf-id</i>─┴─┘                                                        
                                                                                   
     ┌─EXIT_IDS=ALL──────────┐                                                    
►────┼───────────────────────┼──────────────────────────────────────────────────► 
     │           ┌─,───────┐ │                                                    
     │           ▼         │ │                                                    
     └─EXIT_IDS=───<i>exit-id</i>─┴─┘                                                    
                                                                                  
     ┌─CREC_IDS=ALL──────────┐                                                    
►────┼───────────────────────┼──────────────────────────────────────────────────┤ 
     │           ┌─,───────┐ │                                                    
     │           ▼         │ │                                                    
     └─CREC_IDS=───<i>crec-id</i>─┴─┘                                                    
</pre>
### field-inclusion option:
<pre>
     ┌─<i>field-name=B</i>──────────┐                                                    
├────┼───────────────────────┼──────────────────────────────────────────────────┤ 
     ├─<i>field-name=C</i>──────────┤                                                    
     ├─<i>field-name=D</i>──────────┤                                                    
     └─<i>field-name=E</i>──────────┘                                                    
</pre>
Note: *`field-name`* must be one of the following: 
<pre>
CREC_BEGIN
CREC_END
CREC_FISCAL
CREC_ID
CREC_MAX_FILE
CREC_NAME
EXIT_EXEC
EXIT_ID
EXIT_LANG
EXIT_NAME
EXIT_OPT
EXIT_PATH
EXIT_TYPE
LF_ID
LF_NAME
LP_CONST
LP_CONST_LEN
LP_DATE
LP_DPS
LP_DTYPE
LP_ID
LP_KEY_LEN
LP_KEY_TYPE
LP_LR
LP_LR_FIELD
LP_NAME
LP_SCALE
LP_SIGNED
LP_SRC_LR
LP_SYM
LP_TRG_LF
LP_TRG_LR
LP_VAL
LP_VAL_LEN
LR_FLD_ALIGN
LR_FLD_COLNAME
LR_FLD_DPS
LR_FLD_EFFDATE
LR_FLD_FORMAT
LR_FLD_ID
LR_FLD_KEY
LR_FLD_LEN
LR_FLD_MASK
LR_FLD_NAME
LR_FLD_OFFSET
LR_FLD_ORDINAL
LR_FLD_POS
LR_FLD_SCALE
LR_FLD_SIGNED
LR_FLD_TYPE
LR_ID
LR_LKP_EXIT
LR_LKP_PARMS
LR_NAME
LR_STATUS
LR_TYPE
PF_ACCESS
PF_BLKSIZE
PF_CONN
PF_DD
PF_DEV_TYPE
PF_DSCB
PF_DSORG
PF_EXP_DT
PF_ID
PF_IN_DD
PF_IN_DSN
PF_LRECL
PF_MAX_RCLEN
PF_NAME
PF_NULLS
PF_OPTCD
PF_OUT_DD
PF_OUT_DSN
PF_PRM_QTY
PF_RCLEN
PF_RD_DISP
PF_READ_EXIT
PF_READ_PARMS
PF_RECFM
PF_RETN
PF_ROW
PF_SCND_QTY
PF_SQL
PF_SYSOUT
PF_TABLE
PF_TYPE
PF_UNIT
PF_WR_DISP
VIEW_AGGREGATION
VIEW_AGGREGATION_LEVEL
VIEW_BUFF_SIZE
VIEW_COL_ALIGN
VIEW_COL_CALC
VIEW_COL_DATA_TYPE
VIEW_COL_DPS
VIEW_COL_EXTAREA
VIEW_COL_FRMT
VIEW_COL_HDR_ALIGN
VIEW_COL_ID
VIEW_COL_LEN
VIEW_COL_LKP
VIEW_COL_LKP_FIELD
VIEW_COL_LKP_LR
VIEW_COL_LOGIC
VIEW_COL_LOGIC_TEXT
VIEW_COL_MASK
VIEW_COL_NAME
VIEW_COL_ORD_POS
VIEW_COL_SCALE
VIEW_COL_SIGN
VIEW_COL_SPACES
VIEW_COL_SRC_FIELD
VIEW_COL_SRC_ID
VIEW_COL_SRC_TYPE
VIEW_COL_SRC_VAL
VIEW_COL_STRT_POS
VIEW_COL_VISIBLE
VIEW_CR
VIEW_ERROR
VIEW_EXIT
VIEW_EXIT_PARMS
VIEW_EXTR_NUM
VIEW_FLD_DELIM
VIEW_FOLDER_ID
VIEW_FOOTER_CENTRE
VIEW_FOOTER_LEFT
VIEW_FOOTER_RIGHT
VIEW_FORMAT_REC_FILTER
VIEW_FRMT_EXIT
VIEW_FRMT_EXIT_PARMS
VIEW_FRMT_OUT_LIMIT
VIEW_GRP_AGG_FUNC
VIEW_HEADER_CENTRE
VIEW_HEADER_LEFT
VIEW_HEADER_RIGHT
VIEW_HEADING1
VIEW_HEADING2
VIEW_HEADING3
VIEW_ID
VIEW_LOGIC_ID
VIEW_LOGIC_NAME
VIEW_NAME
VIEW_OUT_FRMT
VIEW_OUT_LF
VIEW_OUT_LIMIT
VIEW_OUT_PF
VIEW_PAGE_LINES
VIEW_PHASE
VIEW_REC_AGG_FUNC
VIEW_SORT_DATA_TYPE
VIEW_SORT_DISP_MODE
VIEW_SORT_DPS
VIEW_SORT_FOOTER
VIEW_SORT_FOOTER_OPT
VIEW_SORT_FORMAT
VIEW_SORT_HEADER_OPT
VIEW_SORT_ID
VIEW_SORT_LABEL
VIEW_SORT_LEN
VIEW_SORT_NUM
VIEW_SORT_SEQ
VIEW_SORT_SIGNED
VIEW_SORT_TITLE_EFF_DT
VIEW_SORT_TITLE_EFFTYPE
VIEW_SORT_TITLE_FIELD
VIEW_SORT_TITLE_LEN
VIEW_SORT_TITLE_SRC
VIEW_SRC_ID
VIEW_SRC_LF
VIEW_SRC_LR
VIEW_SRC_REC_FILTER
VIEW_STATUS
VIEW_STR_DELIM
VIEW_TRUNC
VIEW_WIDTH
</pre>