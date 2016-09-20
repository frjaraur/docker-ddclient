clean:
	docker rm -fv frjaraur/rpi-ddclient 2>/dev/null || true
	docker rm -fv frjaraur/ddclient 2>/dev/null || true

buildpi:
	docker build -f Dockerfile.rpi -t frjaraur/rpi-ddclient .

build:
	docker build -t frjaraur/ddclient .

startpi:
	docker run -d \
	--name=ddclient \
	--restart unless-stopped \
	-v /home/zero/DOCKER/rpi-ddclient/ddclient.myconf:/etc/ddclient/ddclient.conf \
	frjaraur/rpi-ddclient

start:
	docker run -d \
	--name=ddclient \
	--restart unless-stopped \
	-v /home/zero/DOCKER/rpi-ddclient/ddclient.myconf:/etc/ddclient/ddclient.conf \
	frjaraur/ddclient

push:
	docker login
	docker push frjaraur/ddclient
pushpi:
	docker login
	docker push frjaraur/rpi-ddclient
