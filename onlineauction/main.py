import sys
import requests

sc=0
retry=5
while sc!=200 and retry!=0:
	sc=requests.get(str(sys.argv[1])).status_code
	retry=retry-1;

if retry==0:
	print 'Email Id verification is not send'
else:
	print 'Done.'



