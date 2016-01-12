*** Settings ***
Documentation	Resource for 'allIndividualConversion' test suites

Variables	testvars.py
Variables	filenames.py
Library		OperatingSystem
Library		String
Library		XML
Library 	Collections
Library		Process

*** User Keywords ***
			
# Convert File to Float (And annciallary keywords)
# ----------------------
#
# Coverts number in a file to a floating number variable to be used in the context of the test. 
#



Convert File to Float
	[arguments]		${floatFilePath}
	${status}	Run Keyword and Ignore Error	File Should Not Be Empty	${floatFilePath}
	${floatString}=		Run Keyword If	${status} == ('PASS', None)		Get File 	${floatFilePath}	ELSE	Convert To String 	0
	${float}= 	Convert To Number	${floatString}
	[return] 	${float}


# Element Text in Convert Found in a Sample Element
# -------------------------------------------------
#
# This test goes through a selection of xpaths, and tests to see if all tags matching the given xpath in the converted corpus has a series of text child elements which combine to 
# a string (hereby referred to as ‘tag text’) that is reasonably close to a similarly constructed tag text in the sample corpus, and vise-versa. 
# Reasonably close in this case means that there exists a corresponding tag text for a given tag text that has a levenshetin distance of less than 30.
#


Element Text in Convert Found in a Sample Element
	[arguments]		${docx}		${xml}	${xpath}	${cParentPath}	${sParentPath}
	[Timeout]	60 sec
	
	File Should Exist	${sParentPath}/${xml}
	File Should Exist	${cParentPath}/${docx}
	
	Run Process		python matchxpathtext.py ${sParentPath}/${xml} ${cParentPath}/${docx} ${docx} ${xpath} failDetails/convertsInSample		shell=True
	${maxLevDistanceFound}=		Convert File To Float	pathTestResults
	${proportionFailure}=		Convert File To Float	pathTestResultsT
	${percentageFailure}=	Evaluate	${proportionFailure}*100
	${rPercentageFailure}=	Convert To Number	${percentageFailure}	2
	Run Keyword And Continue on Failure	Should Be True	${proportionFailure} < ${acceptableFailureProportion}	In document ${docx}, tags at ${xpath} are mismatched with sample document ${xml} at a rate of ${rPercentageFailure}%. This is greater than our threshold of ${acceptableFailurePercentage} 
	Run Keyword And Continue on Failure	Should Be True 		${maxLevDistanceFound} < ${levThreshold}	In document ${docx}, there's a tag at ${xpath} that is significantly different than any tag with the same path in ${docx}

	Run Process              python matchxpathtext.py ${cParentPath}/${docx} ${sParentPath}/${xml} ${docx} ${xpath} failDetails/samplesInConvert             shell=True
	${maxLevDistanceFound} =        Convert File To Float   pathTestResults
	${proportionFailure}=           Convert File To Float   pathTestResultsT
	${percentageFailure}=           Evaluate        ${proportionFailure}*100
	Run Keyword And Continue on Failure		Should Be True	${proportionFailure} < ${acceptableFailureProportion}	In xml ${xml}, tags with xpath ${xpath} will not be found in document ${docx} at a rate of ${percentageFailure}%.
	Should Be True		${maxLevDistanceFound} < ${levThreshold}	In sample xml ${xml}, there's a tag at ${xpath} that is signficantly different than any tag with the same path in ${docx}


