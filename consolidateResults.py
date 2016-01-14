# consolidateResults.py
# Meant to sumamrzie results in one easy text file.
# Takes in no arguments, but requires the prior existence of /failDetails/

import os
import sys

# getPercentPassString(parentFolder)
# ----------------------------------
# Takes the files in failDetails, and returns the percentage of tags processed that successfully match. 

def getPercentPassString(parentFolder):
	if not os.path.isfile(parentFolder + '/mismatches'): return '0.0'
	misFile = open (parentFolder + '/mismatches', 'r'); totFile = open (parentFolder + '/total', 'r')
        misFloat = float(misFile.readline()); totFloat = float(totFile.readline())
        if totFloat == 0: percentPass = 100
        percentPass =   (1 - misFloat/totFloat) * 100 
        percentPString = "%.2f" % percentPass
	return percentPString;

# main()
# ------
# Creates a file that generates percision, recall, and F1 scores 
# for all tags tested for so far in an easy-to-read table. 

precisionParent = '/var/local/meTypesetTests/tests/failDetails/samplesInConvert/allTags/'
recallParent = '/var/local/meTypesetTests/tests/failDetails/convertsInSample/allTags/'

resultMessage = open('trialResultsSummary.txt', 'w')

resultMessage.write('Results Summary \n---------------\n\nTag Name                     || Precision || Recall || F1 Score ||\n-----------------------------||-----------||--------||-------------\n')

for parentFolder in os.listdir(recallParent):
	resultMessage.write(str(parentFolder))
	for x in range(0, 32 - len(str(parentFolder))): resultMessage.write(' ')
	
	recallPercent = getPercentPassString(recallParent + parentFolder)
	resultMessage.write(' ' + recallPercent + '   ')
	
	precisionPercent = getPercentPassString(precisionParent + parentFolder)
	resultMessage.write('    ' + precisionPercent + '      ')
	
	precision = float(precisionPercent) / 100
        recall = float(recallPercent)       / 100
        if (precision + recall == 0): f1 = 0
	else: f1 = 2 * ( (precision * recall) / (precision + recall) )
        f1String = "%.2f" % f1
        resultMessage.write('   ' + f1String + '     \n')
	resultMessage.write('-----------------------------||-----------||--------||-------------\n')

parentFolder = 'failDetails/xref/all_xref/'
resultMessage.write('\nxref')
for x in range(0, 32 - len(str(parentFolder))): resultMessage.write(' ')

messageText = open(parentFolder + 'message')
resultMessage.write(messageText.readline() + '\n\n')

incompleteTotalFile = open ('incompleteFileTotal', 'r')

totalDocs = len(os.listdir('/var/local/meTypesetTests/tests/failDetails/samplesInConvert/')) - 1
incompleteDocs = incompleteTotalFile.readline()

resultMessage.write('\nThere have been ' + str(totalDocs) + ' documents processed in this test, and ' + incompleteDocs + ' have failed to complete the meTypeset process. Please see file \'incomplete files\' for a list of files that failed to process.\n')
resultMessage.write('\nIn this case, \'Precision\' means the percentage of sample tags which found a match in the meTypeset\'d converted corpus.\n')
resultMessage.write('\nIn this case, \'Recall\' means the percentage of converted tags in the meTypeset\'d corpus which found a match in the sample corpus.\n')

resultMessage.write('\n Please consult the \'failedFiles\' file in each specific subdirectory in failDetails/convertsInSample/allTags or failDetails/samplesInConvert/allTags for sspecific line numbers of individual failures.\n')

resultMessage.close()
