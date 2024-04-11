{: .no_toc}
# Users, Groups and Permissions

TABLE OF CONTENTS 
1. TOC
{:toc}  

## Add a Group

Only system administrators can create groups, so ensure you are logged into the workbench as a **system administrator**. You can be in any environment.

1. Select **Administration** > **New** > **Group** 
2. In the **Name** field type a descriptive name. Add **Comments** if desired.
3. Save the group definition **File** > **Save**.
  
When the Group is saved, it is assigned a unique GenevaERS ID. The time stamps show when the file was created, and when it was last updated. 

After the above is complete, the group is ready for immediate use.

## Add a User

Only system administrators can create users, so ensure you are logged into the workbench as a **system administrator**. You can be in any environment.

1. Select **Administration** > **New** > **User** 
2. In the **Name** field type a descriptive name. Add **Comments** if desired.
3. - To specify a system administrator, select the **System Administrator** checkbox.
   - To specify a general user, make sure to clear the System Administrator checkbox.
4. Save the user definition **File** > **Save**.
   
When the user is saved, it is assigned a unique GenevaERS ID. The time stamps show when the file was created, and when it was last updated. 

After the above is complete, a new **system administrator** user is ready for immediate use. 

A new **general user** must be added as a member of at least one **group**.

## Define Group Membership

Only system administrators can change group membership, so ensure you are logged into the workbench as a **system administrator**. You can be in any environment.

You can view and add users to groups by selecting a group and viewing and editing the associated Users list, or, you can view the user and edit the associated Groups list.

### Membership by Group

1. Select **Administration** > **Group Security** > **Membership by Group...** 
2. In the **Group** window, select a group from the drop down box. You can sort the list by clicking on **ID** or **Name** in the header of the list.
3. To view the list of existing users in this group, click in the **Associated Users** table.
4. To add users to this group, click **Add**.
5. Select the checkbox(s) by the User ID(s) you want to add, then click **OK**.
6. To remove users, select the checkbox by the User ID in the Associated Users list, then click **Remove**.
7. Save the group membership definition **File** > **Save**.

### Membership by User

1. Select **Administration** > **Group Security** > **Membership by User...** 
2. In the **Users** window, select a user from the drop down box. You can sort the list by clicking on **ID** or **Name** in the header of the list.
3. To view the list of groups this user already is a member of, click in the **Associated Groups** table.
4. To add this user to a new group, click **Add**.
5. Select the checkbox(s) by the Group(s) you want to add, then click **OK**.
6. To remove a user from a group, select the checkbox by the Group ID in the Associated Groups list, then click **Remove**.
7. Save the user membership definition **File** > **Save**.
