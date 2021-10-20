FROM node:16

COPY init.sh /
COPY entrypoint.sh /
COPY data/db.json /app/db.json

WORKDIR /

RUN chmod +x init.sh
RUN chmod +x entrypoint.sh

RUN [ "sh", "init.sh" ]
ENTRYPOINT [ "sh", "entrypoint.sh" ]
