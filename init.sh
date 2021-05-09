#!/bin/sh

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

if [ ! -f "$SCRIPTPATH/config/traefik/acme-prod.json" ]; then
  echo "{}" > "$SCRIPTPATH/config/traefik/acme-prod.json"
  sudo chmod 0600 "$SCRIPTPATH/config/traefik/acme-prod.json"
fi

if [ ! -f "$SCRIPTPATH/config/traefik/acme-staging.json" ]; then
  echo "{}" > "$SCRIPTPATH/config/traefik/acme-staging.json"
  sudo chmod 0600 "$SCRIPTPATH/config/traefik/acme-staging.json"
fi

[ ! "$(docker network ls | grep proxy)" ] && docker network create proxy
[ ! "$(docker network ls | grep database)" ] && docker network create database

echo "Server is Successfully initialized."