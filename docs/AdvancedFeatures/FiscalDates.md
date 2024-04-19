    EFFECTIVE DATE VIEW DEFINITIONS
        Look-up Tables can include a Start Date and an End Date that define the period of time during which the record is valid (effective).  Effective Date views compare a date, which may be an event date from a detail record or a user-specified date, to a Reference File Table record’s start and end date range.  If the event or user-specified date is within the start and end date range, that Reference File record is effective for that time period and is selected for the View Definition.  Records that are not effective for the time period are excluded from the view. 
        
        (NOTE: I think this last sentence might be too restrictive for how Geneva works now.  This is a version 3 statement.  The next paragraph is also based upon the CICS Screens.)
        
        The View Definition Standard Parameters screen is the only screen where the effective date view parameters must be defined.  If you want to use the event process date on each Event File record as the effective date for comparison, enter ‘H’ in the LOOKUP CODE (C, H) field, and the PROC DATE FIELD will default to the Event File default process date.  The View Definition must include a field from the lookup table somewhere in the View Definition itself (Title Field, Sort Field, selection criteria, or column criteria).
        
        If you want to use a specific date as the effective comparison date (today’s date, for example), leave the LOOKUP CODE (C, H) field and the PROC DATE FIELD blank and enter the desired date in MMDDCCYY format in the LOOKUP DATE field.  
   
   RELATIVE DATE VIEW DEFINITIONS
        With the GENEVA ERS ViewBuilder, you can define relative selection criteria for the fiscal month or date fields versus “hard-coding” the values and updating the View Definition each time that month or date changes.  
        
        The relative fiscal month or day is specified by entering a relative code in the CODE field and a value in the VALUE field on the View Definition General Selection Parameters and/or View Definition Column Selection Parameters for SELECTION FROM and/or SELECTION TO.  The SELECTION CODE field is in the format ‘x’ where a relative code (‘F’ for relative fiscal month or ‘C’ for relative calendar day) is entered.  When SELECTION CODE is entered, a value must be entered in SELECTION VALUE.  
        For fiscal month selection, valid values are ‘1’-’25’ and ‘99’.  You can enter ‘-’ (minus) and ‘+’ (plus) values to indicate the direction of the relative range.  Typically, ‘-’ values are used since future data typically does not exist, with the exception of budget data.
    
    Example:
    ‘F -001’ refers to the current fiscal month minus one, which is last month.  
    ‘F 000’ refers to the current fiscal month, and ‘F +001’ refers to the current month plus one.  Obviously, ‘+’ values are only valid for budget data.  For calendar day, or process date, selection valid system values are ‘+’ and ‘-’.

        Suppose you have a View Definition that is run monthly and compares the current month financial information with the prior month.  You could “hard code” the fiscal month numbers in the View Definition General Selection Parameters and change these values each month.  To avoid this additional effort, use the relative date View Definition to define the View Definition General Selection Parameters screen as follows:
Enter a ‘F’ in the SELECTION FROM CODE field and enter ‘-001’ in the SELECTION FROM VALUE field, enter a ‘F’ in the SELECTION TO CODE field and enter ‘000’ in the SELECTION TO VALUE.  This will always result in a view containing the data for the current month and the previous month.

(More Documentation from another part of the old manuals)

Relative values can be entered on date fields.  When relative values are entered, GENEVA V/T interprets those values differently as time passes.  In the example above, the Field ‘H21’ (fiscal month) has a relative code of ‘F’ and a relative value of ‘-03’.  If this is fiscal month ‘10’ (based on the current month stored in the System Management Table), then this View Definition will select data from fiscal month ‘7’.  When the current fiscal month changes to ‘11’, the View Definition will change its data selection to fiscal month ‘8’.  If you are not interested in a range of values and only want fiscal month ‘-3’ data, there is no need to enter any criteria in the selection fields.  For more information on relative and absolute values, refer to the Field Descriptions section in this chapter.

You can enter field values as a range using ‘FROM’ and ‘TO’ values.  When specifying a range, you can combine two absolute field values, two relative date values, or an absolute field with a relative date.  If you are combining an absolute value with a relative date selection, the absolute value must be entered in the SELECTION FROM field.  In the example above, the field ‘H42’ has a range of ‘6000’ to ‘7000’.  This means that data with any value between 6000 and 7000, inclusive, will be included on your view (MOD is ‘blank’).  

.....

REL CD FROM

This field can be used to create relative selection criteria for fiscal period or date fields.  Instead of entering an absolute value in the SELECTION FROM and SELECTION TOs, relative values can be entered in the SELECTION FROM and REL CD TO fields.  A relative code of ‘F’ is used to designate relative fiscal month, while ‘C’ is used to designate relative calendar day.  
    Note:  Valid REL CD FROM values are:
    ‘C’	Calendar Days
    ‘F’	Fiscal Month

