import re
import sys
f = open (sys.argv[1], "r")
fd = f.read()
l = re.findall('(?:(&#\d*|>))(.*?)(?=&#\d*|<)',fd)
f.close()
o = open ( 'regexOutput/'sys.argv[1], 'w')
o.write(l)
o.close()
