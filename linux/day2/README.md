## task 4 

##  Do some setting in linux server to achieve below given things 

<ol>

	<li> set alias k in such a way so that it run whoami command for all users old or new </li>
	<li> adjust some setting in your system so that user can decide which history they want to save or not  </li>
</ol>


### task 5 

<details><summary>show</summary>
<p>

```bash
  1. 
  2. complete this task uisng non root user
  3. store all the rows of /etc/passwd file into myshell.txt under /tmp/ which matches given conditions 
  4. every row must contain  root OR  shutdown  as exact words  
  5. now put this myshell.txt file in such a location so that it must follow below given condition you can root for this line if required
  6. now create new user named autouser1 
  7. autouser1 home directory must be /opt/autouser1 automatically
  8. when you check autouser1 home directory it must contain myshell.txt file
  9. Please note that step 7 and step 8 must happen automatically once you create user 
```

</p>
</details>


### Task 6 

## IO direction task 1 

<details><summary>show</summary>
<p>

```bash
  1. 
  2. run ifconfig command store output from line number  2 to 5 in a file io.txt under Desktop folder 
  3. count number of character in io.txt and store back in the same file 
  4. make sure file has all the content from point 1 to 2  
  5. copy io.txt to /mnt/
  6. change owner of /mnt/io.txt as root 
  7. group of this file must be koolgrp 
```

</p>
</details>

## IO direction task 2

<details><summary>show</summary>
<p>

```bash
  1. 
  2. complete this task uisng non root user
  3. store all the rows of /etc/passwd file into myshell.txt under Desktop 
  4. every row must contain  bash  
  5. copy io.txt to /mnt/
  6. change owner of /mnt/io.txt as root 
  7. group of this file must be koolgrp 
```

</p>
</details>

### password locking 

```
[root@gaea-test ~]# useradd  x1
[root@gaea-test ~]# 
[root@gaea-test ~]# 
[root@gaea-test ~]# passwd x1
Changing password for user x1.
New password: 
BAD PASSWORD: The password is a palindrome
Retype new password: 
passwd: all authentication tokens updated successfully.
[root@gaea-test ~]# 
[root@gaea-test ~]# 
[root@gaea-test ~]# passwd -l x1
Locking password for user x1.
passwd: Success
[root@gaea-test ~]# passwd -d x1
Removing password for user x1.
passwd: Success
[root@gaea-test ~]# passwd --help
Usage: passwd [OPTION...] <accountName>
  -k, --keep-tokens       keep non-expired authentication tokens
  -d, --delete            delete the password for the named account (root only)
  -l, --lock              lock the password for the named account (root only)
  -u, --unlock            unlock the password for the named account (root only)
  -e, --expire            expire the password for the named account (root only)
  -f, --force             force operation
  -x, --maximum=DAYS      maximum password lifetime (root only)
  -n, --minimum=DAYS      minimum password lifetime (root only)
  -w, --warning=DAYS      number of days warning users receives before password expiration (root
                          only)

```
