#!/bin/bash

echo -e "\e[36mOrion version\e[0m"
curl -k https://localhost/orion/ngsi-ld/ex/v1/version
response=$(curl -k -sS -i https://localhost/orion/version)

status_code=$(echo "$response" | head -n 1 | awk '{print $2}')
echo "$response"
[ "$(echo $response | head -n 1 | awk '{print $2}')" -lt 300 ] && exit 0 || exit 1
