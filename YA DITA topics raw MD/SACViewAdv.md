# Views - advanced overview {#SACViewAdv .concept}

This topic assumes you are familiar with the topic "**Views overview**". A link to that overview is under **Related concepts** below.

## 01 Summary of this topic {#01 .section}

This topic covers the following:

-   [10 Logic Text and formulas](SACViewAdv.md#10)
-   [20 Activating a view](SACViewAdv.md#20)
-   [30 What metadata components does a view access?](SACViewAdv.md#30)
-   [50 Optimize view processing](SACViewAdv.md#50)
-   [90 How to delete a view](SACViewAdv.md#90)
-   [100 Need more on this page?](SACViewAdv.md#100)

## 10 Logic Text and formulas {#10 .section}

Logic text is a scripting language that can be added to a view to change the behaviour. Logic text can **select records in input or output files**. Logic text can implement **formulas** for columns in a view. See topic "**Logic text overview**". A link to that overview is under **Related concepts** below.

## 20 Activating a view {#20 .section}

During creation of a view, or immediately after modification of any part of a view, the view becomes "**Inactive**".

The view must be activated before the view can be run in the SAFR Performance Engine. Activation means all parts of the view are validated. The validation displays any error messages that prevent the view becoming '**Active**".

For details of how to activate a view, see these topics:

-   "**Creating views**"
-   "**Modifying views**"
-   "**Batch activating views**"

Links to these tasks are under **Related tasks** below.

## 30 What metadata components does a view access? {#30 .section}

![](images/View_concept_02.gif)

The diagram above shows the metadata types that have a direct relationship to a view. The lines show where metadata types are related. The relationship may be one to many or many to many, and may be only in one direction. If there is no line then there is no direct relationship.

System and environment administrators can create and modify all the components shown above.

General users can create and modify the shaded components, which produce the most obvious results for SAFR. General users can have extra authorities granted by membership of a group. The extra authorities can allow a general user to create and modify other components. Granting of extra authorities is a way of implementing specialized job roles for general users in your company.

All the components in the diagram above have overview topics. Authorities are discussed in topic "**Groups overview**".

Links to overview topics under **Related concepts** below.

## 50 Optimize view processing {#50 .section}

The methods are:

-   **Parallelism** - allowing \(where possible\) to do processing in parallel.
-   **Common Key Buffers** - to load into memory at the same time all relevant records with a shared key.
-   **Pipes** - to allow one view to pass data in memory to another view\(s\). This technique allows parallel processing.
-   **Tokens** - to pass data between views in a manner similar to a pipe. The token means that the receiving view\(s\) must wait until the sending view has finished processing an entire record. This method has advantages and disadvantages compared to pipes.

For more details, see these topics:

-   "**Parallelism overview**",
-   "**Common Key Buffers overview**",
-   "**Pipes overview**",
-   "**Tokens overview**".

Links to these overviews are under **Related concepts** below.

## 90 How to delete a view {#90 .section}

You must have the modify right to the view folder containing the view. To delete a view do the following:

1.  In the **Navigator**, select the relevant view folder.
2.  In the **Metadata List**, click on the relevant view to highlight it.
3.  Click ![](images/Icon_Del_Metadata_01.gif) or press the **Delete** key.

Views are not deleted immediately.

When you delete a view, then the view is placed in a folder "**Deleted Views**" and the status is made inactive.

Later, the task "**Empty "Deleted Views" folder**" permanently deletes views in that folder. A link to that topic is under **Related tasks** below.

An alternative method to achieve the permanent delete is to delete views from the "**Deleted Views**" folder. When you confirm a delete from "**Deleted Views**", the view is deleted permanently.

This pattern is not affected by the fact that if a view is stored in the "**Deleted Views**" folder that view is also listed in the "**All Views**" folder. Deleting a view from the "**Deleted Views**" folder also deletes the view from the "**All Views**" Folder.

## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

