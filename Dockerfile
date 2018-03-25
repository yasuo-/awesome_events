FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /awesome_events
WORKDIR /awesome_events
COPY Gemfile /awesome_events/Gemfile
COPY Gemfile.lock /awesome_events/Gemfile.lock
RUN bundle install
COPY . /awesome_events
