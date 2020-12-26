FROM node:12-alpine

LABEL author="mk3ext" maintainer="me@mk3ext.dev"

RUN mkdir -p /home/container \
    && apk add --no-cache git

WORKDIR /home/container

COPY package-lock.json /home/container
COPY package.json /home/container
COPY index.js /home/container

RUN /usr/local/bin/npm install

COPY . /home/container

ENV NODE_ENV=production

VOLUME ["home/container"]

ENTRYPOINT ["/usr/local/bin/npm"]
CMD ["start"]