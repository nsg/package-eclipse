IMAGE = eclipse
NAME = eclipse
VERSION = 1.5.1
ITERATION = 1
BIN_URL = "http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/mars/1/eclipse-java-mars-1-linux-gtk-x86_64.tar.gz"

build:
	docker build \
		-t ${IMAGE} \
		--build-arg VERSION=${VERSION} \
		--build-arg ITERATION=${ITERATION} \
		--build-arg BIN_URL=${BIN_URL} \
		.

package: build
	docker cp $$(docker create ${IMAGE}):/build/${NAME}_${VERSION}-${ITERATION}_amd64.deb $$PWD

clean:
	rm *.deb
