ARG BUILD_FROM=debian:buster-slim

FROM $BUILD_FROM

RUN [ "/usr/bin/qemu-arm-static", "apt", "update" ]

RUN [ "/usr/bin/qemu-arm-static", "apt", "install", "-y", "wget" ]

#RUN apt update \
# && apt install -y wget
 
RUN wget https://github.com/badaix/snapcast/releases/download/v0.25.0/snapclient_0.25.0-1_armhf.deb
 
RUN [ "/usr/bin/qemu-arm-static", "dpkg", "-i", "--force-all", "'snapclient_0.25.0-1_armhf.deb'" ]

#RUN dpkg -i --force-all 'snapclient_0.25.0-1_armhf.deb'
 
#RUN apt-get -f install -y

RUN [ "/usr/bin/qemu-arm-static", "apt", "-f", "install", "-y" ]

ENV TZ=America/Toronto

ENTRYPOINT ["snapclient"]
