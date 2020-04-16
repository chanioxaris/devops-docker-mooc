FROM ruby:2.6.0

COPY rails-example-project .
RUN chmod 777 /tmp
RUN apt-get update && apt-get install nodejs -y
RUN gem install bundler && bundle install
RUN rails db:migrate
EXPOSE 3000
CMD rails s