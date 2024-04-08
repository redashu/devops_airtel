FROM nginx
COPY hello.html /usr/share/nginx/html/index.html 
# you don't have to use CMD or entrypoint 