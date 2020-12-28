FROM alpine:latest

RUN apk --update add squid inotify-tools 

COPY bin /usr/local/bin

USER squid

EXPOSE 3128

CMD [ "/usr/local/bin/docker-entrypoint.sh" ]
