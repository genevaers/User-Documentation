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
