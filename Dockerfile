FROM node:16-alpine

WORKDIR /usr/app
COPY ./public /usr/app/public

RUN npm install -g http-server

ENTRYPOINT ["http-server", "./public", "-d", "false", "--gzip", "true", "--utc"]
