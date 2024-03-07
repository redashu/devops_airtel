# apache httpd -- Customlog for particular website 
### updated Vhost file 

```
<virtualhost *:80>
	servername  www.jack.com
	documentroot  /var/www/jack/
	CustomLog  /var/log/httpd/jac-com-access.log combined
	ErrorLog  /var/log/httpd/jac-com-error.log 
</virtualhost>
```

### Note; please explore other options in Custom log -- like combined is the one 
