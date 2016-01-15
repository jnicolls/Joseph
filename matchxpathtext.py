# matchxpathtext.py takes in five arguments from the command line. The first two represent filepaths to XML files.
# The third is the general name of the file being analyzed. The last represents a tag that is being searched for.
#
# This program goes trhough every element in the second argument (the 'trialFile'), and tries to find a matching
# element in the first in terms of text content. In the event that the tag is 'xref', a seperate specialized process is
# undergone instead of attempting to match text elements. 

import re
import os
import sys
import lxml
from math import factorial
import Levenshtein
import itertools
from lxml import etree

SENTINEL = -1
LEV_THRESHOLD = 30

# getErrorPath(fileName, tag)
# ---------------------------
# Gives consistent name formatting to error files.

def getErrorPath(fileName, tag):
	if tag == 'xref': 
		return sys.argv[5] + '/' + fileName + '_xref_error'
	else:
		tagName = tag.replace("/", "_")
		tagName = tagName.replace(".", 'DOT')
		return  sys.argv[5] + '/' + fileName + '/' + tagName + '_error';

# getCompleteText(elem)
# ---------------------
# Combines all text elems of the children text nodes of a single XML parent element.

def getCompleteText(elem):
	completeText = ''
	iterText = elem.itertext()
	for text in iterText:
		completeText += text
	return completeText;

# createErrorFile(fileName, tag)
# ------------------------------
#
# Creates an error file that will be referenced frequently throughout
# the file.

def createErrorFile(fileName, tag):
	"Create error file (with the name of tag currently being analyzed) in the folder of all error files of the current XML being analyzed."
	errorPath = getErrorPath(fileName, tag)
	error = open(errorPath, 'w')
	return error;


# updateTagData(mismatchCount, totalTags, tag):
# ---------------------------------------------
# Updates a consistent list of total number of tags processed (both in this and other files),
# in addtiion to updating # of mismatches and proportion of mismatched tags.

def updateTagData(mismatchCount, totalTags, tag, fileName, errorLines):

	stringTag = tag.replace("/", "_")
	stringTag = stringTag.replace(".", "DOT")
	if (tag == 'xref'): parentFolder = sys.argv[5] + '/all_xref/'
	else: parentFolder = sys.argv[5] + '/allTags/' + stringTag + '/'
	misSoFar = SENTINEL; totSoFar = SENTINEL; misF = None; totF = None

	if not os.path.isfile(parentFolder + 'mismatches'):
		misF = open (parentFolder + 'mismatches', 'w')
		totF = open (parentFolder + 'total', 'w')
		misSoFar = mismatchCount
		totSoFar = totalTags
	else:
		misF = open (parentFolder + 'mismatches', 'r'); totF = open (parentFolder + 'total', 'r')
		misSoFar = float(misF.readline()) + mismatchCount
		totSoFar = float(totF.readline()) + totalTags
		misF.close(); totF.close()
		misF = open (parentFolder + 'mismatches', 'w'); totF = open (parentFolder + 'total', 'w')



	misF.write(str(misSoFar))
	totF.write(str(totSoFar))

	message = open (parentFolder + 'message', 'w')
	message.truncate()

	proportion = SENTINEL
	if totSoFar != 0 : proportion = float(misSoFar)/float(totSoFar)
	else: proportion = 0

	if tag == 'xref': 
		message.write("There has been a total of  " + str(totSoFar) + " xref body tags processed thus far. ")
		message.write("The result of subtracting the total number of back ref tags from the total number of xref body tags is " + str(misSoFar))
		message.write(" resulting in a precision  of " + str(proportion) + ' , ONLY if you take into account the number of tags, and not the content. A more accurate level of precision is most likely lower.')
	else: message.write("There have been " + str(totSoFar) + " tags processed, and " + str(misSoFar) + " have fallen over the Levenshtein threshold, resulting in a miss rate of " + str(proportion))
	
	if errorLines:
		with open(parentFolder + 'failedFiles', "a") as failedFiles:
			failedFiles.write('\n' + fileName + ' fail lines:\n' + str(errorLines) + '\n')

	message.close(); misF.close(); totF.close();

# compareXREFS(trialTree, sampleTree, error, fileName)
# ----------------------------------------------------
#
# First, this method compares the total number of xrefs in the trial document to the total number of xrefs in the sample document. 
#
# Then, the document goes through every single 'rid' in each xref in the body document, and checks to see if there's a corresponding
# ref in the back of the trial document. Then, the reverse is done: every 'id' of each ref tag is checked for a corresponding 
# xref in the body of the trial document. The total number for both these failures are averaged out, and the results are recorded. 
#

