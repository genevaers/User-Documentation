## Lookup Path Specification 

A lookup path is a GenevaERS metadata component defining how to retrieve information from a target logical record (LR) using data from a source LR.

Lookup paths can be used by many different views. To view existing lookup paths, click Lookup Paths in the Navigator pane and open a lookup path in the metadata list at the bottom of the screen.

To create a new lookup path

Select **Administration** > **New** > **Lookup Path** from the menu.



--- 
This is a work in progress, needs reviewing and new screen shots (text copied from Intro3_Introduction_to_Lookups.md)...

The General tab of the selected lookup path shows the lookup path ID, name, comments, and status, either active or inactive.

When you create a new lookup path, the lookup path ID is assigned by the Workbench and is not editable. It is used to make each lookup path unique and appears along with the lookup path name in views.

The name of the lookup path is visible when you are using it in views. When you name a lookup path, it is good practice to include the source-LR-to-target-LR mapping performed by the path.

Also, if more than one lookup path in your environment is used to join the same source LR and target, you should add additional qualifiers to the name to provide uniqueness.

Lookup paths are created with an Inactive status and remain inactive until they are completely defined. They can then be activated, allowing for use in views.

If an active lookup path changes, all views referencing that lookup path are deactivated to prevent views from performing inaccurate joins. Select the Make Lookup Path Inactive check box to deactivate the lookup; this also deactivates all the views using the lookup path.

From the General tab, we’ve clicked the Lookup Path Definition tab, where we can select the source logical record and the target LR and its specific logical file.

We can then select the source fields that should be used to create a key to search the target to find a matching record. The accumulated length of the source fields must equal the total key length before the lookup path can be activated and used for processing in a view.

The Source Field Properties area is displayed when the Selected Source Fields list is clicked. Here you can select a source field from the source logical record or specify a constant that should be used in the key.

Constants can be either static, as shown here, or symbolic, which allows setting the value in the view when the lookup path is used. When specifying a constant, carefully consider the format of the target key when setting the format (data type), length, and so on.

We’ve now completed the lookup path. Next, we’ll see how to use it in the view.