FROM ruby:3.2.3

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev curl

RUN gem install bundler -v 2.5.10

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 --retry 3

COPY . .

CMD [ "bash" ]