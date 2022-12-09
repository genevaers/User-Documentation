# Examples: WRITE statements {#WERLTT203WRITE .reference}

## Examples: IF with WRITE in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (ISNUMERIC({field4}) AND
   ({field5} > {field6} * 10) AND
   (ISNOTSPACES{field7} 
   THEN WRITE (SOURCE=DATA,
               USEREXIT={DB2_Update})
ENDIF 
```

|If field4 is numeric and field5 is greater than field6 times 10 and field7 is not spaces, then call the user-exit routine DB2\_Update for the columns up to the current point. This effectively does a writes to a DB2 table the columns in that record up to the current point.|
| | |
|```
IF (ISNOTNULL({field3}) AND
   ({field2} = {field1} + {field5}
   THEN WRITE (SOURCE=INPUT,
               DEST=FILE=
                  {LogicalFile3})
ENDIF 
```

|If field3 is not nulls and field2 equals field1 plus field 5 then write the entire input record to LogicalFile3. All columns in the input record are included, no matter what column contains this logic text.|
| | |
|```
IF (DAYSBETWEEN({field12},{field15})
     > 10) AND
   (ISFOUND({Lookup3;$SYM="A"}))
   THEN WRITE (SOURCE=VIEW,
               DEST=EXT=03)
ENDIF 
```

|If field12 and field15 are more than 10 days apart and the lookup path Lookup3 works with symbol SYM set to "A", then write the columns up to the current point to extract work file \(EXT\) 3. This assumes that the control record for this environment has a Maximum Extract File Number that is at least 3, or any overwrite of the VDP has also set this parameter to at least 3.|

**Parent topic:**[Logic text 2: Extract Column Assignment](../html/WERLTT200EColAssign.md)

