*** Settings ***
Documentation	This text file is meant to experiment around with Robot Framework to see what it can do. \
Library			Process
Library			OperatingSystem
Library			XML
Library			Collections

***Test Cases***

000 Environment
    ${result} =             Run Process         ../tools/gennlm_mac.sh 	OpenMed-01-e1.docx 		./000   shell=True
    Log                     ${result.stdout}
    Log                     ${result.stderr}
    Should Not Contain      ${result.stderr}    cannot find or open
    Should Not Contain      ${result.stdout}    ERROR
    [Teardown]              Remove Directory    000                 recursive=True

001 Length of XML files match
	${result}=    		Run Process			../tools/gennlm_mac.sh OpenMed-01-e1.docx ./001 	shell=True
	Log    				${result.stdout}
    Log    				${result.stderr}
    ${xml}=    			Parse XML 			./001/OpenMed-01-e1.xml
    ${xmlChildren}=		Get Child Elements 	${xml}
    ${idealXml}= 		Parse XML  			OpenMed-01-e1.nxml
    ${idealChildren}=	Get Child Elements 	${idealXml}
    ${idealLength}=		Get Length 			${idealChildren}
    Length Should Be 	${xml}				${idealLength}
    [Teardown]    		Remove Directory   	ResultDirectory   	recursive=True

# 002 Title Nesting Matches
# 	${result} =    Run Process     InsertProgramHere InsertDocHere InsertFolderHere    shell=True
# 	Log    ${result.stdout}
#     Log    ${result.stderr}
#     ${xml} =    	Parse XML 	InsertDocResultHere
#     ${idealXml} = 	Parse XML  	InsertOrigDocHere
