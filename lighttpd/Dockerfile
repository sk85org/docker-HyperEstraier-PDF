FROM alpine:latest

ENV QDBM_VERSION qdbm-1.8.78
ENV QDBM_URL https://dbmx.net/qdbm/qdbm-1.8.78.tar.gz
ENV HE_VERSION hyperestraier-1.4.13
ENV HE_URL https://dbmx.net/hyperestraier/hyperestraier-1.4.13.tar.gz


RUN apk update &&\
    apk --no-cache add gettext curl gcc gcc6 make libc-dev zlib-dev lighttpd  &&\
    curl -o /tmp/qdbm.tar.gz ${QDBM_URL} &&\
    curl -o /tmp/hyperestraier.tar.gz ${HE_URL} &&\
    tar xvzf /tmp/hyperestraier.tar.gz -C /tmp &&\
    tar xvzf /tmp/qdbm.tar.gz -C /tmp &&\
    cd /tmp/${QDBM_VERSION}/ &&\
    ./configure CC=gcc-6 &&\
    make &&\
    make install &&\
    cd /tmp/${HE_VERSION}/ &&\
    ./configure CC=gcc-6 &&\
    make &&\
    make install &&\
    cd / &&\
    rm -r /tmp &&\
    apk del curl gcc gcc6 make libc-dev zlib-dev
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80/tcp