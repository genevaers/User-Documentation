# How to read the syntax diagrams

The following structures are used in describing the syntax of GenevaERS program control statements and the GenevaERS logic text language.    

- Read the syntax diagrams from left to right, from top to bottom, following the path of the line.  
  - The `►►──` symbol indicates the beginning of a command.  
  - The `───►` symbol indicates that the command syntax is continued on the next line.
  - The `◄───` symbol indicates that a command is continued from the preceding line.  
  - The `──►◄` symbol indicates the end of a command.  
  
     
- Required items appear on the horizontal line (main path).
<pre>
<i>    ►►──required_item──────────────────────────────────────────────►◄</i>
</pre>
- Optional items appear below the main path.
<pre>
<i>    ►►──required_item──┬───────────────┬───────────────────────────►◄</i>
<i>                       └─optional_item─┘</i>   
</pre>
- If an optional item appears above the main path, that item has no effect on the
execution of the statement and is used only for readability.
<pre>
<i>                       ┌─optional_item─┐</i>   
<i>    ►►──required_item──┴───────────────┴───────────────────────────►◄</i>
</pre>

- If you can choose from two or more items, they appear in a vertical stack.
  
- If you *must* choose one of the items, one item of the stack appears on the main path.
<pre>
<i>    ►►──required_item──┬─required_choice2─┬────────────────────────►◄</i>
<i>                       └─required_choice2─┘</i>   
</pre>
- If choosing one of the items is optional, the entire stack appears below the main path.
<pre>
<i>    ►►──required_item──┬──────────────────┬────────────────────────►◄</i>
<i>                       ├─optional_choice1─┤</i>
<i>                       └─optional_choice2─┘</i>   
</pre>
- If one of the optional items is the default, it appears above the main path and the remaining choices are shown below.
<pre>
<i>                       ┌─default_choice1──┐</i>   
<i>    ►►──required_item──┼──────────────────┼────────────────────────►◄</i>
<i>                       ├─optional_choice2─┤</i>   
<i>                       └─optional_choice3─┘</i>   
</pre>
- An arrow returning to the left, above the main line, indicates an item that can be repeated.
<pre>
<i>                       ┌─────────────────┐</i>   
<i>                       ▼                 │</i>   
<i>    ►►──required_item────repeatable_item─┴─────────────────────────►◄</i>
</pre>
- If the repeat arrow contains a comma, you must separate repeated items with a comma.
<pre>
<i>                       ┌─,───────────────┐</i>   
<i>                       ▼                 │</i>   
<i>    ►►──required_item────repeatable_item─┴─────────────────────────►◄</i>
</pre>
- A repeat arrow above a stack indicates that you can repeat the items in the stack.
     
- Sometimes, for readability, a diagram must be split into fragments. The syntax fragment is shown separately from the main syntax diagram, but the contents of the fragment should be read as if they are on the main path of the diagram.
  
<pre>
<i>    ►►──required_item</i>──┤ fragment-name ├───────────────────────────►◄
    
<b>    fragment-name:</b>

<i>    ├───required_item──┬───────────────┬────────────────────────────┤</i>
<i>                       └─optional_item─┘</i>   
</pre>
  
- Keywords appear in uppercase (for example, FILE). Keywords must be spelled exactly as shown. 

- Variables appear in all lowercase letters (for example, *field-name*). They represent user-supplied names or values.
  
- If punctuation marks, parentheses, arithmetic operators, or other such symbols are shown, you must enter them as part of the syntax.



