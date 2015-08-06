#!/usr/bin/python

import re
import sys

s = ''
f = open(sys.argv[1], 'r')


l = [line.decode('utf-8').strip() for line in f.readlines()]

f.close()

a = ''

for line in l:
	a += line

a = re.sub('\'', ' ', a)
a = re.sub('\xe2', ' ', a)
a = re.sub('\)', '\\)', a)
a = re.sub('\(', '\\(', a)
a = re.sub('\.', ' ', a)
a = re.sub(',', ' ', a)
a = re.sub(r'\s+?', ' ', a)

str(a).decode('utf-8').strip()

pattern = re.compile(r'[^\s]+') 

for c in re.findall(pattern, a):
	s += c
	s += '\\s+?'	



w = open('spaced', 'w')
w.write(s)
w.close()
