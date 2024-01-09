---
title: Introduction to Using GenevaERS
nav_order: 2
---

# Introduction to Using GenevaERS

This page provides you with a broad overview of GenevaERS and the basics of its graphical user interface. It will help you: 
- Identify the two major software components of GenevaERS
- Identify the major types of GenevaERS metadata
- Navigate the GenevaERS Workbench, and
- Create a simple view.  

## GenevaERS Overview

GenevaERS is a software application development tool that solves high-volume data analysis and reporting problems. GenevaERS provides capabilities for data transformation, data mining, database query, and financial reporting.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Components" src=images/Module1-Introduction-to-Views/Module1_Slide4.jpeg title="GenevaERS Components"/> 

GenevaERS consists of two software components: the PC-based Workbench and the mainframe-based batch process known as the Performance Engine. Developers use the Workbench to build applications that are stored in a metadata repository in an IBM¬Æ  DB2¬Æ  database. These applications are then run by the Performance Engine, which reads data from source files or databases, transforms it, and writes it to output files.

<div style="clear: right" > 

## Metadata
Several types of metadata make up a GenevaERS application. The most common are 
- the environment definition, 
- the physical file definition (or PF), 
- the logical file definition (or LF), - the logical record definition (or LR), 
- the view definition, and the view folder.  

Note that, when discussing GenevaERS metadata, we often omit the word definition, because it is usually clear from the context whether we mean the metadata or the entity it refers to.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Environments" src=images/Module1-Introduction-to-Views/Module1_Slide6.jpeg title="GenevaERS Environments"/>

An environment definition describes a logical collection of metadata within the GenevaERS Workbench. Typical types of environments include development, production, or training environments. Access to an environment can be restricted to a certain set of users.  

Some major components of the metadata include:
- A physical file definition, or PF, describes a data source. Examples include customer or order files. 

- A logical file definition, or LF, describes a collection of one or more physical files. 

- A logical record definition, or LR, describes a record layout. In COBOL programs, record layouts are often found in copybooks. In relational databases, they are found in table definitions.

Some examples of these metadata types are shown here. 

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Metadata" src=images/Module1-Introduction-to-Views/Module1_Slide7.jpeg title="GenevaERS Metadata"/> 

- A logical record for a customer is used to map data to a customer logical file. The customer logical file refers to data in a customer physical file.  
- An order logical record is used to map data from a logical file named ORDER_001, which refers to data in a single physical file named ORDER_001.  
- The order logical record can also be used to map data from a logical file named ORDER_ALL. ORDER ALL refers to a collection of order physical files.

<div style="clear: right" > 

## Views


<img style="float: right;" width="50%" vspace="5" src=images/Module1-Introduction-to-Views/Module1_Slide8.jpeg title="GenevaERS View Folders" alt="GenevaERS View Folders"/>

A view definition describes a data transformation. It is analogous to a program or a query. Views are the basic units of work that are performed by the Performance Engine.  

Views are often grouped together into view folders for ease of maintenance. View folders are often named for a particular developer or function. Security can be applied to view folders to prevent unauthorized access.  

<div style="clear: right" > 

## Workbench
The GenevaERS Workbench is used to add, change, and delete GenevaERS metadata. 
<img style="float: right" width="50%" vspace="5" alt="GenevaERS Workbench" src=images/Module1-Introduction-to-Views/Module1_Slide9.jpeg title="GenevaERS Workbench"/> 


It contains a menu and toolbar, and consists of multiple display areas, or frames.  

- The Navigator area displays the types of metadata available.  

- The Metadata List area displays a list of items for the selected metadata type.  

- And the Editor area is the part of the screen where you modify metadata items.

### Views and Folders
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Workbench" src=images/Module1-Introduction-to-Views/Module1_Slide10.jpeg title="GenevaERS Workbench"/>

By expanding the View Folders item in the Navigator area, you can see a list of all view folders.  

The contents of the selected folder are displayed in the Metadata List area. 

From there, you can select a view for editing and the view will be displayed in the Editor area.

