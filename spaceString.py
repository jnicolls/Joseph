import re
import sys

s = ''
f = open(sys.argv[1], 'r')
a = f.read()

a = re.sub(r'\d', ' ', a) 
a = re.sub('"', ' ', a)
a = re.sub('\'', ' ', a)
a = re.sub(r'\;', ' ', a)
a = re.sub('\.', ' ', a)
a = re.sub(',', ' ', a)
a = re.sub('s', ' ', a)
a = re.sub('-', ' ', a)
a = re.sub(r'(\(.*?\))', ' ', a)
a = re.sub(r'(\[.*?\])', ' ', a)

pattern = re.compile(r'(\S*?)(?:\s)') 

for c in re.findall(pattern, a):
	s += c
	s += '\\s+'



w = open('spaced', 'w')
w.write(s)
w.close()
