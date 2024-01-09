---
title: Introduction to Date Effective Lookups
nav_order: 17
---

# Introduction to Date Effective Lookup

This page provides you with more information about GenevaERS Lookups, including date effective lookups.  It will help you to: 
- Describe uses for effective-dated lookups 
- Read a Logic Table and Trace with effective-dated lookups 
- Explain the Function Codes used in the example
- Debug lookups with effective dates

This page covers the following Logic Table Function Codes:
- LKDC, builds a date effective lookup key from a constant
- LKDE, builds a date effective lookup key from the source Event record

The following function code was not shown in an example
- LKDL, builds a date effective lookup key from a looked up record


[Other Logic Table Functions Codes can be located here.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" >

# Effective Date Reporting Business Need

<img style="float: right;" width="50%" vspace="5" alt="Business Need" src=images/Module16-Date_Effective_Lookups/Module16_Slide4.jpeg title="Business Need"/>

Many reporting applications perform date effective processing to:
1. Spot trends
2. Perform “What-if” analysis
3. Analyze changes in positions
4. Reconstruct historical perspectives for audit and other purposes

As you can see in this example, the number of customers by division by year is shown.  GenevaERS’s date effective joins provide a powerful way to perform these types of functions.  Changes in reference data can be maintained to allow for recreation of reports as of a point in time.  This can be done in individual views or a view might include multiple “as of” dates.

<div style="clear: right" >

# Example Data Model

<img style="float: right;" width="50%" vspace="5" alt="Example Data Model" src=images/Module16-Date_Effective_Lookups/Module16_Slide5.jpeg title="Example Data Model"/>

We’ll expand our example in the prior pages by including a new table, the Customer Name table.  This table is keyed by the Customer ID.  This Customer system tracks changes to data via effective dates, to keep track of changes to people’s name, perhaps when they get married.  To do so, it has an additional key to the table, the Effective Start Date.  Thus for the same Customer ID it could have two names, each effective for specific times.

<div style="clear: right" >

# Found Results

<img style="float: right;" width="50%" vspace="5" alt="Found Results" src=images/Module16-Date_Effective_Lookups/Module16_Slide6.jpeg title="Found Results"/>

When using tables structured for GenevaERS effective dated joins, the same primary key value can have two different sets of attributes.  The effective start date is used to distinguish between the two values, meaning when each record became effective.  A start date of all zeroes means the record has always been effective; in other words it has been effective since the earliest possible “date”.  

In this example, two different start dates are used to search the reference table for customer 5.  The first is 2012, and so it returns the record which started in 1985.  Customer 5’s name in 2012 was Sally Rogers Smith.  

The second query is for 1984, and so the earlier record, for the earliest possible date, is returned.  Customer 5’s name from the earliest possible date until June 22, 1985 was Sally Rogers.  GenevaERS assumes that the effective “end” date of the first record is the start date of the next record.

In many applications, exact binary matches of keys required the data value be exactly the same, including the effective date.  This can require many duplicate records to have all possible dates covered.  GenevaERS doesn’t require this.  It tests for the most recent effective dated record “falling back” from the key date provided to the last effective record.  This can significantly reduce the size of effective-dated reference files, which thus use less memory while still performing very high speed joins.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Found Results" src=images/Module16-Date_Effective_Lookups/Module16_Slide7.jpeg title="Found Results"/>

GenevaERS also provides the ability to use an effective End date as well when an explicit end date is stored on each record.  This is useful rather than assuming the effective “end” date of the first record is the start date of the next record.  This functionality allows for gaps when no effective date record may be in force. 

When using end date processing, GenevaERS starts with the same “fall back” logic to find the earliest start dated record.  It then performs one more test, checking to see if the date provided is also less than the end date.  If it is not, GenevaERS returns a not found condition.

In this example we repeat the same search for customer 5’s name.  The 2012 search returns the same results because the end date of 9999-99-99 greater than 2012; in fact it is the highest possible date.  This record is effective forever.  

The 1984 search returns a Not Found condition, because the effective date of 1984 is between the 1983 end date of the first record, and the 1985 start date of the next record.

This same functionality in other tools can consume a lot of CPU resource testing for valid date ranges.  GenevaERS effective date search is very efficient, on the order of 2 additional CPU instructions for each effective date test.

<div style="clear: right" >

# Effective Dated LR Definition

<img style="float: right;" width="50%" vspace="5" alt="Effective Dated LR Definition" src=images/Module16-Date_Effective_Lookups/Module16_Slide8.jpeg title="Effective Dated LR Definition"/>

The Effective Dates, both Start and End, are defined on the Logical Record.  There can be only one Start and one End effective date on each LR.  Both parameters are optional, but an End Date requires a Start Date be defined.  They can be located anywhere on the LR.  

In this example, the Customer Name LR has both a Start and an End date defined.  

<div style="clear: right" >

## Effective Dated Lookup Path

<img style="float: right;" width="50%" vspace="5" alt="Effective Dated Lookup Path" src=images/Module16-Date_Effective_Lookups/Module16_Slide9.jpeg title="Effective Dated Lookup Path"/>

The Start Date and End Date parameters should not be placed on the Lookup Path, and do not affect how the lookup path is constructed.  Fields listed in the lookup path are used for an exact binary match.  Because the Start and End dates are not exact binary matches, they are not placed on the Lookup Path.  However, remember the start and end dates are marked as effective dates on the LR, instructing GenevaERS to use them during processing.

In this example, only the field to be used to search the 10 byte Customer ID is defined in the Lookup Path.

<div style="clear: right" >

## Lookup Path and Join Phase

<img style="float: right;" width="50%" vspace="5" alt="Lookup Path and Join Phase" src=images/Module16-Date_Effective_Lookups/Module16_Slide10.jpeg title="Lookup Path and Join Phase"/>

Use of a Start Date or Start and End Dates affect the Join Phase processing.  It is not possible to use just an end date.  The values in these fields are added to the RED Core Image file at the end of the LR defined key data. All field date effective dates are converted to binary, and GenevaERS will automatically convert all dates to the same content code of CCYY-MM-DD regardless of the source data format.  This is done to reduce the amount of memory used by them and ensure the test for effective dates test years, then months, then days. (Note that even though dates are converted to binary format, no exact match of dates is required).

Note that use of a Start Date parameter is the only case where duplicate keys are allowed in a GenevaERS Join Reference file.  In this example, although there are two records for Customer 5, the start date ensures uniqueness in the search results.   

Like all other RED Core Image files, it must be in sorted order by the (1) key, such as the Customer ID in this example, (2) the start date, and (3) end date, if used.  

<div style="clear: right" >

# “As-of” Effective Date Source

<img style="float: right;" width="50%" vspace="5" alt="“As-of” Effective Date Source" src=images/Module16-Date_Effective_Lookups/Module16_Slide11.jpeg title="“As-of” Effective Date Source"/>

The Effective date used in the search key can come from three different places.  

- A constant placed in the view
- A constant fed to Performance Engine programs in the job stream, or
- The value from a field on the Source Event File

Each of these will be discussed in the following sections.

<div style="clear: right" >

## Constant

<img style="float: right;" width="50%" vspace="5" alt="Constant" src=images/Module16-Date_Effective_Lookups/Module16_Slide12.jpeg title="Constant"/>

A constant “as-of” effective date value can be hard coded in the view.  To do so, place it immediately below the path in the column parameters.  If used, the same value will be used for all lookups for that column.  The value would have to be updated manually if the view is reused, for example, to report processing results at the end of every month.  

In this example all customer names as of 2010-01-01 would be extracted in column 2.  

Use of this approach is effective for (1) unit testing views (2) one time views to produced a particular report for analysis, or (3) for future dated views to do what-if analysis for reorganizations.

<div style="clear: right" >

## Rundate

<img style="float: right;" width="50%" vspace="5" alt="Rundate" src=images/Module16-Date_Effective_Lookups/Module16_Slide13.jpeg title="Rundate"/>

A more frequently used option is to use the RUNDATE parameter.  The RUNDATE can be set in the GVBMR86 step of the Selection Job of the Performance Engine.  If the parameter is not set, GVBMR86 will default to the system date.  Thus each day a new VDP is created, the RUNDATE will be advanced to the current date.  

In our example then, although the view might have been created in 2010, if GVBMR86 is run in 2012-10-03, all customer names as of that date will be extracted by our example view.  

Often rather than using the system date which might change arbitrarily at midnight, small programs are created to pass GVBMR86 a “fiscal date” of some predetermined kind.  A fiscal date allows all views running at the same time to use the same date.  Also, even if a set of views needs to be re-run on another date, they can be “as of” the required date.  For example, running reports for the year end December 31 can be done even though the system date is January 1st.  

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Search Key" src=images/Module16-Date_Effective_Lookups/Module16_Slide14.jpeg title="Search Key"/>

A field on the source Event File can also be used as an effective date.  This is similar to using it in a lookup path, although it is not placed in the path and exact match of values is not required.  If used for the date effective join, the date used can vary record by record, unlike the other two date constants described.

In this example, the Date Became Customer field is used to find the customer’s name when they became a customer.  The report is not as of 2010, or 2012, but varies customer by customer depending upon the date stored in the customer Event file.

Each use of a look-up path containing an effective date in a view requires specifying which date should be used for that join, either a constant, the run date, or from a field value.  Thus a single view can use all three sources for different joins.

Next, we’ll examine the Logic Table generated by these different options.

<div style="clear: right" >

# LKDC Logic Table Function

<img style="float: right;" width="50%" vspace="5" alt="LKDC Logic Table Function" src=images/Module16-Date_Effective_Lookups/Module16_Slide15.jpeg title="LKDC Logic Table Function"/>

The View Constant and Run Date effective joins use an LKDC Logic Table Function Code.  Remember LK functions build look-up keys prior to performing searches of core image files.  LKD functions build lookup keys containing dates for effective dates.  LKDC builds a lookup Effective Date from a Constant.  

The only difference between the View Constant and Run Date is the source of the constant.  The View Constant is the value placed in the view itself.  The Run Date constant is placed there by GVBMR86 at run time.  One cannot detect which source was used for the effective date by examining the logic table.  In this example, the View constant is 2010-01-01.  The Run Date constant is 2014-04-04. 

Because all effective dates are converted to a four byte binary (a FM type 6 on the logic table report) which can potentially hold 10 digits, an additional “00” is appended to the end of the date constants for the join processing, but does not affect the source or target date.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Run Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide16.jpeg title="Run Date"/>

The view using a source Event File Field for the date effective join uses an LKDE Logic Table Function Code, which builds a Lookup Key effective Date using the value from a source Event File Field. Rather than seeing a specific date in the logic table, the value to be used will be moved from a field. This is like an LKE function, but used for an effective date. 

In our Event File Field example the field ID 68, DATE_BECAME_CUSTOMER, will be moved to the Lookup Key Effective date position.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Run Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide17.jpeg title="Run Date"/>

As noted earlier, all these dates are given a four byte binary (“FM” Format code 6) field, with a CCYYMMDD content, (“CN” Content code 3).  The Constants are put into these formats in the logic table to save CPU cycles during run time, thus they are listed with these formats as SOURCE.  The date from the Event File field will be converted to this format as the data is read during execution.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Run Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide18.jpeg title="Run Date"/>

Next we’ll trace records through these logic tables.  We’ll use this reference file as the target of our join, searching against customer 1, Michael Clark.  We’ll show what the results of the date effective search would be for various date combinations.

<div style="clear: right" >

# Trace Results

<img style="float: right;" width="50%" vspace="5" alt="Run Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide19.jpeg title="Run Date"/>

The Logic Table Trace for one record against all views is shown here.  Each view executes an LKE to move the Customer ID “1” to the lookup key.  Then each executes the effective date build, either an LKDC or LKDE.  The LUSM lookup function is performed, and then the customer last name is moved to the extract file through a DTL Data lookup function, and the record is then written using the WRDT Write the extract record Data Area function code.  

We’ll examine the details of each on the following slides.

<div style="clear: right" >

## Trace of Found Condition

<img style="float: right;" width="50%" vspace="5" alt="Trace of Found Condition" src=images/Module16-Date_Effective_Lookups/Module16_Slide20.jpeg title="Trace of Found Condition"/>

Let’s examine the LKDC and LKDE functions more closely, and what effective date is used in each.  

At the bottom of the screen is shown the Effective Start date for the target reference file record, 1961-03-15, and it’s end date is 9999-99-99.  Since all three LKD effective dates, 2010 for the View Constant, 2014 for the Run Date, and 1999 for the Event File Field value are within this date range the results for all three views are found conditions.

Note that the value for the LKDE is not shown in binary in the trace because the source data is not binary.  Conversion to binary takes place as part of this logic table function processing.  

<div style="clear: right" >

## Effective Date Less than Start Date

<img style="float: right;" width="50%" vspace="5" alt="Effective Date Less than Start Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide21.jpeg title="Effective Date Less than Start Date"/>

In this example, we’ve changed the reference file record effective date to start in 2011 rather than 1961.  

The View constant compares the LKDC 2010 which is less than the start date of 2011, resulting in a Not Found condition

The Run date compares LKDC 2014 to a start date of 2011 and find the reference file record is effective, and so results in a Found condition

The LKDE Field value contains 1999 which is less than the start date of 2011, and thus results in a Not Found condition.  

Thus views 1 and 3 use DTC function code, move a Data Constant of spaces to the extract file.  

<div style="clear: right" >

## Effective Date Greater than End Date

<img style="float: right;" width="50%" vspace="5" alt="Effective Date Greater than End Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide22.jpeg title="Effective Date Greater than End Date"/>

In this example, we’ve changed the reference file effective END date (not the START Date) from a very long time in the future, 9999-99-99, to a while ago in the past at 2000-01-01.  

The View constant compares LKDC 2010 which is greater than the end date of 2000, resulting in a Not Found condition

The Run Date compares LKDC 2014 to an end date of 2000 and find the reference file record is no longer effective, and so results in a Not Found condition

The LKDE Field value contains 1999 is less than the end date of 2000, the reference file record is still effective, and thus results in a Found condition.  

Thus views 1 and 2 use DTC function code to move a Data Constant of spaces to the extract file.  

<div style="clear: right" >

## Gap in Effective Records

### View Constant

<img style="float: right;" width="50%" vspace="5" alt="Gap in Effective Records: View Constant" src=images/Module16-Date_Effective_Lookups/Module16_Slide23.jpeg title="Gap in Effective Records: View Constant"/>

In this example, we’ve added another reference file record for customer 1 reflecting a name change to CLARK-SMITH.  However, there is gap between the two records.  One still ends in 2000, but the new one does not start until 2011.  The view still requires an “as of” date of 20100101.

There is no change to the View Constant process. The lookup key is primed with customer 1, and an LKDC effective date of 2010.  The search finds the CLARK record because the new record doesn’t start until 2011.   After finding this record, the program compares the view effective LKDC date constant 2010 which is greater than the end date of 2000, resulting in a Not Found condition

<div style="clear: right" >

### Run Date

<img style="float: right;" width="50%" vspace="5" alt="Gap in Effective Records: Run Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide24.jpeg title="Gap in Effective Records: Run Date"/>

The Run Date view primes the key with customer 1 and an LKDC effective date of 2014.  Therefore, the binary search returns the second record with the effective start date of 2011.  The performance engine then tests the LKDC effective date of 2014 with the end date of 9999, and results in a Found condition.  The customer name of CLARK-SMITH is used in the output column.

<div style="clear: right" >

<img style="float: right;" width="50%" vspace="5" alt="Gap in Effective Records: Run Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide25.jpeg title="Gap in Effective Records: Run Date"/>

The Field value view primes the key with customer 1 and a LKDE field value of 1999.  The search returns the first reference file record with its start date of 1961.  A comparison of the end date of 2000 to 1999 shows the record is still effective and thus results in a Found condition.  The view uses the last name Clark to build the output record. 

<div style="clear: right" >

## No Effective End Date

<img style="float: right;" width="50%" vspace="5" alt="No Effective End Date" src=images/Module16-Date_Effective_Lookups/Module16_Slide26.jpeg title="No Effective End Date"/>

In this example we’ve modified the Customer Name Logical Record so there is no Effective End Date field.  If no end date field is defined on the LR, the start date of the next record is the implicit end date of the prior record.

The View Constant searches with an LKDC constant of 2010, which is less than the 2011 of the 2nd record, but greater than the 1961 of the first record.  Thus the 1961 record is effective.  It uses the last name of “Clark” to build the output record

The Run Date view searches with an LKDC value of 2014 date which returns the 2nd record with a start date of 2011.  Because there is no explicit End Date, this record is assumed to be effective forever.  The view uses the “Clark-Smith” value to build the output record

The Field Value view with a LKDE date of 1999 has the same results as the View Constant.

Thus all three views have found conditions.

<div style="clear: right" >

## Varying Dates For The Event File Field

<img style="float: right;" width="50%" vspace="5" alt="Varying Dates For The Event File Field" src=images/Module16-Date_Effective_Lookups/Module16_Slide27.jpeg title="Varying Dates For The Event File Field"/>

This Trace shows Event File records beyond the first record for the Event File Field view.  Note that the trace shows that the Date used in the LKDE Function Code changes with each event file record, whereas the constants used in LKDC would remain the same throughout a run.  The relationship between these dates might be summarized as:

The View Constant date is always the same, even in between different executions of the view in the Performance Engine if the view is never manually updated.

The Run Date Constant is the same within an execution of the Performance Engine, but can change depending on the system date or parameters passed to GVBMR86 between executions

The Event File Field Date can vary within an execution of the Performance Engine, as the dates with the source Event File change.

# Debugging Effective Dates


The following are a few of the more common reasons why you may encounter an error in effective date processing, and possible approaches to each:

- Effective dates should not be included in the lookup path.  If they are, the dates will be moved by LKE functions instead of LKDE or LKDC functions, requiring a exact match, not an effective date “match”.

- Because the source for an LKDE is a field specified in a view rather than on the lookup path, it is possible to use different LR fields, resulting in different output results per view when similar results were expected.  

- Improper content code definition for LR dates, either the Join or the Event LR, such as MM-DD-YY, will result in not found conditions.

- Views can be hardcoded with effective dates, rather than using the Run Date parameter or a Field value.

- Because each use of a look-up path containing an effective date effective in a view, inconsistent use of constants, run-date, or a field value can provide unexpected results.

- Improper parameters passed to GVBMR86 can set an incorrect Run Date

In summary, typical Date Effective Processing Problems:
- Effective dates should not be included in the lookup path
- Different date fields in different views for LKDE functions
- Improper content code definition for LR dates
- Improper use of hardcoded dates in views
- Inconsistent parameters in the same view
- An improper Run Date due to parameters errors

<div style="clear: right" >

# Function Overview

<img style="float: right;" width="50%" vspace="5" alt="Function Overview" src=images/Module16-Date_Effective_Lookups/Module16_Slide29.jpeg title="Function Overview"/>

This page has introduced the following Logic Table Function Code:
- LKDC, builds a date effective lookup key from a constant
- LKDE, builds a date effective lookup key from the source Event record

The following function code was not shown in an example
- LKDL, builds a date effective lookup key from a looked up record


[Click here to access the list of the most common Logic Table Functions for reference.](Intro11a_Logic_Table_Function_Codes.md)

<div style="clear: right" > 

