from subprocess import check_output
import time


t=time.time()
while time.time()-t<56:
	print('running crons ' )
	print(check_output(["rake", "crontask:setliveauction"]))
	print(check_output(["rake", "crontask:setwinner"]))
	time.sleep(2)
