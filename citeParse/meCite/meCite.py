#!/usr/bin/env python
# -*- coding: latin-1 -*-

"""meCite: an extensible citation parsing library.

Usage:
  meCite.py [(-d | --debug)] <style> <citation>
  meCite.py (-h | --help)
  meCite.py (-t | --test)
  meCite.py --version

Options:
  -d --debug    Enable debug output.
  -h --help     Show this screen.
  -t --test     Run the test suite.
  --version     Show version.

"""
from docopt import docopt
import os
import re
import sys
import re
import codecs
from itertools import izip
import os.path

__author__ = "Martin Paul Eve"
__copyright__ = "Copyright 2013"
__credits__ = ["Martin Paul Eve"]
__license__ = "GPL"
__version__ = "0.1"
__maintainer__ = "Martin Paul Eve"
__email__ = "martin@martineve.com"
__status__ = "Alpha"


def load_database():
	if debug:
		print >> sys.stderr, "Loading database: " + "styles.txt."
	with open("styles.txt", 'r') as styleFile:
		data = styleFile.read()
		return data.split("\n")

def load_chosen_ruleset(chosenStyle):
	if debug:
		print >> sys.stderr, "Loading ruleset: " + "styles/" + chosenStyle + "/ruleset.txt" + "."
	with open("styles/" + chosenStyle + "/ruleset.txt", 'r') as ruleset:
		data = ruleset.read()
		return data.split("\n")
		
def validate_ruleset(ruleset, chosenStyle):
	# this function is here to make sure that a ruleset hasn't been placed in the wrong directory at any time
	if debug:
		print >> sys.stderr, "Validating ruleset."
	if ruleset[0] != chosenStyle:
		print >> sys.stderr, "Ruleset " + ruleset[0] + " is not valid for citation style " + chosenStyle +"."
		sys.exit(2)

def pairwise(iterable):
    "s -> (s0,s1), (s2,s3), (s4, s5), ..."
    a = iter(iterable)
    return izip(a, a)

def load_citation_ruleset(chosenStyle, objectType):
	if debug:
		print >> sys.stderr, "Loading object ruleset: " + "styles/" + chosenStyle + "/" + objectType + ".txt" + "."
	with codecs.open("styles/" + chosenStyle + "/" + objectType + ".txt", 'r', "utf-8") as ruleset:
		data = ruleset.read()
		return data.split("\n")

def run_ruleset(ruleset, citation, chosenStyle):
	firstRun = True

	if debug:
		print >> sys.stderr, "Running ruleset:"
		print >> sys.stderr, ruleset

	for rule, outputType in pairwise(ruleset):
		if firstRun:
			if debug:
				print >> sys.stderr, "Ignoring ruleset header."
			firstRun = not firstRun
		else:
			# if rule line is #INCLUDE we need to get the regex from the subset file
			if rule.lower() == "#include":
				if debug:
					print >> sys.stderr, "Loading regex for %s via #INCLUDE statement." % (outputType)

				citationIncludeRuleset = load_citation_ruleset(chosenStyle, outputType.lower())
				rule = citationIncludeRuleset[2]

				if debug:
					print >> sys.stderr, "Regex for #INCLUDE of %s determined to be %s." % (outputType, rule)
			
			pattern = re.compile(rule, re.UNICODE)
			result = pattern.match(citation)

			if result:
				if debug:
					print >> sys.stderr, "Determined that citation is a %s through regex %s." % (outputType, rule)
				return outputType
			else:
				if debug:
					print >> sys.stderr, "Determined that citation is not a %s through regex %s." % (outputType, rule)


def parse_citation(citationRuleset, citation):
	regex = citationRuleset[2]

	pattern = re.compile(regex)
	result = pattern.match(citation)

	if result:
		returnObject = {}

		if debug:
			print >> sys.stderr, "Matched citation as %s %s through regex %s." % (citationRuleset[0], citationRuleset[1], regex)

		resultGroups = result.groups()

		if debug:
			print >> sys.stderr, result.groups()

		for assign in citationRuleset[3:]:
			if assign is not None and ',' in assign:
				index,assignation = assign.split(',')
				if debug:
					print >> sys.stderr, "Index %s. Assignation name \"%s\"." % (index, assignation)
					print >> sys.stderr, "Assigning %s as \"%s\"." % (assignation, result.group(index))
				returnObject[assignation] = result.group(index)

		returnObject["Type"] = citationRuleset[1]

		return returnObject
	else:
		if debug:
			print >> sys.stderr, "Citation was not parseable as %s %s through regex %s." % (citationRuleset[0], citationRuleset[1], regex)

