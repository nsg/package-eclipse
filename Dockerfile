FROM nsgb/package-base-deb

ARG BIN_URL
ARG VERSION
ARG ITERATION

RUN download \
	-c $BIN_URL \
	-t /opt/eclipse.tar.gz \
	-h 04dd54df5d047fba63677b56f90ee8fd880cd206c7075ea9332095efa7f25663 \
	-x

ADD eclipse.desktop /usr/share/applications/eclipse.desktop
RUN cp /opt/eclipse/icon.xpm /usr/share/pixmaps/eclipse.xpm
RUN rm /opt/eclipse/eclipse.ini
ADD eclipse.ini /opt/eclipse/eclipse.ini

RUN fpm \
	-s dir \
	-t deb \
	-v $VERSION \
	--iteration $ITERATION \
	-n eclipse \
	/opt/eclipse \
	/usr/share/applications/eclipse.desktop \
	/usr/share/pixmaps/eclipse.xpm
