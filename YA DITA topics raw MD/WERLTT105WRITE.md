# Examples: WRITE statements {#WERLTT105WRITE .reference}

## Examples: WRITE in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
' This WRITE statement is before
' any SELECT or SKIP.
WRITE (SOURCE = INPUT,
       USEREXIT = {Backup} )
```

|This WRITE sends all input records to the UserExit Routine called Backup.|
| | |
|```
' This WRITE statement is before
' any SELECT or SKIP.
WRITE (SOURCE = INPUT,
       USEREXIT = {Decryption} )
```

|This WRITE decrypts all input records and puts the results "in place" so that the input records are processed later in the extract phase.|
| | |
|```
SELECTIF ( {product_code}
            = "ABC" )
WRITE (SOURCE = INPUT,
       DEST = FILE = {All_ABC} )
```

|The WRITE sends only input records with product\_code = "ABC" to the logical file "All\_ABC".|
| | |
|```
IF ( {product_code} = "ABC" )
   THEN SELECT
ENDIF
WRITE (SOURCE = INPUT,
       DEST = FILE = {All_ABC} )
 
```

|This example has the same effect as the previous example. Ensure the IF statement is purely for SELECT statements only.|

**Parent topic:**[Logic text 1: Extract Record Filter](../html/WERLTT100ERecFilter.md)

