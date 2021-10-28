FROM node:16

COPY data/* /root/.config/Insomnia/

WORKDIR /

RUN npm install -g insomnia-inso

ENTRYPOINT [ "inso" ]