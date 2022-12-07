# SAFR overview - START HERE {#SACASAFR .concept}

## 01 Summary of this topic {#01 .section}

The sections in this topic are as follows:

-   [10 What is SAFR?](SACASAFR.md#10)
-   [20 SAFR software](SACASAFR.md#20)
-   [100 Need more on this page?](SACASAFR.md#100)

## 10 What is SAFR? {#10 .section}

SAFR stands for **Scalable Architecture for Financial Reporting.**

SAFR is pronounced "SAF-er". Rhymes with "matter".

What does Scalable Architecture for Financial Reporting mean?

The word **scalable** means that as more demands are made for financial data and reporting, the existing financial processing can produce the results without major redesigning or rebuilding of the financial systems.

Financial reporting systems typically display what are called "dis-economies of scale". This means that as a company requires more summaries of specific financial issues, the complexity and cost of creating the computing processes is larger than expected. With SAFR, it does not matter how much larger your company grows or how complex the financial reporting, SAFR remains a fast, efficient and accurate method to generate all your financial reports.

There are two main benefits from using SAFR:

-   **Easy access to financial details.** Traditional financial systems produce the financial reports, but if you want to question the reasons behind one of the figures, this takes long and costly manual investigation. With SAFR, the details behind the financial figure are retained, so finding the reasons behind a figure is fast and easy. This is because SAFR does not "throw away" the detailed transactions like a traditional financial system does.
-   **Faster processing.** Is your company unable to obtain reports from a data warehouse because the processing takes too long? Is your overnight batch window becoming too short to finish all processing required? Do SQL queries take too long to produce results? These are all situations in which SAFR can provide answers much faster.

## 20 SAFR software {#20 .section}



![](images/SAFR_Overall_07IC.gif)



SAFR consists of four parts:

1.  **SAFR Workbench.** This PC software creates and modifies views. For more, see topic "**Workbench overview**". A link to this overview is under **Related concepts** below.
2.  **SAFR Performance Engine \(PE\).** This mainframe software produces the results of SAFR using views. The Performance Engine runs under the operating system **z/OS** as a batch job using JCL. For more, see topic "**Performance Engine \(PM\) overview**". A link to this overview is under **Related concepts** below.
3.  **Utilities.** These are mainframe batch programs that deliver extra processing. These steps can be run anytime.

    For more, see "**PM Utilities overview**". A link to this overview is under **Related concepts** below.

4.  **User-Exit Routines.** Also called "Exits". These are mainframe programs that are tailored to your company. User-Exit Routines run inside the Performance Engine. For more, see topic "**User-Exit Routines overview**". A link to this overview is under **Related concepts** below.

    Also see "**PM Exits overview**". A link to this overview is under **Related concepts** below.


## 100 Need more on this page? {#100 .section}

If you need more details to be added to this page, please email **AskSAFR@us.ibm.com** .

**Parent topic:**[SAFR overviews](../html/AAR450Overviews.md)

