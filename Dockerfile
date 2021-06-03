ARG BUILD_FROM=debian:buster-slim

FROM $BUILD_FROM

RUN apt update \
 && apt install -y wget \
 && wget https://github.com/badaix/snapcast/releases/download/v0.25.0/snapclient_0.25.0-1_amd64.deb
 
 RUN dpkg -i --force-all 'snapclient_0.25.0-1_amd64.deb'
 
 RUN apt-get -f install -y

COPY snapclient /etc/default/snapsclient

ENV TZ=America/Toronto

ENTRYPOINT ["snapclient"]
