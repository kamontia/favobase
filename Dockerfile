FROM ruby:2.5.0
MAINTAINER kondo takeshi(take.she12@gmail.com)

ENV APP_ROOT /usr/src/app

EXPOSE 3000
WORKDIR $APP_ROOT

RUN apt-get update && apt-get install -y \
  nodejs \
  mysql-client \
  postgresql-client \
  sqlite3 \
   --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle install

COPY . $APP_ROOT

RUN rake db:migrate