def compareXREFS(trialTree, sampleTree, error, fileName):

	bodyXrefIDMatchFailures = 0; backRefIDMatchFailures = 0; errorLines = []
	bodyXREFS = trialTree.findall('body//xref'); backREFS = sampleTree.findall('back//ref'); sampleXREFS = sampleTree.findall('body//xref')
	totalBodyXREFS = len(bodyXREFS); totalBackREFS = len(backREFS); totalSampleXREFS = len(sampleXREFS)

	for bodyXREF in bodyXREFS:
		idNum = bodyXREF.get("rid")
		# idXREF is a list of all tags matching the xpath.
		idXREF = trialTree.xpath("back//ref[@id=\'" + idNum + "\']")
		# # if len(idXREF) is not equal to one, that means that idNum matched to nothing, or to multiple tags. 
		if len(idXREF) != 1: 
			bodyXrefIDMatchFailures += 1.0
			errorLines.append(bodyXREF.sourceline)

	for backREF in backREFS:
		idNum = backREF.get("id")
		idXREF = trialTree.xpath("body//xref[@id=\'" + idNum + "\']")
		if len(idXREF) != 1: 
			backRefIDMatchFailures += 1.0
			errorLines.append(backREF.sourceline)
	
	diff = totalBodyXREFS - totalBackREFS
	result = open('pathTestResults', 'w')
	result.write(str(diff))

	result2 = open('pathTestResultsT', 'w')
	bodyXRefPer = bodyXrefIDMatchFailures/totalBodyXREFS
	backRefPer = backRefIDMatchFailures/totalBackREFS
	xrefPerAvg = ((bodyXRefPer + backRefPer) / 2) 
	result2.write(str(xrefPerAvg))
	
	error.write("\n There was a difference of " + str(diff) + "between the sample xrefs and the converted xrefs in this document.")
	error.write("\nThere was a total of " + str(totalBodyXREFS) + " body Xrefs and a total of " + str(totalBackREFS) + " back refs.\n\n")
	error.write("\n" + str(bodyXRefPer) + " percent of all body xrefs in the converted document failed to match properly with a back reference tag.")



	updateTagData(diff, totalBodyXREFS, 'xref', fileName, errorLines);

	result.close(); result2.close()




# countMismatches(convertTree, sampleTree, tag, error)
# ----------------------------------------------------
#
# Counts the number of mismatches between text within tags. A mismatch occurs
# when the text of a trial elem  cannot come within LEV_THRESHOLD of the text of a sample elem. For each tag, if the text does not match exactly,
# with another tag, the closest match (w/ lowest Levenshetein distance) is checked to see if
# it has a higher Levenshetein distance than the highest thus far.
#
# At the end, the error file is updated to show off the most erroneous text.

def countMismatches(trialTree, sampleTree, tag, error, fileName):

	mismatchCount = 0
	totalTags = 0
	errorLines = []
	highestLevCount = 0

	# Cermine occassionally chooses to classify tags in other tags that can occassionally be uninituitive. Below are hardcoded 'aliases' for common tags. 

	aliasTag = tag
	if tag == 'front//name': aliasTag = 'front//string-name'
	if tag == 'front//institution': aliasTag = 'front//aff' 

	trialTreeTags = trialTree.findall(tag)
	if not trialTreeTags: trialTreeTags = trialTree.findall(aliasTag)
	
	sampleElemList = sampleTree.findall(tag)
	
	if not sampleElemList: sampleElemList = sampleTree.findall(aliasTag)

	if not sampleElemList and aliasTag == tag:
  		error.write('sampleTree has no elems matching xpath: ' +  tag + '\n\n')
 		mismatchCount += 1

	elif not sampleElemList and aliasTag != tag:
		error.write('sampleTree has no elems matching xpath: ' + tag + ' or ' + aliasTag)
  		mismatchCount += 1
	
	for trialElem in trialTreeTags:

		totalTags += 1.0

		if sampleElemList:

			levDistance = findClosestMatch(sampleElemList, trialElem, error, tag)

			if levDistance > LEV_THRESHOLD: 
				mismatchCount += 1
				errorLines.append(trialElem.sourceline)

			if levDistance > highestLevCount: 
				highestLevCount = levDistance



	result = open('pathTestResults', 'w')
	result.write(str(highestLevCount))
	result2 = open('pathTestResultsT', 'w')
	if totalTags != 0:
		result2.write(str(mismatchCount/totalTags))
	else:
		result2.write('0')	
	updateTagData(mismatchCount, totalTags, tag, fileName, errorLines);

