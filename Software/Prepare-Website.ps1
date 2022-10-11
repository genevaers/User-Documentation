	
$ScriptName = 'Prepare-Website-NEW.ps1'
$ScriptVersion = '2.0'

<# Prepare-Website.ps1 - the script to process Markdown includes for a GitHub website.
	
	This power shell script is designed for Windows 10 where folder and file names can contain spaces.
	This power shell script works on a file structure that is a clone of a GitHub repository.
	
	The GitHub respository consists of markdown files in folders.  The website is from GitHub Pages
	and could be a Jekyll website where the folder for the website is "docs".
	
	For example, the clone is stored in				"C:\Git\RepoABC" 
	and the Jekyll website (for GitHub Pages) in 	"C:\Git\RepoABC\docs".
	This script was tested using a Jekyll website using theme "just-the-docs".
	
		This script allows markdown files in the website to include other markdown files.
	See "OVERVIEW" about 75 lines below. 
	
	Version 1.1  9 Aug, 2022
			Folder AI Info is now AI-Info
			Folder AC Expanded Common is now AC-Expanded-Common
			Folder AD Expanded Topics is now AD-Expanded-Topics
			These changes allow gitignore to usesfully point to these folders.
	Version 2.0  07 Oct, 2022
			Folder AA Topic Markdown is now    All Markdown Topics
			Folder AC Common Markdown is now   Common Modules
			Folder AI-Info is now              Logs
			Folder AS-Software is now          Software
			Folder AC-Expanded-Common is now   Temp\Expanded-Common
			Folder AD-Expanded-Topics is now   Temp\Expanded-Topics
			Folder Temp (ToDoIncludes) is now  TempInclude
			Params folder has less variables.  Run script from Software folder.
			Syntax of includes now uses [[ ]] rather than curly brackets.
			Report has more details includign 
				List of common files, list of topic files,
				common files with includes, topics with includes,
				comparison of params to usage.
	
	
	DETAILS OF CODING
	=================
	
	Search on "Codex.x" to find where that coding is actually placed.

	Func00.01	Function Confirm-Folders
	Func00.02	Function Find-Path
	Func00.03	Function Find-Filename

	Code01.00	Establish parameter values. 
	    Code01.01	Setup default values.
		Code01.02	Look for file Prepare-Website-Params.txt
		Code01.10	Read Params file line by line.
		Code01.20	Ignore comments and blank lines.
		Code01.30	Read parameter=value into $line[0] and $line[1].
		Code01.40	Use $line[0] to set parameter name and $line[1] to set the value
		Code01.41	Param values found.
		Code01.50	Setup related folders starting from Software folder
		Code01.60	Check permanent folders (All MD Topics, Common, docs, Logs, Software)
		Code01.70	Check temporary folders
		Code01.80	Check values of parameters

	
	Code02.00	Add more lines to files.
		Code02.10	Add lines to REPORT file.  
		Code02.20	Add lines to TRACE File.     

	Code03.00	Setup common file arrays
		Code03.01	Declare one dimensional arrays for common files
		Code03.10 	Test if common files exist
		Code03.20	Situation no common files exist
		Code03.30	Read common files and setup array sizes and initial values
		Code03.40	Setup two dimensional arrays for Common files
		Code03.50	Check all common files have unique Filenames

	Code04.00	Setup topic file arrays
		Code04.01	Declare one dimensional arrays for topic files
		Code04.10	Test if topic files exist
		Code04.20	Situation no topic files exist
		Code04.30	Read topic files and setup array sizes and initial values
		Code04.40	Setup two dimensional arrays for topic files
		Code04.50   Check all topics do not match any common file names
		Code04.60   Delete md files under website folder
		Code04.61	List all folders under the website folder
		Code04.62	Delete all md files under website folders except underscore folders

	Code05.00	Populate common includes array
		Code05.01  Initialise variables
		Code05.10  Read all common files and record includes in array
		Code05.20  Includes - check how coding starts
		Code05.21  Includes - check how coding ends
		Code05.22  Includes - check if coding is almost right
		Code05.23  Housekeeping - set flags and counters.
		Code05.24  Get the include details from the include coding
		Code05.25  Put in ".md" as last three chars if not already there
		Code05.26  If include coding starts with slash, remove it
		Code05.27  Check if this include is already an include for this common file
		Code05.28  Test that include points to an existing common file
		Code05.29  Record include in CommonIncludesArray
		Code05.30  Display common files that have includes

	Code06.00	Populate topic includes array
		Code06.01  Initialise variables
		Code06.10  Read all topic files and record includes in array
		Code05.20  Includes - check how coding starts
		Code05.21  Includes - check how coding ends
		Code05.22  Includes - check if coding is almost right
		Code06.20  Includes - check how coding starts
		Code06.21  Includes - check how coding ends
		Code06.22  Includes - check if coding is almost right
		Code06.23  Housekeeping - set flags and counters.
		Code06.24  Get the include details from the include coding
		Code06.25  Put in ".md" as last three chars if not already there
		Code06.26  If include coding starts with slash, remove it
		Code06.27  Check if this include is already an include for this topic file
		Code06.28  Test if include points to an existing common file
		Code06.29  Record include in TopicIncludesArray
		Code06.30  Topics without includes are copied to the website immediately
		Code06.32  Display topic files that have includes
		Code06.40  End processing if any errors in includes found (for either common or topic files)

	Code07.00	Create pathway table for common files and check for circular includes
		Code07.10	Setup Pathway arrays
		Code07.20	Generate Pathways from common includes
			Code07.21	Create new 2-step pathway for NewPathwayArray
		Code07.30	Find extra pathways Case ExistingPathDuplAddLast
			Code07.31   Duplicate pathway for ExistingPathDuplAddLast
			Code07.32   Check if new last step is too far
			Code07.33   Add new last step for ExistingPathDuplAddLast
			Code07.34   Check for circular include
		Code07.40   Find extra pathways Case NewPathExtend
			Code07.41   Setup CheckExtend array
			Code07.42   Search existing pathways (Do While KeepChecking)
			Code07.43   Search existing pathways (Do While StillPathways & NoExtension)
			Code07.44   Duplicate pathway for NewPathExtend
			Code07.45   Check if new last step is too far
			Code07.46   Add new last step for NewPathExtend
			Code07.47   Update CheckExtend array
			Code07.48   Check for circular include
		Code07.50   Find extra pathways Case ExistingPathDuplAddFirst
			Code07.51   Duplicate pathway for ExistingPathDuplAddFirst
			Code07.52   Check if new last step is too far
			Code07.53   Add new last step for ExistingPathDuplAddFirst
			Code07.54   Check for circular include
		Code07.60	Check for circular includes in NewPathwayArray
		Code07.70	Add NewPathwayArray to ExistingPathwayArray
		Code07.90	Display ExistingPathwayArray

	Code08.00	Calculate Priorities for common includes
		Code08.10	Priority 0 for commons that have no includes
			Code08.11	Find common files with no includes and update CommonPriorityArray to 0
			Code08.12	Update CommonIncludesArray where Include = common found above
			Code08.13	Update CommonIncludesPriorityArray to have 0 for common found above
			Code08.14	Check for any includes priorities still -1 and display priorities
		Code08.20   Priority 1 for commons that have all includes at priority = 0
			Code08.21	Find commons with all includes at priority 0; update CommonPriority to 1	1
			Code08.22	Update CommonIncludesArray where Include = common found above
			Code08.23	Update CommonIncludesPriorityArray to have 1 for common found above
			Code08.24	Check for any includes priorities still -1
		Code08.30	Priority x for commons that have all includes at 0 to x-1
			Code08.31	Find commons with all includes in priority range 0 to (x-1) 
			Code08.32	Update CommonIncludesArray where Include = common found above
			Code08.33	Update CommonIncludesPriorityArray to have x for common found above
			Code08.34	Check for any includes priorities still -1
		Code08.40	Check all common priorities are >= 0 and fill in TopicIncludesPiorities

	Code09.00 	Calculate Priorities for topic includes

	Code10.00	Create ToDoIncludes List
		Code10.10	Create ToDoIncludes arrays
		Code10.20	Populate ToDoIncludes arrays
		Code10.30	Display ToDoIncludes in trace

	Code11.00	Perform ToDoIncludes List
		Code11.10	Ensure new TempInclude folder
		Code11.20   Loop for ToDoIncludes
		Code11.30	Copy input files into TempInclude
		Code11.40	Ensure folders in Expanded Folders.
		Code11.50	Create Expanded file and open requesting file
		Code11.60	Find include coding and copy to expanded file
		Code11.70	Copy epxanded topic to website path
		
	Code12.00	Copy images folder from topics folder to website folder
		Code12.10	Check if All Markdown Topics folder has an images folder
		Code12.20	Delete any existing website images folder
		Code12.30	Copy from All Markdown Topics Images folder to website images folder - all files and folders
	
	Code13.00	Final report lines





		 
	
					
	Code099	Finish
	
	
	
	
	OVERVIEW OF THIS SCRIPT: Prepare-Website
	========================================

	(Overview1.0)

	This script allows a topic markdown file (say Aspect A.md) to include another markdown file
	(say C1.md), which means the contents of C1.md is copied into a location in Aspect A.md. 
	
	The file Aspect A.md can be called the "requesting" file. 
	
	The file C1.md can be called the "include" file and can also be called a "common" file because
	it can be included in other files like Aspect B.md. The name "C1" is short for "Common 1".  

	When file C1.md is inserted into the correct position in topic file Asoect A.md then we have
	created the "expanded" version of the topic. 
	
	Why do this?  This is a "copybook" situation, where the same data is available in multiple
	places.  Any changes to that data are done once only - in the relevant common file.  
	Next time the website is prepared, all the places that include that file are changed.
	
	Souncs easy - but there are some complications:
	
	(Overview1.1) 

	A. A common file can also have includes.   For example, C1 includes C2 which includes C3.
		C1 can be included from a topic, so that is a level 1 include.  C3 is hence at level 3.
		A parameter decides the maximum depth - choose the depth required. 
		In this situation, the scripts works out the correct order for the includes to be processed. 
		In this example, the include of C3 into C2 must be done before the include of C2 into C1. 
		The script does this automatically.
	
	B. This script checks for a possible circular includes, where a common file either directly or
	  	indirectly tries to include itself.  For example, if C1 includes C2 which includes C1 then
		that is	a circular include.  The script checks for this and stops with an error message
		when found.
	   	
	C. A requesting topic cannot include another topic.  This is because a topic in a Jekyll website
	   has "front matter" which is unique to that topic.  If a requesting file has front matter and
	   the include file has front matter then we have a problem of overwrite of front matter.  For
	   this reason, the script requires that a requesting file (either a topic of a common file) can
	   only include a common file which has no "front matter". Any attempt to include a file that has
	   front matter gets an error message.  
	
	D.  The script does not know in advance where the incldes are.  The script scans the folder 
	    "Common Modules" (and sub-folders) to find any common files and whether they have includes. 
		The script also scans folder "All Markdown Topics" (and sub-folders) to find any topics that have
		includes. If no errors are found, then the includes are procesed in the correct order appropriate.

		The expanded version of common files are copied to folder "Temp\Expanded-Common" to the same
		sub-folder as the requesting file has in folder AC.  The expanded common file can be used in 
		other includes (for common files and/or topics).
	
	    The expanded version of a topic (with includes) is copied to folder "Temp\Expanded-Topics" to the
		same sub folder as the requesting file has in folder All Markdown Topics.  Those expanded versions
		are also copied to the website folder "docs" (to the same sub folder).

		Topics without includes are copied from folder "All Markdown Topics" direct to the website folder
		(to the same sub folder).
	
	E.  The actual include is done by Code11.00 - mainly in 11.50 and 11.60. 
		
	
	The above points give maximum flexibility on includes while avoiding problems like circular
	includes and overwrite of front matter.
	
	(Overview2.0)

	HOW TO ACHIEVE MARKDOWN INCLUDES USINIG THIS SCRIPT.
	===================================================== 
	
	The situation is that topic file Aspect A.md (in folder All Markdown Topics\Folder A) requires
	information already in topic file Aspect B.md (in folder All Markdown Topics\Folder B).
	
	1.  Create file C1.md which has the common information.  C1.md does NOT have front matter - the
	    file is just markdown text which may have links and/or graphics.
	
	2.  Place C1.md in a folder under "Common Modules (see IMPORTANT FOLDER INFO below). Let's
	    say we place C1.md in folder Common Modules\General Common Files.  The name "General
	 Common Files" can be anything - this is just an example name.  It is an advantage to group 
	 common files into folders like this.
	
	3.  Both Aspect A.md and Aspect B.md get this coding on a line by itself:
		     [[ INCLUDE General Common Files\C1 ]]
		
	4.  Ensure all changes to files (such as Aspect A.md, Aspect B.md and C1.md) are complete. 
	    See IMPORTANT FOLDER INFO below.
	
	5.  In a powershell window, do the following:
	        (a) Navigate to C:\Git\RepoABC\Software using cd commands.
	        (b) Execute command ./Prepare-Website
		
	6.  If you see "Successful end", then the includes are now processed.
	    Optional: if your website is a Jekyll website, this can be viewed locally using Jekyll
		serve in the usual manner.  When appropriate, commit and merge the changes in all folders
		to the repo into GitHub.  The website is available in GitHub pages in the usual manner.
	
	
	
	(Overview3.0)
	
	IMPORTANT FOLDER INFO
	=====================
	The folders discussed here are part of a clone of a repo in GitHub.  This repo has a folder
	similar to "docs" which is a GitHub Pages website.   This script was tested with a Jekyll
	website in the "docs" folder that used the Jekyll theme "just-the-docs". 

	Typically your clone is stored in C:\Git\reponame.  This is the repository in GitHub.
	
	Under that you typically see folder "docs" which stores the website markdown files.
	
	The folders required in your repo are:
		All Markdown Topics
		Common Modules
		docs	
		Temp\Expanded-Common
		Temp\Expanded-Topics
		Logs
		Software


	Folder All Markdown Topics
	==========================
	This folder contains topics for the website.  Normally, the TopicsFolder has sub-folders
	which group together topics.

	For example, the TopicsFolder may contain the following:
		All Markdown Topics\Folder A
			Aspect A1.md
			Aspect A2.md
	
		All Markdown Topics\Folder B
			Aspect B1.md
			Aspect B2.md
	
	Let's say that Aspect A1 and Aspect B1 both want file C1 included.
		
	Files Aspect A1.md and Aspect B1.md contain the following coding (on a seperate line):
		[[ INCLUDE General Common Files\C1 ]]
	
	This coding makes include work (if C1.md exists in the given path) when the script is run.
	
	
	Folder Common Modules
	======================
	
	This folder contains common markdown files that can be included in any topic.
	Normally, this folder has sub-folders which group common files together.
	For example, folder:   	Common Modules\General Common Files
	contains file:          C1.md
	
		
	
	Folder Temp\Expanded-Common
	===========================
	
	This folder is used by the script and is provided for your information only. 
	Do not change anything in this folder.
	
	This folder contains the expanded version of any common file that has includes. 
	For example, C1.md can include C22.md.  When that include is done, the expanded version
	of C1 is stored in folder Temp\Expanded-Common.
	
	The script uses expanded common files in folder Temp\Expanded-Common in the relevant
	topic includes.  Example:
		1. Common file "C1.md" in folder "Common Modules\General Common Files",
		2. Expanded version of C1.md is prepared in "Temp\Expanded-Common\General Common Files".
		   The expanded version has C22 inserted at the correct location.
		3. When Aspect A1.md includes C1, it is the expanded version of C1 that is inserted.
		
	
	
	Folder Temp\Expanded-Topics
	===========================
	
	This folder is used by the script and is provided for your information only. 
	Do not change anything in this folder.
	
	This folder contains the expanded version of a topic that has includes.
	
	The script copies expanded topic files from Temp\Expanded-Topics to the website folder.
	This is how the expanded versions of topics appear on the website - by being copied
	to the website folder somewhere.

	Example:
		1. Topic file "Aspect A1.md" is in folder "All Markdown Topics\Folder A",
		    Aspect A1.md includes C1 which included C22.  
			This means that Aspect A1 needs to receive the expanded version of C1
			from fodler "Temp\Expanded-Common\General Common Files".
		2. Expanded version of Aspect A1.md is prepared in "Temp\Expanded-Topics\Folder A".
		3. Expanded version of Aspect A1.md is copied to from there to folder "docs\Folder A". 
	
		
	Folder Logs
	===========
	
	This folder contains an error file, a report file, and a trace file.  ALl three files are about
	running this script.
	
	The error file contains the errors that need action.

	The report contains useful information: all error messages, extra informational messages, 
	and statistics on topic files, common files and includes done. 
	
	The trace file contains even more and is mainly used by the developer to debug any problems
	and verify the correct processing.
	
	
	Folder Software
	===============
	
	This folder contains:
		1.  This script which can be run to do the include processing.
		2.  File Prepare-Website-Params.txt.  Normally, do not touch this file.
	
	
	Folder TempInclude
	==================
	This folder is created by the script and only exists when the script is running. 
	If this folder still exists after the script has finished, it can be deleted.

	
	Folder "docs"
	=============
	
	This folder contains the files that create a jekyll website. 
	
	(Overview4.0)
	
	Parameters to this script
	=========================
	
	The script needs to know where to find the data on your laptop.   Update the file
	Software\Prepare-Website-Params.txt with the values relevant to your machine.
	
	The parameters are below:

	RepoFolder		This can be any name.  For a GitHub repository this is typically
					C:\Git\reponame where reponame is the name of the GitHub repository.

	WebsiteFolder   This can be any name.  For a Jekyll website that is part of a 
					GitHub repository, this is typically C:\Git\reponame\docs.
					The WebsiteFolder is typically underneath RepoFolder, but this is
					not necessary.

	DisplayInfo    Typically Yes.  
				   This might be set to No if the script is being run in the background.
				   This controls whether the script will dispaly error messages and other
				   information when the script is running.  If uinformation not displayed
				   is always in the report in folder Logs.

	MaxIncludesPerFile   One topic can request up to this number of includes.
						 This caters for some topics that are collections of includes.
						 Set this parameter higher if the default (20) is not enugh.
						

	MaxDepthCommonIncludesCommon 	Depth is where one common file includes another common file.
						Set this parameter higher if the default (5) is not enough.
						See also Overview 1.1 above, point A.

	MaxPathways     This is how the script tests for circular includes. 
					Set this parameter higher if an error message instructs you to do so.
 #>

#	Func00.01	Function Confirm-Folders (EF)

