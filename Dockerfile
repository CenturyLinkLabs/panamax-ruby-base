FROM gliderlabs/alpine:3.1

MAINTAINER CenturyLink Labs <clt-labs-futuretech@centurylink.com>


ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.0
RUN echo 'gem: --no-document' >> /.gemrc
ADD . /tmp
WORKDIR /tmp


RUN apk-install curl \
   libffi \
   build-base \
   openssl-dev \
   gdbm \
   ncurses \
   readline \
   yaml \
   sqlite-dev \
   ca-certificates \
   tzdata \
   ruby-bundler \
   ruby-dev  \
   && gem install --no-document bundler \
   && bundle install --without development \
   && apk del build-base ncurses
   && rm -rf /var/cache/apk/*

CMD [ "irb" ]

# These instructions are only executed when this image is used as the base for
# another image. They will be executed immediately after the FROM instruction
# in the child Dockerfile.
ONBUILD ADD . /usr/src/app
ONBUILD WORKDIR /usr/src/app
ONBUILD ENV RAILS_ENV production
ONBUILD RUN bundle install --without development test
ONBUILD EXPOSE 3000
