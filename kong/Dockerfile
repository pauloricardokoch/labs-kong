FROM kong:2.6.0-alpine

USER root
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/* 
RUN curl -sL https://github.com/kong/deck/releases/download/v1.8.2/deck_1.8.2_linux_arm64.tar.gz -o deck.tar.gz
RUN tar -xf deck.tar.gz -C /tmp
RUN cp /tmp/deck /usr/local/bin/

CMD [ "kong", "start" ]