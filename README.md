# docker-unifi

Docker container for [Unifi](https://unifi-sdn.ubnt.com/).

# Usage
```sh
docker build -t twanislas/unifi src
docker run \
-d \
--name unifi \
--restart always \
-p 1900:1900 \
-p 3478:3478 \
-p 5656-5699:5656-5699 \
-p 6789:6789 \
-p 8080:8080 \
-p 8443:8443 \
-p 8843:8843 \
-p 8880:8880 \
-p 10001:10001 \
-v ./config/unifi:/var/lib/unifi \
-v ./config/certbot:/etc/letsencrypt \
twanislas/unifi
```
Or if you use `docker-compose` :
```sh
docker-compose build
docker-compose up -d
```