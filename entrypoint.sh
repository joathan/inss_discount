#!/bin/bash
set -e

# check if the gems are installed, if not, install
bundle check || bundle install

# creating a database
bundle exec rails db:create

# continue with the original Docker command
exec "$@"