Function Confirm-Folders {

	# 	Function Confirm-Folders is given a base and a path
	#	This functdon ensures that the combination of base+path exists as a folder structure
	#	This is done by ensuring each folder in the path is added one by one until they are all there.

	Param ([string]$a,[string]$b) 

	$EF_Base = $a
	$EF_Folders = $b

	If (-not (Test-Path $EF_Base -PathType container)) {	
		#	Base does not exist.  Stop function immediately.
		Return 'ERROR - Base folder does not exist ' + $EF_Base
	}
	
	If ( ($Null -eq $EF_Folders) -or
         ($Null -eq $EF_Folders.Trim() ) ) {
		#	The base exists and the target folders are empty, so nothing to do
		Return 'SUCCESS'
	}

	#	Inside $EF_Folders are folder names possibly split by \.  Create an array with these.

	$EF_FoldersArray = $EF_Folders.Split("\")

	$EF_CurrentBase = $EF_Base

	#	Check each folder exists

	For ($Folderindex = 0; $Folderindex -lt $EF_FoldersArray.length; $Folderindex++) {
		
		$EF_CheckPath = $EF_CurrentBase + '\' + $EF_FoldersArray[$Folderindex]

		If (-not (Test-Path $EF_CheckPath -PathType container)) {	

			#	$EF_CurrentBase does not have folder $EF_FoldersArray[$Folderindex], so create it.

			New-Item $EF_CheckPath -itemType Directory | Out-Null	
			
		}

		# 	Either $EF_CheckPath already existed or was created.  So the new base is $EF_CheckPath

		$EF_CurrentBase = $EF_CheckPath

	}	#	Next Folderindex

	Return 'SUCCESS'

}

#	Func00.02	Function Find-Path (FP)

Function Find-Path {

	# 	Function Find-Path is given a base and a fullpath
	#	This functdon takes the base out of fullpath, and takes the filname out of fullpath.
	#	This function returns the path that is left.
	#	For example, if C:\MyBase is the base, and
	#					C:\MyBase\A\B\Common1.md is the full path
	#	then this function returns A\B

	Param ([string]$a,[string]$b) 

	$FP_Base = $a
	$FP_FullPath = $b
	$FP_Path = ''			# 	Initial value

	#	Omit base (and the trailing backslash) by skipping the right number of characters

	$FP_SkipBase = $FP_Base.length + 1
	$FP_PathAndFile = $FP_FullPath.substring($FP_SkipBase)

	# The filename is after any last remaining backslash.

	If ($FP_PathAndFile.contains("\")) {
		#	There is at least one backslash, so split FP_PathAndFile by the backslash character.

		$FP_PathAndFileArray = $FP_PathAndFile.Split("\")

		$FP_PathLength = $FP_PathAndFileArray.length - 1

		$FP_Path = $FP_PathAndFileArray[0]

		For ($Pathindex = 1; $Pathindex -lt $FP_PathLength; $Pathindex++) {

			$FP_Path = $FP_Path + '\' + $FP_PathAndFileArray[$Pathindex]

		}
		Return $FP_Path

	} else { 	#  There is no backslash, so there is no path - return null
		Return $FP_Path
	}

	

}

#	Func00.03	Function Find-Filename (FF)

Function Find-Filename {

	# 	Function Find-Filename is given a fullpath to file.
	#	This functdon returns just the filename part of the given fullpath.
	

	Param ([string]$a) 

	$FF_FullPath = $a
	
	$FF_PositionBackslash = $FF_FullPath.IndexOf("\")
	If ($FF_PositionBackslash -eq -0) {

		#	There is no backslash, so FF_FullPath is purely a filename
		
		Return $FF_FullPath

	}

	#	There is a backslash, so split FF_FullPath by the backslash character.

	$FF_FullPathArray = $FF_FullPath.Split("\")

	$FF_PathLength = $FF_FullPathArray.length -1

	#	Filename is the last entry in this array

	$FF_Filename = $FF_FullPathArray[$FF_PathLength]

	Return $FF_Filename

}




# 	Code01.00	Establish parameter values. 

$ShowText = 'M01.00A  Start Prepare-Website' 

#	Powershell default coding is UTF-16 LE but Jekyll requires UTF-8.  This is set below:

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'



#   Code01.01		Setup default values.

#  DEFAULT VALUES OF PARAMETERS

$DisplayInfo                       = 'Yes' 		# Yes/No.  Set to No for a background process.
												# This var sets $DisplayInfoInScript (True/False)
$MaxIncludesPerFile                = 20			# This applies to both topics and common files.
$MaxDepthCommonIncludesCommon 	   = 5			# A includes B includes C etc. to F at most.
$MaxPathways                       = 500		# Rows for array to test for circular includes.

$LargestIncludesPerCommon           = 0			# Shows how many are needed for the markdown data.
$LargestIncludesPerTopic            = 0			# Shows how many are needed for the markdown data.
$UsedDepthCommonIncludesCommon 	    = 0			# Shows the depth needed for the markdown data.
$UsedPathways                       = 0			# Shows Pathways needed for the markdown data.


#  Include Coding syntax values

$IncludeDelimeterStart = '[['
$IncludeDelimeterEnd = ' ]]'
$IncludeStart12Chars = "[[ INCLUDE: "
$IncludeStart11Chars = "[[INCLUDE: "
$IncludeLiteral = "INCLUDE:"
$MDCommentCoding = '[//]: #'



#	Interim value of DisplayInfoInScript.  Will be altered by valkue of param DisplayInfo

$DisplayInfoInScript = $True


# Note: LineEndings are CRLF because this is Jekyll under Windows.


#	Code01.02		Look for file Prepare-Website-Params.txt

#Find the script file that is running.

$ScriptFile = $MyInvocation.MyCommand.Path
# $ShowText = 'M01.02A  ScriptFile ' + $ScriptFile
# Write-Host $ShowText

#   Find folder for script.

$ScriptFolder = Split-Path $ScriptFile -Parent
# $ShowText = 'M01.02B  ScriptFolder ' + $ScriptFolder
# Write-Host $ShowText

$SoftwareFolder = $ScriptFolder

#   Params file should be in same folder as script.

$FoundParamsFile = $False

$ParamsFileFullPath = $SoftwareFolder + '\Prepare-Website-Params.txt'
#   $ShowText = 'M01.02D  ParamFile ' + $ParamsFileFullPath
#   Write-Host $ShowText

If (Test-Path -Path $ParamsFileFullPath -PathType leaf) {
	$FoundParamsFile = $True
#	$ShowText = 'M01.02E  Params found at ' + $ParamsFileFullPath 
#	Write-Host $ShowText
} else {
	# Default values already set in 01.01 above.
}	

If ($FoundParamsFile) {

	#	Found Prepare-Website-Params.txt
	#
	# 	Code01.10	Read Params file line by line.
	#
	$ParamsFileContents = Get-Content -Path $ParamsFileFullPath
	Foreach ($line in $ParamsFileContents) {
			#	$ShowText = 'M01.10A  Line is ' + $line + ' ' 
			#	Write-Host $ShowText
		
		$TrimLine = $line.Trim()
			#	$ShowText = 'M01.10B  TrimLine is ' + $TrimLine + ' '
			#	Write-Host $ShowText
		
		$FoundParamComment = $False
		$FoundParamBlankLine = $False
	
		If  ($TrimLine.StartsWith('#')){ 
			$FoundParamComment = $True
		 		#	$ShowText = 'M01.10C      *** Ignore comment ***' 
		 		#	Write-Host $ShowText
		} 
		If ($TrimLine -eq '') {
			$FoundParamBlankLine = $True
			 	#	$ShowText = 'M01.10D      ***** Ignore BLANK line *****' 
		 		#	Write-Host $ShowText		
		} 
	
	
	
		#	Code01.20  Ignore comments and blank lines.
	
		If (( -not ($FoundParamComment)) -and ( -not ($FoundParamBlankLine))) {
		
			#	
			#	Code01.30   Read parameter=value into $line[0] and $line[1].
			#	
			#	$ShowText = 'M01.30A     Found paraneter ' + $line 
			#	Write-Host $ShowText
			$lineorig = $line
			$line = $line.Split('=')
			#	$ShowText = 'M01.30B      Line 0 is ' + $line[0] 
			#	Write-Host $ShowText
			$line[0] = $line[0].Trim()
			#	$ShowText = 'M01.30C      Trimmed Line 0 is ' + $line[0] 
			#	Write-Host $ShowText		
		 	#	ShowText = 'M01.30D      Line 1 is ' + $line[1] 
		 	#	Write-Host $ShowText
			
			$InvalidParam = $False
			$TestParamName = $line[0].Trim()
			$TestParamValue = $line[1].Trim()
			#	ShowText = 'M01.30X     Parameter name is X' + $TestParamName + 'X' 
			#	Write-Host $ShowText
			#	$ShowText = 'M01.30Y     Parameter value is X' + $TestParamValue + 'X' 
			#	Write-Host $ShowText		
		
		
			If ($TestParamName -eq '') {
				ShowText = 'M01.30E     Params line has empty name for line ' + $lineorig 
 				Write-Host $ShowText
				$InvalidParam = $True
			}
		
		
			If ($TestParamValue -eq '') {
				$ShowText = 'M01.30F     Params line has empty value for line ' + $lineorig 
 				Write-Host $ShowText
				$InvalidParam = $True
			}
			If  ($InvalidParam ) {
				$ShowText = 'M01.30G     Params line has empty value or name - run terminated.' 
 				Write-Host $ShowText
				Exit
			}
		
			$OKParamName = $False
			
		
			#	Code01.40	Use $line[0] to set parameter name and $line[1] to set the value
		
			If ($line[0] -eq 'DisplayInfo') {
				$DisplayInfo = $line[1].Trim() 
				#	$ShowText = 'M01.40C  DisplayInfo      = ' + $DisplayInfo 
 				#	Write-Host $ShowText
				$OKParamName = $True
			}

			If ($line[0] -eq 'MaxIncludesPerFile') {
				$MaxIncludesPerFile = $line[1].Trim() 
				#	$ShowText = 'M01.40C  $MaxIncludesPerFile = ' + $MaxIncludesPerFile 
				#	Write-Host $ShowText
				$OKParamName = $True
			}

			If ($line[0] -eq 'MaxDepthCommonIncludesCommon') {
				$MaxDepthCommonIncludesCommon = $line[1].Trim() 
				#	$ShowText = 'M01.40C  $MaxDepthCommonIncludesCommon        = ' + $MaxDepthCommonIncludesCommon 
 				#	Write-Host $ShowText
				$OKParamName = $True
			}

			If ($line[0] -eq 'MaxPathways') {
				$MaxPathways = $line[1].Trim() 
				#	$ShowText = 'M01.40C  MaxPathways     = ' + $MaxPathways 
 				#	Write-Host $ShowText
				$OKParamName = $True
			}

			#	End with error if an invalid parameter name given.
		
			If  ($OKParamName -eq $False) {
				$ShowText = 'M01.40Z     Invalid Param name for line ' + $lineorig 
 				Write-Host $ShowText
				Exit
			}
		
		}	#	End If not comment and not blank line
	}	#	End For each line in ParamsFileContents

}	# If FoundParamsFile



# 	Code01.41	Param values found.

#	Values after param file processing complete

# 	$ShowText = 'M01.41A  DisplayInfo ' + $DisplayInfo 
# 	Write-Host $ShowText
# 	$ShowText = 'M01.41B  MaxIncludesPerFile ' + $MaxIncludesPerFile 
# 	Write-Host $ShowText
# 	$ShowText = 'M01.41C  MaxDepthCommonIncludesCommon ' + $MaxDepthCommonIncludesCommon  
# 	Write-Host $ShowText
# 	$ShowText = 'M01.41D  MaxPathways ' + $MaxPathways 
# 	Write-Host $ShowText



#   Code01.50		Setup related folders starting from Software folder


#  Code01.51  Check "Software" is name of current folder.

$NameSoftwareFolder = Split-Path -Path ($SoftwareFolder) -Leaf
#	$ShowText = 'M01.51AA $NameSoftwareFolder = ' + $NameSoftwareFolder
#	Write-Host $ShowText 


If (-not ($NameSoftwareFolder -ceq "Software")) {
	If (($NameSoftwareFolder -eq "Software")) {
		$ShowText = 'M01.51A  ERROR - Case incorrect for Software Folder'
		Write-Host $ShowText 
		Exit
	} else {
		$ShowText = 'M01.51B  ERROR - Run this script from folder named "Software"'
		Write-Host $ShowText 
		Exit
	}
}


#  "RepoFolder" must exist, becuase the Software folder must have a parent.

$RepoFolder = Split-Path $SoftwareFolder -Parent
#	$ShowText = 'M01.52A  RepoFolder ' + $RepoFolder
#	Write-Host $ShowText


#  Code01.52  Setup folder names.

$TopicsFolder = $RepoFolder + '\All Markdown Topics'
$CommonFolder = $RepoFolder + '\Common Modules'
$ExpandedCommonFolder = $RepoFolder + '\Temp\Expanded-Common'
$ExpandedTopicsFolder = $RepoFolder + '\Temp\Expanded-Topics'
$LogsFolder = $RepoFolder + '\Logs'
$TempIncludeFolder = $RepoFolder + '\TempInclude'
$WebsiteFolder = $RepoFolder + '\docs'

$ComModLiteral = "Common Modules"
$ExpComLiteral = "Temp\Expanded-Common"


#	Code01.60	Check permanent folders (All MD Topics, Common, docs, Logs, Software)

$FatalError = $False

#	Code01.61	Check TopicsFolder

If (-not (Test-Path $TopicsFolder -PathType container)) {
	$FatalError = $True	
	$ShowText = 'M01.61A  ERROR - Missing required folder "' + $TopicsFolder + '"'
	Write-Host $ShowText
}


#   Code01.62	Check CommonFolder

If (-not (Test-Path $CommonFolder -PathType container)) {
	$FatalError = $True	
	$ShowText = 'M01.62A  ERROR - Missing required folder "' + $CommonFolder + '"'
	Write-Host $ShowText
}


#	Code01.63	Check $WebsiteFolder

If (-not (Test-Path $WebsiteFolder -PathType container)) {
	$FatalError = $True	
	$ShowText = 'M01.63A  ERROR - Missing required folder "' + $WebsiteFolder + '"'
	Write-Host $ShowText
}


If ($FatalError) {
	$ShowText = 'Missing at least one required folder - run terminated. '
	Write-Host $ShowText
	Exit
}



#	Code01.64	Check $LogsFolder

#	Logs folder is a permanent folder, but it is deleted and recreated fresh in each run.

If (Test-Path -Path $LogsFolder) {
#	$ShowText = 'M01.64A 	Found Logs Folder - ' + $LogsFolder 
#	Write-Host $ShowText 

	#  Delete InfoFolder and all sub-folders.
	Remove-Item $LogsFolder -Recurse	
#	$ShowText = 'M01.64B 	Deleted Logs Folder - ' + $LogsFolder 
#	Write-Host $ShowText 

} 


#  Create new Logsfolder.  The "Out-Null" suppresses the Powershell output (too much).
	
New-Item $LogsFolder -itemType Directory | Out-Null
#	$ShowText = 'M01.64C  Created new LogsFolder - ' + $LogsFolder 
#	Write-Host $ShowText 




#   Code01.65	Create ERROR file, REPPORT file, and TRACE file in Logs folder

#   Setup RunDate 
Get-Date | Set-Variable -Name RunDate

#	Create ERROR file

$ErrorFileFullPath = $LogsFolder + '\'
$ErrorFileFullPath = $ErrorFileFullPath + 'ERRORS Prepare-Website.txt'

$ShowText = 'M01.65A  Error file for ' + $ScriptName + '   Version ' + $ScriptVersion
Out-File -filepath $ErrorFileFullPath  -inputObject $ShowText -force

$ShowText = 'M01.65B  Run Date       ' + $RunDate
Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append



#   Create REPORT file

$ReportFileFullPath = $LogsFolder + '\'
$ReportFileFullPath = $ReportFileFullPath + 'REPORT Prepare-Website.txt'

$ShowText = 'M01.65E  Report file for ' + $ScriptName + '   Version ' + $ScriptVersion
Out-File -filepath $ReportFileFullPath  -inputObject $ShowText -force

$ShowText = 'M01.65F  Run Date       ' + $RunDate
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append






#   Create TRACE file

$TraceFileFullPath = $LogsFolder + '\'
$TraceFileFullPath = $TraceFileFullPath + 'TRACE Prepare-Website.txt'

$ShowText = 'M01.65J  Trace file for ' + $ScriptName + '   Version ' + $ScriptVersion
Out-File -filepath $TraceFileFullPath  -inputObject $ShowText -force

$ShowText = 'M01.65K  Run Date       ' + $RunDate
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append



#   Code01.70	Check temporary folders

#	This include folders:
#		ExpandedCommonFolder = \Temp\Expanded-Common
#		ExpandedTopicsFolder = \Temp\Expanded-Topics
#		TempIncludeFolder = \TempInclude

#	Code01.71	Check ExpandedCommonFolder

If (Test-Path -Path $ExpandedCommonFolder) {
#	$ShowText = 'M01.71A 	Found ExpandedCommonFolder Folder - ' + $ExpandedCommonFolder
#	Write-Host $ShowText 

	#  Delete ExpandedCommonFolder and all contents
	Remove-Item $ExpandedCommonFolder -Recurse
#	$ShowText = 'M01.71B 	Deleted ExpandedCommonFolder Folder - ' + $ExpandedCommonFolder
#	Write-Host $ShowText 
}

#  Create new ExpandedCommonFolder.  The "Out-Null" suppresses the Powershell output (too much).
	
New-Item $ExpandedCommonFolder -itemType Directory | Out-Null
$ShowText = 'M01.71C  Created new ExpandedCommonFolder - ' + $ExpandedCommonFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
#	Write-Host $ShowText 




#	Code01.72	Check ExpandedTopicsFolder


If (Test-Path -Path $ExpandedTopicsFolder) {
#	$ShowText = 'M01.72A 	Found ExpandedTopicsFolder Folder - ' + $ExpandedTopicsFolder
#	Write-Host $ShowText 

	#  Delete all files in ExpandedTopicsFolder.
	Remove-Item  $ExpandedTopicsFolder -Recurse
#	$ShowText = 'M01.72B 	Deleted ExpandedTopicsFolder Folder - ' + $ExpandedTopicsFolder
#	Write-Host $ShowText 

} 

#  ExpandedTopicsFolder does not exist - so create it.
	
New-Item $ExpandedTopicsFolder -itemType Directory  | Out-Null
$ShowText = 'M01.72C  Created new ExpandedTopicsFolder - ' + $ExpandedTopicsFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
#	Write-Host $ShowText 



#	TempIncludeFolder = \TempInclude is setup in 11.00 later.




#	Code01.80	Check values of parameters

#	Code01.81	Check $DisplayInfo
#	Check if Yes or No. 
If ($DisplayInfo -eq 'Yes') {
	$DisplayInfoInScript = $True
} else {
    If ($DisplayInfo -eq 'No') {
		$DisplayInfoInScript = $False
	} else {

		$DisplayInfoInScript = $True

		$ShowText = 'M01.81A 	ERROR DisplayInfo must be Yes or No. '
		Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		Write-Host $ShowText 

		$ShowText = 'M01.82B 	ERROR DisplayInfo = "' + $DisplayInfo + '"' 
		Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		
		$ShowText = 'Errors - see Error file in folder Logs  '
		Write-Host $ShowText 
		
		Exit
	}
}


#	Code01.82	Check $MaxIncludesPerFile
#	Check integer and greater than zero
$MaxIncludesPerFile = $MaxIncludesPerFile -as [int]
If ($MaxIncludesPerFile -isnot [int]) {
	$ShowText = 'M01.82A 	ERROR MaxIncludesPerFile must be positive whole number. '
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
	
	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }
	
	Exit
} 
If ($MaxIncludesPerFile -lt 0) {
	$ShowText = 'M01.82B 	ERROR MaxIncludesPerFile must be positive whole number. '
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
	
	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }
	
	Exit
} 


#	Code01.83	Check $MaxDepthCommonIncludesCommon
#	Check integer and greater than zero
$MaxDepthCommonIncludesCommon = $MaxDepthCommonIncludesCommon -as [int]
If ($MaxDepthCommonIncludesCommon -isnot [int]) {
	$ShowText = 'M01.83A  ERROR MaxDepthCommonIncludesCommon must be positive whole number. '
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	
	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }
	
	Exit
}

#	$ShowText = 'M01.83B  MaxDepthCommonIncludesCommon ' +  $MaxDepthCommonIncludesCommon 
#	If ($DisplayInfoInScript) { Write-Host $ShowText }

If ($MaxDepthCommonIncludesCommon -lt 1) {
	$ShowText = 'M01.83C  ERROR MaxDepthCommonIncludesCommon must be positive whole number. '
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	
	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }
	
	Exit
} 

#	Code01.84	Check $MaxPathways
#	Check integer and greater than zero
$MaxPathways = $MaxPathways -as [int]
If ($MaxPathways -isnot [int]) {
	$ShowText = 'M01.84A 	ERROR MaxPathways must be positive whole number. '
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	
	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }
	
	Exit
} 
If ($MaxPathways -lt 0) {
	$ShowText = 'M01.84B 	ERROR MaxPathways must be positive whole number. '
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	
	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }
	
	Exit
} 

#	Code01.85	All parameter processing complete

# $ShowText = 'M01.85A  DisplayInfo ' + $DisplayInfo 
# Write-Host $ShowText
# $ShowText = 'M01.85B  MaxIncludesPerFile ' + $MaxIncludesPerFile 
# Write-Host $ShowText
# $ShowText = 'M01.85C  MaxDepthCommonIncludesCommon ' + $MaxDepthCommonIncludesCommon  
# Write-Host $ShowText
# $ShowText = 'M01.85D  MaxPathways ' + $MaxPathways 
# Write-Host $ShowText





#	Code02.00	Add more lines to files.

#	Code02.10	Add lines to REPORT file.  

$ShowText = '  '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10A 	List of important folders'
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = '  '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10B 	Repo Folder               ' + $RepoFolder 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10C 	All Markdown TopicsFolder ' + $TopicsFolder 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10D 	Common Modules Folder     ' + $CommonFolder 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10E 	Website ("docs") Folder   ' + $WebsiteFolder 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10F 	Logs Folder               ' + $LogsFolder 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10G 	Software Folder           ' + $SoftwareFolder 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = '  '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10M 	Parameters to this script           '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = '  '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

If ($FoundParamsFile) {
	$ShowText = 'M02.10N 	Params file                  ' + $ParamsFileFullPath 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
} else {
	$ShowText = 'M02.10P 	No Params file - values below are default' 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
}

$ShowText = 'M02.10Q 	DisplayInfo                  ' + $DisplayInfo
 Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10R 	MaxIncludesPerFile           ' + $MaxIncludesPerFile
 Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10S 	MaxDepthCommonIncludesCommon ' + $MaxDepthCommonIncludesCommon 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.10T 	MaxPathways                  ' + $MaxPathways 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append



#	Code02.20	Add lines to TRACE File.  

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20A 	List of important folders'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20B 	Repo Folder               ' + $RepoFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20C 	All Markdown TopicsFolder ' + $TopicsFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20D 	Common Modules Folder     ' + $CommonFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20E 	Website ("docs") Folder   ' + $WebsiteFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20F 	Logs Folder               ' + $LogsFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20G 	Software Folder           ' + $SoftwareFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20M 	Parameters to this script           '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


If ($FoundParamsFile) {
	$ShowText = 'M02.20N 	Params file                  ' + $ParamsFileFullPath 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
} else {
	$ShowText = 'M02.20P 	No Params file - values below are default' 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
}

$ShowText = 'M02.20Q 	DisplayInfo                  ' + $DisplayInfo
 Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20R 	MaxIncludesPerFile           ' + $MaxIncludesPerFile
 Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20S 	MaxDepthCommonIncludesCommon ' + $MaxDepthCommonIncludesCommon 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M02.20T 	MaxPathways                  ' + $MaxPathways 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append



#	Code03.00	Setup common file arrays

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M03.00A  Common files '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


#	Code03.01	Declare one dimentional arrays for common files

#	The sizes of the arrays are determined in Code03.30

$CommonArray = @()					#	Path & Filename of the common file
$CommonFilenameArray = @()			#	Filename of the common file (must be unique)
$CommonPriorityArray = @()			#   Priority of the common file itself
$NumCommonIncludesArray = @()		#   Number of includes for this common file


#	Code03.10	Test if common files exist

$ShowText = 'M03.10A  Start search for common files'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

If (Get-Childitem -Path $CommonFolder -Include *.md -recurse) {
	$CommonFilesExist = $True
} else {
	$CommonFilesExist = $False
}	

#	Code03.20	Situation no common files exist

If (-not $CommonFilesExist) {

	#	No common modules means no includes are possible for topics.

	$ShowText = 'M03.20A  (Information only)  No common files in ' + $CommonFolder
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

	
	$ShowText = 'M03.20B  (Information only)  This means no includes will be possible for topics in ' + $TopicsFolder
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	
}	#	If CommonFilesExist is False.


