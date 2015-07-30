import re
import sys
f = open ('/var/local/meTypesetTests/tests/testOutput/'+sys.argv[1] +'/nlm/out.xml', "r")
print ("open operation complete")
fd = f.read()
s = ''
pattern = re.compile(r'(?:(&#\d*|>))(.*?)(?=(&#\d*|<))')
for e in re.findall(pattern, fd):
	s += ' '
	s += e[1]
f.close()
o = open ( '/var/local/meTypesetTests/tests/regexOutput/'+sys.argv[1], 'w', 0)
o.write(s)
o.close()
