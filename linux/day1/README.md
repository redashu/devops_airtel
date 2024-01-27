### Info about LInux as kernel 

<img src="kernel.png">

### Understanding working of shell in linux 

<img src="shell.png">

### exploring env variable in linux 

```
[airtel@gaea-test ~]$ x=10
[airtel@gaea-test ~]$ 
[airtel@gaea-test ~]$ echo $x
10
[airtel@gaea-test ~]$ echo $path

[airtel@gaea-test ~]$ echo $PATH
/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/airtel/.local/bin:/home/airtel/bin
[airtel@gaea-test ~]$ 
[airtel@gaea-test ~]$ 
[airtel@gaea-test ~]$ cal
    January 2024    
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

[airtel@gaea-test ~]$ which  cal 
/bin/cal

```

### default history size checking 

```
[airtel@gaea-test ~]$ echo    $HISTSIZE
1000
[airtel@gaea-test ~]$ whoami
airtel
[airtel@gaea-test ~]$ 

```

### changing history size 

```
[airtel@gaea-test ~]$ HISTSIZE=2
[airtel@gaea-test ~]$ echo    $HISTSIZE
2
[airtel@gaea-test ~]$ date
-bash: /bin/date: Permission denied
[airtel@gaea-test ~]$ cal
    January 2024    
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

[airtel@gaea-test ~]$ ls
[airtel@gaea-test ~]$ history 
    8  ls
    9  history 

```

### changing size in ,bashrch 

```
airtel@gaea-test ~]$ cat  .bashrc 
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# changing history size

HISTSIZE=2000

```

### checking it

```
[airtel@gaea-test ~]$ echo $HISTSIZE
1000
[airtel@gaea-test ~]$ source  .bashrc  # laod file without logout that user 
[airtel@gaea-test ~]$ 
[airtel@gaea-test ~]$ echo $HISTSIZE
2000

```