#	Code03.30	Read common files and setup array sizes and initial values

If ($CommonFilesExist) {

	#	Get-ChildItem sets the sizes of these one dimentional common arrays

	(Get-ChildItem -Path $CommonFolder -Include *.md -recurse ).FullName |
	Foreach-Object{ 
		$CommonArray += $_ 					# Populates and sizes this Array.
		$CommonPriorityArray += $_			# Sizes this array as for CommonArray.
		$NumCommonIncludesArray += $_		# Sizes this array as for CommonArray.
		}

	#	Get-ChildItem also sets the size of CommonFileNameArray

	(Get-ChildItem -Path $CommonFolder -Include *.md -recurse ).Name |
	ForEach-Object{ 
		$CommonFilenameArray += $_			# Populates and sizes this Array.
		}

	#	Array CommonArray is fully populated.  The arrays below are the right size but 
	#	have incorrect values.  The other two arrays need sensible initial values.

	For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {
		$CommonPriorityArray[$index1] = -1		#	Minus 1 is "To be calculated"
		$NumCommonIncludesArray[$index1] = 0	#   Assume no includes for now
	}

	#	$ShowText = "M3.30A  Initial values setup for all 1 dimensional common arrays."
	#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


	#	Display CommonArray
	
	
	$ShowText = ' '
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

	$ShowText = '===================================================================='
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	
	$ShowText = ' '
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	

	$ShowText = 'M03.30B  COMMON FILES '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	#	Write-Host $ShowText

	$ShowText = ' '
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	

		
	For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {
		
		$FileName = $CommonArray[$index1]
		$ShowText = 'M03.30C  	' + $index1 + '   ' +  $FileName
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append 
		#	Write-Host $ShowText
		
	}	#  For index in CommonArray

}	# If CommonFilesExist

	$ShowText = ' '
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

	$ShowText = 'M03.30D  Total common files: ' + $CommonArray.length 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

	$ShowText = ' '
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

#	Code03.40	Setup two dimensional arrays for Common files

#	$CommonIncludesArray[$index1,$index2]			Include (index2) for common (index1)
#	$CommonIncludesPriorityArray[$index1,$index2]	Priority of include (index2) for commmon (index1)

$CommonIncludesArray = New-Object 'string[,]' $CommonArray.length,$MaxIncludesPerFile

$CommonIncludesPriorityArray = New-Object 'int[,]' $CommonArray.length,$MaxIncludesPerFile


# 	Set initial values for both two dimensional arrays.
# 	For includes set to a dummy string
#	For priority set to zero (which assumes the include has no includes inside it)
		
For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {
		
	For ($index2 = 0; $index2 -lt $MaxIncludesPerFile; $index2++) {

		$CommonIncludesArray[$index1,$index2] = "IntialValue" 	# 	Clearly show a bogus value	
		$CommonIncludesPriorityArray[$index1,$index2] = -1		#	Minus 1 is "To be calculated"
	
	}	#  For index2 = include for that common file

}	#  For index1 = common file in CommonArray

#	$ShowText = "M3.40A  Initial values setup for all 2 dimensional common arrays."
#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


#	Code03.50	Check all common files have unique Filenames

For ($index1 = 0; $index1 -lt $CommonFilenameArray.length; $index1++) {
	
	$ThisFileName = $CommonFilenameArray[$index1]
	$NextIndex1 = $index1 + 1
			
	# 	Check if ThisFileName exists anywhere later in the CommonFilenameArray.

	For ($index10 = $NextIndex1; $index10 -lt $CommonFilenameArray.length; $index10++) {
		If ($CommonFilenameArray[$index10] -eq $ThisFileName) {

			$ShowText = ' '
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

			$ShowText = 'M03.50A  ERROR - Two common files have the same Filename: ' + $ThisFileName
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

			
			$ShowText = 'M03.50B  ' + $index1 + ' ' + $CommonArray[$index1]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

			
			$ShowText = 'M03.50C  '  + $index10 + ' '+ $CommonArray[$index10]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
			
			$ShowText = 'Errors - see Error file in folder Logs  '
			If ($DisplayInfoInScript) { Write-Host $ShowText }

			Exit
			
		}	#	Found duplicate name
	
	}	#  For index10 = next FileNamee

}	#  For index1 = common file in CommonFilenameArray




#	Code04.00	Setup topic file arrays

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M04.00A  Topic files '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
#	If ($DisplayInfoInScript) { Write-Host $ShowText }


#	Code04.01	Declare one dimensional arrays for topic files

#	The sizes of the arrays are determined in Code04.30

$TopicArray = @()					#	Path & Name of the common file
$TopicFilenameArray = @()			#	Filename of the topic (must not match a common file)
$TopicPriorityArray = @()			#   Priority of the topic file itself.
$NumTopicIncludesArray	= @()		#   Number of includes for this topic file



#	Code04.10	Test if topic files exist

$ShowText = 'M04.10A  Start search for topic files'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

If (Get-Childitem -Path $TopicsFolder -Include *.md -recurse) {
	$TopicFilesExist = $True
} else {
	$TopicFilesExist = $False
}	

#	Code04.20	Situation no topic files exist

If (-not $TopicFilesExist) {

	#	No topic markdown files means no includes are possible for topics.

	$ShowText = 'M04.20A  No topic files in ' + $TopicsFolder
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

	
	$ShowText = 'M04.20B  This means there is nothing for this script to do. '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	
	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }

	Exit

}	#	If TopicFilesExist is False.



#	Code04.30	Read topic files and setup array sizes and initial values

#	Get-ChildItem sets the sizes of one dimentional topic arrays

(Get-ChildItem -Path $TopicsFolder -Include *.md -recurse ).FullName |
ForEach-Object{ 
	$TopicArray += $_ 					# Sizes this Array for the topic files that exist.
	$TopicPriorityArray += $_			# Sizes this array as for TopicArray.
	$NumTopicIncludesArray += $_		# Sizes this array as for TopicArray.
	}
	
#	Get-ChildItem also sets the size of TopicFileNameArray

(Get-ChildItem -Path $TopicsFolder -Include *.md -recurse ).Name |
ForEach-Object{ 
	$TopicFilenameArray += $_			# Populates and sizes this Array.
	}


#	Array TopicArray is fully populated.  The other two arrays are the right size 
#	but have incorrect values.  The other two arrays need sensible initial values.

For ($index1 = 0; $index1 -lt $TopicArray.length; $index1++) {
	$TopicPriorityArray[$index1] = 0		# 	Assume the include file has no includes for now
	$NumTopicIncludesArray[$index1] = 0		#   Assume no includes for now
}

#	$ShowText = "M4.30A  Initial values setup for all 1 dimensional topic arrays."
#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


#	Display TopicArray

$ShowText = '===================================================================='
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append


$ShowText = "M04.30B  TOPIC FILES" 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
#	Write-Host $ShowText

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

		
For ($index1 = 0; $index1 -lt $TopicArray.length; $index1++) {
		
	$ShowText = 'M04.30C   ' + $index1 + '   ' +  $TopicArray[$index1]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	#	Write-Host $ShowText

}	#  For index in TopicArray


$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append


$ShowText = "M04.30D  Total Topic Files: " + $TopicArray.length 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
#	Write-Host $ShowText

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append



#	Code04.40	Setup two dimensional arrays for topic files

#	$TopicIncludesArray[$index1,$index2]			Include (index2) for topic file (index1)
#	$TopicIncludesPriorityArray[$index1,$index2]	Include priority (index2) for topic file (index1)

$TopicIncludesArray = New-Object 'string[,]' $TopicArray.length,$MaxIncludesPerFile
$TopicIncludesPriorityArray = New-Object 'int[,]' $TopicArray.length,$MaxIncludesPerFile


# 	Set initial values for the two dimensional array to a dummy string.

For ($index1 = 0; $index1 -lt $TopicArray.length; $index1++) {
		
	For ($index2 = 0; $index2 -lt $MaxIncludesPerFile; $index2++) {

		$TopicIncludesArray[$index1,$index2] = "IntialValue" 	# 	Clearly show a bogus value	
		$TopicIncludesPriorityArray[$index1,$index2] = -1 		#	Minus 1 is "To be calculated"	
	}	#  For index2 = include for that topic file

}	#  For index1 = topic file in TopicArray

#	$ShowText = "M4.40A  Initial values setup for 2 dimensional topic array."
#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 



#	Code04.50   Check all topics do not match any common file names.
#				Why?  Because when the includes are actually done, the topic and any includes are
#				copied to the folder TempInclude.  If a topic and common file have the same name,
#				one file overwrites the other.  


For ($index1 = 0; $index1 -lt $TopicFilenameArray.length; $index1++) {
	
	$ThisFileName = $TopicFilenameArray[$index1]
					
	# 	Check if ThisFileName exists anywhere later in the CommonFilenameArray.

	For ($index2 = 0; $index2 -lt $CommonFilenameArray.length; $index2++) {
		If ($CommonFilenameArray[$index2] -eq $ThisFileName) {

			$ShowText = ' '
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

			$ShowText = 'M04.50A  ERROR - Topic and Common file have the same Filename: ' + $ThisFileName
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

			
			$ShowText = 'M04.50B Topic ' + $index1 + ' ' + $TopicArray[$index1]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

			
			$ShowText = 'M04.50C Common '  + $index2 + ' '+ $CommonArray[$index2]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
			
			$ShowText = 'Errors - see Error file in folder Logs  '
			If ($DisplayInfoInScript) { Write-Host $ShowText }

			Exit
			
		}	#	Found duplicate name
	
	}	#  For index2 = next Common file in CommonFilenameArray

}	#  For index1 = Topic file in TopicFilenameArray



#	Code04.60   Delete md files under website folder
#
#	Why is this necessary? 
#	Let's say topic XYZ.md exists in folder ABC under the website folder.
#   There will be topic XYZ.md is in folder ABC udner the folder All Markdown Topics.
#	If topic XYZ.md is no longer needed, delete from folder ABC under the folder All Markdown Topics.
#	How does this result in the same file being deleted from folder ABC under the website folder?
#	The solution is to delete all md files under the Website folder with a few exceptions.
#	The exceptions any folder that has first letter underscore (e.g. _post, _sass, _site).


$ShowText = ' '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$ShowText = 'M04.60A  Delete md files under website folder with care '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

#
#	Code04.61	List all folders under the website folder
#	


If (Get-Childitem -Path $WebsiteFolder -Directory) {
	#	There are directories under the WebsiteFolder (normal situation)
	
	$ShowText = 'M04.61A  Yes there are website sub-folders '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$WebsiteSubFoldersExist = $True
} else {
	#	There are NO directories under the WebsiteFolder (maybe a testing situation)
	$WebsiteSubFoldersExist = $False

	$ShowText = ' '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$ShowText = 'M04.61A  No Website sub-folders exist, so no delete of md files needed '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

}	

If ($WebsiteSubFoldersExist) {

	$WebsiteSubFoldersArray = @()			#	Path & Name 
	$WebsiteSubFoldersNameArray = @()		#	Name only

	(Get-ChildItem -Path $WebsiteFolder -Directory ).FullName |
	ForEach-Object{ 
		$WebsiteSubFoldersArray += $_ 					# Sizes this Array for the sub-folders
	}

	#	Get-ChildItem also sets the size of TopicFileNameArray

	(Get-ChildItem -Path $WebsiteFolder -Directory ).Name |
	ForEach-Object{ 
		$WebsiteSubFoldersNameArray += $_			# Populates and sizes this Array.
	}


	#	Display $WebsiteSubFoldersArray

	$ShowText = ' '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$ShowText = 'M04.61B  Found Website sub-folders '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	If ($WebsiteSubFoldersArray.length -eq 0) {
		$WebSiteSubFolders = $False
		$ShowText = 'M04.61C  NO SUBFOLDERS FOUND ????? '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		If ($DisplayInfoInScript) { Write-Host $ShowText }
		Exit
	} else {

		For ($index1 = 0; $index1 -lt $WebsiteSubFoldersArray.length; $index1++) {

			$ShowText = 'M04.61D  Sub-folder ' + $WebsiteSubFoldersArray[$index1]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	
		}	
	}

	#  For index1 = topic file in $WebsiteSubFoldersArray

	#	Count md files.

	$CountWebsiteMDFilesArray = @()			#	Path & Name 

	(Get-ChildItem -Path $WebsiteFolder -Include *.md -recurse ).FullName |
	ForEach-Object{ 
		$CountWebsiteMDFilesArray += $_ 					# Sizes this Array for the sub-folders
	}


	$ShowText = 'M04.61E  MD files under Website ' + $CountWebsiteMDFilesArray.length
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	#	Display $CountWebsiteMDFilesArray

	$ShowText = ' '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$ShowText = 'M04.61F  Display Website MD files '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


	For ($index1 = 0; $index1 -lt $CountWebsiteMDFilesArray.length; $index1++) {

		$ShowText = 'M04.61G      MD File ' + $CountWebsiteMDFilesArray[$index1]
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	}	#  For index1 = topic file in $CountWebsiteMDFilesArray



	#
	#   Code04.62	Delete all md files under website folders except underscore folders
	#
	#	Start with Website folder itself
	#

	$MDFilesWebsiteFolder = $WebsiteFolder + '\*.md'


	Remove-Item $MDFilesWebsiteFolder -Force

	$ShowText = 'M04.62A  Deleted md files in Website folder itself ' + $MDFilesWebsiteFolder
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


	#
	#	Now delete md files in each sub-folder excepting any sub-folder that starts with underscore
	#

	For ($index1 = 0; $index1 -lt $WebsiteSubFoldersArray.length; $index1++) {

		$Firstchar = $WebsiteSubFoldersNameArray[$index1].substring(0,1)

		$ShowText = 'M04.62B  Firstchar ' + $Firstchar
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		If ($Firstchar -ne '_') {

			Remove-Item $WebsiteSubFoldersArray[$index1] -Include *.md -Recurse -Force

			$ShowText = 'M04.62C  Delete md files from ' + $WebsiteSubFoldersArray[$index1]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		}	#	Firstchar is not underscore

	}	#  For index1 = topic file in $WebsiteSubFoldersArray

	$ShowText = 'M04.62Z  End Delete md from docs '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


	#	Code04.63	Check if md files still exist under Website

	If (Get-Childitem -Path $WebsiteFolder -Include *.md -recurse) {
		$WebsiteMDFilesFilesExist = $True
	} else {
		$WebsiteMDFilesFilesExist = $False
	}	

	If ($WebsiteMDFilesFilesExist) {

		$CheckWebsiteMDFilesArray = @()			#	Path & Name 

		(Get-ChildItem -Path $WebsiteFolder -Include *.md -Recurse ).FullName |
		ForEach-Object{ 	
			$CheckWebsiteMDFilesArray += $_ 					# Sizes this Array for the sub-folders
		}

		$ShowText = 'M04.63A  MD files left under Website ' + $CheckWebsiteMDFilesArray.length
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


		#	Display $CheckWebsiteMDFilesArray

		$ShowText = ' '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$ShowText = 'M04.63B  Check Website MD files still there '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


		For ($index1 = 0; $index1 -lt $CheckWebsiteMDFilesArray.length; $index1++) {

			$ShowText = 'M04.63C      MD File ' + $CheckWebsiteMDFilesArray[$index1]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		}	#  For index1 = topic file in $CheckWebsiteMDFilesArray

	} else {

		$ShowText = 'M04.63D  No more md files under Website '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	}	#	No WebsiteMD files

}	#	There are WebsiteFoller sub-folders


#	Code05.00	Populate common includes array

$ShowText = ' '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$ShowText = 'M05.00A  Common includes '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
#	If ($DisplayInfoInScript) { Write-Host $ShowText }


$ShowText = 'M05.00B  Start search for includes inside common files'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 



#	Code05.01  Initialise variables

$ErrorsInIncludes = $False				#	This flag covers both common and topic files
$CommonFilesHaveIncludes = $False


#	Code05.10  Read all common files and record includes in array


