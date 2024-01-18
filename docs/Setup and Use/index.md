# Setup and Use

## Installation 
There are two main components to install. The PC based Workbench and the mainframe based Performance Engine.

- To build and install the Workbench go [here](https://github.com/genevaers/Workbench)

- To download the latest Performance Engine executables go [here](https://github.com/genevaers/Performance-Engine/releases)

- Other setup info - Sample JCL, Parms e.g. EXTRPARM (?) with links to parameters in Reference section

## Basic Concepts

The following information provides you with a broad overview of GenevaERS and the basics of its graphical user interface. 

[Workbench Introduction](Concepts/Intro0_Introduction_to_Using_GenevaERS.md)

The following page provides you with an introduction to the GenevaERS Performance Engine and how to use it.  You will be able to:
- Identify the phases of the Performance Engine 
- Identify the main inputs and outputs for each phase

[Performance Engine](Concepts/Intro1_Introduction_to_the_Performance_Engine.md)

## Basic Skills

The examples here are based on the Demo data. If you haven't installed the Demo, then it is highly recommended you do. Go [here](https://genevaers.github.io/Demo/)

**Import the Demo XML into the Workbench in a new environment**

1. Using your preferred file transfer method, download *your-hlq*.GVBDEMO.WB.XML to a folder on your PC.
2. Start up the Workbench.
3. Select **Administration** > **New** > **Environment**
4. In the **Name** field type **DemoEnv**
5. Uncheck **Generate a Control Record**
6. Save using either **cntl+s**, or click the save symbol on the tool bar.
7. Select **Administration** > **Import**
8. Type the following in the Import Utility window
    - Target Environment: **DemoEnv**
    - Component Type: **View Folder**
    - Archive Folder: ***your-PC-folder***
9. Select the XML file that is listed in **File(s)**
10. Click **Import**

This imports in to the Workbench all the PFs, LFs, LRs, Lookup Paths, and Views associated with the Demo.
 
You can now create a new View using some of the Demo metadata.

[Example 1: Creating a new View](Examples/NewView.md)

[Example 2: Adding a filter](Examples/AddExtractFilter.md)

[Example 3: Adding a Lookup field]
