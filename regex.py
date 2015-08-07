import re
import sys
f = open ('/var/local/meTypesetTests/tests/testOutput/'+sys.argv[1] +'/nlm/out.xml', "r")
print ("open operation complete")
fd = f.read()
s = ''

fd = re.sub(r'\&lt.*?\&gt\;', ' ', fd)
 
pattern = re.compile(r'(?:(&#\d*|>))(.*?)(?=(&#\d*|<))')
for e in re.findall(pattern, fd):
	s += ' '
	s += e[1]

s = re.sub('-', ' ', s)
s = re.sub(r'\,', ' ', s)
s = re.sub(r'\.', ' ', s)
s = re.sub('\'', '', s)
s = re.sub(r'\;', ' ', s)
s = re.sub('s', ' ', s)
s = re.sub(r'[0-9]', ' ', s)
s = re.sub(r'\(.*?\)', ' ', s)
s = re.sub(r'(\[.*?\])', ' ', s)

f.close()
o = open ( '/var/local/meTypesetTests/tests/regexOutput/'+sys.argv[1], "w")
o.write(s)
o.close()