### View Properties
View information is displayed on two separate screens:
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Properties" src=images/Module1-Introduction-to-Views/Module1_Slide11.jpeg title="GenevaERS Properties"/>

- The View Editor screen, where you can define specific data transformations.
- The View Properties screen, where you can modify information that applies to the whole view.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Output" src=images/Module1-Introduction-to-Views/Module1_Slide12.jpeg title="GenevaERS Output"/>

You use the General tab on the View Properties screen to specify the output format, flat file or hardcopy report, and other related information.  

This tab also displays information about when the view was created and last modified and by whom.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Folder" src=images/Module1-Introduction-to-Views/Module1_Slide13.jpeg title="GenevaERS Folder"/>

In addition, the General tab displays the name of the view folder where the view is stored.   

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Advanced Features" src=images/Module1-Introduction-to-Views/Module1_Slide14.jpeg title="GenevaERS Advanced Features"/>

You can access advanced features on the Extract Phase tab and the Format Phase tab. You can open these tabs by single-clicking them.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Toggle" src=images/Module1-Introduction-to-Views/Module1_Slide15.jpeg title="GenevaERS Toggle"/>

You can toggle back and forth between the View Properties screen and the View Editor screen by clicking the first icon in the Editor area toolbar, or by pressing the F9 key. 

### View Editor
<div style="clear: right" > <img style="float: right; " width="50%" vspace="5" alt="GenevaERS View Editor" src=images/Module1-Introduction-to-Views/Module1_Slide16.jpeg title="GenevaERS View Editor"/>

In View Editor mode, the Workbench displays several frames of view information.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Editor Grid" src=images/Module1-Introduction-to-Views/Module1_Slide17.jpeg title="GenevaERS View Editor Grid"/>
The View Editor grid displays the characteristics of view output columns. These characteristics include the data type, the length, and the alignment, such as left, right, or center.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Source Properties" src=images/Module1-Introduction-to-Views/Module1_Slide18.jpeg title="GenevaERS Source Properties"/>

You can display information about the data source for the view by right-clicking a blue cell in the View Editor grid. This information includes the logical record and the logical file.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Column Properties" src=images/Module1-Introduction-to-Views/Module1_Slide19.jpeg title="GenevaERS Column Properties"/>

To open a frame showing the column source properties, you right-click a green cell. The source of a column‚Äôs data can be a field in the source file, a constant, a lookup value, or the result of a formula.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Edit Functions" src=images/Module1-Introduction-to-Views/Module1_Slide20.jpeg title="GenevaERS Edit Functions"/>

The View Editor incorporates several functions, such as inserting a column or activating a view. You can run a View Editor function in several ways: 
- Select it from the Edit menu or the Action menu for the Workbench
- Left-click the function icon on the View Editor toolbar 
- Right-click in the View Editor grid and select the function from the pop-up menu 
- Or press the appropriate key combination, which is noted on the Workbench menu and the pop-up menu.  

Choose whichever technique you prefer.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Edit New Source" src=images/Module1-Introduction-to-Views/Module1_Slide21.jpeg title="GenevaERS Edit New Source"/>

To add a new view source, you right-click on the grid to display the pop-up menu, and then select Insert and View Source.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS Edit New Source 2" src=images/Module1-Introduction-to-Views/Module1_Slide22.jpeg title="GenevaERS Edit New Source 2"/>

The Insert View Source window opens. You can select from a list of data sources in the window.  

<div style="clear: right" > 

## Example View

<img  style="float: right;" width="50%" vspace="5" alt="GenevaERS Programming" src=images/Module1-Introduction-to-Views/Module1_Slide24.jpeg title="GenevaERS Programming"/>

Now let’s take what you’ve learned and create your own view. 

The following example is a simple data transformation, reading data from the ORDER001 file and writing out only the Order ID, Customer ID, and Total Amount fields.  

If we were to code a conventional program, we would:
- Define the file attributes
- Define the record layouts
- Code the business logic
- Compile the program
- Link the program and
- Run the program

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example" src=images/Module1-Introduction-to-Views/Module1_Slide25.jpeg title="GenevaERS View Example"/>

