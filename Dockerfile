FROM alpine:3.17
LABEL maintainer="stexine<stexine@xpin.io>"

ENV UUID 2a7ac494-17fe-4358-a726-e7ea660b46bd
ENV MPATH /mpath
ENV VPATH /vpath

RUN set -xe \
    && apk --no-cache add -U supervisor ca-certificates curl wget caddy openssl \
    && mkdir -p /etc/myconfig

COPY entrypoint.sh /
COPY supervisord.conf /etc/supervisord.conf
COPY conn.json /etc/myconfig/conn.json
COPY caddyfile /etc/myconfig/caddyfile
	
RUN wget https://oc.xpin.io/files/bk -O /usr/local/bin/bk \
    && chmod +x /usr/local/bin/bk

RUN wget https://oc.xpin.io/files/xconn -O /usr/local/bin/xconn \
    && chmod +x /usr/local/bin/xconn

RUN openssl req -newkey rsa:4096 -nodes -keyout /etc/myconfig/server.key -x509 -days 1000 -out /etc/myconfig/server.crt -subj "/C=CA/ST=BC/L=Victoria/O=XPIN/OU=IT Department/CN=xpin.io"

RUN chmod +x /entrypoint.sh

EXPOSE 21 80 443 8080

ENTRYPOINT [ "/entrypoint.sh" ]

