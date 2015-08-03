import re
import sys
f = open ('/var/local/meTypesetTests/tests/testOutput/'+sys.argv[1] +'/nlm/out.xml', "r")
print ("open operation complete")
fd = f.read()
s = ''
pattern = re.compile(r'(?:(&#\d*|"|>))(.*?)(?=(&#\d*|"|<))')
for e in re.findall(pattern, fd):
	s += ' '
	s += e[1]
f.close()
pattern2 = re.compile(r'(.*?)(?:(\s+?;))')
rs = ''
for p in re.findall(pattern2, s):
	rs += p[0]
o = open ( '/var/local/meTypesetTests/tests/regexOutput/'+sys.argv[1], "w")
o.write(rs)
o.close()
