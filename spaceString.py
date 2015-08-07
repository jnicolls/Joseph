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
a = re.sub(r'(\s+)', '\s+', a)


w = open('spaced', 'w')
w.write(s)
w.close()
