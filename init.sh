#!/bin/sh

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

if [ ! -f "$SCRIPTPATH/src/traefik-data/acme-prod.json" ]; then
  echo "{}" > "$SCRIPTPATH/src/traefik-data/acme-prod.json"
  sudo chmod 0600 "$SCRIPTPATH/src/traefik-data/acme-prod.json"
fi

if [ ! -f "$SCRIPTPATH/src/traefik-data/acme-staging.json" ]; then
  echo "{}" > "$SCRIPTPATH/src/traefik-data/acme-staging.json"
  sudo chmod 0600 "$SCRIPTPATH/src/traefik-data/acme-staging.json"
fi

docker network create proxy