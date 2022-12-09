# SAFR Login errors {#WERSeSALogin .reference}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 Information messages](WERSeSALogin.md#10)
-   [20 Error messages: User Id & Password](WERSeSALogin.md#20)
-   [30 Error messages: Environment & Group](WERSeSALogin.md#30)
-   [40 Error messages: Login process](WERSeSALogin.md#40)

## 10 Information messages {#10 .section}

|Message|Notes|
|-------|-----|
|Select your database connection|Select from the drop down box for field **Connection Name**. If there are no values listed or you cannot find the value you require, then click**Connections...** and use the SAFR Connection Manager screen to create the connection name you require. If the **Connections...** button is grey, click **Cancel** and restart the SAFR Workbench - the **Connections...** button is now available. For help to create a connection name see topic "**SAFR Connection Manager screen help**". For a link, see under **Related reference** below.

|
|Enter your userid.|This happens when the User Id field is empty. Enter your User Id and Password, and click **Login**. Once you successfully login to an environment in the SAFR Workbench, SAFR remembers your User Id for the next session. You can always change the value of User Id that is provided.

|
|Select your environment|Select an environment from the drop down box. Once an environment is selected, click ****Set as Default**** to ensure this environment displays first for your next login. If there is a list of environments, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header.|
|Select your group|Select a group from the drop down box. Once a group is selected and the environment above already has a tick for 'Set as Default", then for this group you can click ****Set as Default**** to ensure this group displays first for your next login. If there is a list of groups, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header. If you are a system administrator, the groups field is grey and no action is required.|

## 20 Error messages: User Id & Password {#20 .section}

|Message|Solution|
|-------|--------|
|User Id Not Entered|This happens when the User Id field is empty. Enter your User Id and Password, and click **Login**. Once you successfully login to an environment in the SAFR Workbench, SAFR remembers your User Id for the next session. You can always change the value of User Id that is provided.

|
|User \(value on screen\) not found.|The value for User Id is not found in the list of SAFR Users. Check you have typed the User Id correctly. If this problem persists, see your system administrator to check your correct User Id value.|
|Password not valid|The Password is not correct for the User Id. Check you have typed both the User Id and the Password correctly. If this problem persists, see your system administrator to check your correct User Id value. If necessary, ask your system administrator to reset your Password.|
|Failed to access log file \(value on screen\)|The workbench cannot access the log file path given. See your system administrator.|
|Data access error for User|The last time you attempted to logon, SAFR connection manager could not access your SAFR database. This message is historical and needs no action. This message persists until you have successfully accessed the SAFR database.|
|There was an error while connecting to the Database. Do you want to change the connection manager settings?|The settings on the SAFR connection manager screen did not successfully access the SAFR database. Click Yes to update the connection manager settings, otherwise click No.|
|An unexpected database error occurred during login process. Cannot continue.|This is unexpected error occurred due to unavailability of the database service. See your system administrator for help.|

## 30 Error messages: Environment & Group {#30 .section}

|Message|Solution|
|-------|--------|
|Please select an Environment.|Select an environment from the drop down box. Once an environment is selected, click ****Set as Default**** to ensure this environment displays first for your next login. If there is a list of environments, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header.|
|Please select a Group.|Select a group from the drop down box. Once a group is selected and the environment above already has a tick for 'Set as Default", then for this group you can click ****Set as Default**** to ensure this group displays first for your next login. If there is a list of groups, sort the list by clicking on "name" or "id" in the header of the list. Reverse the sort order by clicking again on "name" or "id" in the header. If you are a system administrator, the groups field is grey and no action is required.|

## 40 Error messages: Login process {#40 .section}

|Message|Notes|
|-------|-----|
|Invalid log path, cannot make directory|See your system administrator: your preferences file contains an invalid path to the log directory.|
|Invalid log path in preferences, cannot make directory ddd|The workbench attempted to create the log directory ddd but was unable to. See your system administrator who should check access and permissions to the log directory.|
| | |

**Parent topic:**[Workbench Troubleshooting](../html/AAR950WETr.md)

