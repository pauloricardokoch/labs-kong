FROM node:16

COPY entrypoint.sh /
COPY data/db.json /app/db.json

WORKDIR /

RUN chmod +x entrypoint.sh
RUN npm install -g json-server

ENTRYPOINT [ "sh", "entrypoint.sh" ]