For example, to select data that is between three prior fiscal months and one prior fiscal month, enter ‘-003’ in the SELECTION FROM, and ‘F’ in the REL CD FROM; and ‘-001’ in the SELECTION TO, and ‘F’ in the REL CD TO.  This effectively creates a “moving” view of the values from the previous three months without having to change the FROM and TOs as you would if the values ‘9’ and ‘12’ were entered.

In another example, to select Accounts Receivable under 90 days old, enter ‘-90’ in the SELECTION FROM, and ‘C’ in the REL CD FROM; and ‘0’ in the SELECTION TO, and ‘C’ in the REL CD TO.  This effectively creates a “moving” view of the accounts receivable under 90 days old based on the current system date without having to change the FROM and TO values each time the View Definition is activated.  

The value entered in the SELECTION FROM VALUE or SELECTION TO must follow the following format:  the first character should be a  
sign (‘+’ or ‘-‘); the next characters are numbers specifying the number of months or days.  In the example above, GENEVA V/T will select data three months prior to the current month (current month minus 3).

A relative value of ‘0’ can be used with both the relative fiscal month and calendar day.  If used, no ‘+/-‘ sign is required.  A ‘0’ value used with the fiscal month will select data from only the current month.  When used with the relative calendar day, GENEVA V/T will only select data that is posted to the Event File as of the day of your view production run.

As with all relative conditions, any value can be used, but the relative period should not extend beyond your fiscal year or biennial time frames.  The ‘+’ feature can be very useful when used to show future budget periods when used with the relative fiscal month.  The ‘+’ value typically has no application when used with the relative calendar day because transactions are not typically processed for future dates.

For example, to select data that is between three prior fiscal months and one prior fiscal month, enter ‘-003’ in the SELECTION FROM, and ‘F’ in the REL CD FROM; and ‘-001’ in the SELECTION TO, and ‘F’ in the REL CD FROM.  This effectively creates a “moving” view of the values from the previous three months without having to change the SELECTION FROM and the SELECTION TO VALUE as would be required if the values ‘9’ and ‘12’ were entered.

.....

To Define a View Containing Columns to Include the Three Prior Fiscal Months
You can use the following procedure to create a View Definition with relative values and codes.  By using relative values and codes, you will not need to change the selection criteria each time you run the View.  You may want to create a View Definition with a FREQUENCY of ‘M’ on the Standard Parameters screen.  This example constructs a View Definition with three columns each presenting expenditures for a different month based on the current fiscal month.  Column 1 is expenditures for the current fiscal month less one, Column 2 contains the expenditures for the current fiscal month less two, Column 3 presents expenditures for current fiscal month minus 3.  Once this View Definition is created, you can leave it active with FREQUENCY of ‘M’.  It will print every month with the expenditures for the previous three months.  You can specify the current fiscal month by using ‘00’ in the FROM field.  This example assumes that all columns are defined with the same transaction amount field.  Once the three columns are defined, you can define all Column Selection Parameters in order by scrolling between them using <PF20> NEXT COL and <PF19> PREV COL.
STEP 1.	Access the View Definition General Column Parameters screen and then the Column Selection Parameters screen.
STEP 2.	Tab to the SELECTION FIELD and either enter the field number if known or press FLD LIST to access the list of available Field Definition Numbers.  This is the field that you want to use to select data for this column.  It should be the processing fiscal month field.  
A list of all available Field Definitions will be displayed.
    Tip!  It is important to tab to the SELECTION FIELD field before you press FLD LIST.  This action positions the cursor on the field that will be populated with the Field Definition Number you select from the FLD LIST screen.  When FLD LIST is pressed, GENEVA V/T  remembers where the cursor was on the current screen so that it can transfer the Field Definition Number you select from the Field Definition List screen and populate the SELECTION FIELD field with the value.

STEP 3.	Select the processing fiscal month Field Definition by placing the cursor on the line containing the Field Definition number and pressing <ENTER>.
The Field Definition Number will be transferred to the View Definition Column Selection Parameters screen.
?Help!  Scrolling through the Field Definition List is accomplished by pressing <PF7> to scroll backward and <PF8> to scroll forward.

 
STEP 5.	Enter the SELECTION FROM that you want included in this column.  For this example, you should enter ‘-01’ in column 1, ‘-02’ in column 2 and ‘-03’ in column 3.  (You will provide the relative code to select fiscal month and apply this operand (+ or -) and value.)
STEP 6.	Enter an ‘F’ in the REL CD FROM.  
STEP 7.	Leave the MOD indicator blank to include the value.
STEP 8.	Press UPDT/SAME and then NEXT COL to enter the selection criteria for the next column.  
The message:  ‘RECORD SUCCESSFULLY UPDATED’ will be displayed.
    Note:  These steps can be followed to enter a relative value based on calendar date.  You must use a Field Definition Number with date ‘D’ format.  You can specify SELECTION FROM ‘-07’ with ‘C’ in the REL CD FROM and SELECTION FROM ‘-01’ with ‘C’ in the REL CD FROM to create a view to run weekly.  This example will provide data from the previous week (from seven days before today to the previous day).


