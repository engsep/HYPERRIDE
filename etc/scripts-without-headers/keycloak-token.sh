#!/bin/bash

if [ -f "$ENV_FILE" ]; then
    export $(grep -v '^#' .env | xargs)
fi

: "${DUCKDNS_DOMAIN:=engsep}"
: "${NGINX_FULL_DOMAIN:=${DUCKDNS_DOMAIN}.duckdns.org}"
: "${NGINX_HTTP_PORT:=80}"

: "${ORION_CLIENT_ID:=orion}"
: "${ORION_CLIENT_SECRET:=u0uEieRqtUVrXPluUAiuvGAZ2Qk4Bco6}"

: "${REALM_NAME:=dedalus}"
: "${REALM_USERNAME:=myuser}"
: "${REALM_PASSWORD:=myuser}"

KEYCLOAK_BASE_URL=http://$NGINX_FULL_DOMAIN:$NGINX_HTTP_PORT/idm
TOKEN_REQ_ENDPOINT=$KEYCLOAK_BASE_URL/realms/${REALM_NAME}/protocol/openid-connect/token

# Request Tokens to be used in Bearer Authorization header
curl -sS -X POST $TOKEN_REQ_ENDPOINT \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "grant_type=password" \
    -d "client_id=${ORION_CLIENT_ID}" \
    -d "client_secret=${ORION_CLIENT_SECRET}" \
    -d "username=${REALM_USERNAME}" \
    -d "password=${REALM_PASSWORD}" | jq -r .access_token
