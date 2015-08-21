# testvars.py
# -----------
#
# Variables (consisting primarily of relative file paths) for testForSuccessfulConversion.txt Robot Framework test. 
# In the event that the test is transferred to a different system, variables in this file must be adjusted depending on file organization. 
#

convertParentPath = '/var/local/meTypesetTests/tests/testOutput'
sampleParentPath = '/var/local/meTypesetTests/testingDocuments/OpenMedXML'
AcceptableErrorRegex = '(OpenMed-\\d*-e*\\d*?..docx/nlm/out.xml:\\d*: element xref: validity error : IDREFS attribute rid references an unknown ID "TO_LINK")?(Document OpenMed-\\d*-e*\\d*?..docx/nlm/out.xml does not validate against http://jats.nlm.nih.gov/archiving/1.1d3/JATS-archivearticle1.dtd)'
demoParentPath = '/var/local/meTypesetTests/tests/newCorpus'
errorMessage = 'does not match up evenly between the sample XML and the meTypeset\'d version. Please see corresponding file for more information!'
necessaryMatchElems = ['./article/title', './/aff', './/p', './/abstract/p', './/fig/graphic', './/fig/table-wrap/table', './/sec/title', ' .//fig/table-wrap/caption', ' .//fn/fn-group']
~                                                                                                                                                                                               
