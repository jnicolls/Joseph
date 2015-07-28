import re
import sys
f = open (sys.argv[1], "r")
fd = f.read()
l = re.findall('(?:(&#\d*|>))(.*?)(?=&#\d*|<)',fd)
f.close()
o = open ( 'regexOutput', 'w', 0)
o.write(str(l))
o.close()
