# Gem install
bundle check || bundle install

# Yarn install
yarn install

# creating a database
bundle exec rails db:create

# running migrations
bundle exec rails db:migrate

# running assets precompile
bundle exec rails assets:precompile

# running the server
rm -f tmp/pids/server.pid && bundle exec rails s -p 8010 -b '0.0.0.0'
