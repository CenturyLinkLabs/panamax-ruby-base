FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

# Ensure UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update

# Install Go
ADD https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz /tmp/
WORKDIR /tmp
RUN tar -xvf /tmp/go1.2.1.linux-amd64.tar.gz
ENV GOROOT /tmp/go
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/tmp/fleet/bin:/tmp/go/bin

# Install fleet and fleetctl
RUN apt-get -y install git
RUN git clone https://github.com/coreos/fleet.git
# TODO edit build script and comment out fleet install
WORKDIR /tmp/fleet
RUN chmod +x build
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/tmp/fleet/bin:/tmp/go/bin:/tmp/fleet/bin
RUN ./build

# Install Ruby
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.1 gcc g++ ruby2.1-dev make

RUN echo "install: --no-rdoc --no-ri" > /etc/gemrc
RUN echo "update:  --no-rdoc --no-ri" >> /etc/gemrc
RUN gem install bundler

