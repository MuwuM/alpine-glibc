FROM alpine:latest

MAINTAINER Mat <mat@orimani.info>

ADD inst_glibc.sh /tmp/

RUN apk add --update wget ca-certificates && \
    chmod +x /tmp/inst_glibc.sh && \
    sh /tmp/inst_glibc.sh && \
    apk del --purge wget ca-certificates && \
    rm -fr /tmp/* /var/cache/apk/*
