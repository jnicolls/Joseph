import re
import sys
f = open ('/var/local/meTypesetTests/tests/testOutput/'+sys.argv[1] +'/nlm/out.xml', "r")
print ("open operation complete")
fd = f.read()
l = re.findall('(?:(&#\d*|>))(.*?)(?=&#\d*|<)',fd)
f.close()
o = open ( '/var/local/meTypesetTests/tests/regexOutput/'+sys.argv[1], 'w', 0)
o.write(str(l))
o.close()
