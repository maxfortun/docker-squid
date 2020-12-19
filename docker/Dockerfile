FROM alpine:latest

RUN apk --update add squid 

COPY bin /usr/local/bin

USER squid

EXPOSE 3128

CMD [ "/usr/local/bin/docker-entrypoint.sh" ]