If ($CommonFilesExist) {
	
	#	For loop to read CommonArray

	For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {

		#	Assume no includes for this common file unless found
	
		$NumberIncludesThisCommonFile = 0
						
		#	Read each line in the common module
	
	
		$ShowText = 'M05.10A  start read file ====================================='
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$ShowText = 'M05.10B  Read common File ' + $index1 + " = " + $CommonArray[$index1]
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		
		# Read each line in Common File 

		foreach($line in Get-Content $CommonArray[$index1]) {
	
			$ShowBlankLine = $line.Trim()

			#	If there is a blank line, the trace has '(blank line)' to be clearer to see.
			
			# If ($ShowBlankLine -eq '') { 
				#	$ShowBlankLine = '(blank line)'
				#	$ShowText =  'M05.10C  		$line ' + $ShowBlankLine
			# } else {	
				#	$ShowText =  'M05.10D  		$line ' + $line
			# }
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		
			# Want to ignore spaces at start of line.


			#  Code05.20  Includes - check how coding starts

			#	Find include coding on a line in a common file.
			#	First check for $IncludeDelimeterStart	If found, check for proper start and end coding.
			
			$CurrentLine = $line.Trim()
			If ($CurrentLine.length -lt 2) { $CurrentLine = $CurrentLine + "XX"}
			
			$TestFirst2Chars = $CurrentLine.substring(0,2)
			
			#	$ShowText =  'M05.20A  TestFirst2Chars = ' + $TestFirst2Chars
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			$FoundOKIncludeCoding = $False
			$IncludeCodingStart = $False
			$IncludeCodingEnd = $False

			If ($TestFirst2Chars -eq $IncludeDelimeterStart) {

				# Found $IncludeDelimeterStart so check for full include coding.

				If ($CurrentLine.length -lt 12) { $CurrentLine = $CurrentLine + "XXXXXXXXXXXX" }
				$TestFirst12Chars = $CurrentLine.substring(0,12)
				$TestFirst11Chars = $CurrentLine.substring(0,11)
				
				If (($TestFirst12Chars -ceq $IncludeStart12Chars) -or
				    ($TestFirst11Chars -ceq $IncludeStart11Chars)) {
					$IncludeCodingStart = $True
				} else {

					# Error in Include - start coding not correct
					$ErrorsInIncludes = $True
					
					# Is it an error of case or something else?  This decides the error message.
					# Test for a case problem first
					$ErrorInCaseOfIncludeLiteral = $False
					
					If (($TestFirst12Chars -eq $IncludeStart12Chars) -or
					    ($TestFirst11Chars -eq $IncludeStart11Chars)) {
						$ErrorInCaseOfIncludeLiteral = $True
					}

					If ($ErrorInCaseOfIncludeLiteral) {
						
						$ShowText = ' '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.20D  ERROR - "INCLUDE:" must be all upper case'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
					
						$ShowText = 'M05.20E  Include coding "' + $CurrentLine + '"'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.20F  File: ' + $CommonArray[$index1]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append	

					} else {

						$ShowText = ' '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.20J  ERROR - Include coding must start "' + $IncludeStart12Chars 
						$ShowText = $ShowText + '" OR "' + $IncludeStart11Chars + '"'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
					
						$ShowText = 'M05.20K  Include coding "' + $CurrentLine + '"'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.20L  File: ' + $CommonArray[$index1]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append	
					}	#	Not ErrorInCaseOfIncludeLiteral
				}	#	First 12 or 11 chars Not OK


				#  Code05.21  Includes - check how coding ends

				If ($IncludeCodingStart) {

					$TestLast3Chars = $CurrentLine.substring($CurrentLine.length - 3)
	
					If ($TestLast3Chars -eq $IncludeDelimeterEnd)   {
						$IncludeCodingEnd = $True
					} else {
						# Error in Include - end coding not correct
						$ErrorsInIncludes = $True
						$ShowText = ' '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.21A  ERROR - Include coding must end "' + $IncludeDelimeterEnd + '"'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
					
						$ShowText = 'M05.21B  Include coding "' + $CurrentLine + '"'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
				
						$ShowText = 'M05.21C  File: ' + $CommonArray[$index1]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
					}
				}	# IF ($IncludeCodingStart) so check IncludeCodingEnd

				If ($IncludeCodingStart -and $IncludeCodingEnd) {
					$FoundOKIncludeCoding = $True
				}

			}    # If ($TestFirst2Chars -eq $IncludeDelimeterStart)
			

			#  Code05.22  Includes - check if coding is almost right
			 
			# Find lines that are "almost" an include, and give error.  User will delete or fix them.
			
			If($TestFirst2Chars -ne $IncludeDelimeterStart) {

				$FoundComment = $False
				$FoundTwoOpenSquareBrackets = $False
				$FoundTwoClosedSquareBrackets = $False
				$FoundWordIncludeAnyCase = $False
				$FoundAlmostInclude = $False

				# Check for comment.  If not, check for number of [ and ] and INCLUDE:
				If ($CurrentLine.length -lt 7) { $CurrentLine = $CurrentLine + "XXXXXXX" }
				$TestFirst7Chars = $CurrentLine.substring(0,7)
				
				If ($TestFirst7Chars -eq $MDCommentCoding) {
					$FoundComment = $True
					# Found comment so ignore this line

					$ShowText = 'M05.22A  Comment found - will ignore this line and so will Markdown'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
					$ShowText = 'M05.22B  Comment is "' + $CurrentLine.Trim() + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

				} else {	
					# May be line that is almost an include coding line.
					#  Count [ and ] to see if two each.  
					$NumberOpenSquareBrackets =  ($CurrentLine.Split('[')).count-1 
					$NumberClosedSquareBrackets =  ($CurrentLine.Split(']')).count-1 

					# $ShowText = 'M05.22C  NumberOpenSquareBrackets = ' + $NumberOpenSquareBrackets
					# Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					
					# $ShowText = 'M05.22D  NumberClosedSquareBrackets = ' + $NumberClosedSquareBrackets
					# Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

					If ($NumberOpenSquareBrackets -eq 2) {
						$FoundTwoOpenSquareBrackets = $True
					}
					If ($NumberClosedSquareBrackets -eq 2) {
						$FoundTwoClosedSquareBrackets = $True
					}
					#  Look for "include" and ensure NOT case senstivie.

					If ($CurrentLine.Tolower().Contains("include")) {
						$FoundWordIncludeAnyCase = $True
					}

					# $ShowText = 'M05.22E  Word "include" found in any case = ' + $FoundWordIncludeAnyCase
					# Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

					#  If all true then issue error - Include not started correctly.

					If (($FoundTwoOpenSquareBrackets) -and
					    ($FoundTwoClosedSquareBrackets) -and
						($FoundWordIncludeAnyCase)) {
						$FoundAlmostInclude = $True
					}

					If ($FoundAlmostInclude) {
						#	This is an error - the line is almost an incluce but has incorrect coding.
						$ErrorsInIncludes = $True

						$ShowText = ' '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.22G  ERROR - Include coding must start "' + $IncludeStart12Chars 
						$ShowText = $ShowText + '" OR "' + $IncludeStart11Chars + '"'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
					
						$ShowText = 'M05.22H  Include coding "' + $CurrentLine + '"'
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
				
						$ShowText = 'M05.22J  File: ' + $CommonArray[$index1]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append




					}	#  Found likely include

					#  Most markdown lines in the file will reach here without an error. This is fine.
					#  It is only lines look like includes but are not quite right that get an error.

				}	#    If not a comment line
			}	# First 2 chars are NOT an include.

			If ($FoundOKIncludeCoding) {
				
				# Found an include in this common file.

				# Here is what is below:
				# Code05.23  Housekeeping - set flags and counters.
				# Code05.24  Get the include details from the include coding
				# Code05.25  Put in ".md" as last three chars if not already there
				# Code05.26  If include coding starts with slash, remove it
				# Code05.27  Check if this include is already an include for this common file
				# Code05.28  Test that include points to an existing common file
				# Code05.29  Record include in CommonIncludesArray
				
				 
				$IncludeCoding = $CurrentLine
				$IncludeCoding = $IncludeCoding.replace($IncludeDelimeterStart,"")
				$IncludeCoding = $IncludeCoding.replace($IncludeLiteral,"")
				$IncludeCoding = $IncludeCoding.replace($IncludeDelimeterEnd,"")
				$IncludeCoding = $IncludeCoding.Trim()
				
				$ShowText = 'M05.22M  IncludeCoding "' + $IncludeCoding + '"'
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


				# Code05.23  Housekeeping - set flags and counters.
				
				$NumberIncludesThisCommonFile++

				$CommonFilesHaveIncludes = $True


				# Code05.24  Get the include details from the include coding
				# $IncludeCoding is the Include request from this line

				$IncludeFileRequested = $IncludeCoding

				# Ensure no unnecessary spaces in include coding start or end

				$IncludeFileRequested = $IncludeFileRequested.Trim()



				# Code05.25  Put in ".md" as last three chars if not already there
				#	If include coding does not end ".md" then insert this.
				#	Normally the include coding can omit the ".md" to save typing.

				$PositionLast3 = $IncludeFileRequested.length - 3
				$Last3chars = $IncludeFileRequested.Substring($PositionLast3)

				If (-not ($Last3chars -eq ".md")) {
					$IncludeFileRequested = $IncludeFileRequested + ".md"
				}				
				
				#	$ShowText =  'M05.25A  Includes Coding = ' + $IncludeFileRequested
				#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


				# Record include in CommonIncludesArray even if include has error
				# Must first read any existing includes from CommonIncludesArray



				# Code05.26  If include coding starts with slash, remove it
				
				$PositionBackslash = $IncludeFileRequested.IndexOf("\")
				If ($PositionBackslash -eq 0) {
					$IncludeFileRequested = $IncludeFileRequested.Substring(1)
					#	$ShowText =  'M05.26A  Backslash as first char not needed - ignored.' 
					#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				} 
			
				# Put in $CommonFolder so the include is a full path to the file.

				$IncludeFileRequested = $CommonFolder + '\' + $IncludeFileRequested



				# Code05.27  Check if this include is already an include for this common file

				$IncludeAlreadyRecorded = $False

				$index2 = $NumberIncludesThisCommonFile - 1		#	Potential psition of new include 	

				#	We are inside $CommonArray[$index1] and have found an include.
				#	Check if CommonIncludesArray has already an entry for this include in row $index1
				#	Search CommonIncludesArray from 0 to less than $index2
				#	If found, set $IncludeAlreadyRecorded to $True and do NOT record this include again.
				#   If no duplicate found, record this new include as usual in CommonIncludesArray
				#   

				If ($index2 -gt 0) {	# There is at least one other include in the array to check

					For ($index10 = 0; $index10 -lt $index2; $index10++) {
						If ($CommonIncludesArray[$index1,$index10] -eq $IncludeFileRequested) {
							$IncludeAlreadyRecorded = $True
							$NumberIncludesThisCommonFile = $NumberIncludesThisCommonFile - 1
							$ShowText =  'M05.27A  Include already recorded for this common file '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						} # Include already present in includes for this common file (which is OK)
					}	#	Next $index10
				}	# 	$index2 is above 0 so there is at least one other include to test

				If ($IncludeAlreadyRecorded -eq $False) {


					# Code05.28  Test that include points to an existing common file
										
					#	Check if include file exists

					#	$ShowText = 'M05.28A  Check Include at ' + $IncludeFileRequested
					#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

					$ThisIncludeExists = $False

					If   (Test-Path -Path $IncludeFileRequested -PathType leaf) {
						#	$ShowText = 'M05.28B  Include file exists ' 
						#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						$ThisIncludeExists = $True
					} else {

						$ErrorsInIncludes = $True

						$ShowText = ' '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.28C  ERROR - Include does not exist - ' + $IncludeFileRequested
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M05.28D  File: ' + $CommonArray[$index1]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	
					}  # Include does not exist	


					If ($ThisIncludeExists -eq $True) {

			
						# Code05.29  Record include in CommonIncludesArray
				
						#	$ShowText =  'M05.29A  Include Coding = ' + $IncludeFileRequested
						#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						#	Arrays start at index zero so index 2 is $NumberIncludesThisCommonFile - 1
						#	The number of includes array gets new value of $NumberIncludesThisCommonFile

						# 	The include cannot be stored if the index is greater than MaxIncludesPerFile - 1.
						#	This is because the index starts at 0.

						$LastIncludeIndex = $MaxIncludesPerFile - 1

						If ($index2 -gt $LastIncludeIndex) {

							$ShowText = ' '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	
							$ShowText = 'M05.29B  ERROR - Too many includes in a file. '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							$ShowText = 'M05.29C  Parameter MaxIncludesPerFile = ' + $MaxIncludesPerFile
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							$ShowText = 'M05.29D  File: ' + $CommonArray[$index1]
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							For ($index11 = 0; $index11 -lt $MaxIncludesPerFile; $index11++) {
					
								$ShowText = 'M05.29E    Include at index ' + $index11 + '  ' 
								$ShowText = $Showtext + $CommonIncludesArray[$index1,$index11] 
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
							}

							$ShowText = 'M05.29F  Extra include needed: ' + $IncludeFileRequested
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							$ShowText = 'M05.29G  Please increase parameter MaxIncludesPerFile. '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -Append

							
							$ShowText = 'Errors - see Error file in folder Logs  '
							If ($DisplayInfoInScript) { Write-Host $ShowText }

							Exit

						}	#	Too many includes to add one more

						#	At last add the include to CommonIncludesArray
				
						$CommonIncludesArray[$index1,$index2] = $IncludeFileRequested
						$NumCommonIncludesArray[$index1] = $NumberIncludesThisCommonFile

						$ShowText = 'M05.29H  CommonIncludesArray('
						$ShowText = $ShowText + $index1 + ',' + $index2 + ') = '
						$ShowText = $ShowText + $CommonIncludesArray[$index1,$index2]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append	

					}	# 	Include exists

				}	#  IncludeAlreadyRecorded = false

			}	#  End found include coding

		}	# End foreach line in Common file
	
		
		$ShowText = 'M05.28E  end ================================================='
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	
		$ShowText = ' '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	

	}	# 	Next index in CommonArray


	#	Have finished reading all common files.  Either we found includes or we did not.


	#	Code05.30  Display common files that have includes
	
	$NumberCommonFilesWithIncludes = 0
	$TotalCommonIncludes = 0

	
	$ShowText = '===================================================================='
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	
	$ShowText = ' '
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	



	If (-not $CommonFilesHaveIncludes) {
	
		#	No common module files have includes.
		
		$ShowText = 'M05.30A  No common files have includes '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
		#	Write-Host $ShowText
					
	} else {	# CommonIncludesArray must have entries somewhere
	
		

		$ShowText = 'M05.30B  COMMON FILES WITH INCLUDES'
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
		
		For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {
			
			If ($NumCommonIncludesArray[$index1] -gt 0) {
			
				$NumberCommonFilesWithIncludes++
	
				$ShowText = ' '
				Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
				
				$ShowText = 'M05.30C  Common ' + $index1 + ' = ' +  $CommonArray[$index1]
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

				#	Find larged number of includes in a common module

				If ($NumCommonIncludesArray[$index1] -gt $LargestIncludesPerCommon) {
					$LargestIncludesPerCommon = $NumCommonIncludesArray[$index1]
				}

				# Displauy of includes

				For ($index2 = 0; $index2 -lt $NumCommonIncludesArray[$index1]; $index2++) {

					$TotalCommonIncludes++
					If ($index2 -eq 0) { 
						$ShowText = 'M05.30D       INCLUDES ' + $CommonIncludesArray[$index1,$index2] 
					} else {
						$ShowText = 'M05.30D                ' + $CommonIncludesArray[$index1,$index2] 
					}
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
													
				}	#  For index2 = include for that common file
			} #	 $NumCommonIncludesArray[$index1] greater than zero
						
		}	# End index for common file
	
	
		$ShowText = ' '
		Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
		
	
		If ($NumberCommonFilesWithIncludes -eq 1) { 
			$ShowText = 'M05.30E  ' + $NumberCommonFilesWithIncludes + ' common file has includes.' 
		} else {
			$ShowText = 'M05.30E  ' + $NumberCommonFilesWithIncludes + ' common files have includes.' 
		}
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
		#	Write-Host $ShowText
	
		$ShowText = ' '
		Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
		
	
		
	}	# Common files have includes
	

}	# CommonFilesExist - true



#	Code06.00		Populate topic includes array

$ShowText = ' '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$ShowText = 'M06.00A  Topic includes '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
#	If ($DisplayInfoInScript) { Write-Host $ShowText }

$ShowText = 'M06.00B  Start search for includes in topic files'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


#	Code06.01  Initialise variables

$TopicFilesHaveIncludes = $False



#	Code06.10  Read all topic files and record includes in TopicIncludesArray


#	For loop to read TopicArray

For ($index1 = 0; $index1 -lt $TopicArray.length; $index1++) {

	#	Assume no includes for this topic file unless found
	
	$NumberIncludesThisTopicFile = 0
						
	#	Read each line in the topic file
	

	$ShowText = 'M06.10A  start read file ========================================='
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$ShowText = 'M06.10B  Read topic file ' + $index1 + " = " + $TopicArray[$index1]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	
	# Read each line in topic file 

	foreach($line in Get-Content $TopicArray[$index1]) {
	
		$ShowBlankLine = $line.Trim()

		#	If there is a blank line, the trace has '(blank line)' to be clearer to see.

		# If ($ShowBlankLine -eq '') { 
			#	$ShowBlankLine = '(blank line)'
			#	$ShowText =  'M06.10C  		$line ' + $ShowBlankLine
		# } else {	
			#	$ShowText =  'M06.10D  		$line ' + $line
		# }
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		
		# Want to ignore spaces at start of line.


		#  Code06.20  Includes - check how coding starts

		#	Find include coding on a line in a topic.
		#	First check for $IncludeDelimeterStart	If found, check for proper start and end coding.

		$CurrentLine = $line.Trim()
		If ($CurrentLine.length -lt 2) { $CurrentLine = $CurrentLine + "XX"}
		
		$TestFirst2Chars = $CurrentLine.substring(0,2)
		
		#	$ShowText =  'M06.20A  TestFirst2Chars = ' + $TestFirst2Chars
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$FoundOKIncludeCoding = $False
		$IncludeCodingStart = $False
		$IncludeCodingEnd = $False

		If($TestFirst2Chars -eq $IncludeDelimeterStart) {

			# Found $IncludeDelimeterStart so check for full include coding.

			If ($CurrentLine.length -lt 12) { $CurrentLine = $CurrentLine + "XXXXXXXXXXXX"}
			$TestFirst12Chars = $CurrentLine.substring(0,12)
			$TestFirst11Chars = $CurrentLine.substring(0,11)

			If (($TestFirst12Chars -ceq $IncludeStart12Chars) -or
			    ($TestFirst11Chars -ceq $IncludeStart11Chars)) {
				$IncludeCodingStart = $True
			} else {
				# Error in Include - start coding not correct
				$ErrorsInIncludes = $True

				# Is it an error of case or something else?  This decides the error message.
				# Test for a case problem first
				$ErrorInCaseOfIncludeLiteral = $False
				
				If (($TestFirst12Chars -eq $IncludeStart12Chars) -or
				    ($TestFirst11Chars -eq $IncludeStart11Chars)) {
					$ErrorInCaseOfIncludeLiteral = $True
				}

				If ($ErrorInCaseOfIncludeLiteral) {

					$ShowText = ' '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.20D  ERROR - "INCLUDE:" must be all upper case'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
					
					$ShowText = 'M06.20E  Include coding "' + $CurrentLine + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.20F  File: ' + $TopicArray[$index1]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append	

				} else {

					$ShowText = ' '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.20J  ERROR - Include coding must start "' + $IncludeStart12Chars 
					$ShowText = $ShowText + '" OR "' + $IncludeStart11Chars + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
				
					$ShowText = 'M06.20K  Include coding "' + $CurrentLine + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.20L  File: ' + $TopicArray[$index1]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

				}	#	Not ErrorInCaseOfIncludeLiteral
			}	#	First 12 or 11 chars Not OK


			#  Code06.21  Includes - check how coding ends

			If ($IncludeCodingStart) {

				$TestLast3Chars = $CurrentLine.substring($CurrentLine.length - 3)

				If ($TestLast3Chars -eq $IncludeDelimeterEnd)   {
					$IncludeCodingEnd = $True
				} else {
					# Error in Include - end coding not correct
					$ErrorsInIncludes = $True
					$ShowText = ' '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.21A  ERROR - Include coding must end "' + $IncludeDelimeterEnd + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
				
					$ShowText = 'M06.21B  Include coding "' + $CurrentLine + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.21C  File: ' + $TopicArray[$index1]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
				}	

			}     # IF ($IncludeCodingStart) so check IncludeCodingEnd


			If ($IncludeCodingStart -and $IncludeCodingEnd) {
				$FoundOKIncludeCoding = $True
			}
		
		}   # If first 2 chars are $IncludeDelimeterStart

		
		#  Code06.22  Includes - check if coding is almost right

		#  Find lines that are "almost" an include, and give error.  User will delete or fix them.

		If($TestFirst2Chars -ne $IncludeDelimeterStart) {

			$FoundComment = $False
			$FoundTwoOpenSquareBrackets = $False
			$FoundTwoClosedSquareBrackets = $False
			$FoundWordIncludeAnyCase = $False
			$FoundAlmostInclude = $False

			# Check for comment.  If not, check for number of [ and ] and INCLUDE:
			If ($CurrentLine.length -lt 7) { $CurrentLine = $CurrentLine + "XXXXXXX" }
			$TestFirst7Chars = $CurrentLine.substring(0,7)
			
			If ($TestFirst7Chars -eq $MDCommentCoding) {
				$FoundComment = $True
				# Found comment so ignore this line

				$ShowText = 'M06.22A  Comment found - will ignore this line and so will Markdown'
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
				$ShowText = 'M06.22B  Comment is "' + $CurrentLine.Trim() + '"'
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


			} else {	
				# May be line that is almost an include coding line.
				#  Count [ and ] to see if two each.  
				$NumberOpenSquareBrackets =  ($CurrentLine.Split('[')).count-1 
				$NumberClosedSquareBrackets =  ($CurrentLine.Split(']')).count-1 

				# $ShowText = 'M06.22C  NumberOpenSquareBrackets = ' + $NumberOpenSquareBrackets
				# Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				
				# $ShowText = 'M06.22D  NumberClosedSquareBrackets = ' + $NumberClosedSquareBrackets
				# Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				If ($NumberOpenSquareBrackets -eq 2) {
					$FoundTwoOpenSquareBrackets = $True
				}
				If ($NumberClosedSquareBrackets -eq 2) {
					$FoundTwoClosedSquareBrackets = $True
				}
				#  Look for "include" and ensure NOT case senstivie.

				If ($CurrentLine.Tolower().Contains("include")) {
					$FoundWordIncludeAnyCase = $True
				}

				# $ShowText = 'M06.22E  Word "include" found in any case = ' + $FoundWordIncludeAnyCase
				# Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				#  If all true then issue error - Include not started correctly.

				If (($FoundTwoOpenSquareBrackets) -and
					($FoundTwoClosedSquareBrackets) -and
					($FoundWordIncludeAnyCase)) {
					$FoundAlmostInclude = $True
				}

				If ($FoundAlmostInclude) {
					#	This is an error - the line is almost an incluce but has incorrect coding.
					$ErrorsInIncludes = $True

					$ShowText = ' '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.22G  ERROR - Include coding must start "' + $IncludeStart12Chars 
					$ShowText = $ShowText + '" OR "' + $IncludeStart11Chars + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
				
					$ShowText = 'M06.22H  Include coding "' + $CurrentLine + '"'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
			
					$ShowText = 'M06.22J  File: ' + $TopicArray[$index1]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

				}	#  Found likely include

				#  Most markdown lines in the file will reach here without an error. This is fine.
				#  It is only lines look like includes but are not quite right that get an error.

			}	#  If not a comment line
		}	# First 2 chars are NOT an include.

		If ($FoundOKIncludeCoding) {

			# Found an include in this topic file.

			# Here is what is below:
			# Code06.23  Housekeeping - set flags and counters.
			# Code06.24  Get the include details from the include coding
			# Code06.25  Put in ".md" as last three chars if not already there
			# Code06.26  If include coding starts with slash, remove it
			# Code06.27  Check if this include is already an include for this topic file
			# Code06.28  Test if include points to an existing common file
			# Code06.29  Record include in TopicIncludesArray
			# Code06.30  Topics without includes are copied to the website immediately
			
			$IncludeCoding = $CurrentLine
			$IncludeCoding = $IncludeCoding.replace($IncludeDelimeterStart,"")
			$IncludeCoding = $IncludeCoding.replace($IncludeLiteral,"")
			$IncludeCoding = $IncludeCoding.replace($IncludeDelimeterEnd,"")
			$IncludeCoding = $IncludeCoding.Trim()

			$ShowText = 'M06.22M  IncludeCoding "' + $IncludeCoding + '"'
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			# Code06.23  Housekeeping - set flags and counters.
			
			$NumberIncludesThisTopicFile++

			$TopicFilesHaveIncludes = $True


			# Code06.24  Get the include details from the include coding
			# $IncludeCoding is the Include request from this line

			$IncludeFileRequested = $IncludeCoding
			
	
			# Ensure no unnecessary spaces in include coding start or end

			$IncludeFileRequested = $IncludeFileRequested.Trim()



			# Code06.25  Put in ".md" as last three chars if not already there

			#	If include coding does not end ".md" then insert this.
			#	Normally the include coding can omit the ".md" to save typing.

			$PositionLast3 = $IncludeFileRequested.length - 3
			$Last3chars = $IncludeFileRequested.Substring($PositionLast3)

			If (-not ($Last3chars -eq ".md")) {
				$IncludeFileRequested = $IncludeFileRequested + ".md"
			}			

			#	$ShowText =  'M06.25A  Includes Coding = ' + $IncludeFileRequested
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append			



			# Code06.26  If include coding starts with slash, remove it
		
			$PositionBackslash = $IncludeFileRequested.IndexOf("\")
			If ($PositionBackslash -eq 0) {
				$IncludeFileRequested = $IncludeFileRequested.Substring(1)
				#	$ShowText =  'M06.26A  Backslash as first char not needed - ignored.' 
				#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			} 


			# Put in $CommonFolder so the include is a full path to the file.

			$IncludeFileRequested = $CommonFolder + '\' + $IncludeFileRequested



			#	Code06.27  Check if this include is already an include for this topic file

			$IncludeAlreadyRecorded = $False

			$index2 = $NumberIncludesThisTopicFile - 1		#	Potential psition of new include 	

			#	$ShowText =  'M06.27A  Index2 ' + $index2
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			#	We are inside $TopicArray[$index1] and have found an include.
			#	Check if TopicIncludesArray has already an entry for this include in row $index1
			#	Search TopicIncludesArray from 0 to less than $index2
			#	If found, set $IncludeAlreadyRecorded to $True and do NOT record this include again.
			#   If no duplicate found, record this new include as usual in TopicIncludesArray
			#   

			If ($index2 -gt 0) {	# There is at least one other include in the array to check

				For ($index10 = 0; $index10 -lt $index2; $index10++) {
					If ($TopicIncludesArray[$index1,$index10] -eq $IncludeFileRequested) {
						$IncludeAlreadyRecorded = $True
						$NumberIncludesThisTopicFile--
						$ShowText =  'M05.27A  Include already recorded for this topic file '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

					} # Include already present in includes for this topic file (which is OK)
				}	#	Next $index10
			}	# 	$index2 is above 0 so there is at least one other include to test

			If ($IncludeAlreadyRecorded -eq- $False) {



				# Code06.28  Test if include points to an existing common file
						
				
				#  TestIncludePath is the possible include file

				#	$ShowText = 'M06.28A  Check Include at ' + $IncludeFileRequested
				#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				$ThisIncludeExists = $False

				If   (Test-Path -Path $IncludeFileRequested -PathType leaf) {
					#	$ShowText = 'M06.28B  Include file exists ' 
					#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					$ThisIncludeExists = $True
				} else {

					$ErrorsInIncludes = $True

					$ShowText = ' '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append		
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M06.28C  ERROR - Include file does not exist - ' + $IncludeFileRequested 
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append	

					$ShowText = 'M06.28D  Include was requested from file - ' + $TopicArray[$index1]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
				}	# 	Include does not exist

				If ($ThisIncludeExists -eq $True) {


					#	Code06.29  Record include in TopicIncludesArray
				
					#	$ShowText =  'M06.29A  Include Coding = ' + $IncludeFileRequested
					#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

					#	Arrays start at index zero so index2 is $NumberIncludesThisTopicFile - 1
					#	The number of includes array gets new value of $NumberIncludesThisTopicFile

					# 	The include cannot be stored if the index is greater than MaxIncludesPerFile - 1.
					#	This is because the index starts at 0.

					$LastIncludeIndex = $MaxIncludesPerFile - 1

					If ($index2 -gt $LastIncludeIndex) {

						$ShowText = ' '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
	
						$ShowText = 'M06.29B  ERROR - Too many includes in a file. '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M06.29C  Parameter MaxIncludesPerFile = ' + $MaxIncludesPerFile
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M06.29D  File: ' + $TopicArray[$index1]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						For ($index11 = 0; $index11 -lt $MaxIncludesPerFile; $index11++) {
					
							$ShowText = 'M06.29E    Include at index ' + $index11 + '  ' 
							$ShowText = $Showtext + $TopicIncludesArray[$index1,$index11] 
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
						}

						$ShowText = 'M06.29F  Extra include needed: ' + $IncludeFileRequested
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

						$ShowText = 'M06.29G  Please increase parameter MaxIncludesPerFile. '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
						
						$ShowText = 'Errors - see Error file in folder Logs  '
						If ($DisplayInfoInScript) { Write-Host $ShowText }

						Exit

					}	#	Too many includes to add one more

					#	At last add the include to CommonIncludesArray
						
					$TopicIncludesArray[$index1,$index2] = $IncludeFileRequested
					$NumTopicIncludesArray[$index1] = $NumberIncludesThisTopicFile

					$ShowText = 'M06.29H  TopicIncludesArray('
					$ShowText = $ShowText + $index1 + ',' + $index2 + ') = '
					$ShowText = $ShowText + $TopicIncludesArray[$index1,$index2]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


				}	# 	Include exists

			}	#  IncludeAlreadyRecorded = false

		
		}	#  End found include coding

		
	}	# End foreach line in topic file
	
	
	$ShowText = 'M06.29M  end ====================================================='
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	

	#	Code06.30	Topics without includes are copied to the website immediately


	If ($NumberIncludesThisTopicFile -eq 0) {

		
        #   Call Find-Filename to find just the filename of topic

		$TopicFileName = Find-Filename $TopicArray[$index1]

		$ShowText = 'M06.30A  Topic filename with no includes = ' +  $TopicFileName
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


        #   Call Find-Path to find path associated with topic

		#	$ShowText = 'M06.30B      TopicsFolder = ' + $TopicsFolder
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		#	$ShowText = 'M06.30C      Topic full path =  ' + $TopicArray[$index1]
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		
			
		$TopicPath = Find-Path $TopicsFolder $TopicArray[$index1]

		$ShowText = 'M06.30D  Path for topic = ' +  $TopicPath
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
        
		
        
		#	Call Confirm-Folders to make sure Website has the path

		#	$ShowText = 'M06.30E      Path needed above website '  +  $WebsiteFolder
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		
        $Result = Confirm-Folders   $WebsiteFolder $TopicPath

        $ShowText = 'M06.30F      Result of adding path to website is ' + $Result
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

		#	Copy topic to website folder path

		$TopicWebsiteFullPath = $WebsiteFolder + '\' + $TopicPath + '\'
		$TopicWebsiteFullPath = $TopicWebsiteFullPath  + $TopicFileName


		Copy-Item -Path $TopicArray[$index1] -Destination $TopicWebsiteFullPath  -Force

		$ShowText = 'M06.30G  Topic copied to website and path ' 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	}

	$ShowText = ' '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


}	# 	Next index in TopicArray


#	Have finished reading all topic files.  Either we found includes or we did not.


#	Code06.32		Display topic files with includes

$NumberTopicFilesWithIncludes = 0
$TotalTopicIncludes = 0


$ShowText = '===================================================================='
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append



If (-not $TopicFilesHaveIncludes) {
	
	#	No topic markdown files have includes.
	
	$ShowText = 'M06.32A  No topic files have any includes '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	Write-Host $ShowText
	
} else {	# TopicIncludesArray must have entries somewhere
	
	
	$ShowText = 'M06.32B  TOPIC FILES WITH INCLUDES'
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

	
	For ($index1 = 0; $index1 -lt $TopicArray.length; $index1++) {
	
				
		# Displauy of includes
		
		If ($NumTopicIncludesArray[$index1] -gt 0) {
	
			$ShowText = ' '
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			
			$ShowText = 'M06.32C  Topic ' + $index1 + ' = ' +  $TopicArray[$index1]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
		
			$NumberTopicFilesWithIncludes++


			#	Find larged number of includes in a topic
				
			If ($NumTopicIncludesArray[$index1] -gt $LargestIncludesPerTopic) {
				$LargestIncludesPerTopic = $NumTopicIncludesArray[$index1]
			}



			For ($index2 = 0; $index2 -lt $NumTopicIncludesArray[$index1]; $index2++) {

				$TotalTopicIncludes++
		
				If ($index2 -eq 0) { 
					$ShowText = 'M06.32D       INCLUDES  ' + $TopicIncludesArray[$index1,$index2] 
				} else {
					$ShowText = 'M06.32D                 ' + $TopicIncludesArray[$index1,$index2] 
				}
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												
			}	#  For index2 = include for that topic file

		} #	 $NumTopicIncludesArray[$index1] greater than zero
		
	}	# There are topic includes
	
	$ShowText = ' '
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	

	If ($NumberTopicFilesWithIncludes -eq 1) { 
		$ShowText = 'M06.32E  ' + $NumberTopicFilesWithIncludes + ' topic file has includes.' 
	} else {
		$ShowText = 'M06.32E  ' + $NumberTopicFilesWithIncludes + ' topic files have includes.' 
	}	
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	#	Write-Host $ShowText

	
}	# End index for topic file


#	Code06.40  End processing if any errors in includes found (for either common or topic files)

If ($ErrorsInIncludes) {

	$ShowText = ' '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append


	$ShowText = 'M06.40A  ERROR - Includes have errors (see other messages).  Run terminated.'
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }
	
	Exit

}



#	Code07.00	Create Pathways table for common files and check for circular includes

$ShowText = " "
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$ShowText = 'M07.00A  Create Pathways and check circular includes '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
#	If ($DisplayInfoInScript) { Write-Host $ShowText }

$ShowText = "M07.00B  Start pathway processing."
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 




# General plan: read CommonIncludesArray and generate Pathways arrays.
# Each read of CommonIncludesArray creates a 2-step pathway in NewPathwayArray.
# There may be extra pathways due to implications of that new 2-step pathway.
# When all extra pathways are found and created in NewPathwayArray, 
#    load the new rows from NewPathwayArray into ExistingPathwayArray, and 
#    empty NewPathwayArray once more.
# At various points, check for circular includes.  If found, 
#    issue error to Error file and Report and cease all furhter processing.
# When all the CommonIncludesArray is processed then this section is done.


#	Code07.10	Setup Pathway arrays

#	This is the "master" list of pathways
#	Thise uses $index3 and $index4

#	Max steps in a pathway is one larger than $MaxDepthCommonIncludesCommon 
#	because step 0 is the common file and the includes start at 1 (instead of 0)

$MaxStepsInPathway = $MaxDepthCommonIncludesCommon + 1

$ExistingPathwayArray = New-Object 'string[,]' $MaxPathways,$MaxStepsInPathway
$ExistingPathwaylastStepArray = New-Object 'int[]' $MaxPathways

#	This is the new pathways to be added to the master list.
#	This uses $index5 and $index6

$NewPathwayArray = New-Object 'string[,]' $MaxPathways,$MaxStepsInPathway
$NewPathwayLastStepArray = New-Object 'int[]' $MaxPathways

#	CheckExtend will be used in 07.40.

$CheckExtendArray = New-Object 'string[,]' 1,$MaxStepsInPathway
$CheckExtendLastStep = -1	#	Dummy value for now	

# 	Set initial values for both Patway arrays.
# 	For includes set to a dummy string
#	For steps set to 1 (which assumes a single include and nothing more)
		
For ($index3 = 0; $index3 -lt $MaxPathways; $index3++) {
		
	$ExistingPathwaylastStepArray[$index3] = 1		#	Assume only one level of include
	$index5 = $index3
	$NewPathwayLastStepArray[$index5] = 1		#	Assume only one level of include

	For ($index4 = 0; $index4 -lt$MaxStepsInPathway; $index4++) {
		
		$ExistingPathwayArray[$index3,$index4] = "IntialValue" 	# 	Clearly show a bogus value	
		$index6 = $index4
		$NewPathwayArray[$index5,$index6] = "IntialValue" 	# 	Clearly show a bogus value	
			
		If ($index3 -eq 0) {	#	Only do this for the one row CheckExtend
			$CheckExtendArray[0,$index4] = "InitialValue"
		}


	}	#  For index2 = step for that pathway

}	#  For index1 = Pathway


#	Code07.20	Generate Pathways from common includes
#
#	Each step in CommonIncludesArray implies a requesting file and a common include.
#	Call each requesting common file R and the common include S.  
#	This is a new 2-step pathway (R-S).
#	That 2-step pathway is added to NewPathwayArray. 
#	WE need to check for more pathways based on that 2-step pathway.
#	If there are, add the new pathways in NewPathwayArray.
#	How do we check for more pathways to add?
#	First, case ExistingPathDuplAddLast - search ExistingPathwayArray for any pathways that end R.
#	    If found, duplicate that pathway to NewPathwayArray and add S as a new last step.
#	Second, case NewPathExtend.  Look at each new pathway added by ExistingPathDuplAddLast 
#		and look for extensions to this.  We extend where possible.
#	Finally, case ExistingPathDuplAddFirst - search ExistingPathwayArray for a pathway that starts with S.
#		If found, duplicate that pathway to NewPathwayArray so the new one starts with R
#		and then has the rest of the steps.
#	When done, add NewPathwayArray to ExistingPathwayArray.  This completes adding all the pathways
#	based on the new 2-step pathway.
#



#   Read each CommonArray and check for includes in CommonIncludesArray.
#	Where we find an include, create a new 2-step pathway for that include.

$index3 = -1   				#	This is the index of the Pathways array.
$index5 = -1				#   This the incex of the New Pathways array
$PathwayLastRow = -1		#	Empty - next row will be row zero (the first).
$NewPathwayLastRow = -1		#	Empty - next row will be row zero (the first).

For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {

	$ShowText = " "
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$ShowText = 'M07.20A  Check includes for common ' + $index1 + ' = ' +  $CommonArray[$index1]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	
	If ($NumCommonIncludesArray[$index1] -gt 0) {

		For ($index2 = 0; $index2 -lt $NumCommonIncludesArray[$index1]; $index2++) {
		
			#	Code07.21	Create new 2-step pathway for NewPathwayArray
			#
			#   Each new common include is a new 2-step pathway in NewPathwayArray where
			#		$CommonArray[$index1] is step 0 (the requesting file)
			#		$CommonIncludesArray[$index1,$index2] is step 1 (the common file)
			#
			#   Create the 2-step row in NewPathwayStapsArray as follows:
			#		$index5 incremented   (a new pathway)
			#		$index2 = 0 the first time in CommonIncludesArray
			#		$MewPathwayArray[$index5,0] = $CommonArray[$index1]
			#		$NewPathwayArray[$index5,1] = $CommonIncludesArray[$index1,$index2] 
			#		$NewPathwayLastStepArray[$index5] = 1

			If ($index2 -gt 0) {

				# $index2 above 0 means we have a new include in CommonIncludesArray
				#	This means a blank line in the trace which spaces the messages out.
				$ShowText = " "
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				
				$ShowText = 'M07.21A  Continue checking includes for common ' + $index1 + ' = ' +  $CommonArray[$index1]
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			}

			$ShowText = 'M07.21B                  Found include ' + $CommonIncludesArray[$index1,$index2]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	

			$index5++	#	Creates a new pathway that is 2-steps.
			
			#	The requesting common file is the common file we are looking at

			$ThisRequestingCommon = $CommonArray[$index1]	

			#	NewPathwayArray step 0 is the requesting common file.

			$NewPathwayArray[$index5,0] = $ThisRequestingCommon
			
			#	$ShowText = 'M07.21A       NewPathwayArray index5 = ' + $index5
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			#	The Common include we are looking at is the include from the CommonIncludesArray

			$ThisCommonInclude = $CommonIncludesArray[$index1,$index2]

			#	This include is the second step of our new pathway, i.e. step 1
			
			$NewPathwayArray[$index5,1] = $ThisCommonInclude
			
			#	$NewPathwayLastStepArray[$index5] = 1 is already set in that array

			$ShowText = 'M07.21C      NewPathway 2-step start = ' + $NewPathwayArray[$index5,0] 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


			$ShowText = 'M07.21D                  single step = ' + $NewPathwayArray[$index5,1]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		
			$NewPathwayLastRow = $index5		#	Latest NewPathwawyStpesArray row


			#
			#	Code07.30   Find extra pathways Case ExistingPathDuplAddLast.
			#

			$ShowText = 'M07.30A    Begin ExistingPathDuplAddLast'
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			#	"ExistingPathDuplAddLast" means we will duplicate existing pathways and insert an extra last step.
			#	Let's consider an example.  
			#	We have a pathway in ExistingPathwayArray A-B.  (This means A includes B.)
			#	We have a new 2-step pathway in our NewPathwayArray: B-C.
			#	ExistingPathDuplAddLast means we do the following:
			#   Task 1. Scan ExistingPathwayArray for a pathway that ends in B.  We find one (A-B).
			#	Task 2. Duplicate the existing pathawy and add a new last step of C,
			#		   meaning we create A-B-C in our NewPathwayArray.
			#	Task 3. For each Task 2 perform Case NewPathExtend.  (See 07.40 for why).
			#
			# 	Bottom line: we end up with three pathways: A-B, B-C, and A-B-C.
			#	The first two pathways were 2-step pathways (simple).  The third is from Case ExistingPathDuplAddLast.
			#	ExistingPathDuplAddLast is a typical way new pathways are added.
			#
			#	Now the concept is clear, lets' look at the variables involved.
			#	The new 2-step pathway in NewPathwayArray is R-S.
			#	R = $NewPathwayArray[$index5,0] = $ThisRequestingCommon
			#	S = $NewPathwayArray[$index5,1] = $ThisCommonInclude
			#	
			#	ExistingPathDuplAddLast Task 1 - search ExistingPathwayArray for a pathways that end R 
			#	If found, create new pathway that is duplicate and has
			#			 extra step $NewPathwayArray[$index5,1] = S
			#		$index3 = row in existing ExistingPathwayArray
			#		$index4 = $ExistingPathwaylastStepArray[$index3]  
			#		Look for $ExistingPathwayArray[$index3,$index4] = $ThisRequestingCommon
			#		$index5 = row in New Pathway Array
			#		$index10 = step in that row of New Pathway Array
			#

			$ShowText = 'M07.30B        PathwayLastRow ' + $PathwayLastRow
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 



			if ($PathwayLastRow -gt -1) {	#	Means entries are in ExistingPathwayArray

				# Search ExistingPathwayArray
	
				$PathwayRowLength =  $PathwayLastRow + 1

				#	Search ExistingPathwayArray

				For ($index3 = 0; $index3 -lt $PathwayRowLength; $index3++) {
		
					$ShowText = 'M07.30C        ExistingPathDuplAddLast - Check Existing Pathway ' + $index3
					$ShowText = $ShowText + ' ' + $ExistingPathwayArray[$index3,0]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


					#	index4 is last step in that pathway
					$index4 = $ExistingPathwaylastStepArray[$index3]
				
					If ($ExistingPathwayArray[$index3,$index4] -eq $ThisRequestingCommon){

						#	Code07.31   Duplicate pathway for ExistingPathDuplAddLast


						$ShowText = 'M07.31A        ExistingPathDuplAddLast relevant for ' + $index3
						$ShowText = $ShowText + ' ' + $ExistingPathwayArray[$index3,0]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	
						$ShowText = 'M07.31B                Last step is ' + $index4
						$ShowText = $ShowText + ' ' + $ExistingPathwayArray[$index3,$index4]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


						#   This existing pahtway has last step R = $ThisRequestingCommon
						#	Duplicate this existing pathway into NewPathwayArray and add extra last step.
						#	$ExistingPathwayArray[$index3, * ] copies to new pathway in NewPathwayArray
						#   and then add new last step of S to that new pathway

						$index5++	#	New pathway in NewPathwayArray
							
						$ExistingPathwayLastStep = $ExistingPathwaylastStepArray[$index3] + 1	# Update as we go

						#	Duplicate pathway in ExistingPathwayArray to NewPathwayArray

						For ($index10 = 0; $index10 -lt $ExistingPathwayLastStep; $index10++) {
						
							$NewPathwayArray[$index5,$index10] = $ExistingPathwayArray[$index3,$index10]

							#	$ShowText = 'M07.31C       index5 = ' + $index5
							#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

							If ($index10 -eq 0){
								$ShowText = 'M07.31D        New ExistingPathDuplAddLast NewPathwayArray start ' + $NewPathwayArray[$index5,0] 
							} else {
								$ShowText = 'M07.31E                      step ' + $index10 + '  ' 
								$ShowText = $Showtext + $NewPathwayArray[$index5,$index10] 
							}
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						}

						#	Need to add new last step
						#	$index10 already incremented from the above loop.
						#	Before we add, we must check if this will exceed the max stesp in a pathway.
						#   If the new last step is too many, show error

						#	Code07.32     Check if new last step is too far

						If ($index10 -gt ($MaxStepsInPathway - 1)) {

							$ShowText = ' '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
							$ShowText = 'M07.32A  ERROR - Include depth too far. '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							$ShowText = 'M07.32B  Parameter MaxDepthCommonIncludesCommon = ' + $MaxDepthCommonIncludesCommon
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							$ShowText = 'M07.32C  This sequence of includes needs an extra step '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							For ($index11 = 0; $index11 -lt $ExistingPathwayLastStep; $index11++) {
						
								If ($index11 -eq 0){
									$ShowText = 'M07.32D  Start at ' + $NewPathwayArray[$index5,0] 
								} else {
									$ShowText = 'M07.32E      Next include at index ' + $index11 + '  ' 
									$ShowText = $Showtext + $NewPathwayArray[$index5,$index11] 
								}
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							}	#	Next Index11 in step for NewPathwayArray row index5

							$ShowText = 'M07.32F        Extra step needed: ' + $ThisCommonInclude
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							$ShowText = 'M07.32G  Please increase parameter MaxDepthCommonIncludesCommon. '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

							
							$ShowText = 'Errors - see Error file in folder Logs  '
							If ($DisplayInfoInScript) { Write-Host $ShowText }

							Exit

						}	# Next Index10 is too big for step in NewPathwayArray row

						#	Code07.33     Add new last step for ExistingPathDuplAddLast
						#	Add new last step S to this pathway in NewPathwayArray

						$NewPathwayArray[$index5,$index10] = $ThisCommonInclude 

						$NewPathwayLastStepArray[$index5] = $index10	# Set new last step number

						$ShowText = 'M07.33A                  new last ' + $index10 + '  '
						$ShowText = $Showtext + $NewPathwayArray[$index5,$index10] 
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						$NewPathwayLastRow = $index5		#	Latest last row in NewPathwawyStepsArray

						#
						#	Code07.34     Check for circular include
						#

						$ShowText = 'M07.34A        Check for circular include for this last pathway added ' 
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						If ($NewPathwayArray[$index5,0] -eq $NewPathwayArray[$index5,$index10]){
							#	Detected a circular include
		
							$ShowText = ' '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
							$ShowText = 'M07.34B  ERROR - Circular include found: '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
		
							#	$ShowText = 'M07.34C  NewPathArray ' + $index5 + ' ' + $index6
							#	$ShowText = $ShowText + ' ' + $NewPathwayArray[$index5,$index6]
							#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							#	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							#	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
							
							$NewPathwayLastStep = $NewPathwayLastStepArray[$index5] + 1		
		
							
							For ($index10 = 0; $index10 -lt $NewPathwayLastStep; $index10++) {
								
								If ($index10 -eq 0){
									$ShowText = 'M07.34D       Start pathway ' + $NewPathwayArray[$index5,0] 
								} else {
									$ShowText = 'M07.34E         inc index ' + $index10 +  ' '  + $NewPathwayArray[$index5,$index10] 
								}
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
							}
		
							$ShowText = 'Errors - see Error file in folder Logs  '
							If ($DisplayInfoInScript) { Write-Host $ShowText }
		
							Exit
		
						}	#	If first and last step of latest NewPathwayArray entry are the same	

						#
						#	Code07.40   Find extra pathways Case NewPathExtend
						#
						
						#	We just finished craeting a new Case ExistingPathDuplAddLast pathway.
						#	In ExistingPathDuplAddLast we duplicated a pahtway ending in R and added last step S. 
						#	Case NewPathExtend takes this further.
						#   For example, the existing pathways are as follwows:
						#		A-B, B-C, A-B-C, D-E
						#		A new 2-step pathway in our NewPathwayArray is:
						#		E-A.
						#	We obviously need E-A-B and E-A-B-C - see case ExistingPathDuplAddFirst below.
						#	Look at what case ExistingPathDuplAddLast does - it creates this patheway:
						#		D-E-A
						#	That's a useful pathway. but what about D-E-A-B and D-E-A-B-C?
						#
						#	NewPathExtend provides the extra pathways as follows:
						#	The last ExistingPathDuplAddLast entry is D-E-A. Call this "CheckExtend".
						#	The last step of CheckExtend is currently A.
						#   Task A. Scan ExistingPathwayArray for 2-step pahtway starting CheckExtend last step.
						#		 We find one (A-B).
						#	Task B. Duplicate CheckExtend and add new last step of the 2-step found (B).
						#		 This creates D-E-A-B.
						#	Task C. Consider the new pathway added the new "CheckExtend".
						#		Repeat Task A searching ExistingPathwayArray for 2-step pathway starting B.
						#		We find one (B-C).
						#		Repeat Task B to create new pathway D-E-A-B-C.
						#		Keep going until no more 2-step pathways relevant in ExistingPathwayArray.
						#	Bottom line: D-E-A-B and D-E-A-B-C are added to NewPathWayArray.
						#
						#
						#	Task A Scan Pathways for 2-step starting at last step of CheckExtend.
						#
						#	CheckExtend starts as the current ExistingPathDuplAddLast pathway
						#	Copy latest pathway in NewPathwayArray to CheckExtend
						#

						$ShowText = 'M07.40A           Begin Case NewPathExtend '
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						#
						#	Code07.41   Setup CheckExtend array
						#

						$CheckExtendLength = $NewPathwayLastStepArray[$index5] + 1
						

						For ($index7 = 0; $index7 -lt $CheckExtendLength; $index7++) {
						
							$CheckExtendArray[0,$index7] = $NewPathwayArray[$index5,$index7] 
							$CheckExtendLastStep = $index7

							If ($index7 -eq 0){
								$ShowText = 'M07.41A           Setup CheckExtend start ' + $NewPathwayArray[$index5,0] 
							} else {
								$ShowText = 'M07.41B                      step ' + $index7 + '  ' 
								$ShowText = $Showtext + $NewPathwayArray[$index5,$index7] 
							}
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						}
						
						#
						#	Code07.42   Search existing pathways (Dp While KeepChecking)
						#	We need to scan Pathways for 2-step starting with last step CheckExtend.
						
						If ($PathwayLastRow -gt -1) {	#	Means entries are in ExistingPathwayArray

							# Checking for NewPathExtend keeps going until no more extensions possible.

							Do {

								$ShowText = 'M07.42A           NewPathExtend for latest CheckExtend'
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


								$KeepChecking = $False		# Will set to True if extension found

								$ExtensionDone = $False		# True if we find a worthwhile extension

								$Index20 = 0				# Index for ExistingPathwayArray

								$StillPathwaysToCheck = $True	# False when index20 is above the length

								#	Look for a 2-step pathway to extend pathway CheckExtend

								#	Code07.43   Search existing pathways (Do While StillPathways & NoExtension)

								Do  {

									$ShowText = 'M07.43A           NewPathExtend Pathways index20 '  + $index20 
									Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

									#	Is this pathway 2-steps?

									If ($ExistingPathwaylastStepArray[$index20] -eq 1) {

										#	Check first step of pathway = last step of CheckExtend

										If ($ExistingPathwayArray[$index20,0] -eq $CheckExtendArray[0,$CheckExtendLastStep]){

											#	Code07.44   Duplicate pathway for NewPathExtend
											#  Found a 2-step pathway to apply to CheckExtend
											#  Duplicate CheckExtend and add extra step $ExistingPathwayArray[$index20,1]

										
											$index5++	#	New pathway in NewPathwayArray

											$OldExtendLength = $CheckExtendLastStep + 1
							
											$NewExtendLastStep = $CheckExtendLastStep + 1
											$NewLengthExtend = $NewExtendLastStep + 1
					
											#	Duplicate pathway in ExistingPathwayArray to NewPathwayArray
					
											For ($index21 = 0; $index21 -lt $OldExtendLength; $index21++) {
																											
												$NewPathwayArray[$index5,$index21] = $CheckExtendArray[0,$index21]

												#	$ShowText = 'M07.44A       index5 = ' + $index5
												#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

												If ($index21 -eq 0){
													$ShowText = 'M07.44B           Case NewPathExtend start ' + $NewPathwayArray[$index5,0] 
												} else {
													$ShowText = 'M07.44C                      step ' + $index21 + '  ' 
													$ShowText = $Showtext + $NewPathwayArray[$index5,$index21] 
												}
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
											}	# Duplicate pathway steps

											#	Need to add new last step
											#	$index21 already incremented from the above loop.

											#
											#	Code07.45   Check if new last step is too far
											#	Before we add, we must check if this will exceed the max stesp in a pathway.
											#   If the new last step is too many, show error

											If ($index21 -gt ($MaxStepsInPathway - 1)) {

												$ShowText = ' '
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
												$ShowText = 'M07.45A  ERROR - Include depth too far. '
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

												$ShowText = 'M07.45B  Parameter MaxDepthCommonIncludesCommon = ' + $MaxDepthCommonIncludesCommon
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

												$ShowText = 'M07.45C  This sequence of includes needs an extra step '
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

												For ($index11 = 0; $index11 -lt $ExistingPathwayLastStep; $index11++) {
						
													If ($index11 -eq 0){
														$ShowText = 'M07.45D  Start at ' + $NewPathwayArray[$index5,0] 
													} else {
														$ShowText = 'M07.45E      Next include at index ' + $index11 + '  ' 
															$ShowText = $Showtext + $NewPathwayArray[$index5,$index11] 
													}
													Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
													Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
													Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

												}

												$ShowText = 'M07.45F        Extra step needed: ' + $ThisCommonInclude
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

												$ShowText = 'M07.45G  Please increase parameter MaxDepthCommonIncludesCommon. '
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

												$ShowText = 'Errors - see Error file in folder Logs  '
												If ($DisplayInfoInScript) { Write-Host $ShowText }

												Exit

											}	# 	Too many steps in pathway

											#	Code07.46   Add new last step for NewPathExtend
											#	Add new last step from 2-step pathway found

											$NewPathwayArray[$index5,$index21] = $ExistingPathwayArray[$index20,1]

											$NewPathwayLastStepArray[$index5] = $index21	# Set new last step number

											$ShowText = 'M07.46A                  new last ' + $index21 + '  '
											$ShowText = $Showtext + $NewPathwayArray[$index5,$index21] 
											Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

											$NewPathwayLastRow = $index5		#	Latest last row in NewPathwawyStepsArray

											$ExtensionDone = $True

											#
											#	Code07.47   Update CheckExtend array
											#

											$CheckExtendLength = $NewPathwayLastStepArray[$index5] + 1
						

											For ($index7 = 0; $index7 -lt $CheckExtendLength; $index7++) {
						
												$CheckExtendArray[0,$index7] = $NewPathwayArray[$index5,$index7] 
												$CheckExtendLastStep = $index7

												If ($index7 -eq 0){
													$ShowText = 'M07.47A           Setup CheckExtend start ' + $NewPathwayArray[$index5,0] 
												} else {
													$ShowText = 'M07.47B                      step ' + $index7 + '  ' 
													$ShowText = $Showtext + $NewPathwayArray[$index5,$index7] 
												}
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
											}

											#
											#	Code07.48     Check for circular include
											#
											
											$ShowText = 'M07.48A           Check for circular include for this last pathway added ' 
											Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

											If ($NewPathwayArray[$index5,0] -eq $NewPathwayArray[$index5,$index21]){
												#	Detected a circular include
		
												$ShowText = ' '
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
												$ShowText = 'M07.48B  ERROR - Circular include found: '
												Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
		
												#	$ShowText = 'M07.48C  NewPathArray ' + $index5 + ' ' + $index6
												#	$ShowText = $ShowText + ' ' + $NewPathwayArray[$index5,$index6]
												#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
												#	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
												#	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
							
												$NewPathwayLastStep = $NewPathwayLastStepArray[$index5] + 1		
		
							
												For ($index10 = 0; $index10 -lt $NewPathwayLastStep; $index10++) {
								
													If ($index10 -eq 0){
														$ShowText = 'M07.48D       Start pathway ' + $NewPathwayArray[$index5,0] 
													} else {
														$ShowText = 'M07.48E         inc index ' + $index10 +  ' '  + $NewPathwayArray[$index5,$index10] 
													}
													Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
													Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
													Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
												}
		
												$ShowText = 'Errors - see Error file in folder Logs  '
												If ($DisplayInfoInScript) { Write-Host $ShowText }
		
												Exit
		
											}	#	If first and last step of latest NewPathwayArray entry are the same	

										}	#	first step of pathway = last step of CheckExtend
	
									}	#	Found 2-step pathway		


									$index20++ 	#	Check next row in ExistingPathwayArray 

									#	$ShowText = 'M07.48F          Index20 ' + $index20
									#	$ShowText = $ShowText + " and PathwayLastRow " + $PathwayLastRow
									#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

									#	If Index20 goes past LastRow, then signal no more rows to check
									If ($index20 -gt $PathwayLastRow) {
										$ShowText = 'M07.48G           NewPathExtend No more pathways'
										Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
										$StillPathwaysToCheck = $False
									} else {
										$ShowText = 'M07.48H           NewPathExtend check more pathways'
										Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
									}


									#	$ShowText = 'M07.48J           StillPathwaysToCheck ' + $StillPathwaysToCheck
									#	$ShowText = $ShowText + " and ExtensionDone " + $ExtensionDone
									#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


									#	Do-While check existing pathways for 2-step pathways
								} While ($StillPathwaysToCheck -and ($ExtensionDone -eq $False	))	
								
								#	$ShowText = 'M07.48K           Below DoWhile for StillPathways to Check' 
								#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


								#	If latest scan of ExistingPathwayArray found no exztensions, then stop checking
								If ($ExtensionDone -eq $False) {
									$ShowText = 'M07.48L           NewPathExtend No extension so stop checking pathways'
									Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
									$KeepChecking = $False
								} else {
									$ShowText = 'M07.48M           NewPathExtend had extension so search again'
									Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
									$KeepChecking = $True
								}

								#	$ShowText = 'M07.48N           KeepChecking ' + $KeepChecking
								#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


								#	Do-While Keep Checking
							} While ($KeepChecking)		
								     
							$ShowText = 'M07.48K           NewPathExtend finished for thisExistingPathDuplAddLast'
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				
						}	# PathwaysArray has entries	

					}	#	last step of existing pathway equals common file (start ExistingPathDuplAddLast)

					$ShowText = 'M07.48L           Finished this pathway for ExistingPathDuplAddLast'
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				
				}	#  For index3 = Pathway
		
				$ShowText = 'M07.48M    Finish ExistingPathDuplAddLast ' 
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


			} else { 
			 #   ExistingPathwayArray has NO entries to process

			$ShowText = 'M07.48N        No entries in ExistingPathwayArray so no duplicate possibilities'
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			}	


			#
			#	Code07.50   Find extra pathways Case ExistingPathDuplAddFirst
			#
			#	In 07.21 above we added a simple pathway where R includes S.
			#	R = $NewPathwayArray[$index5,0] = $ThisRequestingCommon
			#	S = $NewPathwayArray[$index5,1] = $ThisCommonInclude
			#
			#	Case ExistingPathDuplAddFirst = find existing pathway that starts with S.
			# 	That existing pathway has step 0 = $ThisCommonInclude
			#	If found, create new pathway that is duplicate and has
			#			 new start step of $ThisRequestingCommon
			#			 and all other steps as for the existing pathway found
			#		$index7 = row in ExistingPathwayArray
			#		Look for $ExistingPathwayArray[$index7,0] = $ThisCommonInclude
			#

			$ShowText = 'M07.50A    Begin ExistingPathDuplAddFirst'
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


			if ($PathwayLastRow -gt -1) {

				# Search ExistingPathwayArray
	
				$PathwayRowLength =  $PathwayLastRow + 1

				For ($index3 = 0; $index3 -lt $PathwayRowLength; $index3++) {
		
					If ($ExistingPathwayArray[$index3,0] -eq $ThisCommonInclude){

						#	Code07.51   Duplicate pathway for ExistingPathDuplAddFirst

						#   $ShowText = 'M07.51A     ExistingPathDuplAddFirst Found ' + $ExistingPathwayArray[$index3,0]
						#   Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						#	$ShowText = 'M07.51B    NewPathwayArray index = 0 ' 
						#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						#	$ShowText = 'M07.51C     NewPathwayArray ' +  $NewPathwayArray[0,1]
						#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						# This pahtway has first step same as $ThisCommonInclude.
						#	Create a new pathway with $ThisRequestingCommon as first step
						#	and the remaining stpes are $ExistingPathwayArray[$index3, * ] 
						#
						
						$index5++	#	New pathway

						$NewPathwayArray[$index5,0] = $ThisRequestingCommon

						$ShowText = 'M07.51D        Case ExistingPathDuplAddFirst NewPathwayArray start ' + $NewPathwayArray[$Index5,0]
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							
						$ExistingPathwayLastStep = $ExistingPathwaylastStepArray[$index3] + 1	

						For ($index10 = 0; $index10 -lt $ExistingPathwayLastStep; $index10++) {
						
							$StepForNewPathway = $index10 + 1

							#	Code07.52     Check if new last step is too far
							#	As we add a step, check if it is too many includes.

							If ($StepForNewPathway -gt ($MaxStepsInPathway - 1)) {

								$ShowText = ' '
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
								$ShowText = 'M07.52A  ERROR - Include depth too far. '
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

								$ShowText = 'M07.52B  Parameter MaxDepthCommonIncludesCommon = ' + $MaxDepthCommonIncludesCommon
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

								$ShowText = 'M07.52C  Current pathway starts at common  ' + $ThisRequestingCommon
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

								$ShowText = 'M07.52D        Extra step is one too many  ' + $ExistingPathwayArray[$index3,$index10]
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

								$ShowText = 'M07.52E  Please increase parameter MaxDepthCommonIncludesCommon. '
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

								$ShowText = 'Errors - see Error file in folder Logs  '
								If ($DisplayInfoInScript) { Write-Host $ShowText }

								Exit

							}

							#	Code07.53   Add new last step for ExistingPathDuplAddFirst
							#	$StepForNewPathway is within range, so all is OK.

							$NewPathwayArray[$index5,$StepForNewPathway] = $ExistingPathwayArray[$index3,$index10]

							$ShowText = 'M07.53A                      step ' + $StepForNewPathway + '  ' 
							$ShowText = $Showtext + $NewPathwayArray[$index5,$StepForNewPathway] 
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						}


						$NewPathwayLastStepArray[$index5] = $StepForNewPathway	# Set new last step number

						$NewPathwayLastRow = $index5		#	Latest NewPathwawyStpesArray row

						#
						#	Code07.54     Check for circular include
						#

						$ShowText = 'M07.54A        Check for circular include for this last pathway added ' 
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						If ($NewPathwayArray[$index5,0] -eq $NewPathwayArray[$index5,$StepForNewPathway]){
							#	Detected a circular include
		
							$ShowText = ' '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
							$ShowText = 'M07.54B  ERROR - Circular include found: '
							Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
		
							#	$ShowText = 'M07.54C  NewPathArray ' + $index5 + ' ' + $index6
							#	$ShowText = $ShowText + ' ' + $NewPathwayArray[$index5,$index6]
							#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
							#	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
							#	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
		
							
							$NewPathwayLastStep = $NewPathwayLastStepArray[$index5] + 1		
		
							
							For ($index10 = 0; $index10 -lt $NewPathwayLastStep; $index10++) {
								
								If ($index10 -eq 0){
									$ShowText = 'M07.54D       Start pathway ' + $NewPathwayArray[$index5,0] 
								} else {
									$ShowText = 'M07.54E         inc index ' + $index10 +  ' '  + $NewPathwayArray[$index5,$index10] 
								}
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
								Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
							}
		
							$ShowText = 'Errors - see Error file in folder Logs  '
							If ($DisplayInfoInScript) { Write-Host $ShowText }
		
							Exit

						}	# 	If first and last step of latest NewPathwayArray entry are the same	
						
					}	#	last step of existing pathway equals common file
	
				}	#  For index3 = Pathway

				$ShowText = 'M07.53B    Finish ExistingPathDuplAddFirst ' 
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			} else { 
				#   ExistingPathwayArray has NO entries to process
   
			   $ShowText = 'M07.53C        No entries in ExistingPathwayArray so no duplicate possibilities'
			   Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			}
					
			#
			#	Code07.60	Check for circular includes in NewPathwayArray
			#	We checked in  07.34, 07.47. 07.54 so this may be redundant.
			#	This section is retained as a double-check.
			#
			# 	Check for NewPathwayArray[$index9,0] = 
			#	          NewPathwayArray[$index9,NewPathwayLastRowArray[$index9]]
			#		This is a circular include.
			#		If found, signal error and end all processing.		

			#	$ShowText = 'M07.60A  $PathwayLastRow = ' + $PathwayLastRow
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				
			#	$ShowText = 'M07.60B  $NewPathwayLastRow = ' + $NewPathwayLastRow
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			$ShowText = 'M07.60A  Begin Circular Include check'
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


			
			$NewPathwayRowLength =  $NewPathwayLastRow 

			For ($index5 = 0; $index5 -lt $NewPathwayRowLength; $index5++) {
		
				#	Index6 is last step in that pathway
				$Index6 = $NewPathwayLastStepArray[$index5]
				
				If ($NewPathwayArray[$index5,0] -eq $NewPathwayArray[$index5,$index6]){
					#	Detected a circular include

					$ShowText = ' '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M07.60D  ERROR - Circular include found: '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append


					#	$ShowText = 'M07.60E  NewPathArray ' + $index5 + ' ' + $index6
					#	$ShowText = $ShowText + ' ' + $NewPathwayArray[$index5,$index6]
					#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					#	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					#	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					
					$NewPathwayLastStep = $NewPathwayLastStepArray[$index5] + 1		

					
					For ($index10 = 0; $index10 -lt $NewPathwayLastStep; $index10++) {
						
						If ($index10 -eq 0){
							$ShowText = 'M07.60F       Start pathway ' + $NewPathwayArray[$index5,0] 
						} else {
							$ShowText = 'M07.60G         inc index ' + $index10 +  ' '  + $NewPathwayArray[$index5,$index10] 
						}
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
						Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append
					}

					$ShowText = 'Errors - see Error file in folder Logs  '
					If ($DisplayInfoInScript) { Write-Host $ShowText }

					Exit

				}	# Found circular include
		
			
			}	#  For index5 = NewPathway while checking for circular include
			



			#	Code07.70	Add NewPathwayArray to ExistingPathwayArray

			$ShowText = 'M07.70A  Copy NewPathwayArray to end of ExistingPathwayArray' 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			

			# 	Add NewPathwayArray to ExistingPathwayArray
			#			Update PathwayLastStepArray too.
			#			Then reset NewPathwayArray and
			#						NewPathwayLastRowArray
			#

			#	$ShowText = 'M07.70B  $PathwayLastRow = ' + $PathwayLastRow
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				
			#	$ShowText = 'M07.70C  $NewPathwayLastRow = ' + $NewPathwayLastRow
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			#



			$index3 = $PathwayLastRow		#  Will increment for new entry
			
			#	$ShowText = 'M07.70D  PathwayLastRow ' +  $PathwayLastRow
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			
			#	$ShowText = 'M07.70E  NewPathwayLastRow ' +  $NewPathwayLastRow
			#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			$NewPathwayRowLength =  $NewPathwayLastRow + 1

			For ($index5 = 0; $index5 -lt $NewPathwayRowLength; $index5++) {
		
				$index3++
				$PathwayLastRow = $index3
				$LastPathwayIndex = $MaxPathways - 1
				If ($index3 -gt $LastPathwayIndex){

					$ShowText = ' '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M07.70F  ERROR - Too many pathways to check. '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					$ShowText = 'M07.70G  Please increase parameter MaxPathways. '
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
					Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

					
					$ShowText = 'Errors - see Error file in folder Logs  '
					If ($DisplayInfoInScript) { Write-Host $ShowText }

					Exit

				}

				#	$ShowText = 'M07.70M  PathwayLastRow ' +  $PathwayLastRow
				#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				

				#	$ShowText = 'M07.70N  NewPathwayLastStepArray index ' + $index5 + ' has value ' 
				#	$ShowText = $ShowText + $NewPathwayLastStepArray[$Index5]
				#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			
				$NewPathwayLastStep = $NewPathwayLastStepArray[$index5] + 1		

				For ($index6 = 0; $index6 -lt $NewPathwayLastStep; $index6++) {
					
					$index4 = $Index6
					$ExistingPathwayArray[$index3,$index4] = $NewPathwayArray[$Index5,$Index6]
					$ExistingPathwaylastStepArray[$index3] = $index4

					If ($index4 -eq 0) {
						$ShowText = 'M07.70P        ExistingPathwayArray start ' + $index3 + ' ' + $index4
						$ShowText = $ShowText + ' ' +$ExistingPathwayArray[$index3,$index4]
					} else {
						$ShowText = 'M07.70Q                      step ' + $index3 + ' ' + $index4
						$ShowText = $ShowText + ' ' +$ExistingPathwayArray[$index3,$index4]
					}
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				}	# Index 6 = steps in NewPathwayArray
		
			
			}	#  For index5 = NewPathway 

			
			$ShowText = 'M07.70X  NewPathwayArray added to ExistingPathwayArray '
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


			# Reset NewPathwayArray and NewPathwayLastRowArray

			$NewPathwayLastRow = -1		# Will ignore any data already there.
			$index5 = -1				#   This the incex of the new pathways array

			#
			# 	While there is still another include in $CommonIncludesArray[$index1,$index2],
			#		$index2 incremented
			#		Continue creating new rows in NewPathwayStapsArray as in step 2, 3, 4, 5, 6, 7
	
		}	#  For index2 = include for that topic file

	}	#	Entries in CommonIncludesArray

	#		
	# 	When includes exhausted in $CommonIncludesArray[$index1,$index2],
	#		$index1 is incremented and return to step 1.
	#

}	#	Index1 = common file

$ShowText = 'M07.70Y  Finished processing of pathways.'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

#	$ShowText = 'M07.70Z  $PathwayLastRow = ' + $PathwayLastRow
#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


#	Code07.90	Display ExistingPathwayArray


$ShowText = ' '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$ShowText = 'M07.90A  Display pathways'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 



if ($PathwayLastRow -gt -1) {

	# Search ExistingPathwayArray

	$NewPathwayRowLength =  $NewPathwayLastRow + 1

	$PathwayRowLength =  $PathwayLastRow + 1
	$UsedPathways = $PathwayLastRow + 1

	#   $ShowText = 'M07.90B  PathwayRowLength = ' + $PathwayRowLength
	#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	For ($index3 = 0; $index3 -lt $PathwayRowLength; $index3++) {

		#	$ShowText = 'M07.90C  PathwayLastStepArray index ' + $index3 + ' has value ' 
		#	$ShowText = $ShowText + $ExistingPathwaylastStepArray[$index3]
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$LastPathwayStep = $ExistingPathwaylastStepArray[$index3] + 1

		For ($index4 = 0; $index4 -lt $LastPathwayStep; $index4++) {
			
			If($index4 -eq 0){
				$ShowText = 'M07.90D  ExistingPathwayArray ' + $index3 + ' ' + $index4 + ' '	
			} else {
				$ShowText = 'M07.90E                  Step ' + $index3 + ' ' + $index4 + ' '
			}
			$ShowText = $ShowText + $ExistingPathwayArray[$index3,$index4]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


		}	# Index 4 = steps in ExistingPathwayArray
	
	}	#  For index3 = NewPathway 

}	#   ExistingPathwayArray has entries to process