def sanitize(citation):
	new_citation = citation.decode("UTF-8")
	if debug:
		print >> sys.stderr, "Sanitizing quotation to UTF-8: %s." % (new_citation)
	return new_citation

def loadtestfile(chosenStyle, objectType):
	with codecs.open("tests/" + chosenStyle + "/" + objectType + ".txt", 'r', "utf-8") as ruleset:
		data = ruleset.read()
		return data.split("\n")

if __name__ == "__main__":
	global debug
	global test
	arguments = docopt(__doc__, version='meCite 0.1')
	debug = arguments['--debug']
	test = arguments['--test']

	styles = load_database()

	if not test:
		# check that the given style variable is actually valid
		chosenStyle = arguments['<style>'].upper()
		if not chosenStyle in styles:
			print >> sys.stderr, arguments['<style>'] + " is not a valid citation style."
			sys.exit(1)
	
		ruleset = load_chosen_ruleset(chosenStyle)
		validate_ruleset(ruleset, chosenStyle)

		citation = sanitize(arguments['<citation>'])

		objectType = run_ruleset(ruleset, citation, chosenStyle)

		if objectType == None:
			print >> sys.stderr, "Could not determine object type of passed citation."
			sys.exit(3)

		citationRuleset = load_citation_ruleset(chosenStyle, objectType.lower())

		parsedCitation = parse_citation(citationRuleset, citation)
		parsedCitation["ObjectType"] = objectType

		print parsedCitation

	else:
		# we're in test suite mode; iterate over styles and validate each
		for style in styles:
			if style != u'':
				ruleset = load_chosen_ruleset(style)
				validate_ruleset(ruleset, style)

				print "Testing ruleset %s." % (style)

				firstRun = True

				for rule, outputType in pairwise(ruleset):
					if firstRun:
						if debug:
							print >> sys.stderr, "Ignoring ruleset header."
						firstRun = not firstRun
					else:
						citationRulesetNonOrdered = load_citation_ruleset(style, outputType.lower())

						# load the test file
						if os.path.exists("tests/" + style + "/" + outputType.lower() + ".txt"):
							testFile = loadtestfile(style, outputType.lower())

							objectType = run_ruleset(ruleset, testFile[1], style)
							citationRuleset = load_citation_ruleset(style, objectType.lower())

							parsedCitation = parse_citation(citationRuleset, testFile[1])	
							parsedCitation["ObjectType"] = objectType		

							for testOutput in testFile[2:]:
								testLine = testOutput.split("|:|")

								if testLine[0] != u'':
									if testLine[0] in parsedCitation:
										if parsedCitation[testLine[0]] != testLine[1]:
											# check this isn't a problem with ruleset ordering
											problemDiagnosed = False											

											parsedCitationNonOrdered = parse_citation(citationRulesetNonOrdered, testFile[1])
											parsedCitationNonOrdered["ObjectType"] = outputType

											for testOutputNonOrdered in testFile[2:]:
												testLineNonOrdered = testOutputNonOrdered.split("|:|")

												if testLineNonOrdered[0] != u'':
													if testLineNonOrdered[0] in parsedCitationNonOrdered:
														if parsedCitationNonOrdered[testLineNonOrdered[0]] != testLineNonOrdered[1]:											
															print "[FAIL] Test %s %s. '%s' was '%s'. It should have been '%s'" % (style, outputType, testLine[0], parsedCitation[testLine[0]], testLine[1])
															problemDiagnosed = True
											if not problemDiagnosed:
												print "[FAIL] Test %s %s failed due to ruleset ordering. '%s' was '%s'. It should have been '%s'. Citation was matched by %s instead of %s." % (style, outputType, testLine[0], parsedCitation[testLine[0]], testLine[1], parsedCitation["ObjectType"], parsedCitationNonOrdered["ObjectType"])
									else:
										# check this isn't a problem with ruleset ordering
										problemDiagnosed = False											

										parsedCitationNonOrdered = parse_citation(citationRulesetNonOrdered, testFile[1])
										parsedCitationNonOrdered["ObjectType"] = outputType

										if testLine[0] in parsedCitationNonOrdered:
											print "[FAIL] Test %s %s due to ruleset ordering. '%s' was not found in output object: %s. Citation was matched by %s instead of %s." % (style, outputType, testLine[0], parsedCitation, parsedCitation["ObjectType"], parsedCitationNonOrdered["ObjectType"])	
										else:
											print "[FAIL] Test %s %s. '%s' was not found in output object: %s" % (style, outputType, testLine[0], parsedCitation)
						else:
							print "[WARN] Could not run test %s %s as test fixture not found." % (style, outputType)

