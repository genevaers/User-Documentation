{: .no_toc}
# GVBMR95 Parameter File Syntax

# RUNVIEWS file  
<pre>
     ┌─────────────┐
     ▼             │
►►─────┬─────────┬─┴───────────────────────────────────────────────────────────►◄ 
       └─<i>view-id</i>─┘                      
</pre>
  
You can choose to run a subset of views from the VDP. This feature is useful for testing.

*view-id*: The view number, integer in the range 1 - 2147483647.  
You can specify many view numbers with one number per line.