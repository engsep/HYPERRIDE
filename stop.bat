@echo off

echo Stopping Docker containers...
docker compose -p fiware stop
echo Docker containers stopped.