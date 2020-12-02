#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GREEN='\033[0;32m'
BLACK='\033[0m'

#CF dockerfile qui devrait déja avoir installé les dépendances
#printf "${GREEN}Installing dependencies with Composer${BLACK}\n"
#cd $SCRIPT_DIR && composer install

printf "${GREEN}Creating database file${BLACK}\n"
cd $SCRIPT_DIR && touch "database.sqlite"

printf "${GREEN}Creating your environment file${BLACK}\n"
cd $SCRIPT_DIR && cp ".env.example" ".env"

cd $SCRIPT_DIR && ./lancache-autofill app:initialise-database --yes

cd $SCRIPT_DIR && ./lancache-autofill steam:update-app-list

cd $SCRIPT_DIR && ./lancache-autofill steam:initialise --yes
