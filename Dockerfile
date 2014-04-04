FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

# Ensure UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update

# Install fleet and fleetctl
RUN apt-get install -y wget
WORKDIR /tmp
RUN wget --no-check-certificate https://github.com/coreos/fleet/releases/download/v0.1.4/fleet-v0.1.4-linux-amd64.tar.gz
RUN tar -xvf fleet-v0.1.4-linux-amd64.tar.gz
RUN mv /tmp/fleet-v0.1.4-linux-amd64/fleetctl /usr/bin/fleetctl
RUN rm -rf /tmp/fleet-v0.1.4-linux-amd64
RUN rm /tmp/fleet-v0.1.4-linux-amd64.tar.gz
ENV FLEETCTL_ENDPOINT http://172.17.42.1:4001

# Install Ruby
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.1 gcc g++ ruby2.1-dev make

RUN echo "install: --no-rdoc --no-ri" > /etc/gemrc
RUN echo "update:  --no-rdoc --no-ri" >> /etc/gemrc
RUN gem install bundler

