FROM node:16

COPY init.sh /
# cp ~/Library/Application\ Support/Insomnia `pwd`/data
COPY data /root/.config/Insomnia/

WORKDIR /

RUN chmod +x init.sh
RUN [ "sh", "init.sh" ]

ENTRYPOINT [ "inso" ]