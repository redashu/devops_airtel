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



