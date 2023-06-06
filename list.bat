@echo off

docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
pause
docker compose -p fiware logs --tail 10 -f