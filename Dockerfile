FROM ruby:3.1

RUN apt-get update -qq && \
  apt-get install -y build-essential default-libmysqlclient-dev curl vim cron

ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle -j 8

RUN bundle install

WORKDIR /api
COPY . /api
EXPOSE 4000

ENV TZ Asia/Tokyo