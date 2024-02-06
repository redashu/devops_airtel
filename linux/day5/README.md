## linux shell scripting  

### task solution 

```
#!/bin/bash


if [ "$1" = "date" ]
then
     cal
elif [ "$1" = "cal" ]

then
      date

elif [ $# -eq 0 ]
then
	echo "please pass some argument value"
else 

        echo "hey we are only accept cal & date"
	echo "hey you have passed total $# arguments"


fi

```

### loops in shell

<img src="loop.png">

### using for loop 

```
for  i  in  airtel  harry  jack jill  test007  
> do
> userdel  -r  $i 
> done

```

### using for loop with inline input 

```
#!/bin/bash 



for  x  in  $@ 
do
	if [ "$x" == "date" ]
	then
		echo "sorry you don't have permission to RUN $x "
	else 

		$x
	fi 
	sleep 1
done 

```



