# Gem install
bundle check || bundle install

# Yarn install
yarn install

# creating a database, migrations and assets precompile
bundle exec rails db:create db:migrate assets:precompile

# running the server
rm -f tmp/pids/server.pid && bundle exec rails s -p 8010 -b '0.0.0.0'
