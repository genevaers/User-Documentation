# Syntax: WRITE statements {#WERLTSWrite0 .reference}

## Introduction { .section}

WRITE statements are optional in your logic text.

If your logic text contains **no WRITE statements**, then a WRITE occurs automatically. This is called an **implicit** WRITE. An implicit WRITE ensures that all your extract phase records are processed in the format phase \(if the view has a format phase\). Alternatively, an implicit WRITE ensures all your extract phase records are included in the view output file from the extract phase \(if the view has no format phase\). An implicit WRITE still occurs if you provide WRITE statements in your logic text.

A WRITE statement in your logic text allows the following:

-   Writing records to logical files of your choice.
-   Performing a Procedure or UserExit Routine on input records.
-   A combination of the above.

There are **two areas of logic text** where you can use a WRITE statement - see the two topics below.

-   **[Syntax: WRITE statements in Extract Record Filter](../html/WERLTSWrite1ERF.md)**  

-   **[Syntax: WRITE statements in Extract Column Assignment](../html/WERLTSWrite2ECA.md)**  


**Parent topic:**[Logic text: syntax](../html/WERLTSAAASyntax.md)

