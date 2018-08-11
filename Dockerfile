FROM ruby:alpine

LABEL maintainer="http://github.com/mdave16/"
MAINTAINER "http://github.com/mdave16/"

RUN apk add --update build-base postgresql-dev nodejs tzdata
RUN gem i rails

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle

COPY . /app
CMD ["puma"]
