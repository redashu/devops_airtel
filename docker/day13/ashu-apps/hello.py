import time,subprocess

os_details=subprocess.getoutput('uname -r')
while True:
    print("Hello i am checking os details ")
    time.sleep(2)
    print(os_details)
    print("@@@@@@@@@@@@@@")
    print("________________")
    time.sleep(2)