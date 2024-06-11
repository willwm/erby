#!/bin/bash -e

docker compose build --no-cache
docker compose up -d
docker compose exec erb-sandbox bash