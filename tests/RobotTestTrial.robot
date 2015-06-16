*** Settings ***
Documentation	This text file is meant to experiment around with Robot Framework to see what it can do. \
Library			Process
Library			OperatingSystem
Library			XML
Library			Collections

***Test Cases***

000 Environment
	${result} =    Run Process     InsertProgramHere InsertDocHere InsertFolderHere    shell=True
    Log    ${result.stdout}
    Log    ${result.stderr}
    Should Not Contain    ${result.stderr}    cannot find or open
    Should Not Contain    ${result.stdout}    ERROR
    [Teardown]    Remove Directory    000    recursive=True

001 Title Nesting Matches
	${result} =    Run Process     InsertProgramHere InsertDocHere InsertFolderHere    shell=True
	Log    ${result.stdout}
    Log    ${result.stderr}
    ${xml}=    Parse XML    InsertDocHere
