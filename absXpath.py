 absXpath.py takes in three arguments from the command line. The first two represent filepaths to XML files. 
# The last represents a tag that is being searched for. 
#
# This program goes through every element in the second argument (the 'convertFile'), and tries to find a matching
# element in the first, both in terms of the tag content and in terms of the string representation of the xpath. 

import os
import sys
import lxml
from lxml import etree

# The tag will remain as an unaltered string. The sampleFile and convertFile will 
# be parsed according to the ElementTree structure in python. 

sampleFile = open(sys.argv[1], 'r')
convertFile =   open(sys.argv[2], 'r')
fileName = sys.argv[3]

tag = sys.argv[4]
tagName = tag.replace("/", "_")
tagName = tagName.replace(".", 'DOT')

convertTree = lxml.etree.parse(convertFile)
sampleTree = lxml.etree.parse(sampleFile)

convertFile.close()
sampleFile.close()

errorPath = 'failDetails/' + fileName + '/' + tagName + '_error'
error = open(errorPath, 'w')


# This variable keeps track of whether all of the current tags in the converted XML has 
# both a matching xpath and a matching body text, and how many errors occur if any. 

mismatchCount = 0



for convertElem in convertTree.findall(tag):
        xp = convertTree.getpath(convertElem)
        sampleElemList = sampleTree.findall(xp)
        if sampleElemList == None:
                error.write('Sample elem list was empty while convert list was not.\n\n')
                mismatchCount += 1
                break
        matchIndividualElem = False
        for sampleElem in sampleElemList:
                if sampleElem.text == convertElem.text:
                        matchIndividualElem = True
                        break
        if matchIndividualElem == False and convertElem.text != None:
                safeErrString = convertElem.text.encode('utf-8')
                error.write('The following text could not be matched: ' + safeErrString + '\n\n')
                mismatchCount += 1

# pathTestResults is a constant file that a corresponding RobotFramework test will 
# check the contents of to observe the results of the test. 


result = open('pathTestResults', 'w')

if mismatchCount == 0:
        os.remove(errorPath)
        result.write("Success!")
else:
        result.write("Failure.")
        error.write("The number of mismatches found is: " + str(mismatchCount))

error.close()
result.close()
