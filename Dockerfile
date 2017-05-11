FROM ruby:2.3.3-alpine

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN apk --update add busybox && \
    apk add --virtual build-dependencies ruby-dev build-base && \
    gem install bundler --no-ri --no-rdoc && \
    cd /app ; bundle install --without development test && \
    apk del build-dependencies

ADD . /app
USER nobody

ENV RACK_ENV production
EXPOSE 9292

WORKDIR /app
