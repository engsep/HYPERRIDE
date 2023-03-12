docker compose pull; echo -e "\033[0;32mDocker images updated.\033[0m"
# docker compose down -v --remove-orphans; echo -e "\033[0;32mDocker containers restarting...\033[0m"
docker compose -p fiware up -d --remove-orphans --build; echo -e "\033[0;32mDocker containers restarted.\033[0m"
echo ""
echo -e "\033[0;44m FIWARE Stack \033[0m"
echo -e "\033[0;33mby Alerox 2022 \033[0m"
echo ""
node -e "console.log(require('os').release())"
node -e "console.log(require('os').version())"
ver=$(docker -v); echo "${ver//, build*/}"
ver=$(node -v); echo "Node.js $ver"
echo ""
echo -e "\033[1;36mWelcome to FIWARE\033[0m"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""
echo -e "\033[0;36mNotify Node-RED app on Replit...\033[0m"
curl -X POST https://fiware.zeldalegends.repl.co/codespaces -H 'Content-Type: application/json' -d '{"started":true}'
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
# docker logs fiware-orion -f
