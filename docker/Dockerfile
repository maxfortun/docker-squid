FROM alpine:latest

RUN apk --update add squid inotify-tools \
	&& rm -rf /var/cache/apk/*

COPY bin /usr/local/bin

EXPOSE 3128

CMD [ "/usr/local/bin/docker-entrypoint.sh" ]
