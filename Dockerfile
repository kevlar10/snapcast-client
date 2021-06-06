FROM arm32v7/debian:buster-slim 
COPY qemu-arm-static /usr/bin

RUN apt update \
 && apt install -y wget
 
RUN wget https://github.com/badaix/snapcast/releases/download/v0.25.0/snapclient_0.25.0-1_armhf.deb

RUN dpkg -i --force-all 'snapclient_0.25.0-1_armhf.deb'
 
RUN apt-get -f install -y

ENTRYPOINT ["snapclient"]
