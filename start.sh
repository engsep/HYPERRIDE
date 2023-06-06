#!/bin/bash

echo -e "\033[0;44m HYPERRIDE Setup \033[0m"
# sudo chown -R 1000:1000 node-red
echo -e "\033[0;35mUpdating Docker images...\033[0m"
docker compose pull && echo -e "\033[0;32mDocker images updated.\033[0m"
# docker compose down -v --remove-orphans
echo -e "\033[0;35mBuilding Docker containers...\033[0m"
docker compose -p fiware up -d --remove-orphans --build && echo -e "\033[0;32mDocker containers built.\033[0m"
# Patch for Vicenza2: use image instead of build in compose and decomment the following 3 lines:
# docker exec node-red bash -c 'cd /data ; npm i'
# docker stop node-red
# docker start node-red
echo -e ""
echo -e "\033[0;44m ICT Platform \033[0m"
echo -e "\033[0;33mby Alerox 2023\033[0m"
echo -e ""
node -e "console.log(require('os').release())"
node -e "console.log(require('os').version())"
docker -v
ver=$(node -v); echo -e "Node.js $ver"
echo -e ""
echo -e "\033[1;36mWelcome to HYPERRIDE!\033[0m"
docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"
echo -e ""
echo -e "\033[0;36mNotify Node-RED app on Replit...\033[0m"
# IP=$(curl -s http://whatismyip.akamai.com/)
# IP=$(ip addr show $(ip route | awk '/default/ { print $5 }') | grep 'inet' | head -n 1 | awk '/inet/ {print $2}' | cut -d'/' -f1)
IP=$(curl -s https://ifconfig.me/)
JSON={\"orion\":\"http://$IP:1026\",\"keyrock\":\"http://$IP:3005\",\"started\":true}
curl -X POST https://hyperride.engsep.repl.co/fiware -H 'Content-Type: application/json' -d $JSON

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
# cat backup.sql | docker exec -i db-mysql /usr/bin/mysql -u root --password=secret idm
#
# ----------------------
# Docker common commands
# ----------------------
# docker exec -it node-red /bin/bash
# docker logs fiware-orion --tail 10 -f
