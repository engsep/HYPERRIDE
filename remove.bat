@echo off

echo Removing Docker containers...
docker compose -p fiware down -v --remove-orphans
echo Docker containers removed.