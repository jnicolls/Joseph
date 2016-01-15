Overall Structure
-----------------
This test processes two corpuses. One of these is a corpus of XML files derived from a corpus of Docx files that were run through meTypeset. From this point forward, this corpus will be referred to as the ‘converted’ corpus. The other is another corpus of XML derived from a body of Docx manually typed up to match JATS standard. From this point forward, this body will be referred to as the ‘sample’ corpus. 

This test goes through a selection of xpaths, and tests to see if all tags matching the given xpath in the converted corpus has a series of text child elements which combine to a string (hereby referred to as ‘tag text’) that is reasonably close to a similarly constructed tag text in the sample corpus, and vise-versa. Reasonably close in this case means that there exists a corresponding tag text for a given tag text that has a levenshetin distance of less than 30.

This test also accounts for appropriate NUMBER of xrefs produced and appropriate MATCHING of xrefs and refs in the converted document. Please consult matchxpathtext.py for more information. 


Testvars.py & filenames.py
--------------------------
Variable files for resources.robot & allIndividualConversionTestsBODY.robot


allIndividualConversionTestsBODY.robot & allIndividualConversionTestsFRONT.robot 
--------------------------------------------------------------------------------
These are similarly structured robot framework tests that both act as a structure for the test described above. They are called using
the shell command ‘pybot allIndividualConversionTestsBODY.robot’ & 'pybot allIndividualConversionTestsFRONT.robot' This will create an output 
file log.html in addition to providing feedback through the console. It consists of a vast number of unit tests, with each individual document 
in the corpus having a specific set of tests for a prespecified set of xpaths. sudo permissions should be granted to these tests in the event 
that the root user isn't the one making the command, as several error files are produced under a folder created called 'failDetails.' These tests
should be called in order, from allIndividualConversionTestsBODY.robot to allIndividualConversionTestsFRONT.robot, as the first test provides important
logistical work in setting up the failDetails directory and subdirectories. 

overallConversionTest.robot
---------------------------
This test compiles information from failDetails into a fairly clean and organized robotFramwork test output, testing the raw percentage of all tags processed vs. all tags that failed. As it requires failDetails to exist, both allIndividualConversionTestsBODY.robot & allIndividualConversionTestsFRONT.robot should be run before this test is run. 

consolidateResults.py
---------------------
This python program consolidates the most directly relevant information into the .txt file trialResultsSummary.txt


matchxpathtext.py
-----------------
Does the actual processing work for comparing tag texts. In addition, creates and processes files that keeps track of data in failDetails in terms of accuracy of the overall corpus.

/failDetails/
-------------
Note: Due to the fact that the documents being tested are not available for the public domain, an example of this folder is not provided in this repository. 

Direct child folders: 	
						convertsInSample: Tests for accuracy of tags in converts compared to the sample. 
						samplesInConvert: Tests for how many of sample tags are reflected in the converted document. 
						xref: Specialized folder for xref test. 
In convertsInSample & samplesInConvert:
						Default Case: Folder named as a file, contains specific details of failures for individual tags.
						allTags: Total stats for the tags across the entire corpus for this specific comparison. 
In xref:
						Default Case: File name, reflects individual details of xref matching failure. 
						all_xref: Acts like subdirectories in allTags, but for xref specifically.  
allTags
						Default Case: Subdirectories with the name of a tag. Contains files about general information about that specific tag across the corpus. 
all_xref & subdirectories of allTagas
						failedFiles: Text file consisting of the names of all files that failed to match tags properly. 
						mismatches: Exact number of tags that failed to match. 
						total: Exact number of tags processed in this test. 
						message: Readable message about the results of this specific test. 
