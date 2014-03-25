FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

# Ensure UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.1 gcc ruby2.1-dev make

RUN echo "install: --no-rdoc --no-ri" > /etc/gemrc
RUN echo "update:  --no-rdoc --no-ri" >> /etc/gemrc
RUN gem install bundler
