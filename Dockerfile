FROM nsgb/package-base-deb

ENV BIN_URL http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/mars/1/eclipse-java-mars-1-linux-gtk-x86_64.tar.gz
ENV VERSION 4.5.1

RUN download \
	-c $BIN_URL \
	-t /opt/eclipse.tar.gz \
	-h 04dd54df5d047fba63677b56f90ee8fd880cd206c7075ea9332095efa7f25663 \
	-x

RUN fpm \
	-s dir \
	-t deb \
	-v $VERSION \
	-n eclipse \
	/opt/eclipse
