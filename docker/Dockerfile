FROM alpine:latest

RUN apk --update add squid

COPY bin /usr/local/bin

EXPOSE 3128

CMD [ "/usr/local/bin/docker-entrypoint.sh" ]
