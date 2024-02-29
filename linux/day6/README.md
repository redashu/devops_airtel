## linux understanding 


## Using sed 

```
azureuser@linux-agent:~$ cat  /tmp/ok.txt 
hello guys 
uday is cool
uday is cool
uday is cool
uday is cool
uday is cool
uday is cool
uday is cool
basit is nice
basit is nice
basit is nice
basit is nice
basit is nice
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
azureuser@linux-agent:~$ sed   's/cool/good'         /tmp/ok.txt 
sed: -e expression #1, char 11: unterminated `s' command
azureuser@linux-agent:~$ sed   's/cool/good/'         /tmp/ok.txt 
hello guys 
uday is good
uday is good
uday is good
uday is good
uday is good
uday is good
uday is good
basit is nice
basit is nice
basit is nice
basit is nice
basit is nice
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
azureuser@linux-agent:~$ vim  /tmp/ok.txt 
azureuser@linux-agent:~$ 
azureuser@linux-agent:~$ 
azureuser@linux-agent:~$ 
azureuser@linux-agent:~$ sed   's/cool/good/'         /tmp/ok.txt 
hello guys 
uday is good
uday is good  and cool 
uday is good
uday is good
uday is good
uday is good
uday is good
basit is nice
basit is nice
basit is nice
basit is nice
basit is nice
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
azureuser@linux-agent:~$ sed   's/cool/good/2'         /tmp/ok.txt 
hello guys 
uday is cool
uday is cool  and good 
uday is cool
uday is cool
uday is cool
uday is cool
uday is cool
basit is nice
basit is nice
basit is nice
basit is nice
basit is nice
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
azureuser@linux-agent:~$ sed   's/cool/good/g'         /tmp/ok.txt 
hello guys 
uday is good
uday is good  and good 
uday is good
uday is good
uday is good
uday is good
uday is good
basit is nice
basit is nice
basit is nice
basit is nice
basit is nice
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
azureuser@linux-agent:~$ vim /tmp/ok.txt 
azureuser@linux-agent:~$ 
azureuser@linux-agent:~$ 
azureuser@linux-agent:~$ 
azureuser@linux-agent:~$ sed   's/cool/good/g'         /tmp/ok.txt 
hello guys 
uday is good
uday is good  and good 
uday is good and Cool 
uday is good
uday is good
uday is good
uday is good
basit is nice
basit is nice
basit is nice
basit is nice
basit is nice
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
azureuser@linux-agent:~$ sed   's/[cC]ool/good/g'         /tmp/ok.txt 
hello guys 
uday is good
uday is good  and good 
uday is good and good 
uday is good
uday is good
uday is good
uday is good
basit is nice
basit is nice
basit is nice
basit is nice
basit is nice
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
shubhas is awesome 
azureuser@linux-agent:~$ 

```
### using find 

```
root@linux-agent:~# find  /  -name  passwd 
/etc/pam.d/passwd
/etc/passwd
/usr/share/lintian/overrides/passwd
/usr/share/doc/passwd
/usr/share/bash-completion/completions/passwd
/usr/bin/passwd
^C

```

### 

```
root@linux-agent:~# find  /etc  -name  passwd 
/etc/pam.d/passwd
/etc/passwd
```


### case insensitive search

```
find  /  -iname  passwd 
/tmp/Passwd
/etc/pam.d/passwd
/etc/passwd
/usr/share/lintian/overrides/passwd
/usr/share/doc/passwd

```
