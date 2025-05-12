#!/bin/bash

docker compose down --remove-orphans -v
docker compose up --build -d

#docker exec node-red bash -c "cd /data; npm install --unsafe-perm --no-update-notifier --no-fund --only=production"
#docker restart node-red

docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}"

docker compose logs -n 10 -f
