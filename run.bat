@echo off
rem set COMPOSE_PROJECT_NAME=fiware

call setenv.bat

set DOCKER_FILE=docker-compose.yml
set PROJECT_NAME=fiware
if "%1"=="/?" echo Usage: run [--context-broker-only^|--pep-proxy-only] & exit 1
if "%1"=="-h" echo Usage: run [--context-broker-only^|--pep-proxy-only] & exit 1
if "%1"=="--help" echo Usage: run [--context-broker-only^|--pep-proxy-only] & exit 1
if "%1"=="--context-broker-only" set DOCKER_FILE=docker-compose-context-broker-only.yml & set PROJECT_NAME=context-broker
if "%1"=="--pep-proxy-only" set DOCKER_FILE=docker-compose-pep-proxy-only.yml & set PROJECT_NAME=pep-proxy

rem docker compose -f %DOCKER_FILE% down
rem docker compose -f %DOCKER_FILE% pull
docker compose -f %DOCKER_FILE% -p %PROJECT_NAME% up --build --remove-orphans -d

:loop
docker compose -f %DOCKER_FILE% logs -t --until 1m
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
pause
goto loop