With the GenevaERS tool, the first three steps are performed in the Workbench and the last three are performed for you by the Performance Engine.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example 2" src=images/Module1-Introduction-to-Views/Module1_Slide26.jpeg title="GenevaERS View Example 2"/>

Defining files and records will be covered in the GenevaERS training module entitled "Creating Metadata." T

The Performance Engine will be introduced in the Performance Engine Overview module. The topic of coding business logic will be introduced in the next few slides.  

In the example described in the following slides, metadata has been pre-populated in the Workbench for ease of instruction.  


To create a new view, click the Administration menu, select New and then select View.
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Start" src=images/Module1-Introduction-to-Views/Module1_Slide27.jpeg title="GenevaERS View Example Start"/>


The View Properties tab opens.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Properties" src=images/Module1-Introduction-to-Views/Module1_Slide28.jpeg title="GenevaERS View Example Properties"/>

Enter a descriptive name for the view, such as Simple_Transformation_View Note that embedded spaces are not allowed in names, so you must use underscores to separate words. Next, clear the Format Phase check box; this feature is not needed for this simple view.

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Name" src=images/Module1-Introduction-to-Views/Module1_Slide29.jpeg title="GenevaERS View Example Name"/>

To display the View Editor Grid, select Show Grid or Properties, from the Edit menu (Alternatively, you can click the toolbar icon or press the F9 key). 

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Editor" src=images/Module1-Introduction-to-Views/Module1_Slide30.jpeg title="GenevaERS View Example Editor"/>

From the Edit menu, select Insert, and then select View Source (Alternatively, you can right-click and select Insert and then select View Source from the pop-up menu, or you can press the Shift key and the Insert key). The Insert View Source window opens.
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Source" src=images/Module1-Introduction-to-Views/Module1_Slide31.jpeg title="GenevaERS View Example Source"/>

From the Logical Record list, select ORDER. Then, from the Logical File list, select ORDER_001.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Source 2" src=images/Module1-Introduction-to-Views/Module1_Slide32.jpeg title="GenevaERS View Example Source 2"/>

From the Edit menu, select Add Column (Alternatively, you can click the plus sign icon on the toolbar or press Alt and the Insert key). A new column is added to the grid.  
<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Column" src=images/Module1-Introduction-to-Views/Module1_Slide33.jpeg title="GenevaERS View Example Column"/>

Click the green cell. The Column Source Properties frame opens on the right.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Source Properties" src=images/Module1-Introduction-to-Views/Module1_Slide34.jpeg title="GenevaERS View Example Source Properties"/>

In the Column Source Type field, click the list box and select Source File Field.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Field Type" src=images/Module1-Introduction-to-Views/Module1_Slide35.jpeg title="GenevaERS View Example Feild Type"/>

In the Column Source Value field, click the list box and select ORDER_ID.   

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Value" src=images/Module1-Introduction-to-Views/Module1_Slide36.jpeg title="GenevaERS View Example Value"/>

Repeat the previous steps to add columns for Customer ID and Order Total Amount. Then save the view by selecting Save from the File menu, or by clicking the Save icon in the Workbench toolbar, or by pressing Control and S.  

<div style="clear: right" > <img style="float: right;"  width="50%" vspace="5"  alt="GenevaERS View Example Repeat" src=images/Module1-Introduction-to-Views/Module1_Slide37.jpeg title="GenevaERS View Example Repeat"/>

To activate the view, use any of these methods: 
Select Activate from the Action menu
Press the Activate icon on the View Editor toolbar
Press F5.  

<div style="clear: right" > <img style="float: right;" width="50%" vspace="5" alt="GenevaERS View Example Complete" src=images/Module1-Introduction-to-Views/Module1_Slide38.jpeg title="GenevaERS View Example Complete"/>

The view title bar now displays the word "Active". Save the view again to preserve this active state. The view is now ready to be run.


<div style="clear: right" >
