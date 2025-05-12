#!/bin/bash

# docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}" | sort
# docker ps -a --format "table {{.Networks}}\t{{.Names}}\t{{.RunningFor}}\t{{.Image}}\t{{.Command}}\t{{.Mounts}}"
# docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}"
echo

# DOCKER CONTAINERS
echo -e "\e[36mDOCKER CONTAINER\e[0m"
docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\t{{.ID}}"
stty -echo && read -n 1 key && stty echo && echo # read -n 1 key && [[ -z $key ]] || echo

# DOCKER NETWORKS
echo -e "\e[32mDOCKER NETWORKS\e[0m"
docker ps -a --format "table {{.Names}}\t{{.Ports}}\t{{.Networks}}"
stty -echo && read -n 1 key && stty echo && echo # read -n 1 key && [[ -z $key ]] || echo

# DOCKER VOLUMES
echo -e "\e[33mDOCKER VOLUMES\e[0m"
docker ps -a --format "table {{.Names}}\t{{.Command}}\t{{.Mounts}}"
echo
read -t 10 -n 1 -p $'\e[90mShow logs? (y/n)\e[0m' choice || choice="y" && [[ -z $choice ]] || echo

# DOCKER LOGS
[[ "$choice" =~ [sSyY] ]] && echo -e "\e[34mDOCKER LOGS\e[0m" && docker compose logs -n 10 -f