#	Code08.00	Calculate Priorities for common includes

$ShowText = " "
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$ShowText = 'M08.00A  Priorities for common includes '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
#	If ($DisplayInfoInScript) { Write-Host $ShowText }



#	Code08.10	Priority 0 for commons that have no includes

$ShowText = 'M08.10A  Find commons with no includes'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


#	Code08.11	Find common files with no includes and update CommonPriorityArray to 0
#	Read NumCommonIncludesArray looking for a value = 0.

For ($index1 = 0; $index1 -lt $NumCommonIncludesArray.length; $index1++) {

	# We are only considering common files that have no includes
	# No common files have had priorities set yet.

	If ($NumCommonIncludesArray[$index1] -eq 0) {

		$ShowText = 'M08.11A  No includes for common at index ' + $index1 + ' ' 
		$ShowText = $ShowText + $CommonArray[$index1] 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$CommonPriorityArray[$index1] = 0 

		
		#	Code08.12	Update CommonIncludesArray where Include = common found above

		For ($index12 = 0; $index12 -lt $CommonArray.length; $index12++) {

			If ($NumCommonIncludesArray[$index12] -gt 0) {


				For ($index13 = 0; $index13 -lt $NumCommonIncludesArray[$index12]; $index13++) {
			

					If ($CommonIncludesArray[$index12,$index13]  -eq $CommonArray[$index1]) {

						#	Found where  $CommonArray[$index1] is included
						$ShowText = 'M08.12A      Same included in ' + $CommonArray[$index12] 
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
						$ShowText = 'M08.12B          verify include is ' + $index12 + ' ' + $index13 + ' '
						$ShowText = $ShowText + $CommonIncludesArray[$index12,$index13] 
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

						#	Code08.13	Update CommonIncludesPriorityArray to have 0 for common found above
					
						$CommonIncludesPriorityArray[$index12,$index13] = 0

						$ShowText = 'M08.13A          Include priority set to zero ' 
						Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

					}	#	Found include we know is priority zero
												
				}	#  For index13 = include for that common file

			}	#	If common file at index12 has includes	

		}	#	Next index12 in CommonArray

	}	#	Found NumCommonIncludesArray[$index1] -eq 0

}	# 	Next index1 for NumCommonIncludesArray


