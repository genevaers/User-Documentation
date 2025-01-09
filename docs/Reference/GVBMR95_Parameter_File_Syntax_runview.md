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
You can specify many view numbers with one number per line.  

*view-id*: The view number, integer in the range 1 - 2147483647.  

Example:
```
//RUNVIEWS DD *  
* list of views           
 12230                    
 12231                    
 12232                    
 ```
