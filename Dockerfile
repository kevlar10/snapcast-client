FROM arm32v7/alpine:latest
COPY qemu-arm-static /usr/bin

RUN echo "http://alpine.northrepo.ca/edge/community" >> /etc/apk/repositories

RUN apk update
 && apk add snapcast-client

ENTRYPOINT ["snapclient"]