# XREF Test
# ---------
#
# This keyword runs a process in matchxpathtext.py that tests for two conditions. One is that the total number of xrefs present in the meTypeset converted
# file is the same number a the total number of xrefs in the corresponding sample file. The result of this comparsion (i.e, the absolute difference in
# these two totals) is reflected in file pathTestResults. The second condition is that an adequate percentage of xrefs in converted file's body match
# a corresponding ref in the file's back. 
#
XREF Test
	[arguments]		${docx}		${xml}	${cParentPath}	${sParentPath}
	File Should Exist	${sParentPath}/${xml}
	File Should Exist	${cParentPath}/${docx}

	Run Process		python matchxpathtext.py ${sParentPath}/${xml} ${cParentPath}/${docx} ${docx} xref failDetails/xref			shell=True

	${diff}=		Convert File To Float	pathTestResults
	Run Keyword And Continue on Failure	Should Be True		-10 < ${diff} < 10		In file ${docx}, there is a difference of ${diff} between the total number of xrefs in the converted document and the total number of REFS in the converted document. 
	${proportionFailure}=	Convert File To Float	pathTestResultsT
	${percentageFailure}=	Evaluate	${proportionFailure}*100
	Run Keyword And Continue on Failure		Should Be True		-${acceptableFailureProportion} < ${proportionFailure} < ${acceptableFailureProportion}		In file ${docx}, xpath references do not match properly ${percentageFailure}% of the time.

# Update Incompleted Files
# ------------------------
# In the event that meTypeset has failed to finish the conversion process for a given file, this keyword updates two files that keeps track of how many files cpt
# thus far have failed to complete the meTypeset process and what specific files have failed to do so. 
#


Update Incompleted Files
	[arguments]		${fileName}
	${inFileTotal}=		Convert File to Float	incompleteFileTotal
	${inFileTotal}=		Evaluate 	${inFileTotal}+1
	${inFileTotalS}=	Convert to String	${inFileTotal}
	Create File		incompleteFileTotal		${inFileTotalS}
	Append to File		incompleteFiles		\n${fileName}\n
	Fail		${fileName} has not finished the meTypeset process


# Check for Matching Text Elems
# -----------------------------
#
# Parent test that runs Element Text in Convert Found in a Sample Element on the same document for different xpaths. 
#

Check for Matching Text Elems
	[arguments]	${docx}		${xml}
	File Should Exist	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/${docx}
	File Should Exist	${bodySampleParent}/${xml}
	${conFile}=		Get File	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/${docx}
	${status}	Run Keyword and Ignore Error	Should Not Be Equal		${conFile}		\{"status":"error","error":"The job is not completed yet","flashMessages":\[\]\}
	Run Keyword If	${status} != ('PASS', None)		Update Incompleted Files	${docx}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${docx}		${xml}	back//fn	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/	${bodySampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${docx}		${xml}	body//fig//caption	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/	${bodySampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${docx}		${xml}	body//p		/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/	${bodySampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${docx}		${xml}	body//table-wrap//caption	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/	${bodySampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${docx}		${xml}	body//list/list-item/p	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/	${bodySampleParent}
	Run Keyword and Continue on Failure		XREF Test	${docx}		${xml}	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/	${bodySampleParent}
	Element Text in Convert Found in a Sample Element	${docx}		${xml}	body//sec/title	/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/	${bodySampleParent}

# Check for Matching Text Elems FRONT
# -----------------------------------
#
# Parent test that runs Element Text in Convert Found in a Sample Element on the same document for different xpaths. This specifically is meant
# to test front matter processing. 
#

Check for Matching Text Elems FRONT
	[arguments]		${pdf}	${xml}
	File Should Exist	${frontConvertParent}/${pdf}
	File Should Exist	${frontSampleParent}/${xml}
	${conFile}= 	Get File	${frontConvertParent}/${pdf}
	${status}	Run Keyword and Ignore Error	Should Not Be Equal		${pdf}	\{"status":"error","error":"The job is not completed yet","flashMessages":\[\]\}
	Run Keyword If	${status} != ('PASS', None)		Update Incompleted Files		${pdf}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${pdf}	${xml}	front//article-title	${frontConvertParent}	${frontSampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${pdf}	${xml}	front//journal-title	${frontConvertParent}	${frontSampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${pdf}	${xml}	front//email	${frontConvertParent}	${frontSampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${pdf}	${xml}	front//aff	${frontConvertParent}	${frontSampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${pdf}	${xml}	front//abstract//p	${frontConvertParent}	${frontSampleParent}
	Run Keyword and Continue on Failure		Element Text in Convert Found in a Sample Element	${pdf}	${xml}	front//name		${frontConvertParent}	${frontSampleParent}
