meTypeset-Test Read-Me
======

This repository consists of three principal files that are crucial for running tests in on the meTypeset XML parser. The first is a shell script that runs meTypeset across a corpus. (improvedTestForConversion.sh) This shell script also calls testForSuccessfulConversion.txt, a Robot Framework Test that checks to see if every element in the converted document from meTypeset has the same body text and XPath string representation. 
