# Syntax: function PRIOR {#WERLTSFPrior .reference}

## How do I use PRIOR? { .section}

PRIOR means the previous input record. For any input record, you can compare the current value of a field with the value in the previous record.

PRIOR is typed before the name of the field, for example:

```
          PRIOR {product_code}
```

If you type

```
          {product_code}
```

then this means the value in the current record.

If you use PRIOR, it is recommended you put CURRENT in front of all fields that refer to the current input record. As mentioned, this is not necessary - it is recommended because it makes the logic text much easier to understand. For example:

```
           IF ((CURRENT {product_code} = PRIOR {product_code}) THEN
```

Notice how CURRENT makes the meaning very clear, even though if you omit the word CURRENT then the logic text works the same way. Normally, CURRENT is used only when a statement contains PRIOR.

CURRENT and PRIOR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

![](images/LTZZ_Syntax_legend.gif)

## Syntax { .section}

![](images/LTS_CURRENT_PRIOR_01.gif)

## Rules for the syntax { .section}

-   If neither CURRENT nor PRIOR is typed, then CURRENT is assumed.
-   CURRENT and PRIOR can only be used in **Extract Record Filter** or **Extract Column Assignment** logic text.

See also topic "**Rules for all logic text**". A link is under **Related reference** below.

## Examples: CURRENT and PRIOR in Extract Record Filter { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (CURRENT({field1}) <>
    PRIOR({field1}))
   THEN SELECT
ENDIF
```

|Select only records with unique values for field1. This assumes the input file is sorted into field1 order. This example can also be written:```
SELECTIF(CURRENT({field1})<>
         PRIOR({field1}))
```

|

## Examples: CURRENT and PRIOR in Extract Column Assignment { .section}

|Example logic text|Meaning|
|------------------|-------|
|```
IF (CURRENT({field2}) <>
    PRIOR({field2}))
    THEN COLUMN = "PRODUCT: "
    ELSE COLUMN = " "
ENDIF
```

|If the current record has a different value of field2 from the previous record, set the current column to "PRODUCT: " otherwise set the current column to blank. This assumes the input file is sorted into field2 order.|

**Parent topic:**[Syntax: functions](../html/WERLTSFAAAFuncs.md)

