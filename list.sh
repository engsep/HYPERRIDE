#!/bin/bash

docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
echo Press Enter to continue...
read key
docker compose -p fiware logs --tail 10 -f