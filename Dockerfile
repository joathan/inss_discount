FROM ruby:3.3.0

RUN apt update && apt upgrade -y && apt install -y lsb-base lsb-release libpq-dev build-essential 

ARG NODE_MAJOR=18
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn postgresql-client

WORKDIR /home/app/web
COPY . /home/app/web

RUN rm -rf node_modules vendor
RUN gem install rails bundler

RUN bundle install
RUN yarn install

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD bundle exec unicorn -c config/unicorn.rb
