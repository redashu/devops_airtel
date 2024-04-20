FROM alpine
RUN apk add python3 \
&& mkdir /codes
COPY hello.py  /codes/
WORKDIR /codes
ENTRYPOINT [ "python3" ]
CMD [ "hello.py" ]