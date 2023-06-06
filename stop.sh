#!/bin/bash

echo -e "\033[0;35mStopping Docker containers...\033[0m"
docker compose -p fiware stop && echo "\033[0;32mDocker containers stopped.\033[0m"