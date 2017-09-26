from subprocess import check_output
import time
import os


t=time.time()
while time.time()-t<56:
	f=open(os.path.realpath(__file__)+".log","a")
	some_path=os.path.dirname(os.path.realpath(__file__))	
	f.write('running crons ' )
	ss=check_output(["rake", "crontask:setliveauction"], cwd=some_path)
	print(ss)
	f.write(ss)
	ss=check_output(["rake", "crontask:setwinner"] ,cwd=some_path)
	print(ss)
	f.write(ss)
	time.sleep(2)
f.close()
