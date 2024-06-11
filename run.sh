#!/bin/bash -e

docker compose build
docker compose up -d
docker compose exec erb-sandbox bash