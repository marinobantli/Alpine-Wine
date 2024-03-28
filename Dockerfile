FROM alpine:latest

#Environment
EXPOSE 5900
ENV DisplayResolution=1280x1024

#Enable edge repo of main and community
COPY src/repositories /etc/apk/repositories
RUN apk update
RUN apk upgrade

#Install apk's
RUN apk add --no-cache tigervnc openbox wine font-terminus

#Copy bootstrap files
COPY src/bootstrap.sh /opt
RUN chmod +x /opt/bootstrap.sh

ENTRYPOINT [ "/opt/bootstrap.sh" ]