#!/bin/bash

curl -k https://localhost/orion/ngsi-ld/ex/v1/version
echo -e "\e[36mOrion version\e[0m"
curl -k https://localhost/orion/version
