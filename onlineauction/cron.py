from subprocess import check_output
import time
import os


t=time.time()
while time.time()-t<56:
	f=open(os.path.realpath(__file__)+".log","a")
	f.write('running crons ' )
	f.write(check_output(["rake", "crontask:setliveauction"]))
	f.write(check_output(["rake", "crontask:setwinner"]))
	time.sleep(2)
f.close()
