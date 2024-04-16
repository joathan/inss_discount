#!/bin/bash
set -e

# check if the gems are installed, if not, install
bundle check || bundle install

# Assegurar que o cliente de banco de dados sabe da senha
export PGPASSWORD=$POSTGRES_PASSWORD

# creating a database
# if ! psql -U $POSTGRES_USER -h $POSTGRES_HOST -lqt | cut -d \| -f 1 | grep -qw $POSTGRES_DB; then
#     echo "Database $POSTGRES_DB does not exist. Creating..."
#     # Comandos para criar o banco de dados
#     rake db:create
#     rake db:schema:load
#     rake db:test:prepare
# else
#     echo "Database $POSTGRES_DB already exists. Skipping creation..."
# fi

# continue with the original Docker command
exec "$@"