#	Code08.14	Check for any includes priorities still -1 and display priorities

$ShowText = 'M08.14A  Check for any common priorities still -1 '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$CommonPriorityMinusOneExists = $False

For ($index12 = 0; $index12 -lt $CommonArray.length; $index12++) {

	If ($CommonPriorityArray[$index12] -lt 0) {
		$CommonPriorityMinusOneExists = $True
	}	#	Found include priority of minus one

	$ShowText = 'M08.14B      Common ' + $index12 + ' ' + $CommonArray[$index12]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	$ShowText = 'M08.14C      Priority ' + $CommonPriorityArray[$index12]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	If ($NumCommonIncludesArray[$index12] -gt 0) {

		For ($index13 = 0; $index13 -lt $NumCommonIncludesArray[$index12]; $index13++) {

			$ShowText = 'M08.14D          Include ' + $index12 + ' ' + $index13 + ' '
			$ShowText = $ShowText + $CommonIncludesArray[$index12,$index13] 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			$ShowText = 'M08.14E          Priority ' + $CommonIncludesPriorityArray[$index12,$index13] 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			If ($CommonIncludesPriorityArray[$index12,$index13] -lt 0) {
				$CommonPriorityMinusOneExists = $True
			}	#	Found include priority of minus one
										
		}	#  For index13 = include for that common file

	} else {

		$ShowText = 'M08.14F          Common has no includes '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		
	}	#	If common file at index12 has includes	

}	#	Next index12 in CommonArray

