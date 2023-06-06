@echo off

echo HYPERRIDE Setup
echo Updating Docker images...
docker compose pull
echo Docker images updated.
# docker compose down -v --remove-orphans
echo Building Docker containers...
docker compose -p fiware up -d --remove-orphans --build
echo Docker containers built.
echo.
echo " ICT Platform "
echo by Alerox 2023
echo.
node -e "console.log(require('os').release())"
node -e "console.log(require('os').version())"
docker -v
echo Node.js
node -v
echo.
echo Welcome to HYPERRIDE!
docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
echo.
echo Notify Node-RED app on Replit...
echo Not supported in Windows.
rem curl -X POST https://fiware.zeldalegends.repl.co/codespaces -H 'Content-Type: application/json' -d '{"started":true}'
#
# ===============
# USEFUL COMMANDS
# ===============
#
# ------------------------------
# Generate hash for access token
# ------------------------------
# node -e "console.log(require('crypto').createHash('sha3-256').update('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx').digest('hex'))"
#
# ----------------------
# MySQL dump and restore
# ----------------------
#
# docker exec db-mysql /usr/bin/mysqldump --databases -u root --password=secret idm > backup.sql
# type backup.sql | docker exec -i db-mysql /usr/bin/mysql -u root --password=secret idm
#
# ----------------------
# Docker common commands
# ----------------------
# docker exec -it node-red /bin/bash
# docker logs fiware-orion --tail 10 -f
