FROM ubuntu
LABEL maintainer="Antoine Rahier <antoine.rahier@gmail.com>"

ARG DEBIAN_FRONTEND="noninteractive"

# Install dependencies
RUN \
apt-get update && \
apt-get install -y apt-utils ca-certificates curl gnupg cron python3-pip wget && \
apt-get -y dist-upgrade && \
apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 && \
apt-key adv --keyserver keyserver.ubuntu.com --recv 0C49F3730359A14518585931BC711F9BA15703C6

COPY rootfs/ /

# Install certbot
RUN \
pip3 install -U pyOpenSSL cryptography && \
pip3 install -U certbot certbot-dns-ovh

# Install UniFi
RUN \
apt-get update && \
apt-get install -y unifi && \
ln -s /var/lib/unifi /usr/lib/unifi/data

# Install S6 Overlay
RUN \
wget "https://github.com/just-containers/s6-overlay/releases/download/$(wget -q https://github.com/just-containers/s6-overlay/releases/latest -O - | grep -m 1 -E \"\>v | awk -F "[><]" '{print $3}')/s6-overlay-amd64.tar.gz" && \
tar -xzf s6-overlay-amd64.tar.gz -C / && \
rm s6-overlay-amd64.tar.gz

EXPOSE 1900/udp 3478/udp 5656-5699/udp 6789/tcp 8080/tcp 8443/tcp 8843/tcp 8880/tcp 10001/udp

VOLUME /var/lib/unifi
VOLUME /etc/letsencrypt

ENTRYPOINT ["/init"]

HEALTHCHECK CMD curl --connect-timeout 5 --show-error --silent --fail --insecure --location "http://localhost:8080/status" > /dev/null || exit 1