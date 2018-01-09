# docker-unifi

[![](https://images.microbadger.com/badges/commit/twanislas/unifi.svg)](https://github.com/Twanislas/docker-unifi) [![](https://images.microbadger.com/badges/image/twanislas/unifi.svg)](https://microbadger.com/images/twanislas/unifi)  [![](https://img.shields.io/docker/pulls/twanislas/unifi.svg)](https://hub.docker.com/r/twanislas/unifi/) [![](https://img.shields.io/docker/stars/twanislas/unifi.svg)](https://hub.docker.com/r/twanislas/unifi/)

Docker container for [Unifi](https://unifi-sdn.ubnt.com/), based on Debian

# Usage
```sh
docker run \
-d \
--name unifi \
--restart always \
-e APP_UID=<user id> \
-e APP_GID=<group id> \
-p 3478:3478 \
-p 5656-5699:5656-5699 \
-p 8080:8080 \
-p 8443:8443 \
-p 8880:8880 \
-p 6789:6789 \
-p 10001:10001 \
-v <path/to/unifi/config>:/config \
twanislas/unifi
```

## Parameters
- `-e APP_UID=<user id>` The user id of the `unifi` user created inside the container. This will default to `2000` if you don't set it.
- `-e APP_GID=<group id>` The group id of the `unifi` group created inside the container. This will default to `2000` if you don't set it.
- `-p <host port>:<container port>` Forwards ports from the host to the container. By default, the UniFi controller will operate on the following ports :
  	- `3478` UDP port used for STUN
	- `5656-5699` UDP ports for AP-EDU Broadcasts
	- `6789` TCP port used for throughput measurement, including UniFi mobile speedtest
	- `8080` TCP port for UAP to inform controller
	- `8443` TCP port for controller GUI / API, as seen in web browser
	- `8880` TCP port for HTTP portal redirect
	- `8843` TCP port for HTTPS portal redirect
	- `10001` UDP port for AP discovery
- `-v <path/to/unifi/config>:/config` This is the path where you want to store Sonarr's configuration.