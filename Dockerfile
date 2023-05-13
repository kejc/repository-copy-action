FROM alpine:3.18
RUN apk --update add git openssh-client
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
VOLUME /app
ENTRYPOINT [ "/entrypoint.sh" ]
