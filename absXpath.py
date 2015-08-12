import sys
import lxml
from lxml import etree

sampleFile = open(sys.argv[1], 'r')
convertFile = 	open(sys.argv[2], 'r') 

convertTree = lxml.etree.parse(convertFile)
sampleTree = lxml.etree.parse(sampleFile)

convertFile.close()
sampleFile.close()


matchSoFar = True

tag = sys.argv[3]
for convertElem in convertTree.findall(tag):
	xp = convertTree.getpath(convertElem)
	sampleElemList = sampleTree.findall(xp)
	print xp
	print convertElem.text
	print sampleElemList
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

result = open('pathTestResults', 'w')

if matchSoFar == True: result.write("Success!")
else: result.write("Failure.")

result.close()
