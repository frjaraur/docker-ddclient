#FROM hypriot/rpi-alpine-scratch
FROM alpine
RUN apk --update add perl
COPY sample-etc_ddclient.conf /etc/ddclient/ddclient.conf
COPY ddclient /usr/bin/ddclient
#COPY entrypoint.sh /entrypoint.sh
RUN adduser -D -s /sbin/nologin ddclient && \
chown ddclient:ddclient /etc/ddclient/ddclient.conf && \
chmod 600 /etc/ddclient/ddclient.conf 
USER ddclient

#ENTRYPOINT ["/entrypoint.sh"]
CMD ["ddclient","-daemon","300","-foreground","-verbose","-noquiet","-cache","/tmp/cache" ]