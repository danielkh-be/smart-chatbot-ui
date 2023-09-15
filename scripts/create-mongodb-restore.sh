#!/bin/bash

set -euo pipefail

# Create a dump from the MongoDB container running in local docker environment.

mongo_user="benorwaychatgpt-cosmosdb"
mongo_pass="l9t9q7tRymqlAi3ovvGY3AYSXKwtv0LTfnyYZvF4olXwtKiJRS6nsHrf75ZKe9KD2YSM3PvAetSCACDbNeeygQ=="
mongo_db="bechatgpt"
mongo_host="benorwaychatgpt-cosmosdb.mongo.cosmos.azure.com"
mongo_port="10255"

docker-compose exec mongo mongorestore --authenticationDatabase admin \
    -u "$mongo_user" -p "$mongo_pass" \
    --host="$mongo_host" --port="$mongo_port" \
    --db="$mongo_db" \
    --writeConcern="{w:0}" \
    --ssl \
    dump2/chatui