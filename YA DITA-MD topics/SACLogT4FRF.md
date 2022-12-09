# Logic text 4: Format Record Filter overview {#SACLogT4FRF .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is logic text for Format Record Filter?](SACLogT4FRF.md#10)
-   [20 Where do I find syntax and examples of this logic text?](SACLogT4FRF.md#20)
-   [30 How do I create logic text for Format Record Filter?](SACLogT4FRF.md#30)
-   [100 Need more on this page?](SACLogT4FRF.md#100)

## 10 What is logic text for Format Record Filter? {#10 .section}

**Format Record Filter** logic text can also be called **Format-Phase Record Filter** logic text.

All logic text is optional. The objective of this logic text is to select or skip output records for a view.

Specifically, this logic text changes the **records selected for output** in the format phase of the SAFR Performance Engine. The format phase is optional, because the extract phase may be sufficient to produce the results of that view.

For an introduction to SAFR phases, see topic "**SAFR phases overview**". A link to that overview is under **Related concepts** below.

## 20 Where do I find syntax and examples of this logic text? {#20 .section}

The syntax of this logic text and examples are described in topic "**Logic text 4: Format Record Filter**". A link to this topic is under **Related reference** below.

## 30 How do I create logic text for Format Record Filter? {#30 .section}

This logic text is part of a view and is associated with the format phase. To create this logic text in an existing view, do the following:

1.  Ensure you are on the "**Edit View**" screen for the relevant view. For help with displaying this screen, see topic "**Modifying Views**" in the General User Guide.
2.  The view must have a format phase. If there is no format phase or you are not sure, see topic "**Edit View \(View Properties, General tab\) screen help**". A link to this topic is under **Related reference** below.
3.  Ensure you are on the "**View Properties**" tab. If the "**View Editor**" tab is displayed, click the **Show Grid / Properties** button. ![](images/Icon_Show_Grid_Props_01.gif) or press F9 or select **Edit -\> Show Grid/Properties**.
4.  Go to the "**View Properties, Format Phase**" tab, and click on the "**Create**" or "**Edit**" button under heading" **Format-Phase Record Filter**".
5.  Type your logic text in the window "**Create New Format-Phase Record Filter**" or "**Edit Format-Phase Record Filter**".
6.  Click ![](images/Icon_ValidLT_02.gif) to check if the logic text is valid.
7.  Fix any errors shown in the "**Logic Text Validation Errors**" window.
8.  When the new logic text is complete and valid,
    -   **EITHER** click ![](images/Icon_Save_03.GIF) \(the save icon\),
    -   **OR** select **File, Save**,
    -   **OR** press **Ctrl+S**.
9.  You may wish to close some of the open windows, such as "**Logic Text Helper**" and "**Create New Format-Phase Record Filter**" or "**Edit Format-Phase Record Filter**".

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

