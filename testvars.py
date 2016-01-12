# testvars.py
# -----------
#
# Variables (consisting primarily of relative file paths) for testForSuccessfulConversion.txt Robot Framework test. 
# In the event that the test is transferred to a different system, variables in this file must be adjusted depending on file organization. 
#

frontConvertParent = '/var/local/meTypesetTests/testingDocuments/jolOutput'
frontSampleParent = '/var/local/meTypesetTests/testingDocuments/jolXML'
bodyConvertParent = '/var/local/meTypesetTests/testingDocuments/coactionDocxOutput/'
bodySampleParent = '/var/local/meTypesetTests/testingDocuments/coactionXML'
necessaryMatchElems = ['body//sec/title', 'body//table-wrap//caption', 'body//list/list-item/p', 'front//email', 'front//journal-title', 'front//article-title', 'front//aff', 'back//fn', 'front//abstract//p' , 'body//fig//caption', 'front//name']
levThreshold = 30
acceptableFailureProportion = .25
acceptableFailurePercentage = '25%'
