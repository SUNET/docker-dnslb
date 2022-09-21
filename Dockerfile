FROM ubuntu:22.04
MAINTAINER Leif Johansson <leifj@sunet.se>
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -q update
RUN apt-get -y upgrade
RUN apt-get -y install git python3 python3-dev libyaml-dev python3-pip build-essential
#RUN pip install python-dnslb
RUN pip3 install git+https://github.com/leifj/python-dnslb.git#egg=python-dnslb
ENV DNSDIR /etc/geodns
ENV ZONE example.com
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
VOLUME /etc/geodns
ENTRYPOINT "/start.sh"
