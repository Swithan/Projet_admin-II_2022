FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get -y install unzip supervisor wget nano

RUN apt-get -y install asterisk asterisk-doc asterisk-dev asterisk-ooh323 libasound2-plugins alsa-utils libsox-fmt-all speex

ADD . .

RUN cat sip.conf >> /etc/asterisk/sip.conf
RUN cat extensions.conf >> /etc/asterisk/extensions.conf

#RUN echo "$(cat sip.conf)" >> /etc/asterisk/sip.conf
#RUN echo "$(cat extensions.conf)" >> /etc/asterisk/extensions.conf

EXPOSE 5060
