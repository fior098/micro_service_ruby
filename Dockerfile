FROM ruby:3.2.2-alpine

RUN apk add --no-cache \
  build-base \
  postgresql-dev \
  tzdata \
  bash

WORKDIR /app

COPY Gemfile ./

RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
