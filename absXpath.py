# absXpath.py takes in three arguments from the command line. The first two represent filepaths to XML files. 
# The last represents a tag that is being searched for. 
#
# This program goes trhough every element in the second argument (the 'convertFile'), and tries to find a matching
# element in the first, both in terms of the tag content and in terms of the string representation of the xpath. 

import sys
import lxml
from lxml import etree

# The tag will remain as an unaltered string. The sampleFile and convertFile will 
# be parsed according to the ElementTree structure in python. 

sampleFile = open(sys.argv[1], 'r')
convertFile = 	open(sys.argv[2], 'r') 
tag = sys.argv[3]

convertTree = lxml.etree.parse(convertFile)
sampleTree = lxml.etree.parse(sampleFile)

convertFile.close()
sampleFile.close()

# This variable keeps track of whether all of the current tags in the converted XML has 
# both a matching xpath and a matching body text. 

matchSoFar = True



for convertElem in convertTree.findall(tag):
	xp = convertTree.getpath(convertElem)
	sampleElemList = sampleTree.findall(xp)
	if sampleElemList == None:
		matchSoFar = False
		break
	matchSoFar = False
	for sampleElem in sampleElemList:
		if sampleElem.text == convertElem.text:
			matchSoFar = True
			break
	if matchSoFar == False:
		break

# pathTestResults is a constant file that a corresponding RobotFramework test will 
# check the contents of to observe the results of the test. 

result = open('pathTestResults', 'w')

if matchSoFar == True: result.write("Success!")
else: result.write("Failure.")

result.close()
