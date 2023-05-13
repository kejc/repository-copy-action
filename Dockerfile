FROM alpine:3.18

COPY entrypoint.sh /entrypoint.sh
COPY known_hosts /root/.ssh/known_hosts

RUN apk --update add git openssh-client
RUN eval "$(ssh-agent -s)"
RUN ssh-keygen -F github.com
RUN mkdir -p /app /root/.ssh
RUN mkdir -p /app /root/.ssh
RUN touch /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/known_hosts

RUN chmod +x /entrypoint.sh
VOLUME /app
ENTRYPOINT [ "/entrypoint.sh" ]