If ($CommonPriorityMinusOneExists) {
	$ShowText = 'M08.14X  Still have priority -1 somewhere '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
} else {
	$ShowText = 'M08.14Y  All priorities now calculated '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
}

#	Check if there are still priority calculations needed.

If ($CommonPriorityMinusOneExists) {

	#	Code08.20   Priority 1 for commons that have all includes at priority = 0

	$ShowText = " "
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$ShowText = 'M08.20A  Priority 1 for commons that have all includes at priority = 0 '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


	#	Code08.21	Find commons with all includes at priority 0; update CommonPriority to 1	

	For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {

		# We are only considering common files that have includes and 
		# that do not already have a priority set

		If (($NumCommonIncludesArray[$index1] -gt 0)-and 
		    ($CommonPriorityArray[$index1] = -1)) {

			$AllIncludesPriority0 = $True

			For ($index2 = 0; $index2 -lt $NumCommonIncludesArray[$index1]; $index2++) {
				If ($CommonIncludesPriorityArray[$index1,$index2] -ne 0) {
					$AllIncludesPriority0 = $False
				}
			}	#	Next index2 which is next include for this common file
			
			If ($AllIncludesPriority0) {

				#	Since all includes for this file are priority 0 then this file is priority 1
				 
				$CommonPriorityArray[$index1] = 1		
				 
				#	The file we are talking about is CommonArray[$index1]
				 
				$ShowText = 'M08.21A  Priority 1 for common file ' + $index1 + ' ' 
				$ShowText = $ShowText + $CommonArray[$index1] 
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				#	Code08.22	Update CommonIncludesArray where Include = CommonArray[$index1]

				For ($index12 = 0; $index12 -lt $CommonArray.length; $index12++) {

					If ($NumCommonIncludesArray[$index12] -gt 0) {
							
						For ($index13 = 0; $index13 -lt $NumCommonIncludesArray[$index12]; $index13++) {
							
							If ($CommonIncludesArray[$index12,$index13]  -eq $CommonArray[$index1]) {
								
								#	Found where  $CommonArray[$index1] is included

								#	Code08.23	Update CommonIncludesPriorityArray to have 1 for common found above
								
								$CommonIncludesPriorityArray[$index12,$index13] = 1

								$ShowText = 'M08.23A  File ' + $CommonArray[$index12]
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								$ShowText = 'M08.23B      Has include ' + $index12 + ' ' + $index13 + ' '
								$ShowText = $ShowText + $CommonIncludesArray[$index12,$index13] 
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
								$ShowText = 'M08.23C      Include priority set to 1'
								Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
									
									
							}	#	Found include we know is priority zero
														
						}	#  For index13 to check includes for that common file
							
					}	#	If common file at index12 has includes	
					
				}	#	Next index12 in CommonArray

			}	#	All includes priority 0	

		} 	#	 $NumCommonIncludesArray[$index1] greater than zero
					
	}	# 	For index1 for common file

}	#	CommonPriorityMinusOneExists



#	Code08.24	Check for any includes priorities still -1

$ShowText = 'M08.24A  Check for any common priorities still -1 '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$CommonPriorityMinusOneExists = $False

For ($index12 = 0; $index12 -lt $CommonArray.length; $index12++) {

	If ($CommonPriorityArray[$index12] -lt 0) {
		$CommonPriorityMinusOneExists = $True
	}	#	Found include priority of minus one

	$ShowText = 'M08.24B      Common at index ' + $index12 + ' ' + $CommonArray[$index12]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	$ShowText = 'M08.24C      Priority ' + $CommonPriorityArray[$index12]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	If ($NumCommonIncludesArray[$index12] -gt 0) {

		For ($index13 = 0; $index13 -lt $NumCommonIncludesArray[$index12]; $index13++) {

			$ShowText = 'M08.24D          Include ' + $index12 + ' ' + $index13 + ' '
			$ShowText = $ShowText + $CommonIncludesArray[$index12,$index13] 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			$ShowText = 'M08.24E          Priority ' + $CommonIncludesPriorityArray[$index12,$index13] 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			If ($CommonIncludesPriorityArray[$index12,$index13] -lt 0) {
				$CommonPriorityMinusOneExists = $True
			}	#	Found include priority of minus one
										
		}	#  For index13 = include for that common file
	} else {

		$ShowText = 'M08.24F          Common has no includes '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		
	}	#	If common file at index12 has includes	

}	#	Next index12 in CommonArray

If ($CommonPriorityMinusOneExists) {
	$ShowText = 'M08.24X  Still have priority -1 somewhere '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
} else {
	$ShowText = 'M08.24Y  All priorities now calculated '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
}

#	Check if there are still priority calculations needed.

If ($CommonPriorityMinusOneExists) {


	#	Code08.30	Priority x for commons that have all all includes at 0 to x-1

	$ShowText = " "
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

	$ShowText = 'M08.30A  Priority x for commons that have all all includes at 0 to x-1 '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


	#	At this point the next priority to calculate is 2.  

	$TargetPriority = 2

	#	Start a loop to keep calculating priorities until all done, or a false safe stop point.

	$FailSafePriorityLimit = $MaxDepthCommonIncludesCommon + 2		#	This limit should never be reached.

	While ($CommonPriorityMinusOneExists) {

		If ($TargetPriority -gt $FailSafePriorityLimit) {

			#	Something has gone wrong - the loop should not be still processing.

			$ShowText = " "
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append


			$ShowText = 'M08.30Z  ERROR - Fail Safe: Code08.30 processing too many times.  Run terminated. '
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
			Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

			$ShowText = 'Errors - see Error file in folder Logs  '
			If ($DisplayInfoInScript) { Write-Host $ShowText }
			
			Exit

		}	
		


		#	Code08.31	Find commons with all includes in priority range 0 to (x-1) and update CommonPriority to x

		$ShowText = " "
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$ShowText = 'M08.31A  Calc next priority =  ' + $TargetPriority
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		For ($index1 = 0; $index1 -lt $CommonArray.length; $index1++) {

			# We are only considering common files that have includes and 
			# that do not already have a priority set

			If (($NumCommonIncludesArray[$index1] -gt 0)-and 
			    ($CommonPriorityArray[$index1] -eq -1)) {
			
				#	In range means between 0 and (target priority - 1).
				#   For example, when target priortiy = 2 then the range is 0 to 1.
				#	Something outside the range is either less than 0 (i.e. -1 and not set)
				#	or the target priority or higher.

				$AllIncludesPriorityInRange = $True

				For ($index2 = 0; $index2 -lt $NumCommonIncludesArray[$index1]; $index2++) {
					If (($CommonIncludesPriorityArray[$index1,$index2] -eq -1) -or
					    ($CommonIncludesPriorityArray[$index1,$index2] -ge $TargetPriority)) {
						$AllIncludesPriorityInRange = $False
					}
				}	#	Next index2 which is next include for this common file
			
				If ($AllIncludesPriorityInRange) {

					#	Since all includes are in ragne, this file has priority $TargetPriority.
				 
					$CommonPriorityArray[$index1] = $TargetPriority
				 
					#	The file we are talking about is CommonArray[$index1]
				 
					$ShowText = 'M08.31A  Priority ' +  $TargetPriority + ' for common file '
					$ShowText = $ShowText + $index1 + ' ' + $CommonArray[$index1] 
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

					#	Code08.32	Update CommonIncludesArray where Include = CommonArray[$index1]

					For ($index12 = 0; $index12 -lt $CommonArray.length; $index12++) {

						If ($NumCommonIncludesArray[$index12] -gt 0) {
							
							For ($index13 = 0; $index13 -lt $NumCommonIncludesArray[$index12]; $index13++) {
							
								If ($CommonIncludesArray[$index12,$index13]  -eq $CommonArray[$index1]) {
								
									#	Found where  $CommonArray[$index1] is included

									#	Code08.33	Update CommonIncludesPriorityArray to target for common found above
								
									$CommonIncludesPriorityArray[$index12,$index13] = $TargetPriority

									$ShowText = 'M08.33A  File ' + $CommonArray[$index12]
									Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
									$ShowText = 'M08.33B      Has include ' + $index12 + ' ' + $index13 + ' '
									$ShowText = $ShowText + $CommonIncludesArray[$index12,$index13] 
									Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
									$ShowText = 'M08.33C      Include priority set to ' +  $TargetPriority
									Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
									
									
								}	#	Found include we know is priority $TargetPriority

							}	#  For index13 to check includes for that common file

						}	#	If common file at index12 has includes	

					}	#	Next index12 in CommonArray

				}	#	All includes priority in range	

			} 	#	 $NumCommonIncludesArray[$index1] greater than zero
					
		}	# 	For index1 for common file

		#	Code08.34	Check for any includes priorities still -1

		$ShowText = 'M08.34A  Check for any common priorities still -1 '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$CommonPriorityMinusOneExists = $False

		For ($index12 = 0; $index12 -lt $CommonArray.length; $index12++) {

			If ($CommonPriorityArray[$index12] -lt 0) {
				$CommonPriorityMinusOneExists = $True
			}	#	Found include priority of minus one
		
			$ShowText = 'M08.34B      Common index ' + $index12 + ' ' + $CommonArray[$index12]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			$ShowText = 'M08.34C      Priority ' + $CommonPriorityArray[$index12]
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			If ($NumCommonIncludesArray[$index12] -gt 0) {

				For ($index13 = 0; $index13 -lt $NumCommonIncludesArray[$index12]; $index13++) {

					$ShowText = 'M08.34D          Include ' + $index12 + ' ' + $index13 + ' '
					$ShowText = $ShowText + $CommonIncludesArray[$index12,$index13] 
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
					$ShowText = 'M08.34E          Priority ' + $CommonIncludesPriorityArray[$index12,$index13] 
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	

					If ($CommonIncludesPriorityArray[$index12,$index13] -lt 0) {
						$CommonPriorityMinusOneExists = $True
					}	#	Found include priority of minus one
										
				}	#  For index13 = include for that common file

			} else {

				#	$ShowText = 'M08.34F          Common has no includes '
				#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				
			}	#	If common file at index12 has includes	

		}	#	Next index12 in CommonArray

		If ($CommonPriorityMinusOneExists) {

			# 	The While loop will run again for next priority

			$TargetPriority++

			$ShowText = 'M08.34X  Still have priority -1 somewhere '
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		} else {

			#	Since CommonPriorityMinusOneExists is false the while look will end

			$ShowText = 'M08.34Y  All priorities now calculated '
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		}


	}	#	While CommonPriorityMinusOneExists

}	# If CommonPriorityMinusOneExists



#	Code08.40	Check all common priorities are >= 0 and fill in TopicIncludesPiorities
#   Also calculate Highest Common Priority (HDP)

$HighestCommonPriority = 0

$ShowText = 'M08.40A  Check all priorities are gte 0 one last time '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$CommonPriorityMinusOneExists = $False


For ($index12 = 0; $index12 -lt $CommonArray.length; $index12++) {

    If ($CommonPriorityArray[$index12] -gt $HighestCommonPriority) {
        $HighestCommonPriority = $CommonPriorityArray[$index12]
    }

	If ($CommonPriorityArray[$index12] -lt 0) {
		$CommonPriorityMinusOneExists = $True
		$ShowText = 'M08.40B      Common at index ' + $index12 + ' ' + $CommonArray[$index12]
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		$ShowText = 'M08.40C      Priority ' + $CommonPriorityArray[$index12]
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	}	#	Found include priority of minus one

	
	If ($NumCommonIncludesArray[$index12] -gt 0) {

		For ($index13 = 0; $index13 -lt $NumCommonIncludesArray[$index12]; $index13++) {
			
			If ($CommonIncludesPriorityArray[$index12,$index13] -lt 0) {
				$CommonPriorityMinusOneExists = $True
				$ShowText = 'M08.40D          Include ' + $index12 + ' ' + $index13 + ' '
				$ShowText = $ShowText + $CommonIncludesArray[$index12,$index13] 
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
				$ShowText = 'M08.40E          Priority ' + $CommonIncludesPriorityArray[$index12,$index13] 
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			}	#	Found include priority of minus one
										
		}	#  For index13 = include for that common file
	}	#	If common file at index12 has includes	

	#	Ensure priority of this common include is recorded where relevant in TopicIncludesPriorityArray
	#   We have common file at $CommonArray[$index12] and priority $CommonPriorityArray[$index12]
	#	Check if any this common file occurs in any TopicInclduesArray entry.
	#	If so, set value of TopicIncludesPreiorityArray.

	$ShowText = 'M08.40F      Common at index ' + $index12 + ' ' + $CommonArray[$index12]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	$ShowText = 'M08.40G      Priority ' + $CommonPriorityArray[$index12]
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


	For ($index1 = 0; $index1 -lt $TopicArray.length; $index1++) {
						
		If ($NumTopicIncludesArray[$index1] -gt 0) {
				
			For ($index2 = 0; $index2 -lt $NumTopicIncludesArray[$index1]; $index2++) {
		
				If ($TopicIncludesArray[$index1,$index2] -eq $CommonArray[$index12]) {

					$TopicIncludesPriorityArray[$index1,$index2] = $CommonPriorityArray[$index12]

					$ShowText = 'M08.40M  	Topic has same include at index ' + $index1 + ' ' + $index2 + ' '
					$ShowText = $ShowText + $TopicIncludesArray[$index1,$index2]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

					$ShowText = 'M08.40N  	Priority of that include is  ' 
					$ShowText = $ShowText + $TopicIncludesPriorityArray[$index1,$index2]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

				}	#	$TopicIncludesArray[$index1,$index2] equals CommonArray[Index12]

			}	#	 For index2 = include for that topic file

		} 	#	 $NumTopicIncludesArray[$index1] greater than zero

	}	#	Next Index1 in TopicArray
		
}	#	Next index12 in CommonArray

If ($CommonPriorityMinusOneExists) {
	$ShowText = 'M08.40X  ERROR - Still have priority -1 somewhere '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append 

	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }

	Exit
} 

$ShowText = 'M08.40Y  Highest common priority ' + $HighestCommonPriority
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 




#	Code09.00 	Calculate Priorities for topic includes

$ShowText = ' '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

$ShowText = 'M09.00A  Priorities for topic includes '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


# 	Topic without includes are priority 0 and the rest are HCP + 1
$TopicsWithIncludesPriority = $HighestCommonPriority + 1

$ShowText = 'M09.00B  Topics with includes get priority ' + $TopicsWithIncludesPriority
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


For ($index1 = 0; $index1 -lt $TopicArray.length; $index1++) {
		
	If ($NumTopicIncludesArray[$index1] -eq 0) {
        $TopicPriorityArray[$index1] = 0
    } else {
        $TopicPriorityArray[$index1] = $TopicsWithIncludesPriority

		# 	Only display the topics with includes

		$ShowText = 'M09.00C      Topic at index ' + $index1 + ' ' + $TopicArray[$index1]
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		$ShowText = 'M09.00D          Priority ' + $TopicPriorityArray[$index1]
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

    }

	
}	#  For index1 = topic file in TopicArray


#	Code10.00	Create ToDoIncludes List

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M10.00A  Create ToDoIncludes List '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$NeedToDOIncludesProcessed = $True

#	Code10.10	Create ToDoIncludes arrays

#	Are there any common includes to process?  Are there any topic includes to process?	

If ($NumberCommonFilesWithIncludes -eq 0) {
	$NeedCommonIncludes = $False
} else {
	$NeedCommonIncludes = $True
}

If ($NumberTopicFilesWithIncludes -eq 0) {
	$NeedTopicIncludes = $False
} else {
	$NeedTopicIncludes = $True
}

