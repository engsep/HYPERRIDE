#!/bin/bash

echo "\033[0;35mRemoving Docker containers...\033[0m"
docker compose -p fiware down -v --remove-orphans && echo "\033[0;32mDocker containers removed.\033[0m"