FROM ruby:2.5.5
RUN apt-get update -qq && apt-get install -y mysql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
EXPOSE 3000