#	Use the number of includes to size the ToDo arrays	

$SizeToDoRequestingFiles = $NumberCommonFilesWithIncludes + $NumberTopicFilesWithIncludes
If ($SizeToDoRequestingFiles -eq 0) {
	$ShowText = 'M10.10A  No common includes and no topic includes.  ' 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	$ShowText = 'M10.10B  Script only copies topics and images to the website folder. ' 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	$NeedToDOIncludesProcessed = $False
}

If ($NeedToDOIncludesProcessed) {

	$ToDoRequestingFilesArray = New-Object 'string[]' $SizeToDoRequestingFiles
	$ToDoPriorityArray = New-Object 'int[]' $SizeToDoRequestingFiles
	$ToDoIncludesArray = New-Object 'string[,]' $SizeToDoRequestingFiles,$MaxIncludesPerFile
	$NumToDoIncludesArray = New-Object 'int[]' $SizeToDoRequestingFiles
	$ToDoIncludesPriorityArray = New-Object 'int[,]' $SizeToDoRequestingFiles,$MaxIncludesPerFile


	#	Code10.20	Populate ToDoIncludes arrays

	#	Flags for ToDo arrays

	$TargetPriority = 1
	
	$indexToDo = 0

	If ($NeedCommonIncludes) {

		While ($TargetPriority -lt $TopicsWithIncludesPriority) {

			$ShowText = 'M10.20A  Target priority =  ' + $TargetPriority 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			For ($index20 = 0; $index20 -lt $CommonArray.length; $index20++) {

				If ($CommonPriorityArray[$index20] -eq $TargetPriority) {

					#	The common file has includes because the priority is > zero
					#	Since the priority is the target priority, copy to the ToDo arrays.
					$ToDoRequestingFilesArray[$indexToDo] = $CommonArray[$index20]
					$ToDoPriorityArray[$indexToDo] = $CommonPriorityArray[$index20]
					$NumToDoIncludesArray[$indexToDo] = $NumCommonIncludesArray[$index20]

					For ($index21 = 0; $index21 -lt $NumCommonIncludesArray[$index20]; $index21++) {

						# 	The files to include com from the CommonIncludesArray

						$ToDoIncludesArray[$indexToDo,$index21] = $CommonIncludesArray[$index20,$index21]
						$ToDoIncludesPriorityArray[$indexToDo,$index21] = $CommonIncludesPriorityArray[$index20,$index21]

					}	# 	Index21 for includes

					$ShowText = 'M10.20B      Requesting common file =  ' + $CommonArray[$index20]
					Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

					#	Increment the index for the ToDo arrays for the next entry to be added.
					$indexToDo++

				}	#	If the common file has the right priority
			}	#	Index 20 for common file

			#	We have finished all the common files at that priority, so be ready for the next

			$TargetPriority++

		}	# While loop for TargetPriority

	}	#	If need common includes

	#	TargetPriority is already at the value of $TopicsWithIncludesPriority
	#	IndexToDo is already at the right value for the next entry.

	If ($NeedTopicIncludes) {

		$ShowText = 'M10.20M  Target priority is target includes priority =  ' + $TargetPriority 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		For ($index20 = 0; $index20 -lt $TopicArray.length; $index20++) {

			If ($TopicPriorityArray[$index20] -eq $TargetPriority) {

				#	The topic file has includes because the priority is > zero
				#	Since the priority is the target priority, copy to the ToDo arrays.
				$ToDoRequestingFilesArray[$indexToDo] = $TopicArray[$index20]
				$ToDoPriorityArray[$indexToDo] = $TopicPriorityArray[$index20]
				$NumToDoIncludesArray[$indexToDo] = $NumTopicIncludesArray[$index20]

				For ($index21 = 0; $index21 -lt $NumTopicIncludesArray[$index20]; $index21++) {

					# 	The files to include com from the TopicIncludesArray

					$ToDoIncludesArray[$indexToDo,$index21] = $TopicIncludesArray[$index20,$index21]
					$ToDoIncludesPriorityArray[$indexToDo,$index21] = $TopicIncludesPriorityArray[$index20,$index21]

				}	# 	Index21 for includes

				$ShowText = 'M10.20N      Requesting topic file =  ' + $TopicArray[$index20]
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

				#	Increment the index for the ToDo arrays for the next entry to be added.
				$indexToDo++

			}	#	If the topic file has the right priority
		}	#	Index 20 for topic file

		#	We have finished all the topic files

	}	#	If need topic includes
}

$ShowText = 'M10.20X  Created ToDo includes arrays  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


#	Code10.30	Display ToDoIncludes in trace
#   

$ShowText = 'M10.30A  Display ToDo includes in trace'
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 


For ($index20 = 0; $index20 -lt $ToDoRequestingFilesArray.length; $index20++) {

	$ShowText = 'M10.30B  Priority  ' + $ToDoPriorityArray[$index20] 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	$ShowText = 'M10.30B      Requesting File ' + $ToDoRequestingFilesArray[$index20] 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

    For ($index21 = 0; $index21 -lt $NumToDoIncludesArray[$index20]; $index21++) {
			
			$ShowText = 'M10.30C          Include ' + $index20 + ' ' + $index21 + ' '
			$ShowText = $ShowText + $ToDoIncludesArray[$index20,$index21] 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
											
	}	#  For index21 = include for that ToDo
	
}	#	Next index20 in ToDo arrays


#	Code11.00	Perform ToDoIncludes List

If ($NeedToDOIncludesProcessed) {

	$ShowText = '  '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

	$ShowText = 'M11.00A  Perform ToDoIncludes List '
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append



	#	Code11.10	Ensure new TempInclude folder

	If (Test-Path -Path $TempIncludeFolder) {
		$ShowText = 'M11.10A 	Found TempInclude Folder - ' + $TempIncludeFolder 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		
		#  Delete InfoFolder and all sub-folders.
		Remove-Item $TempIncludeFolder -Recurse		
		$ShowText = 'M11.10B 	Deleted TempInclude Folder - ' + $TempIncludeFolder 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		
	} 
	
	#  Create new TempInclude Folder.  The "Out-Null" suppresses the Powershell output (too much).
			
	New-Item $TempIncludeFolder -itemType Directory | Out-Null
	$ShowText = 'M11.10C  Created new TempInclude Folder - ' + $TempIncludeFolder 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		


	#	Code11.20   Loop for ToDoIncludes

	For ($index20 = 0; $index20 -lt $ToDoRequestingFilesArray.length; $index20++) {


		#	Code11.30	Copy input files into TempInclude
		#	Copy in the reqesting file and all includes needed.
		
		$RequestingFileFullPath = $ToDoRequestingFilesArray[$index20] 
		

		$ShowText = ' '
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		$ShowText = 'M11.20A  Priority of this requesting file: ' + $ToDoPriorityArray[$index20] 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		$ShowText = 'M11.20B  Copy input files to TempInclude  ' 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		$ShowText = 'M11.20C      Requesting File ' + $ToDoRequestingFilesArray[$index20] 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		# 	Check if requesting file is a topic or common file

		If($RequestingFileFullpath.contains("All Markdown Topics")) {
			$RequestingTopic = $True
			$ShowText = 'M11.20D      Requesting file is a topic' 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		} else {
			$RequestingTopic = $False
			$ShowText = 'M11.20E      Requesting file is a common file' 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		}

		Copy-Item -Path $RequestingFileFullPath -Destination $TempIncludeFolder  -Force

		$ShowText = 'M11.20F      Requesting file copied to TempInclude Folder ' 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		#	The requesting file always comes from the source folder, the source is
		#	All Markdown Topics or Common Modules. That source is copied to the TempInclude folder.
		#	The include files come from Common Modules, or from Temp\Expanded-Common.
		#	We use Temp\Expanded-Common when the include file has priority above zero.


		For ($index21 = 0; $index21 -lt $NumToDoIncludesArray[$index20]; $index21++) {

			$ShowText = 'M11.20G          Include ' + $index20 + ' ' + $index21 + ' '
			$ShowText = $ShowText + $ToDoIncludesArray[$index20,$index21] 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			
			#	If this include has priority zero then ToDoIncludesArray has the correct source
			#	which is Common Modules.
			#	However, if this include has priority above zero, we must change the source to the
			#	same path where Common Modules is replaced by Temp\Expanded-Common.

			If ($ToDoIncludesPriorityArray[$index20,$index21] -eq 0) {
				$IncludeHasPriorityZero = $True
			} else {
				$IncludeHasPriorityZero = $False
			}


			If ($IncludeHasPriorityZero) {
				$IncludeFileFullPath = $ToDoIncludesArray[$index20,$index21]

				$ShowText = 'M11.20H          Include comes from Common Modules '
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

			} else {
				$CommonSource = $ToDoIncludesArray[$index20,$index21]

				# Change Common Modules foldedr to the Expanded Common folder.
				# This ensures that the source is the Expanded module, not the source module.

				$CommonExpandedSource = $CommonSource.replace($ComModLiteral,$ExpComLiteral)
				$IncludeFileFullPath = $CommonExpandedSource

				$ShowText = 'M11.20J          Include comes from Temp\Expanded-Common '
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			}

		
			Copy-Item -Path $IncludeFileFullPath -Destination $TempIncludeFolder  -Force

			$ShowText = 'M11.20K          Copied to Temp Folder ' 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		}	#  For index21 = include for that ToDo

		#	Requesting file and includes are now all in the TempInclude folder.



		#	Code11.40	Ensure folders in Expanded Folders ready to receive output of indludes

        #   Setup base folders
        If ($RequestingTopic) {
			$RequestingBaseFolder = $TopicsFolder
            $ExpandedBaseFolder = $ExpandedTopicsFolder
        } else {
			$RequestingBaseFolder = $CommonFolder
            $ExpandedBaseFolder = $ExpandedCommonFolder
        }

		#   Call Find-Filename to find just the filename of the requesting file

		$RequestingFileName = Find-Filename $RequestingFileFullpath
		$ShowText = 'M11.40A  Process includes for this requesting file = ' +  $RequestingFileName
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

		$ShowText = 'M11.40B      Filename for requesting file = ' +  $RequestingFileName
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


        #   Call Find-Path to find path associated with the requesting file

		#	$ShowText = 'M11.40C      RequestingBaseFolder ' + $RequestingBaseFolder
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 

		#	$ShowText = 'M11.40D      RequestingFileFullpath ' + $RequestingFileFullpath
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
		
			
		$RequestingPath = Find-Path $RequestingBaseFolder $RequestingFileFullpath

		$ShowText = 'M11.40E      Path for requesting file = ' +  $RequestingPath
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
        
		
        
		#	Call Confirm-Folders to make sure ExpandedBase has the path

		#	$ShowText = 'M11.40F      Confirm-Folders has Base '  +  $ExpandedBaseFolder
		#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		
        $Result = Confirm-Folders  $ExpandedBaseFolder $RequestingPath

        $ShowText = 'M11.40G      Result of Confirm-Folders for expanded is ' + $Result
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

		If ($RequestingTopic) {
			
			#	Expanded topics are copied to the website.
			#	The website folder must also have the path.

			$Result = Confirm-Folders  $WebsiteFolder $RequestingPath

			$ShowText = 'M11.40H      Result of Confirm-Folders for website is ' + $Result
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

		}


		#	Code11.50	Create Expanded file and open requesting file
		#	Start loop until end of requesting file
		#	Copy lines from requesting file into expanded file until include found

		$FirstLineExpanded = $True
		
		$RequestFileInTempInclude = $TempIncludeFolder + '\' + $RequestingFileName

		foreach($line in Get-Content $RequestFileInTempInclude) {

			$RequestingLine = $line

			#	Code11.60	Find include coding

			$CurrentLine = $line.Trim()
			If ($CurrentLine.length -lt 2) { $CurrentLine = $CurrentLine + "XX"}
			
			$TestFirst2Chars = $CurrentLine.substring(0,2)
			
			If($TestFirst2Chars -eq $IncludeDelimeterStart) {
		
				#	Found an include.  All we need is the filename which is unique.
				#	The incluce will already be in the TempInclude folder.
				#	Once we know the include file in the TempInclude Folder we can open it and copy lines.

				$IncludeCoding = $RequestingLine.Trim()
				$IncludeCoding = $IncludeCoding.replace($IncludeDelimeterStart,"")
				$IncludeCoding = $IncludeCoding.replace($IncludeLiteral,"")
				$IncludeCoding = $IncludeCoding.replace($IncludeDelimeterEnd,"")
				$IncludeCoding = $IncludeCoding.Trim()

				#	Put in ".md" if not there

				$PositionLast3 = $IncludeCoding.length - 3
				$Last3chars = $IncludeCoding.Substring($PositionLast3)

				If (-not ($Last3chars -eq ".md")) {
					$IncludeCoding = $IncludeCoding + ".md"
				}			

				#   Call Find-Filename to find just the filename of the include

				$IncludeFileName = Find-Filename $IncludeCoding

				$ShowText = 'M11.60A      Include Filename = ' +  $IncludeFileName
				Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

				$IncludeFileNameInTemp = $TempIncludeFolder + '\' + $IncludeFileName

				#	$ShowText = 'M11.60B      Include Full Path = ' + $IncludeFileNameInTemp
				#	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


				foreach($IncludeLine in Get-Content $IncludeFileNameInTemp) {

					If ($FirstLineExpanded) {

						$ThisExpandedFileFullPath = $ExpandedBaseFolder + '\' + $RequestingPath
						$ThisExpandedFileFullPath = $ThisExpandedFileFullPath + '\' + $RequestingFileName
	
						$ThisLine = $IncludeLine
						Out-File -filepath $ThisExpandedFileFullPath  -inputObject $ThisLine -force
	
						$FirstLineExpanded = $False
	
					} else{
						$ThisLine = $IncludeLine
						Out-File -filepath $ThisExpandedFileFullPath  -inputObject $ThisLine -append	
					}
				}	

			} else {
				#	Add  lines from requesting file

				If ($FirstLineExpanded) {

					$ThisExpandedFileFullPath = $ExpandedBaseFolder + '\' + $RequestingPath
					$ThisExpandedFileFullPath = $ThisExpandedFileFullPath + '\' + $RequestingFileName
	
					$ThisLine = $RequestingLine
					Out-File -filepath $ThisExpandedFileFullPath  -inputObject $ThisLine -force
	
					$FirstLineExpanded = $False
	
				} else {
					$ThisLine = $RequestingLine
					Out-File -filepath $ThisExpandedFileFullPath  -inputObject $ThisLine -append
				}

			}	#	Include or not in requesting file


		}	#	Line in requesting file	


		#	Code11.70	Copy expanded topic to website path
		#	Finished expanding the requesting file
		#	If this is a topic, copy the expanded version to the website folder path.

		If ($RequestingTopic) {

			$TopicWebsiteFullPath = $WebsiteFolder + '\' + $RequestingPath + '\'
			$TopicWebsiteFullPath = $TopicWebsiteFullPath + $RequestingFileName

			Copy-Item -Path $ThisExpandedFileFullPath -Destination $TopicWebsiteFullPath  -Force

			$ShowText = 'M11.70A    Topic copied to website and path ' 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
			$ShowText = 'M11.70B         ThisExpandedFileFullPath ' + $ThisExpandedFileFullPath
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 						
			$ShowText = 'M11.70C         TopicWebsiteFullPath '  + $TopicWebsiteFullPath
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append }	
		

		#	Finished include processing for the requesting file in the TempInclude Folder.
		#	The relevant Expanded folder has the results of that.
		#	In preparation for next requesting file, empty the TempInclude Folder.

		#  Delete TempIncludeFolder and all sub-folders.
		Remove-Item $TempIncludeFolder -Recurse
		$ShowText = 'M11.70G  Deleted TempInclude Folder - ' + $TempIncludeFolder 
		Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
	 
		# 	Recreate the TempInclude folder only if there is at least one more ToDo item coming

		If (($index20 + 1) -lt $ToDoRequestingFilesArray.length) {

			#  Create new TempIncludeFolder.  The "Out-Null" suppresses the Powershell output (too much).
		
			New-Item $TempIncludeFolder -itemType Directory | Out-Null
			$ShowText = 'M11.70H  Created new TempInclude Folder - ' + $TempIncludeFolder 
			Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
		}

	}	#	Next index20 in ToDo arrays

}	#  If $NeedToDOIncludesProcessed



#	Code12.00	Copy images folder from topics folder to website folder

$ShowText = '  '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M12.00A  Copy images folder from topics folder to website folder '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

#	Code12.10	Check if All Markdown Topics folder has an images folder
#	If not, error and end

$TopicImagesFolder = $TopicsFolder + '\' + "images"

If (Test-Path -Path $TopicImagesFolder) {
	$ShowText = 'M12.10A      Found topic images folder     ' + $TopicImagesFolder 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
} else {
	$ShowText = 'M12.10B  ERROR - Missing topic images folder ' + $TopicImagesFolder 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
	Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
	Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

	$ShowText = 'Errors - see Error file in folder Logs  '
	If ($DisplayInfoInScript) { Write-Host $ShowText }

	Exit
} 


#	Code12.20	Delete any existing website images folder

$WebsiteImagesFolder = $WebsiteFolder + '\' + "images"

If (Test-Path -Path $WebsiteImagesFolder) {
	$ShowText = 'M12.20A      Found website images folder   ' + $WebsiteImagesFolder 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
	
	#  Delete all contents of images folder.
	Remove-Item $WebsiteImagesFolder -Recurse		

	$ShowText = 'M12.20B      Deleted website images folder ' + $WebsiteImagesFolder 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
} else {
	$ShowText = 'M12.20C      Missing website images folder ' + $WebsiteImagesFolder 
	Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
} 

$ShowText = 'M12.20CC      End deleted all images from   ' + $WebsiteImagesFolder 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append


#	Code12.30	Copy from folder All Markdown Topics to website images folder - all files and folders

Copy-Item -Path $TopicImagesFolder -Destination $WebsiteFolder -Recurse

$ShowText = 'M12.30A  Copied all topics images to       ' + $WebsiteImagesFolder
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append






#	Code13.00	Final report lines.

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = '===================================================================='
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00A  SUMMARY OF INCLUDES          '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00B  Total common files         ' + $CommonArray.length
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00C  Total topic files          ' + $TopicArray.length
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$TotalFilesWithIncludes = $NumberTopicFilesWithIncludes + $NumberCommonFilesWithIncludes
$TotalIncludes = $TotalTopicIncludes + $TotalCommonIncludes

$ShowText = 'M13.00D  Common files with includes    ' + $NumberCommonFilesWithIncludes
$ShowText = $ShowText + '       Total includes in those common files    ' + $TotalCommonIncludes
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00E  Topic files with includes     ' + $NumberTopicFilesWithIncludes
$ShowText = $ShowText + '       Total includes in those topic files     ' + $TotalTopicIncludes
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00F  Total files with includes     ' + $TotalFilesWithIncludes
$ShowText = $ShowText + '       Total includes in all files             ' + $TotalIncludes
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

#	Code13.10	Depth of includes - possible reporting

# The total depth of includes can be worked out for each situatiom.
#	For no common or topic includes, then the depth is zero.
#	For no common includes, but there are topic includes, the depth has to be 1,
#		because a topic can only include a common, and no futher depth allowed.
#	For some common includes and no topic includes then the depth is the highest common priroity.
#		This is because the common priorities reflect the depth of the includes.
#	In case of both common and topic includes, the depth is the highest common priority + 1.
#		The plus 1 is adding for the extra depth of topic including a common file.
#		This assumes that a topic will include a common file with the deepest icludes.
#		So this value could be regarded as "potential" rather than actual.
#

If ($TotalIncludes -eq 0) {
	# No includes for common or topic files
	$TotalDepthOfIncludes = 0	
} else { 
	If ($TotalCommonIncludes -eq 0) {
		# Are includes, none for common, all for topic files
		$TotalDepthOfIncludes = 1
	} else {
		$UsedDepthCommonIncludesCommon = $HighestCommonPriority
		If ($TotalTopicIncludes -eq 0) {
			# Are includes, some for common, none for topic files
			$TotalDepthOfIncludes = $HighestCommonPriority
		} else {
			# Are includes, some for both topic and common files
			$TotalDepthOfIncludes = $HighestCommonPriority + 1
			}	#	If there are common and topic includes
	}  #	If there are common includes

}	#	If there are includes

# $ShowText = 'M13.10A  Depth from Topics to deepest common includes common      ' + $TotalDepthOfIncludes 
# Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = '===================================================================='
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append



#	Code13.20	Comparison of parameters to usage

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'Comparison of parameters to usage '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.20A  Includes Per Common        - Param Max = ' + $MaxIncludesPerFile
$ShowText = $ShowText + '           Largest = ' + $LargestIncludesPerCommon
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.20B  Includes Per Topic         - Param Max = ' + $MaxIncludesPerFile
$ShowText = $ShowText + '           Largest = ' + $LargestIncludesPerTopic
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.20C  DepthCommonIncludesCommons - Param Max = ' + $MaxDepthCommonIncludesCommon
$ShowText = $ShowText + '            Used Depth = ' + $UsedDepthCommonIncludesCommon
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.20D  Pathways = Total instances of a common including a common to any depth'
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.20D  Pathways                   - Param Max =  ' + $MaxPathways
$ShowText = $ShowText + '         Used = ' + $UsedPathways
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = '===================================================================='
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = ' '
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append 
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append
Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00X  Report summary lines written' 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00Y  Successful end' 
Out-File -filepath $TraceFileFullPath -inputobject $ShowText -append
Out-File -filepath $ReportFileFullPath -inputobject $ShowText -append

$ShowText = 'M13.00Z  No errors ' 
Out-File -filepath $ErrorFileFullPath -inputobject $ShowText -append

$ShowText = 'Successful end' 
If ($DisplayInfoInScript) { Write-Host $ShowText }

#	End of script