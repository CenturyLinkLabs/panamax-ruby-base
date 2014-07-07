FROM centurylinklabs/ruby-base:2.1.2

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libsqlite3-dev ca-certificates

ADD . /tmp
WORKDIR /tmp
RUN bundle install --without development

ONBUILD ADD . /usr/src/app
ONBUILD WORKDIR /usr/src/app
ONBUILD RUN RAILS_ENV=production bundle install --without development test
ONBUILD EXPOSE 3000
