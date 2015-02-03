FROM ubuntu
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -y update
RUN apt-get -y install python python-dev python-pip build-essential
RUN pip install python-dnslb
ENV DNSDIR /etc/geodns
ENV ZONE example.com
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
VOLUME /etc/geodns
ENTRYPOINT "/start.sh"
