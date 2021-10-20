FROM node:16

# TODO FIXME
# cp -r ~/Library/Application\ Support/Insomnia `pwd`/data
COPY data/Insomnia/* /root/.config/Insomnia/

WORKDIR /

RUN npm install -g insomnia-inso

ENTRYPOINT [ "inso" ]