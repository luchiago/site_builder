FROM ruby:2.7.1

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev postgresql-client wait-for-it

RUN gem install bundler -v 2.1.4

WORKDIR /app

ADD . /app

RUN bundle install --jobs 4 --retry 3

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