# safeLevDistance(textOne, textTwo)
# ---------------------------------
#
# The Levenshtein function imported is unable to deal with empty strings.
# This function makes sure to check for cases in which one of the two texts
# is not empty. It is assumed that at least one of the texts passed in is a valid string.
#
# Since the inputs have heterogenous encodings, both texts are encoded in 'utf-8' before Levenshtein.distance is called.

def safeLevDistance(textOne, textTwo):
	if textOne == None and textTwo != None: return len(textTwo)
	elif textOne != None and textTwo == None: return len(textOne)
	else:
		textOne.replace(" ", ""), textTwo.replace(" ", "")
		return Levenshtein.distance(textOne.encode('utf-8'), textTwo.encode('utf-8'));

# findClosestMatch(sampleElemList, convertElem, error)
# ----------------------------------------------------
# Goes through each elem in the sampleElemList, and compares
# the text of the elem to the text of the convertElem. If a new elem's text in the sampleElemList
# has a lower levenshetein distance than the lowest one recorded thus far, the new tag is recorded as the
# closest match thus far. If the text is the same, the
# the levenshetin distance is recorded as 0, and the loop is exited out.
#
# In the event that the tag passed through is 'front//name', 
# the 'sampleTextList' that is cycled through so that all possible permutations of the name are recorded. 
#

def findClosestMatch(sampleElemList, trialElem, error, tag):

	trialText = getCompleteText(trialElem)

	matchIndividualElem = False
	lowestLevDistance = SENTINEL
	closestMatchingString = ''

	for sampleElem in sampleElemList:
		if tag != "front//name":
			sampleTextList = []
			sampleTextList.append(getCompleteText(sampleElem))
		else:
			# test against all name permutations
			nameParts = sampleElem.getchildren()
			namePartsTextList = []
			namePartsTuples = []
			sampleTextList = []
			for nameTag in nameParts:
				namePartsTextList.append(nameTag.text)
			for subset in itertools.permutations(namePartsTextList, factorial(len(namePartsTextList))):
				namePartsTuples.append(subset)
			for namePermutation in namePartsTuples:
				sampleTextList.append(' '.join(map(str, namePermutation)))


		for sampleText in sampleTextList:


			if sampleText == trialText:
				matchIndividualElem = True
				lowestLevDistance = 0
				break

			sampleDistance = safeLevDistance(sampleText, trialText)

			if sampleDistance < lowestLevDistance or lowestLevDistance == SENTINEL:
				lowestLevDistance = sampleDistance
				if sampleText == None: closestMatchingString = ''
				else: closestMatchingString = sampleText.encode('utf-8')

	if matchIndividualElem == False and trialText != None:
		safeErrString = trialText.encode('utf-8')
		error.write('In line ' + str(trialElem.sourceline) + ', the following text could not be matched: \n\n \'' + safeErrString + '\'. \n\n  The closest text is:\n\n \'' + closestMatchingString + '\' with a Levenshtein distance of '+ str(lowestLevDistance) +  '.\n\n')
	return lowestLevDistance;

# main(sampleFile, trialFile, fileName, tag, errorParent)
# ------------------------------------------------------
#
# Counts the total number of mismatches between the files, (how many tag texts in trial tree are not
# in sample tree), records the most mismatched string in an extraneous file, and updates a file
# that keeps track of errors across a corpus.
# A special process is undergone in the event that the 
# tag being compared is 'xref.'


fileName = sys.argv[3]
sampleFile = open(sys.argv[1], 'r')
trialFile = open(sys.argv[2], 'r')
tag = sys.argv[4]

trialTree = lxml.etree.parse(trialFile)
sampleTree = lxml.etree.parse(sampleFile)

trialFile.close()
sampleFile.close()

error = createErrorFile(fileName, tag)

if tag != 'xref': countMismatches(trialTree, sampleTree, tag, error, fileName)
else: compareXREFS(trialTree, sampleTree, error, fileName)

error.close()
if os.stat(getErrorPath(fileName, tag)) == 0: os.remove(getErrorPath(fileName, tag))
