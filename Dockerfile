FROM ruby:2.6-slim

RUN mkdir app
WORKDIR app

COPY . ./

EXPOSE 4567

ENV APP_ENV=production

RUN gem install sinatra
RUN chmod u+x app.rb

CMD ["ruby", "app.rb"]


